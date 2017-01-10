//
//  ViewController.swift
//  auction
//
//  Created by ik on 09/01/2017.
//  Copyright © 2017 ik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet var contentView: UIView!
    @IBOutlet var contentView: UIView!
    
    var auctionsView: AuctionTableViewController?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        auctionsView = self.storyboard?.instantiateViewController(withIdentifier: "AuctionsView") as? AuctionTableViewController
        addChildViewController(auctionsView!)
        auctionsView?.view.frame = contentView.frame
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        contentView.addSubview((auctionsView?.view)!)
    }

}

