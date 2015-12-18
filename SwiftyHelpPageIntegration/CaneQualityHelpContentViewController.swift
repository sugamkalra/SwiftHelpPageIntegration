//
//  CaneQualityHelpContentViewController.swift
//  SwiftyHelpPageIntegration
//
//  Created by Sugam Kalra on 18/12/15.
//  Copyright © 2015 Sugam Kalra. All rights reserved.
//

import UIKit

/**
 * CaneQualityHelpContentViewController
 *
 * @author Sugam
 * @version 1.0
 */
class CaneQualityHelpContentViewController: UIViewController {
    
    /// outlets
    @IBOutlet weak var imageView: UIImageView!
    
    /// page index
    var pageIndex: Int!
    
    /// the image
    var image: UIImage!
    
    /**
     view did load
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = image
    }
}
