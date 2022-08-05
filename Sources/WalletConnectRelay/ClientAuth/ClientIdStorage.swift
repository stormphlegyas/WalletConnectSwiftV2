import Foundation
import WalletConnectKMS

@available(iOS 13.0, *)
protocol ClientIdStoring {
    func getOrCreateKeyPair() throws -> SigningPrivateKey
}

@available(iOS 13.0, *)
struct ClientIdStorage: ClientIdStoring {
    private let key = "com.walletconnect.iridium.client_id"
    private let keychain: KeychainStorageProtocol

    init(keychain: KeychainStorageProtocol) {
        self.keychain = keychain
    }

    func getOrCreateKeyPair() throws -> SigningPrivateKey {
        do {
            return try keychain.read(key: key)
        } catch {
            let privateKey = SigningPrivateKey()
            try keychain.add(privateKey, forKey: key)
            return privateKey
        }
    }
}
