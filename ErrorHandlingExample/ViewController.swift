//
//  ViewController.swift
//  ErrorHandlingExample
//
//  Created by Dan Ursu on 06/02/16.
//  Copyright © 2016 Dan Ursu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    func fetchData() throws -> AnyObject  {
        let data = NSData(contentsOfFile: "File.txt")
        if let data = data {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            return json
        } else {
           throw NSError(domain: "lala", code: 0, userInfo: nil)
        }
   
    }
    
    func throwingFunction() throws -> AnyObject {
        throw Readfailure()
    }
    
    func nonThrowingFunction() throws -> AnyObject {
        return ""
    }


}

class Readfailure: ErrorType {
}
  