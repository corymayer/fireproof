//
//  ItemTagViewController.swift
//  Fireproof
//
//  Created by Cory - Personal on 1/13/18.
//  Copyright © 2018 CompanyName. All rights reserved.
//

import UIKit
import Eureka
import Vision

class ItemTagViewController: FormViewController {
    var potentialMatches:[VNClassificationObservation]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ SelectableSection<ImageCheckRow<String>>() { section in
            section.header = HeaderFooterView(title: "What is it?")
            section.selectionType = SelectionType.singleSelection(enableDeselection: true)
        }
        
        if let potMatches = self.potentialMatches {
            for option in potMatches {
                form.last! <<< ImageCheckRow<String>(option.identifier){ lrow in
                    lrow.title = option.identifier
                    lrow.selectableValue = option.identifier
                    lrow.value = nil
                    
                    lrow.onChange({ (row) in
                        
                    })
                }
            }
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
