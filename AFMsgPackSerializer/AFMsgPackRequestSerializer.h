// AFMsgPackRequestSerializer.h
// 
// Copyright (c) 2014 AFNetworking (http://afnetworking.com)
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

#import "MsgPackSerialization.h"
#import "AFURLRequestSerialization.h"

/**
 `AFMsgPackRequestSerializer` is a subclass of `AFHTTPRequestSerializer` encodes parameters as a MsgPack form body.
 */
@interface AFMsgPackRequestSerializer : AFHTTPRequestSerializer

/**
 Options for writing the request MsgPack data from Foundation objects. For possible values, see the `MsgPackSerialization` documentation section "MsgPackWritingOptions". `0` by default.
 */
@property (nonatomic, assign) MsgPackWritingOptions writingOptions;

/**
 Creates and returns a MsgPack request serializer with specified writing options.

 @param writingOptions The specified MsgPack writing options.
 */
+ (instancetype)serializerWithWritingOptions:(MsgPackWritingOptions)writingOptions;

@end
