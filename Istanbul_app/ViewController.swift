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
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource {

    var posts = [InstagramPost]()
    
    @IBOutlet weak var postsList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        postsList.dataSource = self
        postsList.register(UINib(nibName: "InstagramViewCell", bundle: nil), forCellReuseIdentifier: "InstagramViewCell")
        postsList.rowHeight = UITableViewAutomaticDimension
        postsList.estimatedRowHeight = 140
        self.navigationItem.title = "Istanbul"
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
    
    func getNetData() {
        
        Alamofire.request("https://igapi.ga/istanbul_kem/media").responseJSON { response in
            
            if let data = response.data{
                let json = JSON(data: data)
                let responsArray = json["items"].arrayValue
                if (responsArray.count > 0) {
                    self.posts = []
                    for item in responsArray{
                        let instagramPost = InstagramPost()
                        instagramPost.title = item["caption"]["text"].stringValue
                        instagramPost.likes = item["likes"]["count"].intValue
                        instagramPost.photo = item["images"]["low_resolution"]["url"].stringValue
                        self.posts.append(instagramPost)
                    }
                
                    self.deleteAll()
                    self.write(data: self.posts)
                    self.postsList.reloadData()
                }
            }
        }
    }
    
    func write(data: [InstagramPost]){
        let realm = try! Realm()
        for item in data {
            try! realm.write {
                realm.add(item)
            }
        }
    }
    func deleteAll(){
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    func getAll()->[InstagramPost]{
        var result = [InstagramPost]()
        let realm = try! Realm()
        let items = realm.objects(InstagramPost.self)
        for item in items {
            
            result.append(item)
        }
        return result
    }
    func getdata() {
       let data = getAll()
        self.posts = data
        postsList.reloadData()
        getNetData()
    }
    
}
