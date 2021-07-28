//
//  TokenDriver.swift
//  CTKPersistentTokenExtension
//
//  Created by Brandon Weeks on 7/28/21.
//

import CryptoTokenKit

class TokenDriver: TKTokenDriver, TKTokenDriverDelegate {

    func tokenDriver(_ driver: TKTokenDriver, tokenFor configuration: TKToken.Configuration) throws -> TKToken {
        NSLog("Entering TokenDriver#tokenDriver")
        NSLog("configuration.keychainItems: \(configuration.keychainItems)")
        let token = try Token(tokenDriver: self, instanceID: configuration.instanceID)
        NSLog("token.keychainContents: \(String(describing: token.keychainContents))")
        NSLog("Exiting TokenDriver#tokenDriver")
        return token
    }

}
