//
//  RestaurantsModel.swift
//  MyRestaurantFinderIOS
//
//  Created by Savani Vishnoi on 5/21/16.
//  Copyright © 2016 Savani Vishnoi. All rights reserved.
//

import Foundation

class RestaurantModel {
    // MARK: Properties
    
    var id: String
    var rating:Double
    var is_claimed: Bool
    var is_closed: Bool
    var name: String
    var image_url:String
    var phone:String
    var display_phone: String
    var review_count: Int
    var rating_img_url:String
    var snippet_text:String
    var snippet_image_url:String
    var address: String
    var city: String
    var country_code: String
    var postal_code:String
    var state_code:String
    var shrt_addr:String

    
    var  imagdata: NSData?
    
    init( id: String
    , rating:Double
    , is_claimed: Bool
    , is_closed: Bool
    , name: String
    , image_url:String
    , phone:String
    , display_phone: String
    , review_count: Int
    , rating_img_url:String
    , snippet_text:String
    , snippet_image_url:String
    , address: String
    , city: String
    , country_code: String
    , postal_code:String
    , state_code:String
        , shrt_addr:String){
        self.address = address;
        self.city = city;
        self.country_code = country_code;
        self.id = id;
        self.image_url = image_url;
        self.is_claimed = is_claimed;
        self.is_closed = is_closed;
        self.name = name;
        self.phone = phone;
        self.postal_code = postal_code;
        self.rating = rating;
        self.state_code = state_code;
        self.rating_img_url = rating_img_url;
        self.review_count = review_count;
        self.snippet_image_url = snippet_image_url;
        self.snippet_text = snippet_text;
        self.display_phone = display_phone;
        self.shrt_addr = shrt_addr;
    }
    
}