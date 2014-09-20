//
//  ViewController.swift
//  swift-qiita
//
//  Created by Yuta Akizuki on 2014/09/20.
//  Copyright (c) 2014年 ytakzk.me. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var articles: Array<Article>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        articles = Array()
        
        // Get articles
        var result: NSArray?
        Alamofire.request(.GET, "https://qiita.com/api/v1/search?q=swift",parameters: nil, encoding: .JSON)
            .responseJSON { (request, response, JSON, error) in
                result = (JSON as NSArray)
                
                // Make models from Json data
                for (var i = 0; i < result?.count; i++) {
                    let dic: NSDictionary = result![i] as NSDictionary
                    var article: Article = Article(
                        title: dic["title"] as String,
                        userName: dic["user"]!["url_name"] as String,
                        linkURL: dic["url"] as String,
                        imageURL:dic["user"]!["profile_image_url"] as String
                    )
                    self.articles?.append(article)
                }
                self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int  {
        return articles!.count
    }
    
    func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell! {
        let cell: MyTableViewCell = tableView?.dequeueReusableCellWithIdentifier("Cell") as MyTableViewCell
        cell.article = articles?[indexPath.row]
        return cell;
    }
    
    func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
        // When a cell has selected, open WebViewController.
        let cell: MyTableViewCell = tableView?.cellForRowAtIndexPath(indexPath) as MyTableViewCell
        self.performSegueWithIdentifier("WebViewController", sender: cell)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        // Assign a model to WebViewController
        if segue.identifier == "WebViewController" {
            var cell : MyTableViewCell = sender as MyTableViewCell
            let vc: WebViewController = segue.destinationViewController as WebViewController
            vc.article = cell.article
        }
    }
}
