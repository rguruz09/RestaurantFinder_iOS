import Foundation
import OAuthSwift

//import AFNetworking.AFHTTPRequestOperationManager.h
//#import <AFNetworking/AFHTTPRequestOperationManager.h>


class YelpSearch: NSObject{
    struct YelpAPIConsole {
        var consumerKey = "tDLu-RYLeLgP4VhfuVOTqQ"
        var consumerSecret = "h5Pznh-1PF4pC_IZWoLq6ggP_Lk"
        var accessToken = "IT7Tg3AKZ0ecoix6UQxdd8zfUX4tUFgz"
        var accessTokenSecret = "je6DtwmauefDp91ZQtPp7WQWK3U"
    }
    
   
        
        let APIBaseUrl = "https://api.yelp.com/v2/"
        let clientOAuth: OAuthSwiftClient?
        let apiConsoleInfo: YelpAPIConsole
        
        override init() {
            apiConsoleInfo = YelpAPIConsole()
            self.clientOAuth = OAuthSwiftClient(consumerKey: apiConsoleInfo.consumerKey, consumerSecret: apiConsoleInfo.consumerSecret, accessToken: apiConsoleInfo.accessToken, accessTokenSecret: apiConsoleInfo.accessTokenSecret)
            super.init()
            
        }
        func searchPlacesWithParameters(searchParameters: Dictionary<String, String>,
            
            successSearch: (data: NSData, response: NSHTTPURLResponse) -> Void, failureSearch: (error: NSError) -> Void) {
                let searchUrl = APIBaseUrl + "search/"
                clientOAuth!.get(searchUrl, parameters: searchParameters, success: successSearch, failure: failureSearch)
        }
        
    }

