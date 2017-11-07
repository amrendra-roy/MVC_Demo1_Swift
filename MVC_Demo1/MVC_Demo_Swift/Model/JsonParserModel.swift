//
//  JsonParserModel.swift
//  MVC_Demo_Swift
//
//  Created by Amrendra on 26/10/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class JsonParserModel: NSObject {

    
    static func parseRepository(fromData data: Data, completionHandler:@escaping([RepositoryModel])->Void) {
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
            let jsodDict = json["repositories"] as! [Any]
            var arrayOfRepoModel = [RepositoryModel]()
            
            for dict in jsodDict {
                let repo = RepositoryModel.init(withRepositoryDict: dict as! NSDictionary)
                print("Dict is = \(dict)")
                arrayOfRepoModel.append(repo)
            }
            completionHandler(arrayOfRepoModel)
            
        } catch {
            print("parseRepository throwing exception")
        }
        
        
    }
    
    
    
    
    
    
}
