//
//  DataService.swift
//  SwiftPassStoryBoardApp
//
//  Created by MacBook on 2/1/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias CompletionHandler = (_ Success : Bool) -> ()

class DataService{
    
    var mainArticleArray : [Article] = []
    
    static let instance = DataService()
    
    func fetchArticle(Completion : @escaping CompletionHandler){
        
        let headers = ["Content-Type" : "application/json"]
        
        Alamofire.request(MAIN_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            guard let data = response.data else{return}
            let swiftyJson = JSON(data)
            
            let articleJson = swiftyJson["articles"]
            
            if(response.error == nil){
                for(_,val) in articleJson{
                    let title = val["title"].stringValue
                    let description = val["description"].stringValue
                    let urlToImage = val["urlToImage"].stringValue
                    let publishedAt = val["publishedAt"].stringValue
                    
                    let article = Article(title: title, description: description, urlToImage: urlToImage, publishedAt: publishedAt)
                    
                    self.mainArticleArray.append(article)
                }
                Completion(true)
            }
            else{
                Completion(false)
            }
        }
    }
}
