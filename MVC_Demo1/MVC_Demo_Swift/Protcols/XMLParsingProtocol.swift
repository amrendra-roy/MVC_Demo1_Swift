//
//  XMLParsingProtocol.swift
//  MVC_Demo_Swift
//
//  Created by Amrendra on 30/10/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import Foundation

@objc protocol XmlParsingProtocol: NSObjectProtocol {
    
      func didFinishParsingContent(results: NSArray);
    
}
