//
//  ItemTagViewController.swift
//  Fireproof
//
//  Created by Cory - Personal on 1/13/18.
//  Copyright © 2018 CompanyName. All rights reserved.
//

import UIKit
import Vision

class ItemTagViewController: UIViewController {
    var potentialMatches:[VNClassificationObservation]?
    var saveItem: Bool = false
    
    @IBOutlet weak var itemNameField: UITextField!
    @IBAction func overlayTap(_ sender: UITapGestureRecognizer) {
        itemNameField.endEditing(false)
    }
    @IBAction func ARButtonTap(_ sender: UIButton) {
        if (saveItem) {
            sender.setImage(UIImage(named: "ARDotUnchecked"), for: .normal)
        }
        else {
            sender.setImage(UIImage(named: "ARDotChecked"), for: .normal)
        }
        
        saveItem = !saveItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let potMatches = potentialMatches {
            itemNameField.text = potMatches[0].identifier
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
}
