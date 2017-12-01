//
//  NewRequestViewController.swift
//  Lender
//
//  Created by Alex Chen on 11/28/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit

class NewRequestViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var infoField: UITextView!
    
    var delegate: RequestProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCreateButton(_ sender: Any) {
        // SERVER: Post request
        if titleField.text == "" {
            print("Title cannot be empty!")
        } else if priceField.text == "" {
            print ("price cannot be empty!")
        } else {
            delegate?.addNewRequest(newRequest: Request(dictionary:
                ["title" : titleField.text ?? "title",
                "user" : User.currentUser!,
                "price" : Int(priceField.text!) ?? 0,
                "dateNeeded" : datePicker.date,
                "info" : infoField.text
                ]))
            self.dismiss(animated: true, completion: nil)
        }
        
//        let data = try! JSONSerialization.data(withJSONObject: dictionary, options: [])
//        UserDefaults.standard.set(data, forKey: "newRequestData")
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "new request"), object: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
