//
//  SearchDetailsDataProvider.swift
//  MyRestaurantFinderIOS
//
//  Created by Shruti Kangokar on 5/22/16.
//  Copyright © 2016 Savani Vishnoi. All rights reserved.
//

import UIKit

class SearchDetailsDataProvider: NSObject, UITableViewDataSource {
    
    private let cellIdentifer = "Cell"
    
    func registerCellsForTableView(tableView: UITableView) {
        tableView.registerClass(restCell.self, forCellReuseIdentifier: cellIdentifer)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10
        return singeltonData.searchList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let item = singeltonData.searchList[indexPath.row];
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer, forIndexPath: indexPath) as! restCell
        
        cell.addLabel.text = item.shrt_addr
   
        cell.nameLabel.text = item.name
        
        let ct = String(item.review_count)
        print(ct)
        cell.viewCt.text = ct + " reviews"
        
        asyncLoadImg(item, imageView: cell.iconImg, url: item.image_url)
        asyncLoadImg(item, imageView: cell.ratImg, url: item.rating_img_url)
        
        return cell
    }
    
    
    func asyncLoadImg(model : RestaurantModel, imageView : UIImageView, url : String ) {
        let dispQueue = dispatch_queue_create("com.sjsu.restaurantfinder", nil)
        
        dispatch_async(dispQueue){
            let data = NSData(contentsOfURL: NSURL(string : url)!)
            var image : UIImage?
            if(data != nil){
                model.imagdata = data;
                image = UIImage(data : data!)!
            }
            dispatch_async(dispatch_get_main_queue()){
                imageView.image = image
            }
        }
    }
}
