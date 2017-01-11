//
//  Auction.swift
//  auction
//
//  Created by ik on 10/01/2017.
//  Copyright © 2017 ik. All rights reserved.
//

public class Auction {
    
    public let description:String
    public let price:Double
    public let ordersQty:Int
    public let maxPrice:Double
    public let minPrice:Double
    
    init(description:String, price:Double, ordersQty:Int, maxPrice:Double, minPrice:Double) {
        self.description = description
        self.price = price
        self.ordersQty = ordersQty
        self.maxPrice = maxPrice
        self.minPrice = minPrice
    }
}
