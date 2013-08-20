// AFMsgPackSerializer.m
// 
// Copyright (c) 2013 AFNetworking (http://afnetworking.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AFMsgPackSerializer.h"

@implementation AFMsgPackSerializer

+ (instancetype)serializer {
    return [self serializerWithReadingOptions:0 writingOptions:0];
}

+ (instancetype)serializerWithReadingOptions:(MsgPackReadingOptions)readingOptions
                              writingOptions:(MsgPackWritingOptions)writingOptions
{
    AFMsgPackSerializer *serializer = [[self alloc] init];
    serializer.readingOptions = readingOptions;
    serializer.writingOptions = writingOptions;

    return serializer;
}

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }

    self.acceptableContentTypes = [NSSet setWithObjects:@"application/x-msgpack", nil];

    return self;
}

#pragma mark - AFURLRequestSerialization

- (NSURLRequest *)requestBySerializingRequest:(NSURLRequest *)request
                               withParameters:(NSDictionary *)parameters
                                        error:(NSError *__autoreleasing *)error
{
    NSParameterAssert(request);

    if ([self.HTTPMethodsEncodingParametersInURI containsObject:[[request HTTPMethod] uppercaseString]]) {
        return [super requestBySerializingRequest:request withParameters:parameters error:error];
    }

    NSMutableURLRequest *mutableRequest = [request mutableCopy];

    [self.HTTPRequestHeaders enumerateKeysAndObjectsUsingBlock:^(id field, id value, BOOL *stop) {
        [mutableRequest setValue:value forHTTPHeaderField:field];
    }];

    [mutableRequest setValue:@"application/x-msgpack" forHTTPHeaderField:@"Content-Type"];
    [mutableRequest setHTTPBody:[MsgPackSerialization dataWithMsgPackObject:parameters options:self.writingOptions error:error]];

    return mutableRequest;
}

#pragma mark - AFURLRequestSerialization

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    if (![self validateResponse:(NSHTTPURLResponse *)response data:data error:error]) {
        return nil;
    }

    return [MsgPackSerialization MsgPackObjectWithData:data options:self.readingOptions error:error];    
}


#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (!self) {
        return nil;
    }

    self.readingOptions = [aDecoder decodeIntegerForKey:@"readingOptions"];
    self.writingOptions = [aDecoder decodeIntegerForKey:@"writingOptions"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];

    [aCoder encodeInteger:self.readingOptions forKey:@"readingOptions"];
    [aCoder encodeInteger:self.writingOptions forKey:@"writingOptions"];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    AFMsgPackSerializer *serializer = [[[self class] allocWithZone:zone] init];
    serializer.readingOptions = self.readingOptions;
    serializer.writingOptions = self.writingOptions;

    return serializer;
}

@end
