AFMsgPackSerializer
====================

`AFMsgPackSerializer` automatically encodes and decodes objects to and from the [MsgPack](http://msgpack.org) format.

## Usage

```objective-c
// AFHTTPClient Configuration
AFHTTPClient *client = [AFHTTPClient client];
client.requestSerializer = [AFMsgPackSerializer serializer];
client.responseSerializer = [AFMsgPackSerializer serializer];
[client GET:@"http://example.com/foo.msgpack"]

// AFHTTPRequestOperation Configuration
NSURL *URL = [NSURL URLWithString:@"http://example.com/foo.msgpack"];
NSURLRequest *request = [NSURLRequest requestWithURL:URL];
AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]
                                           initWithRequest:request];
operation.responseSerializer = [AFMsgPackSerializer serializer];
[operation start];
```

---

## Contact

Mattt Thompson

- http://github.com/mattt
- http://twitter.com/mattt
- m@mattt.me

## License

AFMsgPackSerializer is available under the MIT license. See the LICENSE file for more info.
