//
//  Constants.swift
//  Marvel
//
//  Created by iOSLab on 13/07/24.
//

import Foundation

struct Constants {
    static let heroCellName: String = "heroCell"
    static let heroCellHeight: CGFloat = 150
    
    static let storyboardName: String = "Main"
    static let detailControllerName: String = "detailVC"
    
    
}

struct NetWorkConstants {
    static let baseURL =  "http://gateway.marvel.com"
    static let baseEndpoint = "/v1/public/"
    static let heroEndpoint = "characters"
    
}
