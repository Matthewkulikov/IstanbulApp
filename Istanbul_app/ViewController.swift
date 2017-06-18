//
//  ViewController.swift
//  Istanbul_app
//
//  Created by Иван Дю on 18.06.17.
//  Copyright © 2017 Matthew. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var posts: [InstagramPost] = []
    
    @IBOutlet weak var postsList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

        postsList.dataSource = self
        postsList.register(UINib(nibName: "InstagramViewCell", bundle: nil), forCellReuseIdentifier: "InstagramViewCell")
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: InstagramViewCell = postsList.dequeueReusableCell(withIdentifier: "InstagramViewCell") as! InstagramViewCell
        return cell
    }
    
    func getData() {
        
    }
}
