//
//  XmlParsingModel.swift
//  MVC_Demo_Swift
//
//  Created by Amrendra on 30/10/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class XmlParsingModel:NSObject {

    
    fileprivate var arrOfMusics = [AppleMusicModel]()
    fileprivate var dataDictionary = [String : Any]()
    fileprivate var curretParstingString: String?
    
     var delegate: XmlParsingProtocol?
    
     func parsingAppleMusicData(withData xmlData: NSData) {

       let parser = XMLParser.init(data: xmlData as Data)
        parser.delegate = self as? XMLParserDelegate
        parser.parse()
    }
}

extension XmlParsingModel: XMLParserDelegate {

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        print("didStartElement element is = \(elementName)")
        if elementName == "song" {
            dataDictionary.removeAll()
        }
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "id" {
            dataDictionary["id"] = curretParstingString
        } else if elementName == "title" {
            dataDictionary["title"] = curretParstingString
            
        }else if elementName == "artist" {
            dataDictionary["artist"] = curretParstingString
            
        }else if elementName == "duration"{
            
            dataDictionary["duration"] = curretParstingString
        }else if elementName == "thumb_url"{
            dataDictionary["thumb_url"] = curretParstingString
        } else if elementName == "song" {
            
            let model = AppleMusicModel.init(withDictionary: dataDictionary as NSDictionary)
            
            arrOfMusics.append(model)
        }
        curretParstingString = nil
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        curretParstingString = string;
    }
    
    func parserDidStartDocument(_ parser: XMLParser) {
        print("parserDidStartDocument");
        
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        print("parserDidEndDocument");
        DispatchQueue.main.async {
            let selector = #selector(self.delegate?.didFinishParsingContent(results:))
            if self.delegate != nil && (self.delegate?.responds(to: selector))! {
                
                self.delegate?.didFinishParsingContent(results: self.arrOfMusics as NSArray);
            }
        }
    }
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        
        print("parseErrorOccurred")
    }
    
}
