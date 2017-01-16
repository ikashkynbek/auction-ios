//
//  AuctionDetailsViewController.swift
//  auction
//
//  Created by ik on 11/01/2017.
//  Copyright © 2017 ik. All rights reserved.
//

import UIKit

class AuctionDetailsViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet var imagesScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let rightButtonItem:UIBarButtonItem = UIBarButtonItem(title: "Подписаться", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AuctionDetailsViewController.printme))
        self.navigationItem.rightBarButtonItem = rightButtonItem

        let scrollViewWidth:CGFloat = self.imagesScrollView.frame.width
        let scrollViewHeight:CGFloat = self.imagesScrollView.frame.height - 10
        
        let imageArray = [#imageLiteral(resourceName: "image1"), #imageLiteral(resourceName: "image2"), #imageLiteral(resourceName: "image3"), #imageLiteral(resourceName: "image4"), #imageLiteral(resourceName: "image5")]
        
        for i in 0..<imageArray.count {
            let imageView = UIImageView(image: imageArray[i])
            imageView.contentMode = UIViewContentMode.scaleAspectFit
            imageView.frame.size.width = scrollViewWidth
            imageView.frame.size.height = scrollViewHeight
            imageView.frame.origin.x = (scrollViewWidth * CGFloat(i))
            imageView.center.y = 10
            imagesScrollView.addSubview(imageView)
        }

        self.imagesScrollView.contentSize = CGSize(width:scrollViewWidth * CGFloat(imageArray.count), height:1.0)
        self.imagesScrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func printme() {
        print("asdasdasd")
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
