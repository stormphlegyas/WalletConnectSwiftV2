import Foundation

@available(iOS 13.0, *)
class ManualSocketConnectionHandler: SocketConnectionHandler {
    var socket: WebSocketConnecting

    init(socket: WebSocketConnecting) {
        self.socket = socket
    }

    func handleConnect() throws {
        socket.connect()
    }

    func handleDisconnect(closeCode: URLSessionWebSocketTask.CloseCode) throws {
        socket.disconnect()
    }
}
