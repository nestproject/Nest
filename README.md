# Nest - Swift Web Server Gateway Interface

Nest provides a minimal interface between web servers supporting Swift and  web applications or frameworks. It’s designed to prevent tight coupling between web servers and web applications or frameworks. To enable the use of any framework or application with any server.

## Quick Links

- [Specification](Specification.md)

## Rationale and Goals

The primary goal of Nest is to enable the use of any framework or application with any server. To prevent tight coupling between web servers and web applications or frameworks.

Nest provides a minimal interface supporting every feature in HTTP. It must be extremely simple, and easy to implement for both servers and web applications.

The interface must not make use any external frameworks and only depend on core Swift language features.

## Example Application

A simple Hello World web application using the Nest interface:

```swift
func application(env:[String:AnyObject]) -> (String, [(String, String)], String) {
    return ("200 OK", [("Content-Type", "text/plain")], "Hello World")
}
```

## Testing

Along with providing a specification, Nest also provides a test suite to ensure that a server correctly follows the specification, and to aid development of web servers.

## Implementations

There are no current implementations.

## License

Nest is licensed under the BSD license. See [LICENSE](LICENSE) for more information.

