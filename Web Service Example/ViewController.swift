//
//  ViewController.swift
//  Web Service Example
//
//  Created by Akshay Lazarus on 10/25/14.
//  Copyright (c) 2014 Akshay Lazarus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LTMorphingLabelDelegate {

    @IBOutlet var myNameLabel: LTMorphingLabel!
    @IBOutlet var label: LTMorphingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = AFHTTPRequestOperationManager()
        label.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        
        manager.GET("http:/graph.facebook.com/akshooty",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                println("JSON: " + responseObject.description)
                manager.GET( "http:/graph.facebook.com/bobdylan",
                    parameters: nil,
                    success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                        println("JSON: " + responseObject.description)
                    },
                    failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                        println("Error: " + error.localizedDescription)
                })
                
                if let myName = responseObject.valueForKey("name") as? String {
                    self.label.morphingEffect = .Burn
                    self.label.text = myName
                    
                    //self.myNameLabel!.text = "Akshay"
                }
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

