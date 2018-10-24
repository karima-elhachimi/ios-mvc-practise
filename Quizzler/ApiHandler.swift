//
//  ApiHandler.swift
//  Quizzler
//
//  Created by Karima on 23/10/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
protocol QuestionsDataDelegate : class {
    func hasReceivedData(data: [Question])
}
class ApiHandler {
    weak var delegate : QuestionsDataDelegate?
    
    let QUESTIONS_URL : String = "https://opentdb.com/api.php?amount=10&difficulty=easy&type=boolean"
    var dataArray = [Question]()
    
    init() {
        self.getData()
    }
    
    
//    func launchGetRequest() {
//        Alamofire.request(QUESTIONS_URL, method: .get).responseJSON {
//            response in
//            if response.result.isSuccess {
//                if let apiData = response.result.value {
//                    print("api data: \(apiData)")
//                    for (_, subJson) in JSON(apiData)["results"] {
//                        self.dataArray.append(Question(text: subJson["question"].stringValue, correctAnswer: subJson["correct_answer"].boolValue))
//                    }
//
//                }
//            }
//        }
//    }
    
    
    func getData(/*completion: @escaping (_ jsonData: JSON) -> ()*/) -> Void {
        
        var questionsJSON : JSON?
        Alamofire.request(QUESTIONS_URL, method: .get).responseJSON {
            response in
            if response.result.isSuccess {
                if let apiData = response.result.value {
                    print("api data: \(apiData)")
                    questionsJSON = JSON(apiData)
                    self.delegate?.hasReceivedData(data: self.jsonTransformerToList(json: questionsJSON!["results"]))
                    /*completion(questionsJSON!)*/
            
                }
            }
        }
    }
    
    func asyncAddJsonToList( json : JSON, completion: (_ data: [Question]) -> ()) {
        var questions = [Question]()
        for (_, subJson) in json  {
            
            questions.append(Question(text: subJson["question"].stringValue, correctAnswer: subJson["correct_answer"].boolValue ))
           
            
        }
        
        completion(questions)
    }
    
    func jsonTransformerToList( json: JSON) ->  [Question]{
        var questions = [Question]()
        for (_, subJson) in json  {
            
            questions.append(Question(text: (subJson["question"].stringValue).stringByDecodingHTMLEntities, correctAnswer: subJson["correct_answer"].boolValue ))
            
            
        }
        return questions
        
       
    }
    
    
    
}


