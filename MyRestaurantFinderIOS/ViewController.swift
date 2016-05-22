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
        let ys = YelpSearch()
        ys.searchPlacesWithParameters(["ll": "37.788022,-122.399797", "category_filter": "burgers", "radius_filter": "3000", "sort": "0"], successSearch: { (data, response) -> Void in
            print(NSString(data: data, encoding: NSUTF8StringEncoding))
            print(response)
            }) { (error) -> Void in
                print(error)
        }
        
        
        
    }
}








