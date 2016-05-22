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
    var rating:Int
    
    
    init(id: String, is_claimed: Bool, is_closed: Bool, name: String,
        image_url:String, phone:String, display_phone: String,
        review_count: Int16, categories: [String:String],
        rating: Int, rating_img_url:String,
        snippet_text:String, snippet_image_url:String,
        address: String, city: String, country_code: String,
        postal_code:String, state_code:String ){
            self.id = id
            self.rating = rating
            
    }
    
    
}