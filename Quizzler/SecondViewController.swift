//
//  SecondViewController.swift
//  Quizzler
//
//  Created by Karima on 22/10/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, QuestionsDataDelegate {
    
    
    
    
    let questionBank : QuestionBank = QuestionBank()
    let apiHandler : ApiHandler = ApiHandler()
    var questions = [Question]()
   
    
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        rightSwipe.direction = .right
        
        
        self.apiHandler.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "questionCell")
        resizeTableRow()
       
        
       tableView.addGestureRecognizer(rightSwipe)
       
        
        
    }
    
    func hasReceivedData(data: [Question]) {
        self.questions = data;
        self.tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as! QuestionCellController
        
        print("question: \(self.questions[indexPath.row].question)")
        cell.questionLabel.text = self.questions[indexPath.row].question
    
    
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func resizeTableRow() {
       
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = UITableViewAutomaticDimension
        
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .right) {
            print("Swipe right")
          
            dismiss(animated: true, completion: nil)
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
