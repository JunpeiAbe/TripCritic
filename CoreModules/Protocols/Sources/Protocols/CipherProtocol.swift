import Foundation
import CryptoKit

public protocol CipherProtocol {
    var cryptKey: SymmetricKey { get }
    func encrypt(data:Data, using key:SymmetricKey) -> (ciphertext: Data,nonce: AES.GCM.Nonce,tag: Data)?
    func decrypt(data ciphertext: Data,using key: SymmetricKey,nonce: AES.GCM.Nonce,tag: Data) -> Data?
}

public extension CipherProtocol {
    
    var cryptKey: SymmetricKey {
        SymmetricKey(
            size: .bits256
        )
    }
    
    ///暗号化処理
    func encrypt(
        data:Data,
        using key:SymmetricKey
    ) -> (
        ciphertext: Data,
        nonce: AES.GCM.Nonce,
        tag: Data
    )? {
        do {
            let nonce = AES.GCM.Nonce()
            let sealedBox = try AES.GCM.seal(
                data,
                using: key,
                nonce: nonce
            )
            return (
                sealedBox.ciphertext,
                nonce,
                sealedBox.tag
            )
        } catch {
            print(
                "Encryption failed: \(error)"
            )
            return nil
        }
    }
    
    ///復号化処理
    func decrypt(
        data ciphertext: Data,
        using key: SymmetricKey,
        nonce: AES.GCM.Nonce,
        tag: Data
    ) -> Data? {
        do {
            let sealedBox = try AES.GCM.SealedBox(
                nonce: nonce,
                ciphertext: ciphertext,
                tag: tag
            )
            return try AES.GCM.open(
                sealedBox,
                using: key
            )
        } catch {
            print(
                "Decryption failed: \(error)"
            )
            return nil
        }
    }
}
