//
//  TokenDriver.swift
//  CTKPersistentTokenExtension
//
//  Created by Brandon Weeks on 7/28/21.
//

import CryptoTokenKit

class TokenDriver: TKTokenDriver, TKTokenDriverDelegate {

    func tokenDriver(_ driver: TKTokenDriver, tokenFor configuration: TKToken.Configuration) throws -> TKToken {
        return Token(tokenDriver: self, instanceID: configuration.instanceID)
    }

}
