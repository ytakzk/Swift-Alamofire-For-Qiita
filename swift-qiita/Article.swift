//
//  Article.swift
//  swift-qiita
//
//  Created by Yuta Akizuki on 2014/09/20.
//  Copyright (c) 2014年 ytakzk.me. All rights reserved.
//

import UIKit

class Article: NSObject {
    var title: String, userName: String, linkURL: String, imageURL: String
    
    init(title: String, userName: String, linkURL: String, imageURL: String) {
        self.title = title
        self.userName = userName
        self.linkURL = linkURL
        self.imageURL = imageURL
    }
}
