//
//  InstagramViewCell.swift
//  Istanbul_app
//
//  Created by Иван Дю on 18.06.17.
//  Copyright © 2017 Matthew. All rights reserved.
//

import UIKit

class InstagramViewCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postLikes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup (post: InstagramPost) {
        postTitle.text = post.title
        postLikes.text = String(post.likes)
    }
}
