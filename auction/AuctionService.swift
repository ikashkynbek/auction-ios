//
//  AuctionService.swift
//  auction
//
//  Created by ik on 10/01/2017.
//  Copyright © 2017 ik. All rights reserved.
//

import Alamofire
import SwiftyJSON

class AuctionService {

    func getAuctions(completion:@escaping ([Auction]) -> Void) {
        
       let auctionsPath = "http://192.168.10.92:8080/api/auctions"
        
//        let headers: HTTPHeaders = ["Authorization": "Bearer \(token)"]
        
        Alamofire.request(auctionsPath, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
//                    print("JSON: \(json)")
                    let auctions = self.parseAuction(jsonArray: json["data"].array!)!
                    completion(auctions)
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    func parseAuction(jsonArray: [JSON]) -> [Auction]? {
        return jsonArray.flatMap{ jsonItem -> Auction? in
            guard let description = jsonItem["productName"].string
            else {return nil}
            return Auction(description: description)
        }
    }

}
