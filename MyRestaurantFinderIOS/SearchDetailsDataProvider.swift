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
        
        
        var image : UIImage = UIImage(named: "/Users/shrutik/Documents/bg3.png")!
        cell.iconImg.image = image
        print("The loaded image: \(image)")
        
        
//        let name = tableView.dequeueReusableCellWithIdentifier(cellIdentifer, forIndexPath: indexPath)
//        name.textLabel?.text = item.name
        
//        let imgView = tableView.dequeueReusableCellWithIdentifier(cellIdentifer, forIndexPath: indexPath);
//        load_image(item.image_url, view:imgView.imageView!)
//
   
        return cell
    }
    
    func load_image(image_url_string:String, view:UIImageView)
    {
        
        var image_url: NSURL = NSURL(string: image_url_string)!
        let image_from_url_request: NSURLRequest = NSURLRequest(URL: image_url)
        
        NSURLConnection.sendAsynchronousRequest(
            image_from_url_request, queue: NSOperationQueue.mainQueue(),
            completionHandler: {(response,
                data,
                error) -> Void in
                
                if error == nil && data != nil {
                    view.image = UIImage(data: data!)
                }
                
        })
        
    }
    
}
