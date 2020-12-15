//
//  ViewController33.swift
//  CellClickDemo
//
//  Created by mac on 09/12/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

// USING PROTOCOL

class myCell33: UITableViewCell {
    
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var disslikeBtn: UIButton!
    
    var delegate:MyCellDelegate333!
    
    @IBAction private func myAction(_ sender: UIButton){
        delegate.didPressLikeButton(cell: self)
    }
    
}

protocol MyCellDelegate333 {
    func didPressLikeButton(cell: UITableViewCell)
}


// Next step, create an Extension of UITableView

extension UITableView {
    func returnIndexPath(cell: UITableViewCell) -> IndexPath?{
        guard let indexPath = self.indexPath(for: cell) else {
            return nil
        }
        return indexPath
    }
}






class ViewController33: UIViewController , UITableViewDelegate, UITableViewDataSource, MyCellDelegate333{
  

     @IBOutlet weak var tableView: UITableView!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    

   func numberOfSections(in tableView: UITableView) -> Int {
       return 5
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 10
   }
   
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "myCell33") as! myCell33
       cell.delegate = self
       return cell
   }
    
    
    
    func didPressLikeButton(cell: UITableViewCell) {
        
        // First way to get IndexPath Using Extension
        if let indexpath = self.tableView.returnIndexPath(cell: cell) {
            print(indexpath.section,",", indexpath.row)
        }
        
         // Second way to get IndexPath Using Direct Method
        let indexPath = tableView.indexPath(for: cell)
        
        print(indexPath?.section,",", indexPath?.row)
        
      }
      

    
    
}
