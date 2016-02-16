/// Represents a HTTP Header, Key and Value
public typealias Header = (String, String)

/// Represents a HTTP Request
public protocol RequestType {
  var method: String { get }
  var path: String { get }
  var headers: [Header] { get }
  var body: [UInt8]? { get }
}


/// Represents a HTTP Response
public protocol ResponseType {
  var statusLine: String { get }
  var headers: [Header] { get }
  var body: [UInt8]? { get }
}

public typealias Application = RequestType -> ResponseType
