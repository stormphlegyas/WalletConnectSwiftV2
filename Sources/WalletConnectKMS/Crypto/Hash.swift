import Foundation
import CryptoKit

@available(iOS 13.0, *)
extension Digest {
    var bytes: [UInt8] { Array(makeIterator()) }
    var data: Data { Data(bytes) }
}
//
@available(iOS 13.0, *)
extension Data {
    public func sha256() -> Data {
        SHA256.hash(data: self).data
    }
}
