//
//  HeroAPIConfig.swift
//  Marvel
//
//  Created by iOSLab on 20/07/24.
//

import Foundation
import CryptoKit

enum ApiKeys: String {
    case privateKey = "5dbde72c7ebed9993d4feb31c76d07b55f5327dc"
    case publicKey = "dcc9d8accfac05ed707fa07aabce6e00"
}

struct HeroAPIConfig {
        private var timestamp: String{
        String(Int(Date().timeIntervalSince1970*1000))
    }
    
        private var MD5: String {
        let keys = timestamp + ApiKeys.publicKey.rawValue + ApiKeys.privateKey.rawValue
        
        let digest = Insecure.MD5.hash(data: Data(keys.utf8))
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
        
    }
    
        var HeroUrl: URL? {
        let baseURL = NetWorkConstants.baseURL + NetWorkConstants.baseEndpoint + NetWorkConstants.heroEndpoint
        let urlStr = "\(baseURL)?ts=\(timestamp)&apikey=\(ApiKeys.publicKey.rawValue)&hash=\(MD5)"
        return URL(string: urlStr)
    }
}
