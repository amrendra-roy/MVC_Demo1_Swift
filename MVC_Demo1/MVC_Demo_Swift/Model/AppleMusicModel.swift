//
//  AppleMusicModel.swift
//  MVC_Demo_Swift
//
//  Created by Amrendra on 30/10/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class AppleMusicModel: NSObject {

    let musicID: String!
    let title: String!
    let arties: String
    var duration: String! = "0.0"
    let thumbnilUrl: String?
    
    init(withDictionary dict: NSDictionary) {
        
        musicID = dict["id"] as! String;
        title = (dict["title"] as? String) ?? "Un-Named Title";//This is for testing only
        arties = dict["artist"]as! String;
        duration = dict["duration"] as! String;
        thumbnilUrl = dict["thumb_url"] as? String;
    }
}



