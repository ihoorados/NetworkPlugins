import Foundation

public struct NetworkPlugins {
    public private(set) var text = "Hello, World!"

    public init() {}
}


// MARK: Data Task Delegate
protocol DataTaskDelegate: AnyObject {
    typealias response = ((Result<Data,Error>) -> Void)
    func startDataTask(_ request: URLRequest,completion: @escaping response)
    func cancelDataTask()
}
