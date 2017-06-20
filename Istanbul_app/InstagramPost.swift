//
//  InstagramPost.swift
//  Istanbul_app
//
//  Created by Иван Дю on 18.06.17.
//  Copyright © 2017 Matthew. All rights reserved.
//

import Foundation
import RealmSwift

class InstagramPost: Object {
    
    dynamic var photo: String = ""
    dynamic var likes: Int = 0
    dynamic var title: String = ""
}
