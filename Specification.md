---
Version: 0.2.0
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

```swift
public typealias Header = (String, String)
```

## RequestType

```swift
public protocol RequestType {
  var method:String { get }
  var path:String { get }
  var headers:[Header] { get }
  var body:InputStreamable { get }
}
```

#### Status (`String`)

This is an HTTP status. It must be a string containing a 3-digit integer result code followed by a reason phrase. For example, `200 OK`.

#### Headers (`[(String, String)]`)

The headers is an array of tuples containing the key and value for each HTTP header for the server to send in the returned order.

#### Body (`InputStreamable`)

The request body.

## ResponseType

```swift
public protocol ResponseType {
  var statusLine:String { get }
  var headers:[Header] { get }
  var body:OutputStreamable { get }
}
```

#### Status (`String`)

This is an HTTP status. It must be a string containing a 3-digit integer result code followed by a reason phrase. For example, `200 OK`.

#### Headers (`[(String, String)]`)

The headers is an array of tuples containing the key and value for each HTTP header for the server to send in the returned order.

#### Body (`OutputStreamable`)

The response body 

## OutputStreamable

```swift
public protocol OutputStreamable {
    func writeBytes(bytes: [Int8]);
}
```

#### writeBytes

Write bytes write the bytes passed to the output stream

## InputStreamable

```swift
public protocol InputStreamable {
    func readBytes(count: Int) -> [Int8];
}
```

#### readBytes

Read a given amount of bytes from the input.
If the given amount is not avaiable, the current thread will
be blocked until it is.




