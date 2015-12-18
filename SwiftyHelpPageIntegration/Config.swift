//
//  Config.swift
//  SwiftyHelpPageIntegration
//
//  Created by Sugam Kalra on 18/12/15.
//  Copyright © 2015 Sugam Kalra. All rights reserved.
//

import Foundation

/**
 * Config
 * A Singleton for loading data from Config.plist
 *
 * @author Sugam
 * @version 1.0
 */
class Config {
    
    /// the singleton
    static let sharedInstance = Config()
    
    // This prevents others from using the default '()' initializer for this class.
    private init() {
        loadConfig()
    }
    
    /// the config dictionary
    var config: NSDictionary?
    
    /**
    Load config from Config.plist
    */
    func loadConfig() {
        if let path = NSBundle.mainBundle().pathForResource("Config", ofType: "plist") {
            config = NSDictionary(contentsOfFile: path)
            
            print(config)
        }
    }
    
    /**
    Get base url from Config.plist
    
    - Returns: the base url string from Config.plist
    */
    func getBaseUrl() -> String {
        return config!.valueForKey("base_url") as! String
    }
    

    /**
     Get help images
     
     - returns: the help images
     */
    func getHelpImages() -> [String] {
        return config!.valueForKey("help_images") as! [String]
    }
    
    /**
     Get good sample url from Config.plist
     
     - returns: the good sample url string
     */
    func getGoodSampleUrl() -> String {
        return config!.valueForKey("good_sample_url") as! String
    }
    
    /**
     Get your sample url from Config.plist
     
     - returns: the your sample url string
     */
    func getYourSampleUrl() -> String {
        return config!.valueForKey("your_sample_url") as! String
    }

    


}
