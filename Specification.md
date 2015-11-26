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
  public func readByte()  -> Byte?;
  public func readBytes() -> [Byte]?;
  public func readBytes(size:int) -> [Byte]?;
  public func asString()  -> String?;
  public func readLine()  -> String?;
}
```

#### readByte

Reads one byte from the input stream.
If the end of the stream has been reached, `null` is returned.
If the end of the stream has not been reached, but there is no more data,
the current thread is blocked until a new `Byte` is recived.

#### readBytes

Reads all bytes from the input stream.
If end of stream has not been recived, the current thread is blocked unit it is.

#### readBytes(size:int)

Reads `size` bytes from the input stream.
If end of stream has not been recived, and there is not `size` amount of data in the stream,
the current thread is blocked.

If end of stream has been recived, but there is not `size` amount of data in the stream,
the rest of the data is returned.

This means that there is no guarantee that the returned byte array is `size` in length

#### asString

Reads all bytes in the input stream and converts them to a string.
If end of stream has not been recived, the current thread is blocked unit it is.

#### readLine

Reads all bytes until the first line return or end of stream.
Block the current thread neither a line return or end of stream has been recived.

## OutputStream

```swift
public protocol HttpOutputStream {
  public func writeByte(Byte byte);
  public func writeBytes([Byte] bytes);
  public func writeString(String string);
  public func flush();
  public func close();
}
```

#### writeByte

write a byte to the output stream

#### writeBytes

write a series of bytes to the output stream

#### writeString

write a string to the output stream

#### flush

flush the output stream

#### close

Write \r\n to the output stream, flushes, then closes.

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

