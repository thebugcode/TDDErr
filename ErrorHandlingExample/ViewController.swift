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

    
    func fetchData() -> AnyObject?  {
        do {
            return try readData()
        } catch {
           return nil
        }
    }
    
    
    func readData() throws -> AnyObject? {
        let data = NSData(contentsOfFile: "File.txt")
        if let data = data {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            return json
        }
        
        return nil
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
  