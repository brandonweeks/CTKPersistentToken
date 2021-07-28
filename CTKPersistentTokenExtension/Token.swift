//
//  Token.swift
//  CTKPersistentTokenExtension
//
//  Created by Brandon Weeks on 7/28/21.
//

import CryptoTokenKit

class Token: TKToken, TKTokenDelegate {

    func createSession(_ token: TKToken) throws -> TKTokenSession {
        return TokenSession(token:self)
    }

}
