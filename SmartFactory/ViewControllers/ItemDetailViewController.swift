//
//  ItemDetailViewController.swift
//  SmartFactory
//
//  Created by Sophie on 28.10.17.
//  Copyright © 2017 soet. All rights reserved.
//

import UIKit

class ItemDetailViewController: PopupDetailViewController {
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var comingFromLabel: UILabel!
    @IBOutlet weak var goingToLabel: UILabel!
    @IBOutlet weak var timeTraveledLabel: UILabel!
    
    convenience init() {
        self.init(nibName:nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Items on this Milkrun"
        
        headerLabel.text = "Item A"
        numberOfItemsLabel.text = "Item 1 of 1"
        comingFromLabel.text = "Coming from: "
        goingToLabel.text = "Going to: "
        timeTraveledLabel.text = "Time travelled: "
    }
}
