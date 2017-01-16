//
//  AuctionDetailsViewController.swift
//  auction
//
//  Created by ik on 11/01/2017.
//  Copyright © 2017 ik. All rights reserved.
//

import UIKit

class AuctionDetailsViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet var mainScrollView: UIScrollView!
    @IBOutlet var imagesScrollView: UIScrollView!
    @IBOutlet var mainDescription: UILabel!
    
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
        
        mainDescription.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
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
