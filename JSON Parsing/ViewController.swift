//
//  ViewController.swift
//  JSON Parsing
//
//  Created by Amol Dhage on 07/06/18.
//  Copyright © 2018 AmolTDhage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string : "http://api.fixer.io/latest")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print("Error")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        //Array
                      let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)as AnyObject
                        if let rates = myJson["rates"] as? NSDictionary
                        {
                            print(rates)
                        }
                    }
                    catch
                    {
                        
                    }
                }
            }
         }
        task.resume()
    }
        
        
    // Do any additional setup after loading the view, typically from a nib.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

