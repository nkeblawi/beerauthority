//
//  RateMyApp.swift
//  BeerAuthority
//
//  Created by Nabeel Keblawi on 4/23/16.
//  Copyright © 2016 Nabeel Keblawi. All rights reserved.
//

import UIKit

class RateMyApp: UIViewController, UIAlertViewDelegate {

    private let reviewURLiOS7: String = "itms-apps://itunes.apple.com/app/id"
    private let appID: String = "1088064838"
    private let appName: String = "The Beer Authority"
    
    private let kTrackingAppVersion     = "kRateMyApp_TrackingAppVersion"
    private let kFirstUseDate			= "kRateMyApp_FirstUseDate"
    private let kAppUseCount			= "kRateMyApp_AppUseCount"
    private let kSpecialEventCount		= "kRateMyApp_SpecialEventCount"
    private let kDidRateVersion         = "kRateMyApp_DidRateVersion"
    private let kDeclinedToRate			= "kRateMyApp_DeclinedToRate"
    private let kRemindLater            = "kRateMyApp_RemindLater"
    private let kRemindLaterPressedDate	= "kRateMyApp_RemindLaterPressedDate"
    
    var promptAfterDays: Double = 2
    var promptAfterUses = 3
    var promptAfterCustomEventsCount = 10
    var daysBeforeReminding: Double = 7
    
    var alertTitle = NSLocalizedString("Rate this app", comment: "RateMyApp")
    var alertMessage = ""
    var alertOKTitle = NSLocalizedString("Rate ", comment: "RateMyApp")
    var alertCancelTitle = NSLocalizedString("Don't bother me again", comment: "RateMyApp")
    var alertRemindLaterTitle = NSLocalizedString("Remind me later", comment: "RateMyApp")
    
    class var sharedInstance : RateMyApp {
        struct Static {
            static let instance : RateMyApp = RateMyApp()
        }
        return Static.instance
    }
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    private func getCurrentAppVersion()-> NSString {
        return (NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! NSString)
    }
    private func initAllSettings() {
        let prefs = NSUserDefaults.standardUserDefaults()
        prefs.setObject(getCurrentAppVersion(), forKey: kTrackingAppVersion)
        prefs.setObject(NSDate(), forKey: kFirstUseDate)
        prefs.setInteger(1, forKey: kAppUseCount)
        prefs.setInteger(0, forKey: kSpecialEventCount)
        prefs.setBool(false, forKey: kDidRateVersion)
        prefs.setBool(false, forKey: kDeclinedToRate)
        prefs.setBool(false, forKey: kRemindLater)
    }
    func trackEventUsage() {
        incrementValueForKey(name: kSpecialEventCount)
        
    }
    func trackAppUsage() {
        incrementValueForKey(name: kAppUseCount)
    }

    private func isFirstTime() -> Bool {
        let prefs = NSUserDefaults.standardUserDefaults()
        let trackingAppVersion = prefs.objectForKey(kTrackingAppVersion) as? NSString
        if trackingAppVersion == nil || !(getCurrentAppVersion().isEqualToString(trackingAppVersion! as String)) {
            return true
        }
        return false
    }
    
    private func incrementValueForKey(name name:String) {
        if isFirstTime() {
            initAllSettings()
        } else {
            let prefs = NSUserDefaults.standardUserDefaults()
            let currentCount = prefs.integerForKey(name)
            prefs.setInteger(currentCount + 1, forKey: name)
        }
        
        if shouldShowAlert() {
            showRatingAlert()
        }
    }

    private func shouldShowAlert() -> Bool{
        let prefs = NSUserDefaults.standardUserDefaults()
        let usageCount = prefs.integerForKey(kAppUseCount)
        let eventsCount = prefs.integerForKey(kSpecialEventCount)
        let firstUse = prefs.objectForKey(kFirstUseDate) as! NSDate
        let timeInterval = NSDate().timeIntervalSinceDate(firstUse)
        let daysCount = ((timeInterval / 3600) / 24)
        let hasRatedCurrentVersion = prefs.boolForKey(kDidRateVersion)
        let hasDeclinedToRate = prefs.boolForKey(kDeclinedToRate)
        let hasChosenRemindLater = prefs.boolForKey(kRemindLater)
        
        if hasDeclinedToRate {
            return false
        }
        if hasRatedCurrentVersion {
            return false
        }
        print("hasChosenRemindLater: \(hasChosenRemindLater)")
        if hasChosenRemindLater {
            let remindLaterDate = prefs.objectForKey(kFirstUseDate) as! NSDate
            let timeInterval = NSDate().timeIntervalSinceDate(remindLaterDate)
            let remindLaterDaysCount = ((timeInterval / 3600) / 24)
            return (remindLaterDaysCount >= daysBeforeReminding)
        }
        if usageCount >= promptAfterUses {
            return true
        }
        if daysCount >= promptAfterDays {
            return true
        }
        if eventsCount >= promptAfterCustomEventsCount {
            return true
        }
        return false
    }

    private func showRatingAlert() {
        var message = NSLocalizedString("If you found %@ app useful, please take a moment to rate it. Thank you.", comment: "RateMyApp")
        message = String(format:message, appName)
        
        if alertMessage.characters.count == 0 {
            alertMessage = message
        }
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: alertOKTitle + appName, style: UIAlertActionStyle.Destructive, handler: {
            alertAction in self.okButtonPressed()
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: alertCancelTitle, style: UIAlertActionStyle.Cancel, handler: {
            alertAction in self.cancelButtonPressed()
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: alertRemindLaterTitle, style: UIAlertActionStyle.Default, handler: {
            alertAction in self.remindLaterButtonPressed()
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let controller = appDelegate.window?.rootViewController?.presentedViewController
        controller?.presentViewController(alert, animated: true, completion: nil)
    }
    
    private func okButtonPressed() {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: kDidRateVersion)
        let appStoreURL = NSURL(string: reviewURLiOS7 + appID)
        UIApplication.sharedApplication().openURL(appStoreURL!)
        
    }
    
    private func cancelButtonPressed() {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: kDeclinedToRate)
        
    }
    
    private func remindLaterButtonPressed() {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: kRemindLater)
        NSUserDefaults.standardUserDefaults().setObject(NSDate(), forKey: kRemindLaterPressedDate)
    }
}
