//
//  mainUIModel.swift
//  WeirdFace
//
//  Created by Patrick Doyle on 7/13/19.
//  Copyright © 2019 Patrick Doyle. All rights reserved.
//

import Foundation
import UIKit

//App mode
let modeSelect = 0
let modeDraw = 1
let modeUpload = 2
let modePosition = 3
let modePlace = 4
let modeShare = 5
var viewMode:Int = 0

enum Mode{
    case select
    case draw
    case upload
    case position
    case place
    case share
}

public class MainUIModel {
    
    var premiumModePurchased:Bool // track if premium mode purchased by user
    let inAppPurchasePremiumAccountID = "premium" // app store ID for in app purchase
    var selectedPreviewImage : UIImage?  //preview image
    
    init() {
        //Check if user has access to premium mode when initializing model
        let prefs = UserDefaults.standard
        self.premiumModePurchased =  prefs.bool(forKey: inAppPurchasePremiumAccountID)
    }
    
    func activatePremiumAccess(){
        let preferences = UserDefaults.standard
        preferences.set(true, forKey: inAppPurchasePremiumAccountID) //Set user defaults to save that user has purchased in-app purchases
        premiumModePurchased = true
    }
    
}
