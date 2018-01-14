//
//  ItemTagViewController.swift
//  Fireproof
//
//  Created by Cory - Personal on 1/13/18.
//  Copyright © 2018 CompanyName. All rights reserved.
//

import UIKit
import Vision
import SceneKit

class ItemTagViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    var potentialMatches:[VNClassificationObservation]?
    var saveItem: Bool = false
    var currentItem: Item?
    var currentNode: SCNNode?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var itemNameField: UITextField!
    @objc func overlayTap(_ sender: UITapGestureRecognizer) {
        itemNameField.endEditing(false)
        self.tableView.isHidden = true
    }
    @IBAction func ARButtonTap(_ sender: UIButton) {
        if (currentItem?.included ?? false) {
            sender.setImage(UIImage(named: "ARDotUnchecked"), for: .normal)
        }
        else {
            sender.setImage(UIImage(named: "ARDotChecked"), for: .normal)
        }
        
        if currentItem != nil {
            currentItem!.included = !currentItem!.included
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapOnScreen: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(overlayTap))
        tapOnScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapOnScreen)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let potMatches = potentialMatches {
            itemNameField.text = potMatches[0].identifier
        }
        
        if let searchTextField = itemNameField, let clearButton = searchTextField.value(forKey: "_clearButton") as? UIButton {
            // Create a template copy of the original button image
            let templateImage =  clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
            // Set the template image copy as the button image
            clearButton.setImage(templateImage, for: .normal)
            // Finally, set the image color
            clearButton.tintColor = .white
        }
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "suggestionCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = self.potentialMatches?[indexPath.row].identifier ?? ""
        
        return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemNameField.text = potentialMatches?[indexPath.row].identifier ?? ""
        self.currentItem?.title = itemNameField.text
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.tableView.isHidden = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.tableView.isHidden = true
        self.currentItem?.title = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.currentItem?.title = textField.text
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.destination is ViewController) {
            let vc = segue.destination as! ViewController
            
            vc.lastItem = self.currentItem
        }
    }
}
