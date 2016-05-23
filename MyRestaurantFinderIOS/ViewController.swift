//
//  ViewController.swift
//  MyRestaurantFinderIOS
//
//  Created by Savani Vishnoi on 5/21/16.
//  Copyright © 2016 Savani Vishnoi. All rights reserved.
//

import UIKit
import GoogleMaps
import OAuthSwift



class ViewController: UIViewController  {
    
    //  let searchController = UISearchController(searchResultsController: nil)
    var placesClient: GMSPlacesClient?
    var placePicker: GMSPlacePicker?
    
    
    
    // Instantiate a pair of UILabels in Interface Builder
    var nameLabel: UILabel!
    var addressLabel: UILabel!
    var button:UIButton!
    var restList = [RestaurantModel]()
    // var tabBarController:UITabBarController!
    //  var searchB:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellowColor()
        
        
        let searchController = UISearchController(searchResultsController: nil)
        //searchController.searchResultsUpdater = self
        definesPresentationContext = true
        //  tableView.tableHeaderView = searchController.searchBar
        
        
        let searchButton = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: "pickPlace")
        navigationItem.leftBarButtonItem   = searchButton
        let locationButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "pickPlace")
        navigationItem.rightBarButtonItem   = locationButton
        
        //        let searchController = UISearchController(searchResultsController: nil)
        //        searchController.   searchResultsUpdater = self
        //        searchController.dimsBackgroundDuringPresentation = false
        //        definesPresentationContext = true
        //  tableView.tableHeaderView = searchController.searchBar
        
        
        
        
        nameLabel = UILabel()
        addressLabel = UILabel()
        button = UIButton()
        nameLabel.text = "Hello"
        addressLabel.text="Address"
        self.view.addSubview(nameLabel)
        self.view.addSubview(addressLabel)
        button.setTitle("Yelp", forState: .Normal)
        nameLabel.frame = CGRectMake(15, 54, 300, 500)
        addressLabel.frame = CGRectMake(15, -50, 300, 500)
        button.frame = CGRectMake(15, 78, 300, 500)
        self.view.addSubview(button)
        // var ys = YelpSearch()
        
        //   button.addTarget(YelpSearch, action: "search", forControlEvents: <#T##UIControlEvents#>.Touch)
        button.addTarget(self, action: "search:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        placesClient = GMSPlacesClient()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return candies.count
        return 1
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        // let candy = candies[indexPath.row]
        //  cell.textLabel!.text = candy.name
        //cell.detailTextLabel!.text = candy.category
        return cell
    }
    
    
    @IBAction func getCurrentPlace(sender: UIButton) {
        
        placesClient?.currentPlaceWithCallback({
            (placeLikelihoodList: GMSPlaceLikelihoodList?, error: NSError?) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            self.nameLabel.text = "No current place"
            self.addressLabel.text = ""
            
            if let placeLikelihoodList = placeLikelihoodList {
                let place = placeLikelihoodList.likelihoods.first?.place
                if let place = place {
                    self.nameLabel.text = place.name
                    self.addressLabel.text = place.formattedAddress!.componentsSeparatedByString(", ")
                        .joinWithSeparator("\n")
                }
            }
        })
    }
    
    
    
    // Add a UIButton in Interface Builder to call this function
    func pickPlace() {
        let center = CLLocationCoordinate2DMake(37.788204, -122.411937)
        let northEast = CLLocationCoordinate2DMake(center.latitude + 0.001, center.longitude + 0.001)
        let southWest = CLLocationCoordinate2DMake(center.latitude - 0.001, center.longitude - 0.001)
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        placePicker = GMSPlacePicker(config: config)
        
        placePicker?.pickPlaceWithCallback({ (place: GMSPlace?, error: NSError?) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let place = place {
                //use the place for searching
                //    self.nameLabel.text = place.name
                //  self.addressLabel.text = place.formattedAddress!.componentsSeparatedByString(", ").joinWithSeparator("\n")
            } else {
                self.nameLabel.text = "No place selected"
                self.addressLabel.text = ""
            }
        })
    }
    
    
    func search(sender: UIButton){
        
        var names = [String]()
        let ys = YelpSearch()
        ys.searchPlacesWithParameters(["ll": "37.788022,-122.399797", "category_filter": "burgers", "radius_filter": "3000", "sort": "0", "limit": "20"], successSearch: { (data, response) -> Void in
            print(NSString(data: data, encoding: NSUTF8StringEncoding))
            //print(response)
            do {
                
//                if let jsonBusines:NSDictionary =
//                    try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
//                
//                    let resultset = jsonBusines["businesses"] as? NSDictionary
//                }
                
                  let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                
                if let businesses = json["businesses"] as? [[String: AnyObject]] {
                    for business in businesses {
                        let id1 = business["id"] as? String
                        let rating1 = business["rating"] as? Double
                        let is_claimed1 = business["is_claimed"] as? Bool
                        let is_closed1 = business["is_closed"] as? Bool
                        let image_url1 = business["image_url"] as? String
                        let phone1 = business["phone"] as? String
                        let display_phone1 = business["display_phone"]  as? String
                        let review_count1 = business["review_count"] as? Int
                        let rating_img_url1 = business["rating_img_url"] as? String
                        let snippet_text1 = business["snippet_text"] as? String
                        let snippet_image_url1 = business["snippet_image_url"] as? String
                        let loc = business["location"] as? NSDictionary
                        let city1 = loc!["city"] as? String
                        let country_code1 = loc!["country_code"] as? String
                        let postal_code1 = loc!["postal_code"] as? String
                        let state_code1 = loc!["state_code"] as? String
                        let add_small1 = loc!["address"] as! NSArray
                        let name1 = business["name"] as? String
                        var addr1:String = ""
                        var address1:String = ""

                        for a in add_small1 {
                            let an = a as! String
                            addr1 = addr1 + an
                        }
                        
                        let addr2 = loc!["display_address"] as! NSArray
                        for a1 in addr2 {
                            let an1 = a1 as! String
                            address1 = address1 + an1
                        }
                        
                        print(address1)
                        print(addr1)
                        
                        let item = RestaurantModel(id: id1!, rating: rating1!, is_claimed: is_claimed1!, is_closed: is_closed1!, name: name1!, image_url: image_url1!, phone: phone1!, display_phone: display_phone1!, review_count: review_count1!, rating_img_url: rating_img_url1!, snippet_text: snippet_text1!, snippet_image_url: snippet_image_url1!, address: address1, city: city1!, country_code: country_code1!, postal_code: postal_code1!, state_code: state_code1!, shrt_addr: addr1)
                        
                        singeltonData.searchList.append(item)
                        
                        
                    }
                }
                let vc = TableViewController()
                vc.dataProvider = SearchDetailsDataProvider()
                self.navigationController?.pushViewController(vc, animated: true)
                
            } catch {
                print("error serializing JSON: \(error)")
            }
            
            }) { (error) -> Void in
                print(error)
        }
        
        
        
    }
}








