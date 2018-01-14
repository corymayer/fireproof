//
//  HomeScreenController.swift
//  Fireproof
//
//  Created by Wenmin He on 1/13/18.
//  Copyright © 2018 CompanyName. All rights reserved.
//

import UIKit

class HomeScreenController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var items: [String] = ["We", "are", "good"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:RoomInfoCell = self.roomTableView.dequeueReusableCell(withIdentifier: "RoomCell")! as UITableViewCell as! RoomInfoCell
        
        cell.name?.text = self.items[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        roomTableView.reloadData()
    }
    

    

    @IBOutlet weak var roomTableView: UITableView!
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var homeImg: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        roomTableView.dataSource = self
        roomTableView.delegate = self
        roomTableView.allowsMultipleSelectionDuringEditing = false
        // Do any additional setup after loading the view.
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
