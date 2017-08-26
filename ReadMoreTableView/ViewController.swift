//
//  ViewController.swift
//  ReadMoreTableView
//
//  Created by appinventiv on 25/08/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
   
    var row = 0
    var isSelect = false
    @IBAction func moreBtn(_ sender: UIButton) {
        
        let tab = getCell(sender) as! DataCell
        let customindex = self.tableViewoutlet.indexPath(for: tab)
        let btn = sender as UIButton
        _ = btn.tag
        
        
        
        if isSelect == true{
            tab.descriptionLabel.numberOfLines = 0
            
            isSelect = false
    }
        else{
            tab.descriptionLabel.numberOfLines = 2
            isSelect = true
    }
       tableViewoutlet.estimatedRowHeight = 500
        tableViewoutlet.rowHeight = UITableViewAutomaticDimension
        tableViewoutlet.reloadData()
        
    }
    @IBOutlet weak var tableViewoutlet: UITableView!
    var dataArr = ["Whaatsapp", "Twitter", "Facebook", "Youtube", "Flickr " , "Instagram", "Pinterest", "linkdIn", "Sarahah"]
    var descriptionArr = ["WhatsApp Messenger is a FREE messaging app available for Android and other smartphones. WhatsApp uses your phone's Internet connection (4G/3G/2G/EDGE or Wi-Fi, as available) to let you message and call friends and family. Switch from SMS to WhatsApp to send and receive messages, calls, photos, videos, documents, and Voice Messages " , "From breaking news and entertainment to sports, politics, and everyday interests, when it happens in the world, it happens on Twitter first. See all sides of the story. Join the conversation. Watch live streaming events. Twitter is what’s happening in the world and what people are talking about right now. ", "The Facebook app does more than help you stay connected with your friends and interests. It's also your personal organizer for storing, saving and sharing photos. It's easy to share photos straight from your Android camera, and you have full control over your photos and privacy settings. You can choose when to keep individual photos private or even set up a secret photo album to control who sees it.Get the official YouTube app for Android phones and tablets. See what the world is watching -- from the hottest music videos to what’s trending in gaming, entertainment, news, and more. Subscribe to channels you love, share with friends, and watch on any device" , "", "", "", "", "", ""]
    override func viewDidLoad() {
        tableViewoutlet.dataSource = self
        tableViewoutlet.delegate = self
        super.viewDidLoad()
        
        
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
   
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(dataArr)
        
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as? DataCell else{fatalError()}
        cell.labelText.text = dataArr[indexPath.row]
        cell.descriptionLabel.text = descriptionArr[indexPath.row]
        self.row = indexPath.row
        //tableViewoutlet.rowHeight = 400
        //tableViewoutlet.estimatedRowHeight = 50
        //tableViewoutlet.rowHeight = UITableViewAutomaticDimension
        return cell
    }
    
    func getCell(_ sender: UIButton) -> UITableViewCell {
        var cell: UIView = sender
        //----------jab tak cell superview nh milta-------- superview mil gaya
        while !(cell is DataCell) {
            if let super_view = cell.superview {
                cell = super_view
            } else {}
            
            
        }
        guard let tableCell = cell as? DataCell
            else
        {
            fatalError()
        }
        return tableCell
    }
    
    
    }

extension String {
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return boundingBox.height
    }}
//open class MyClass: UIButton
//{
//    var row: Int?
//}
class DataCell: UITableViewCell {
    
    @IBOutlet weak var moreout: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var labelText: UILabel!
    
}

