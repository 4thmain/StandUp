//
//  ViewController.swift
//  StandUp 3
//
//  Created by Shankar Narayan on 20/01/16.
//  Copyright © 2016 4thMain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var TaskInput: UITextField!

    @IBAction func saveToList(sender: AnyObject) {
        todolist.append(TaskInput.text!)
        NSUserDefaults.standardUserDefaults().setObject(todolist, forKey: "todolist")
        TaskInput.text = ""
        print(todolist)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

