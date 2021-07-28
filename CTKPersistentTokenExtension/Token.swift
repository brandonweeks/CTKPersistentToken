//
//  Token.swift
//  CTKPersistentTokenExtension
//
//  Created by Brandon Weeks on 7/28/21.
//

import CryptoTokenKit

class Token: TKToken, TKTokenDelegate {
    
    init(tokenDriver: TokenDriver, instanceID: TKToken.InstanceID) throws {
        NSLog("Entering Token#init")
        NSLog("Calling super.init(tokenDriver: tokenDriver, instanceID: instanceID)")
        super.init(tokenDriver: tokenDriver, instanceID: instanceID)
        NSLog("self.configuration.keychainItems: \(self.configuration.keychainItems)")
        NSLog("self.keychainContents: \(String(describing: self.keychainContents))")
        NSLog("Calling self.keychainContents?.fill(with: configuration.keychainItems)")
        self.keychainContents?.fill(with: configuration.keychainItems)
        NSLog("self.keychainContents: \(String(describing: self.keychainContents))")
        NSLog("Exiting Token#init")
    }

    func createSession(_ token: TKToken) throws -> TKTokenSession {
        return TokenSession(token:self)
    }

}
