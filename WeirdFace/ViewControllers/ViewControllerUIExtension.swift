//
//  ViewControllerUIExtension.swift
//  WeirdFace
//
//  Created by Patrick Doyle on 7/9/19.
//  Copyright © 2019 Patrick Doyle. All rights reserved.
//

import Foundation
import UIKit

//Class to keep track of updates to UI
extension ViewController {
    
    func configureButtonsAndViews(){
        
        addButtonsToArrays()
        rotateFullScreenImages()
        addShadowsAndBordersToViews()
        disableDefaultButtons()
    }
    
    func disableDefaultButtons(){
        configureDisabledButton(button: placeButton)
        configureDisabledButton(button: addButton)
        configureDisabledButton(button: shareButton)


    }
    
    func hideAndResetFeaturesSlider(){
        featuresSlider.isHidden = true
        featuresSlider.setValue(1.0, animated: false)
    }
    
    func addButtonsToArrays(){
        
        tattooMainMenuButtons.append(selectButton)
        tattooMainMenuButtons.append(drawButton)
        tattooMainMenuButtons.append(uploadButton)
        tattooMainMenuButtons.append(placeButton)
        tattooMainMenuButtons.append(addButton)
        tattooMainMenuButtons.append(shareButton)
        tattooMainMenuButtons.append(tattooTypeButton)
        
        distortionEditModeButtons.append(distortionSizeButton)
        distortionEditModeButtons.append(distortionPositionButton)
        
        featureButtons.append(featureHeadButton)
        featureButtons.append(featureMouthButton)
        featureButtons.append(featureNoseButton)
        featureButtons.append(featureEyesButton)
        
        positionButtons.append(positionXButton)
        positionButtons.append(positionYButton)
        positionButtons.append(positionZButton)
        
    }
    
    func addShadowsAndBordersToViews(){
        //Add shadow to all buttons
        addShadowToView(view: drawnImageFullScreenAcceptButton)
        addShadowToView(view: drawnImageFullScreenUndoButton)
        addShadowToView(view: drawnImageFullScreenDiscardButton)
        addShadowToView(view: drawnImageViewFullScreenButton)
        addShadowToView(view: colorPickerButton)
        addShadowToView(view: colorPickerFullScreenButton)
        addDeepShadowToView(view: drawnImageAcceptButton)
        addDeepShadowToView(view: drawnImageDiscardButton)
        addDeepShadowToView(view: uploadImageDiscardButton)
        addDeepShadowToView(view: uploadImageAcceptButton)
        addDeepShadowToView(view: transformLeftButton)
        addDeepShadowToView(view: transformRightButton)
        addDeepShadowToView(view: transformUpButton)
        addDeepShadowToView(view: transformDownButton)
        addDeepShadowToView(view: transformDoubleUp)
        addDeepShadowToView(view: transformDoubleDown)
        addDeepShadowToView(view: transformDoubleLeft)
        addDeepShadowToView(view: transformDoubleRight)
        addDeepShadowToView(view: transformRotateCWButton)
        addDeepShadowToView(view: transformRotateCCWButton)
        addDeepShadowToView(view: transformMinusButton)
        addDeepShadowToView(view: transformPlusButton)
        addDeepShadowToView(view: transformDoubleMinus)
        addDeepShadowToView(view: transformDoublePlus)
        addDeepShadowToView(view: transformPositionAcceptButton)
        addDeepShadowToView(view: transformSelectSizeButton)
        addDeepShadowToView(view: discardPreviewButton)
        addDeepShadowToView(view: removeWatermarkButton)
        addShadowToView(view: resetButton)
        addShadowToView(view: settingsButton)
        
        scrollMenu.addTopBorderWithColor(color: UIColor.white, width: 1.0)
        
        addShadowToView(view: settingsContainer)
        addShadowToView(view: drawnImageFullScreenRotateMessage)
        addShadowToView(view: secondaryTattooTransformSubMenu)
        
    }
    
    func configureDisabledButton(button: UIButton){
        if let button = button as? RoundedButton {
            
            button.borderWidth = 0.0
            button.isEnabled = false
            
        }
    }
    
    func configureEnabledButton(button: UIButton) {
        if let button = button as? RoundedButton {
            
            button.borderWidth = 1.0
            button.isEnabled = true
            
        }
        
    }
    
    func configureViewsForPremiumMode(isPremium: Bool ){
        
        //Remove icons with locks on them
        
        if isPremium {
            let fullScreenUnlockedImg = UIImage(named: "iconFullScreen.png")
            drawnImageViewFullScreenButton.setImage(fullScreenUnlockedImg, for: .normal)
            let colorPickUnlockedImg = UIImage(named: "iconColorWheel.png")
            colorPickerButton.setImage(colorPickUnlockedImg, for: .normal)
            purchasePremiumButton.isEnabled = false
            purchasePremiumButton.setTitle("Premium Mode Purchased", for: .normal)
            
            //Hide watermark and remove watermark button
            watermark.isHidden = true
            removeWatermarkButton.isHidden = true
        } else {
            let fullScreenLockedImg = UIImage(named: "iconFullScreenLocked.png")
            drawnImageViewFullScreenButton.setImage(fullScreenLockedImg, for: .normal)
            let colorPickLockedImg = UIImage(named: "iconColorWheelLocked.png")
            colorPickerButton.setImage(colorPickLockedImg, for: .normal)
            purchasePremiumButton.isEnabled = true
            purchasePremiumButton.setTitle("Purchase Premium Mode", for: .normal)
            
            //Hide watermark and remove watermark button
            watermark.isHidden = false
            removeWatermarkButton.isHidden = false
            
        }
    
    }
    
    func addShadowToView(view: UIView){
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 1.0
        view.clipsToBounds = false
    }
    
    func addDeepShadowToView(view: UIView){
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowOpacity = 0.8
        view.layer.shadowRadius = 2.0
        view.clipsToBounds = false
    }
    
    func configureButtonAsSelected(button: UIButton){
        if let button = button as? RoundedButton {
            button.borderColor = UIColor.green
            button.tintColor = UIColor.green
        }
    }
    
    func configureButtonAsUnselected(button: UIButton){
        if let button = button as? RoundedButton {
            button.borderColor = UIColor.white
            button.tintColor = UIColor.white
        }
    }
    
    func rotateFullScreenImages(){
        //Rotate the buttons in the full screen imageview since user will be using the screen in landscape mode
        drawnImageFullScreenAcceptButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        
        drawnImageFullScreenUndoButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        
    }
    
}
