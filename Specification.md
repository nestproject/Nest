---
Version: 0.3.0
---

# Nest Specification

There are two components that make up the Nest interface, the “server” or
“gateway” component, and the “application” or “framework” component.

The server component invokes the function that is provided by the application.

## Application

A Nest application is a simple Swift function that takes exactly one argument,
an object or structure that conforms to RequestType. It returns an instance
of a ResponseType which contains exactly three values, the status, headers
and the body.

The full type of the application function is as follows:

```swift
RequestType -> ResponseType
```

## Server

The server or gateway invokes the applications function once for each request
from a client.

## PayloadType

Payload type represents a streamable HTTP body, either for a request or
response.

```
public protocol PayloadType {
  mutating func next() -> [UInt8]?
}
```

```swift
public typealias Header = (String, String)
```

## RequestType

```swift
public protocol RequestType {
  var method:String { get }
  var path:String { get }
  var headers:[Header] { get }
  var body: PayloadType? { get set }
}
```

### ResponseType

```swift
public protocol ResponseType {
  var statusLine:String { get }
  var headers:[Header] { get }
  var body: PayloadType? { get set }
}
```

#### Status (`String`)

This is an HTTP status. It must be a string containing a 3-digit integer result code followed by a reason phrase. For example, `200 OK`.

#### Headers (`[(String, String)]`)

The headers is an array of tuples containing the key and value for each HTTP header for the server to send in the returned order.

#### Body (`String?`)

The body must be a String or nil.

