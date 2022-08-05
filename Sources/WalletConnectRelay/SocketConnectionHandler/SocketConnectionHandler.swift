import Foundation

@available(iOS 13.0, *)
protocol SocketConnectionHandler {
    func handleConnect() throws
    func handleDisconnect(closeCode: URLSessionWebSocketTask.CloseCode) throws
}
