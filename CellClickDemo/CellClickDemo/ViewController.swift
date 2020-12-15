//
//  ViewController.swift
//  CellClickDemo
//
//  Created by mac on 08/12/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var disslikeBtn: UIButton!
    
    
    // the youtuber (Model), you can use your custom model class here
    var indexPath : IndexPath?
    
    // the delegate, remember to set to weak to prevent cycles
     weak var delegate : YoutuberTableViewCellDelegate?
       
     override func awakeFromNib() {
       super.awakeFromNib()
       // Initialization code
           
       // Add action to perform when the button is tapped
       self.likeBtn.addTarget(self, action: #selector(subscribeButtonTapped(_:)), for: .touchUpInside)
     }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
    }
      
    @objc  func subscribeButtonTapped(_ sender: UIButton){
      // ask the delegate (in most case, its the view controller) to
      // call the function 'subscribeButtonTappedFor' on itself.
      if let indexPath = indexPath,
         let delegate = delegate {
          self.delegate?.youtuberTableViewCell(self, subscribeButtonTappedFor: indexPath)
      }
    }
    
}



// Only class object can conform to this protocol (struct/enum can't)
protocol YoutuberTableViewCellDelegate: AnyObject {
  func youtuberTableViewCell(_ youtuberTableViewCell: myCell, subscribeButtonTappedFor indexPath: IndexPath)
}



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! myCell
         cell.indexPath = indexPath
        // the 'self' here means the view controller, set view controller as the delegate
        cell.delegate = self
        
        return cell
    }
    
    
    

}


extension ViewController : YoutuberTableViewCellDelegate {
    func youtuberTableViewCell(_ youtuberTableViewCell: myCell, subscribeButtonTappedFor indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Subscribed!", message: "Row number: \(indexPath.row), Section: \(indexPath.section)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
 
    
}
