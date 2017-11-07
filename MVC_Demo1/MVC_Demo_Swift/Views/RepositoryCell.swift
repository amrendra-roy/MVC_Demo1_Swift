//
//  RepositoryCell.swift
//  MVC_Demo_Swift
//
//  Created by Amrendra on 26/10/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var openIssueLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateRepositoryCell(repoModel model: RepositoryModel) {
        titleLbl.text = model.userName
        openIssueLbl.text = "Open issues: "+String(model.numberOfIssues)
        detailLbl.text = model.repoDescription
    }
}
