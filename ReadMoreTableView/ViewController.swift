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
    
    var myIndexPathArr = [Int]()
    var moreBtn = [String]()
    var dataArr = ["Whaatsapp", "Twitter", "Facebook", "Youtube", "Flickr " , "Instagram", "Pinterest", "linkdIn", "Sarahah"]
    var descriptionArr = [
        """
 1. WhatsApp Messenger is a FREE messaging app available for Android and other smartphones. WhatsApp uses your phone's Internet connection (4G/3G/2G/EDGE or Wi-Fi, as available) to let you message and call friends and family. Switch from SMS to WhatsApp to send and receive messages, calls, photos, videos, documents, and Voice Messages.
 """,
        """
2. Photomath supports arithmetics, integers, fractions, decimal numbers, roots, algebraic expressions, linear equations/inequations, quadratic equations/inequations, absolute equations/inequations, systems of equations, logarithms, trigonometry, exponential and logarithmic functions, derivatives and integrals.
""",
        """
3. Airtel Payments Bank | Fino Payments Bank | Jio Payments Bank - RIL | Equitas Small Finance Bank | Aditya Birla Payments Bank-Idea | Janata Sahakari Bank Ltd. | Pune | Gopinath Patil Parsik Janata Sahakari Bank Ltd. | Apna Sahakari Bank Ltd. | Dombivli Nagari Sahakari Bank Ltd | Punjab & Maharashtra Cooperative Bank Limited | The Kalyan Janata Sahakari Bank Ltd. | Kallappanna Awade Ichalkaranji Janata Sahakari Bank Ltd. | The Mehsana Urban Cooperative Bank Ltd. | Thane Bharat Sahakari Bank Ltd. | Vasai Vikas Sahakari Bank Ltd. | Rajkot Nagarik Sahakari Bank Ltd. | Gujarat State Coop | The Hasti Coop Bank | Dhanalaxmi Bank | Tamilnad Mercantile bank.
""",
        """
4. Join Tiffi and Mr. Toffee on their sweet adventure through the Candy Kingdom. Travel through magical lands, visiting wondrous places and meeting deliciously kooky characters! Switch and match your way through hundreds of fun levels in this delicious puzzle adventure. The sweetest game just keeps getting sweeter!
""",
        """
 5. The Amazon India Shopping App brings to you, over 10 Crore original products and at great prices. Shop on the Amazon App for the latest electronics – Redmi 4, Apple iPhone 7, Samsung J7, OnePlus 3T & many more, accessories & software for your gadgets - memory cards, earphones, chargers, power banks & anti-virus. Don’t just stop there, shop for your home needs and choose from selection across TVs, refrigerators, water purifiers, washing machines, sofa sets, mattresses, bean bags, wall stickers & cookware. Shop from Amazon Fashion for all occasions – Formal attire, vacation wear to casual and daily wear – shirts for men, sarees & gowns for women, watches and jewellery to match and shoes & footwear to boot. Also, the kids range of clothes, footwear, toys - from remote control cars, to bicycles, skateboards and school supplies –bags, bottles & more. Download the Amazon India Shopping App for free, from Google Play Store & enjoy online shopping like never before.
 """,
        """
6. UC Browser is a free web browser for android devices with Fast Download, Data Saving, Ad-Block functionality, and helps you access music, video, cricket information with smooth experience. Customized cricket feature is available on UC Browser. You can visit many cricket sites to support your team, and watch cricket live stream, and check out match scores on UC Browser.
""",
        """
7. VLC media player is a free and open source cross-platform multimedia player that plays most multimedia files as well as discs, devices, and network streaming protocols. VLC media player is a free and open source cross-platform multimedia player that plays most multimedia files as well as discs, devices, and network streaming protocols.
""",
        """
8. Gboard has everything you love about Google Keyboard—speed and reliability, Glide Typing, voice typing, and more—plus Google Search built in. No more app switching; just search and share, right from your keyboard.
""",
        """
9. Get the official YouTube app for Android phones and tablets. See what the world is watching -- from the hottest music videos to what’s trending in gaming, entertainment, news, and more. Subscribe to channels you love, share with friends, and watch on any device.
"""]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewoutlet.dataSource = self
        tableViewoutlet.delegate = self
        // setting default initial value for myIndexpathArray
        for temp in 0...(dataArr.count-1) {
            self.myIndexPathArr.insert(self.dataArr.count, at: temp)
            self.moreBtn.insert("More", at: temp)
        }
    }
    @IBAction func moreBtn(_ sender: UIButton) {
        
        guard let tab = getCell(sender) as? DataCell else {fatalError()}
        guard let customindex = self.tableViewoutlet.indexPath(for: tab) else {fatalError()}
        if tab.moreout.currentTitle == "More" {
            myIndexPathArr[customindex.row] = customindex.row
            moreBtn[customindex.row] = "Less"
        
        }
        else if tab.moreout.currentTitle! == "Less"{
            self.myIndexPathArr[customindex.row] = self.descriptionArr.count
            self.moreBtn[customindex.row] = "More"
        }
        self.tableViewoutlet.reloadData()
    }
    @IBOutlet weak var tableViewoutlet: UITableView!
   
    
    

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
        cell.moreout.setTitle(self.moreBtn[indexPath.row], for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == self.myIndexPathArr[indexPath.row] {
            return UITableViewAutomaticDimension
        }
        return 100
    }
    
}
    // user defined method for getting custom indexpath//////
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
    
class DataCell: UITableViewCell {
    
    @IBOutlet weak var moreout: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var labelText: UILabel!
    
}

