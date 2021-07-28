//
//  CTKPersistentTokenApp.swift
//  CTKPersistentToken
//
//  Created by Brandon Weeks on 7/28/21.
//

import CryptoKit
import CryptoTokenKit
import SwiftUI

@main
struct CTKPersistentTokenApp: App {
    init() {
        // Build items array.
        let certURL = Bundle.main.url(forResource: "test", withExtension: "cer")!
        let certData = try! Data(contentsOf: certURL)
        let cert = SecCertificateCreateWithData(nil, certData as CFData)!
        
        var items = [TKTokenKeychainItem]()
        let tokenID = Data(Insecure.SHA1.hash(data: SecCertificateCopyData(cert) as Data)).base64EncodedString()
        items.append(TKTokenKeychainCertificate(certificate: cert, objectID: tokenID)!)
        items.append(TKTokenKeychainKey(certificate: cert, objectID: tokenID)!)
        
        // Set token configuration.
        let driverConfigurations = TKTokenDriver.Configuration.driverConfigurations
        let driverID = "com.brandonweeks.CTKPersistentToken.CTKPersistentTokenExtension"
        let tokenConfiguration = driverConfigurations[driverID]!.addTokenConfiguration(for: tokenID)
        tokenConfiguration.keychainItems = items
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
