//
//  AuctionTableViewController.swift
//  auction
//
//  Created by ik on 10/01/2017.
//  Copyright © 2017 ik. All rights reserved.
//

import UIKit

class AuctionTableViewController: UITableViewController {

    var apiService:AuctionService!
    var auctions = [Auction]()
    var currencySymbol:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        currencySymbol = getSymbolForCurrencyCode(code: "KZT")
        apiService = AuctionService()
        
        apiService.getAuctions() {(aucs) in
            self.auctions =  aucs
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return auctions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AuctionsCell", for: indexPath) as! AuctionCell
        let a = auctions[indexPath.row]
        
        cell.shortDescription.text = a.description
        cell.price.text = String(a.price) + currencySymbol
        cell.maxPrice.text = String(a.maxPrice)
        cell.minPrice.text = String(a.minPrice)
        cell.qty.text = String(a.ordersQty)
        cell.profit.text = String(format:"%.2f", a.maxPrice - a.minPrice) + currencySymbol
        
        return cell
    }
    


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let detailsView = self.storyboard?.instantiateViewController(withIdentifier: "ActionDetails") as? AuctionDetailsViewController
//        self.present(detailsView!, animated: true, completion: nil)
        
//        let detailsView = AuctionDetailsViewController()
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.pushViewController(detailsView!, animated: true)

    }
    
    func getSymbolForCurrencyCode(code: String) -> String? {
        let locale = NSLocale(localeIdentifier: code)
        return locale.displayName(forKey: NSLocale.Key.currencySymbol, value: code)
    }
}
