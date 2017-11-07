//
//  HomeViewController.swift
//  MVC_Demo_Swift
//
//  Created by Amrendra on 26/10/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit
import MBProgressHUD

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(dismissKeyboard(gesture:)))
        self.view.addGestureRecognizer(tapGesture)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AppleMusicVC" {
                let musicVC = segue.destination as! AppleMusicViewController
                musicVC.listOfMusic = sender as! [AppleMusicModel]
        }
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Methods and Action
    func searchFor(language text: String) {
        
       let urlString = String(format: Constants.API.REPOSITORIES, text)
        ServiceManager.sharedInsance.startWebService(forUrl: urlString) { (data:Data?, error:Error?) in
        
            if error != nil {
                let alert = GenericUtility.showAlert(withTitle: NSLocalizedString("error_title", comment: ""),
                                                     message: (error?.localizedDescription)!,
                                                     btnTitle: NSLocalizedString("ok_title", comment: ""))
                self.present(alert, animated: true, completion: nil)
            }else{
                JsonParserModel.parseRepository(fromData: data!, completionHandler: {[unowned self] (results: [RepositoryModel]) in
                    
                    print("Array of Repo model = \(results)")
                    self.moveToRepositoryListViewController(withResults: results)
                })
            }
        }
    }
    
    @IBAction func didTappedForAppleMusicXML(_ sender: UIButton) {
        let urlString = String(format: Constants.API.APPLE_MUSIC);
        ServiceManager.sharedInsance.startWebService(forUrl: urlString) { (data: Data?, error: Error?) in
            if error != nil {
                let alert = GenericUtility.showAlert(withTitle: NSLocalizedString("error_title", comment: ""),
                                                     message: (error?.localizedDescription)!,
                                                     btnTitle: NSLocalizedString("ok_title", comment: ""))
                self.present(alert, animated: true, completion: nil)
            }else {
                let xmlparsing = XmlParsingModel.init();
                xmlparsing.delegate = self
                xmlparsing.parsingAppleMusicData(withData: data! as NSData)
            }
            
        }
        
    }
    func dismissKeyboard(gesture: UITapGestureRecognizer) -> Void {
        
        self.view.endEditing(true)
    }
    
    // MARK: - Navigation
    func moveToRepositoryListViewController(withResults results:[RepositoryModel]) {
        
        DispatchQueue.main.async {
            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "RepositoryListViewController") as! RepositoryListViewController
            vc.arrOfRepository = results
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}
extension HomeViewController: XmlParsingProtocol {
    func didFinishParsingContent(results: NSArray) {
        print("didFinishParsingContent")
        print("Array is = \(results)");
        performSegue(withIdentifier: "AppleMusicVC", sender: results)
    }
}
extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if (textField.text?.isEmpty)! {
           let alert = GenericUtility.showAlert(withTitle: NSLocalizedString("error_title", comment: ""),
                                                message: NSLocalizedString("search_text_empty", comment: ""),
                                                btnTitle: NSLocalizedString("ok_title", comment: ""))
            self.present(alert, animated: true, completion: nil)
        }else{
            textField.resignFirstResponder()
            searchFor(language: textField.text!)
        }
        
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
