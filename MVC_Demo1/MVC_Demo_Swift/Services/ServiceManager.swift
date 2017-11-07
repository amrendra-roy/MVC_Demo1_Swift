//
//  ServiceManager.swift
//  MVC_Demo_Swift
//
//  Created by Amrendra on 26/10/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class ServiceManager: NSObject {

    let session: URLSession
    
    static let sharedInsance = ServiceManager()

    private override init() {

        session = URLSession.shared
    }
    func startWebService(forUrl urlString: String, completionHandler:@escaping (Data?, Error?)->Void) {
        let url = URL.init(string: urlString)
        let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
               completionHandler(nil, error)
            }else{
                completionHandler(data, nil)
            }
        }
        task.resume()
    }

}
