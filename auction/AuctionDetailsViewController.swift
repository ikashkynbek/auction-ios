//
//  AuctionDetailsViewController.swift
//  auction
//
//  Created by ik on 11/01/2017.
//  Copyright © 2017 ik. All rights reserved.
//

import UIKit

class AuctionDetailsViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var mainScrollView: UIScrollView!
    @IBOutlet var imagesScrollView: UIScrollView!
    @IBOutlet var mainDescription: UILabel!
    @IBOutlet var propertiesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let rightButtonItem:UIBarButtonItem = UIBarButtonItem(title: "Подписаться", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AuctionDetailsViewController.printme))
        self.navigationItem.rightBarButtonItem = rightButtonItem

        let scrollViewWidth:CGFloat = self.imagesScrollView.frame.width
        let scrollViewHeight:CGFloat = self.imagesScrollView.frame.height
        
        let imageArray = [#imageLiteral(resourceName: "image1"), #imageLiteral(resourceName: "image2"), #imageLiteral(resourceName: "image3"), #imageLiteral(resourceName: "image4"), #imageLiteral(resourceName: "image5")]
        
        for i in 0..<imageArray.count {
            let imageView = UIImageView(image: imageArray[i])
            imageView.contentMode = UIViewContentMode.scaleAspectFit
            imageView.frame.size.width = scrollViewWidth
            imageView.frame.size.height = scrollViewHeight
            imageView.frame.origin.x = (scrollViewWidth * CGFloat(i))
            imageView.frame.origin.y = 0
//            imageView.frame.origin.y = 8 - imagesScrollView.frame.origin.y
            imagesScrollView.addSubview(imageView)
        }

        self.imagesScrollView.contentSize = CGSize(width:scrollViewWidth * CGFloat(imageArray.count), height:1.0)
        self.imagesScrollView.delegate = self
        
        self.propertiesTable.register(UITableViewCell.self, forCellReuseIdentifier: "PropertyCell")
        propertiesTable.delegate = self
        propertiesTable.dataSource = self
        
//        print(propertiesTable.frame.size.height)
//        print(mainScrollView.frame.size.height)
//        propertiesTable.frame.size.height = propertiesTable.frame.size.height + 3000
//        mainScrollView.contentSize = CGSize(width: self.view.frame.width, height: 3000)
        
//        print(propertiesTable.frame.size.height)
//        print(mainScrollView.frame.size.height)
        
        mainScrollView.contentSize = CGSize(width: mainScrollView.frame.size.width, height: 3000);

    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCell", for: indexPath)
        cell.textLabel?.text = "axaxax"
        // Configure the cell...
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {

        let oldTableHeight = propertiesTable.frame.size.height
        propertiesTable.frame.size.height = 45 * CGFloat(propertiesTable.numberOfRows(inSection: 0))
        let scrollHeight = mainScrollView.frame.size.height - oldTableHeight + propertiesTable.frame.size.height
        mainScrollView.contentSize = CGSize(width: mainScrollView.frame.size.width, height: scrollHeight);
    }

    
    func printme() {
        print("asdasdasd")
    } 
}
