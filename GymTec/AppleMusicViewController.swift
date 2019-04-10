//
//  AppleMusicViewController.swift
//  GymTec
//
//  Created by Yair Pimentel on 4/8/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//

import UIKit
import StoreKit
import MediaPlayer

class AppleMusicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        appleMusicRequestPermission()
        appleMusicCheckIfDeviceCanPlayback()
        
        appleMusicFetchStorefrontRegion()
        // Just the one track?
        appleMusicPlayTrackId(ids: ["201234458"])
        
        // ...or why stop there? Let's put on LOADS of My Chemical Romance.
        appleMusicPlayTrackId(ids: ["201234458", "201234473", "79990046"])

        // Do any additional setup after loading the view.
    }
    
    
    func appleMusicCheckIfDeviceCanPlayback()
    {
        let serviceController = SKCloudServiceController()
        serviceController.requestCapabilities { (capability:SKCloudServiceCapability, err:Error?) in
            if capability.contains(SKCloudServiceCapability.musicCatalogPlayback) {
                print("The user has an Apple Music subscription and can playback music!")
                
            } else if  capability.contains(SKCloudServiceCapability.addToCloudMusicLibrary) {
                print("The user has an Apple Music subscription, can playback music AND can add to the Cloud Music Library")
                
            } else {
                print("The user doesn't have an Apple Music subscription available. Now would be a good time to prompt them to buy one?")
                
            }
        }
    }
    
    func appleMusicRequestPermission() {
        
        SKCloudServiceController.requestAuthorization { (status:SKCloudServiceAuthorizationStatus) in
            
            switch status {
                
            case .authorized:
                
                print("All good - the user tapped 'OK', so you're clear to move forward and start playing.")
                
            case .denied:
                
                print("The user tapped 'Don't allow'. Read on about that below...")
                
            case .notDetermined:
                
                print("The user hasn't decided or it's not clear whether they've confirmed or denied.")
                
            case .restricted:
                
                print("User may be restricted; for example, if the device is in Education mode, it limits external Apple Music usage. This is similar behaviour to Denied.")
                
            }
            
        }
        
    }
    
    let applicationMusicPlayer = MPMusicPlayerController.systemMusicPlayer
    
    func appleMusicPlayTrackId(ids:[String]) {
        
        applicationMusicPlayer.setQueue(with: ids)
        applicationMusicPlayer.play()
    }
    
    func appleMusicFetchStorefrontRegion() {
        
        let serviceController = SKCloudServiceController()
        serviceController.requestStorefrontIdentifier { (storefrontId:String?, err:Error?) in
            
            guard err == nil else {
                
                print("An error occured. Handle it here.")
                return
                
            }
            
            guard let storefrontId = storefrontId else {
                
                print("Handle the error - the callback didn't contain a storefront ID.")
                return
                
            }
            
            print("Success! The Storefront ID fetched was: \(storefrontId)")
            
        }
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
