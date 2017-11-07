//
//  SearchRepoTest.swift
//  MVC_Demo_Swift
//
//  Created by Amrendra on 30/10/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//


import XCTest
@testable import MVC_Demo_Swift





class SearchRepoTest: XCTestCase {

    
    override func setUp() {
        
        
    }
    
    override func tearDown() {
        
        
    }
    
    func testSerachRepository() {
        
    }
    func testSearchWithExpecation() {
        let stringUrl = String(format: Constants.API.REPOSITORIES, "Java")
        //let url = URL.init(string: stringUrl)
        let expectat = expectation(description: "GET \(stringUrl)")
        ServiceManager.sharedInsance.startWebService(forUrl:stringUrl) { (data: Data?, error: Error?) in
            
            if error != nil {
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
                    let jsonDict = json["repositories"] as! [Any]
                    print("json dic is = \(jsonDict)")
                    
                }catch {
                    print("Catch exception in testSerachRepository")
                }
            }
            XCTAssertNotNil(data, "data should not be nil")
            XCTAssertNil(error, "error should be nil")
            expectat.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testSerachGitAPIPerformance() {
        self.measure {
            let stringUrl = String(format: Constants.API.REPOSITORIES, "Java")

            ServiceManager.sharedInsance.startWebService(forUrl:stringUrl) { (data: Data?, error: Error?) in
                
                if error != nil {
                    
                    do{
                        let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
                        let jsonDict = json["repositories"] as! [Any]
                        print("json dic is = \(jsonDict)")
                        
                    }catch {
                        print("Catch exception in testSerachRepository")
                    }
                }
                XCTAssertNotNil(data, "data should not be nil")
                XCTAssertNil(error, "error should be nil")
            }
        }
    }
    func requestForWebService() {
        let stringUrl = String(format: Constants.API.REPOSITORIES, "Java")
        ServiceManager.sharedInsance.startWebService(forUrl:stringUrl) { (data: Data?, error: Error?) in
            
            if error != nil {
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
                    let jsonDict = json["repositories"] as! [Any]
                    print("json dic is = \(jsonDict)")
                    
                }catch {
                    print("Catch exception in testSerachRepository")
                }
            }
            XCTAssertNotNil(data, "data should not be nil")
            XCTAssertNil(error, "error should be nil")
        }
    }
}
