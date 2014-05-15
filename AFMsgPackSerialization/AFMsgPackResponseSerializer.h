// AFMsgPackResponseSerializer.h
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
#import "AFURLResponseSerialization.h"

/**
 `AFMsgPackResponseSerializer` is a subclass of `AFHTTPResponseSerializer` that validates and decodes MsgPack responses.

 By default, `AFMsgPackSerializer` accepts the following MIME types:

 - `application/x-msgpack`
 */
@interface AFMsgPackResponseSerializer : AFHTTPResponseSerializer

/**
 Options for reading the response MsgPack data and creating the Foundation objects. For possible values, see the `MsgPackSerialization` documentation section "MsgPackReadingOptions". `0` by default.
 */
@property (nonatomic, assign) MsgPackReadingOptions readingOptions;

/**
 Creates and returns a MsgPack response serializer with specified reading options.

 @param readingOptions The specified MsgPack reading options.
 */
+ (instancetype)serializerWithReadingOptions:(MsgPackReadingOptions)readingOptions;

@end
