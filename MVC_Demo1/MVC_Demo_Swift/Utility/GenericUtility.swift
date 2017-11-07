//
//  GenericUtility.swift
//  MVC_Demo_Swift
//
//  Created by Amrendra on 26/10/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import Foundation
import UIKit

class GenericUtility: NSObject {
    
    
    
    
    
    
    deinit {
        
        
    }
    
}

// MARK: - Class methods
extension GenericUtility {
    
    static func showAlert(withTitle title: String, message: String, btnTitle: String) -> UIAlertController {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction.init(title: btnTitle, style: UIAlertActionStyle.default) { (action: UIAlertAction?) in
        }
        alert.addAction(okAction)
        return alert
    }
}

