//
//  AppleMusicCell.swift
//  MVC_Demo_Swift
//
//  Created by Amrendra on 30/10/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class AppleMusicCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var artistLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        // Configure the view for the selected state
    }
    
    func updateAppleMusicCell(withModel model:AppleMusicModel) {
            self.titleLbl.text = model.title
            self.artistLbl.text = model.arties
            self.durationLbl.text = String(format: "Duration: ", model.duration)
        
        
        DispatchQueue.global(qos: .background).async {
        ServiceManager.sharedInsance.startWebService(forUrl: model.thumbnilUrl!, completionHandler: { (data: Data?, error: Error?) in
            
            if error == nil {
                DispatchQueue.main.async {
                    self.imgView.image = UIImage.init(data: data!)
                }
            }
                
            })

            
            
        }
        
        
    }

}
