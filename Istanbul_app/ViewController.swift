//
//  ViewController.swift
//  Istanbul_app
//
//  Created by Иван Дю on 18.06.17.
//  Copyright © 2017 Matthew. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource {

    var posts = [InstagramPost]()
    
    @IBOutlet weak var postsList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

        postsList.dataSource = self
        postsList.register(UINib(nibName: "InstagramViewCell", bundle: nil), forCellReuseIdentifier: "InstagramViewCell")
        postsList.rowHeight = UITableViewAutomaticDimension
        postsList.estimatedRowHeight = 140
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: InstagramViewCell = postsList.dequeueReusableCell(withIdentifier: "InstagramViewCell") as! InstagramViewCell
        cell.setup(post: posts[indexPath.row])
        return cell
    }
    
    func getData() {
        
        Alamofire.request("https://igapi.ga/istanbul_kem/media").responseJSON { response in
            
            if let data = response.data{
                let json = JSON(data: data)
                let responsArray = json["items"].arrayValue
                for item in responsArray{
                    let instagramPost = InstagramPost()
                    instagramPost.title = item["caption"]["text"].stringValue
                    instagramPost.likes = item["likes"]["count"].intValue
                    instagramPost.photo = item["images"]["standard_resoldution"].stringValue
                    self.posts.append(instagramPost)
                }
                self.postsList.reloadData()
            }
        }
    }
}
