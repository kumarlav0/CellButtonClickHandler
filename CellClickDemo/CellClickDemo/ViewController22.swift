//
//  ViewController22.swift
//  CellClickDemo
//
//  Created by mac on 09/12/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

/**
 
 
 Step 1 :  Do everything to load data in TableView
 
 Step 2:  Create Button Action in ViewController
 
 
 
 */


class myCell22: UITableViewCell {
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var disslikeBtn: UIButton!
}



class ViewController22: UIViewController, UITableViewDelegate, UITableViewDataSource {

      @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func likeBtnClickAction(_ sender: UIButton) {
        // Note: This is assuming the button is contained directly in the cell. If the button is contained in another view, then the cell could be sender.superview.superview.
        let cell = sender.superview?.superview as! UITableViewCell
        
        let indexPath = tableView.indexPath(for: cell)
        print(indexPath?.row,"::Section::",indexPath?.section)
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return 5
       }
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 10
       }
       
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "myCell22") as! myCell22
             
           return cell
       }
       
    

}
