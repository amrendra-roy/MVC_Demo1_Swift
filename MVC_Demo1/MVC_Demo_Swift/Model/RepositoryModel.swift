//
//  RepositoryModel.swift
//  MVC_Demo_Swift
//
//  Created by Amrendra on 26/10/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class RepositoryModel: NSObject {

    //MARK: - Constant
    let kName = "name"
    let kDescription = "description"
    let kNumberOfIssues = "open_issues"
    let kOwnerName = "owner"
    
    //MARK: - properties
    let userName: String!
    let repoDescription: String?
    var numberOfIssues: Int = 0
    let ownerName: String!
    
    var issuesList: [IssuesModel]?
    var contributorList:[ContributorModel]?
    
    init(withRepositoryDict dict: NSDictionary) {
        userName = dict[kName] as! String
        repoDescription = dict[kDescription] as? String
        numberOfIssues = dict[kNumberOfIssues] as! Int
        ownerName = dict[kOwnerName] as! String
    }
    
    
    
    
    
}
