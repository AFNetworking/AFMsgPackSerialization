AFMsgPackSerialization
======================

`AFMsgPackSerialization` is an AFNetworking 2 extension that provides request and response serializers to automatically encodes and decodes objects to and from the [MsgPack](http://msgpack.org) format.

## Usage

```objective-c
// AFHTTPClient Configuration
AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
manager.responseSerializer = [AFMsgPackResponseSerializer serializer];
[manager GET:@"http://example.com/foo.msgpack"
  parameters:nil
     success:^(NSHTTPURLResponse *response, id responseObject) {
         // ...
     }
     failure:nil];
```

---

## Contact

Mattt Thompson

- http://github.com/mattt
- http://twitter.com/mattt
- m@mattt.me

## License

AFMsgPackSerialization is available under the MIT license. See the LICENSE file for more info.
