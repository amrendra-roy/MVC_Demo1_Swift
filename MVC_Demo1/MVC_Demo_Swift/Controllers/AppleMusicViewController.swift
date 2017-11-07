//
//  AppleMusicViewController.swift
//  MVC_Demo_Swift
//
//  Created by Amrendra on 30/10/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class AppleMusicViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    
    var listOfMusic = [AppleMusicModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblView.rowHeight = UITableViewAutomaticDimension
        tblView.estimatedRowHeight = 50;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}

extension AppleMusicViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfMusic.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppleMusicCell", for: indexPath) as! AppleMusicCell
        let model = listOfMusic[indexPath.row]
        cell.updateAppleMusicCell(withModel: model)
        return cell
    }
    
    
    
}
