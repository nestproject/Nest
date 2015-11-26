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

## InputStream

```swift
public protocol HttpInputStream {
  public func readByte()  -> Byte;   // Reads one byte form the byte stream
  public func readBytes() -> [Byte]; // Reads all the bytes until \r\n into a byte array
  public func asString()  -> String; // Reads all content until \r\n, and converts it to a string
  public func readLine()  -> String; // Reads a single line from the input stream
}
```

## OutputStream

```swift
public protocol HttpOutputStream {
  public func writeByte(Byte byte);       // Write a single byte
  public func writeBytes([Byte] bytes);   // Write a series of bytes
  public func writeString(String string); // Write a string
  public func flush();                    // Flush buffers
  public func close();                    // Writes \r\n, flushes, and then closes.
}
```

## RequestType

```swift
public protocol RequestType {
  var method:String { get }
  var path:String { get }
  var headers:[Header] { get }
  var body:HttpInputStream { get }
}
```

#### Status (`String`)

This is an HTTP status. It must be a string containing a 3-digit integer result code followed by a reason phrase. For example, `200 OK`.

#### Headers (`[(String, String)]`)

The headers is an array of tuples containing the key and value for each HTTP header for the server to send in the returned order.

#### Body (`HttpInputStream`)

Must be an HttpInputStream. If the body is empty, the HttpInputStream is empty.

## ResponseType

```swift
public protocol ResponseType {
  var statusLine:String { get }
  var headers:[Header] { get }
  var body:HttpOutputStream { get }
}
```

#### Status (`String`)

This is an HTTP status. It must be a string containing a 3-digit integer result code followed by a reason phrase. For example, `200 OK`.

#### Headers (`[(String, String)]`)

The headers is an array of tuples containing the key and value for each HTTP header for the server to send in the returned order.

#### Body (`HttpOutputStream`)

Must be an HttpOutputStream.

