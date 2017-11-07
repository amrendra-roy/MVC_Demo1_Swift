//
//  Constants.swift
//  MVC_Demo_Swift
//
//  Created by Amrendra on 26/10/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import Foundation

struct Constants {
    
    private struct Environment {
        static let DAV = "https://api.github.com"
        static let PROD = "" //Paste your own URLs
        static let SQE = "" //Paste your own URLs
    }
    struct API {
        static let REPOSITORIES = baseURL+"/legacy/repos/search/Go?language=%@"
        static let ISSUES = baseURL+"/repos/%@/%@/issues"
        static let CONTRIBUTORS = baseURL+"/repos/%@/%@/contributors"
        static let APPLE_MUSIC = "https://api.androidhive.info/music/music.xml"
    }
    
    //To change your Server url, just change your environment only.
    static private let baseURL = Environment.DAV
    
    
    
    
    
    
    
    
}
