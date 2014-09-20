//
//  WebViewController.swift
//  swift-qiita
//
//  Created by Yuta Akizuki on 2014/09/20.
//  Copyright (c) 2014年 ytakzk.me. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    @IBAction func backButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    var article: Article?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url: NSURL = NSURL.URLWithString(self.article!.linkURL)
        var urlRequest: NSURLRequest = NSURLRequest(URL: url)
        self.webView.loadRequest(urlRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
