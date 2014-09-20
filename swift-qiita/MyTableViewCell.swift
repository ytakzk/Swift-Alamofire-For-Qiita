//
//  MyTableViewCell.swift
//  swift-qiita
//
//  Created by Yuta Akizuki on 2014/09/20.
//  Copyright (c) 2014年 ytakzk.me. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    var article: Article? {
        // When the data has been set, labels and imageView will have the values.
        didSet {
            self.titleLabel.text = self.article?.title
            self.userLabel.text = self.article?.userName
            self.userImageView.image = UIImage(named: "qiita-logo.png")
            
            var q_global: dispatch_queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            var q_main: dispatch_queue_t  = dispatch_get_main_queue();
            dispatch_async(q_global, {
                let url: NSURL = NSURL.URLWithString(self.article!.imageURL)
                var error: NSError?
                let imageData: NSData = NSData(contentsOfURL: url, options: nil, error:&error)
                let image: UIImage = (error !== nil) ? UIImage(named: "qiita-logo.png") : UIImage(data: imageData)
                dispatch_async(q_main, {
                    self.userImageView.image = image
                })
            })
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
