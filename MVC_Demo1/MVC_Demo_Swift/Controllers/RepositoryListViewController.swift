//
//  RepositoryListViewController.swift
//  MVC_Demo_Swift
//
//  Created by Amrendra on 26/10/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class RepositoryListViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var arrOfRepository = [RepositoryModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblView.rowHeight = UITableViewAutomaticDimension
        tblView.estimatedRowHeight = 80
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RepositoryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfRepository.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath) as! RepositoryCell
        let model = arrOfRepository[indexPath.row] as RepositoryModel
        cell.updateRepositoryCell(repoModel: model)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = GenericUtility.showAlert(withTitle: "✍️", message: "Work In-Progress", btnTitle: "Cancel");
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
}
