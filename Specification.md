---
Version: 0.1.0
---

# Nest Specification

There are two components that make up the Nest interface, the “server” or “gateway” component, and the “application” or “framework” component.

The server component invokes the function that is provided by the application.

## Application

A Nest application is a simple Swift function that takes exactly one argument, the environment. It returns a tuple (the response) containing exactly three values, the status, headers and the body.

The full type of the application function is as follows:

```swift
([String:AnyObject]) -> (String, [(String, String)], String)
```

### Environment

- `REQUEST_METHOD`
- `PATH_INFO`

### The Response

#### Status (`String`)

This is an HTTP status. It must be a string containing a 3-digit integer result code followed by a reason phrase. For example, `200 OK`.

#### Headers (`[(String, String)]`)

The headers is an array of tuples containing the key and value for each HTTP header for the server to send in the returned order.

#### Body (`String`)

The body must be a String.

## Server

The server or gateway invokes the applications function once for each request
from a client.

