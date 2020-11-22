//
//  Model.swift
//  NewsAPI
//
//  Created by NguyenVu on 21/11/2020.
//

import Foundation
import SwiftyJSON

class News {
    var status: String?
    var totalResults: Int?
    var articles: [Articles]?
    
    required public init?(json: JSON) {
        totalResults = json["totalResults"].intValue
        status = json["status"].stringValue
        articles = json["articles"].map{ Articles(json: JSON($0))! }
    }
}

class Articles {
    var source: [Source]?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    required public init?(json: JSON) {
        source = json["source"].map { Source(json: JSON($0))! }
        author = json["author"].stringValue
        title = json["title"].stringValue
        description = json["description"].stringValue
        url = json["url"].stringValue
        urlToImage = json["urlToImage"].stringValue
        publishedAt = json["publishedAt"].stringValue
        content = json["content"].stringValue
    }
    
}

class Source {
    var id: String?
    var name: String?
    
    required public init?(json: JSON) {
        id = json["id"].stringValue
        name = json["name"].stringValue
    }
}
