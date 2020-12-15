//
//  ViewController44.swift
//  CellClickDemo
//
//  Created by mac on 09/12/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class myCell44: UITableViewCell {
    
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var disslikeBtn: UIButton!
    
    
    // for the button closure:-
    var didTapOnLike: (() -> Void)?
    var didTapOnDisLike: (() -> Void)?
    
    
    func whenTapOnButtons(LIKE didTapOnLike: @escaping () -> Void ,DISLIKE didTapOnDisLike: @escaping () -> Void) {
        self.didTapOnLike = didTapOnLike
        self.didTapOnDisLike = didTapOnDisLike
    }
    
    
    
    
    @IBAction private func likeBtnAction(_ sender: UIButton){
        didTapOnLike?()
    }
    
    @IBAction private func disLikeBtnAction(_ sender: UIButton){
        didTapOnDisLike?()
    }
    
    
    
}

  


class ViewController44: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell44") as! myCell44
        cell.whenTapOnButtons(LIKE: {
            self.callLikeApi(indexPath: indexPath)
        }) {
            self.callDisLikeApi(indexPath: indexPath)
        }
        
     
        
        return cell
    }
    
    
    
    func callLikeApi(indexPath:IndexPath) {
        
        print(indexPath.section,indexPath.row)
    }
    
    
    func callDisLikeApi(indexPath:IndexPath) {
        print(indexPath.section,indexPath.row)
        
    }
    
    

}
