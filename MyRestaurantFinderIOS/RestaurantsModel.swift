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
    
    public var id: String
    public var rating:Double
    public var is_claimed: Bool
    public var is_closed: Bool
    public var name: String
    public var image_url:String
    public var phone:String
    public var display_phone: String
    public var review_count: Int
    public var rating_img_url:String
    public var snippet_text:String
    public var snippet_image_url:String
    public var address: String
    public var city: String
    public var country_code: String
    public var postal_code:String
    public var state_code:String
    public var shrt_addr:String
    
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