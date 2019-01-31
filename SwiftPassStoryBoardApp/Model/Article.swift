//
//  Article.swift
//  SwiftPassStoryBoardApp
//
//  Created by MacBook on 2/1/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import Foundation

struct Article{
    private(set) public var title: String?
    private(set) public var description: String?
    private(set) public var urlToImage: String?
    private(set) public var publishedAt: String?
    
    init(title:String,description:String,urlToImage:String,publishedAt:String){
        self.title = title
        self.description = description
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
    }
}

