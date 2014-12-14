//
//  ViewController.swift
//  JsonView
//
//  Created by Shohei Michiwaki on 2014/12/14.
//  Copyright (c) 2014年 Shohei Michiwaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet var loadButton: UIButton!
    
    // API取得の開始処理
    func getData() {
        let URL = NSURL(string: "http://noaniels.azurewebsites.net/api/userapi/getusers");
        let req = NSURLRequest(URL: URL!);
        let connection: NSURLConnection = NSURLConnection(request: req, delegate: self, startImmediately: false)!;
        
        // NSURLConnectionを使ってAPIを取得する
        NSURLConnection.sendAsynchronousRequest(req,
            queue: NSOperationQueue.mainQueue(),
            completionHandler: response);
    }
    
    // 取得したAPIデータの処理
    func response(res: NSURLResponse!, data: NSData!, error: NSError!){
        let json:NSArray = NSJSONSerialization.JSONObjectWithData(data,
            options: NSJSONReadingOptions.AllowFragments, error: nil) as NSArray
        
//        let res:NSDictionary = json.objectForKey("response") as NSDictionary
//        let pref:NSArray = res.objectForKey("prefecture") as NSArray
        
        // １行ずつログに表示
        for var i=0 ; i<json.count ; i++ {
            println(json[i])
            println(json[i].objectForKey("UserId") as NSInteger)
            println(json[i].objectForKey("Name") as NSString)
            
        }
    }
    
    @IBAction func load(sender: AnyObject) {
        getData()
    }
}

