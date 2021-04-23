//
//  EventsViewController.swift
//  EducationalAdminSystem
//
//  Created by 胡嘉诚 on 2021/4/24.
//

import UIKit
import SwiftSpinner
import SwiftyJSON
import Alamofire

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblEvents: UITableView!
    var eventsArr: [EventsModel] = [EventsModel] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblEvents.delegate = self
        tblEvents.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getEventsData(eventsURL)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("EventsTableViewCell", owner: self, options: nil)?.first as! EventsTableViewCell
        cell.lblEvents.text = eventsArr[indexPath.row].title
        return cell
    }
    
    func getEventsData(_ url: String) {
        SwiftSpinner.show("Getting events...")
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide()
            if response.error != nil {
                print("Error in getting events data")
                return
            }
            guard let data = response.data else {return}
            let eventsJson: [JSON] = JSON(data).arrayValue
            for index in eventsJson {
                let title = index["title"].stringValue
                let text = index["text"].stringValue
                let department = index["department"].stringValue
                let displayTime = index["displayTime"].stringValue
                let eventsItem = EventsModel(title, text, department, displayTime)
                self.eventsArr.append(eventsItem)
            }
            self.tblEvents.reloadData()
        }
    }

}
