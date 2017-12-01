//
//  RequestViewController.swift
//  Lender
//
//  Created by Alex Chen on 4/3/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit
import MBProgressHUD

class RequestsViewController: UIViewController, UITableViewDataSource, RequestProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var searchBar: UISearchBar!
    var requests: [Request]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hardCodeAddRequests()
        
        // Initialize the UI
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
       // NotificationCenter.default.addObserver(self, selector: #selector(newRequestReceived), name: NSNotification.Name(rawValue: "new request"), object: nil)

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell", for: indexPath) as! RequestCell
        cell.request = requests[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if requests == nil {
            return 0
        }
        return requests.count
    }
    
    func addNewRequest(newRequest: Request)  {
        self.requests.insert(newRequest, at: 0)
        self.tableView.reloadData()
    }

//    func newRequestReceived(notification: Notification) {
//        let data = UserDefaults.standard.object(forKey: "newRequestData") as! Data
//        let dictionary = try! JSONSerialization.jsonObject(with: data, options: [])
//        let newRequest = Request(dictionary: dictionary as! NSDictionary)
//        self.requests.insert(newRequest, at: 0)
//        self.tableView.reloadData()
//    }
    
    func hardCodeAddRequests() {
        requests = []
        requests.append(Request(dictionary: [
            "title" : "Hawaiian Shirt, size M",
            "user" : User(dictionary: ["name" : "Frat-boy-party"]),
            "price" : 6,
            "dateNeeded" : Date(),
            "info" : "I'm going to a frat party, just gimme something that looks Hawaiian!"
        ]))
        
        requests.append(Request(dictionary: [
            "title" : "Blond wig",
            "user" : User(dictionary: ["name" : "FUTUREstar"]),
            "price" : 3,
            "dateNeeded" : Date(),
            "info" : "I need to play Hannah Montana for a video project!"
        ]))
        
        requests.append(Request(dictionary: [
            "title" : "Suede protector",
            "user" : User(dictionary: ["name" : "Love-myShoeS"]),
            "price" : 2,
            "dateNeeded" : Date(),
            "info" : "GOTTA PROTECT MY FAVORITE SUEDE SHOES! I'll use just a little bit I promise"
        ]))
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("preparing for segue: \(segue.identifier!)")
        if (segue.identifier == "RDetailsSegue") {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let request = requests[indexPath!.row]
            
            let requestVC = segue.destination as! RequestViewController
            requestVC.request = request
        } else if (segue.identifier == "RCreateSegue") {
            let newRequestVC = segue.destination as! NewRequestViewController
            newRequestVC.delegate = self
        }
    }
}

protocol RequestProtocol {
    func addNewRequest(newRequest: Request)
}
