/// Represents a HTTP Header, Key and Value
public typealias Header = (String, String)

/// Represents a HTTP Request
public protocol RequestType {
  var method:String { get }
  var path:String { get }
  var headers:[Header] { get }
  var body:InputStreamable { get }
}


/// Represents a HTTP Response
public protocol ResponseType {
  var statusLine:String { get }
  var headers:[Header] { get }
  var body:OutputStreamable { get }
}

public protocol InputStreamable {
  func readBytes(count:int) -> [Int8]
}

public protocol OutputStreamable {
  func writeBytes(bytes:[Int8])
}

public typealias Application = RequestType -> ResponseType

