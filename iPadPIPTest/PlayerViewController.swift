//
//  PlayerViewController.swift
//  iPadPIPTest
//
//  Created by 김나용 on 2018. 7. 7..
//  Copyright © 2018년 김나용. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class PlayerViewController: AVPlayerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("isPictureInPictureSupported : \(AVPictureInPictureController.isPictureInPictureSupported())")
        
        guard let url = NSURL(string: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8") else { return }
        self.player = AVPlayer(url: url as URL)
        
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PlayerViewController: AVPlayerViewControllerDelegate {
    
    func playerViewControllerWillStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
        print("PIP will start")
    }
    
    func playerViewControllerDidStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
        print("PIP did start")
    }
    
    func playerViewControllerWillStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
        print("PIP will stop")
    }
    
    func playerViewControllerDidStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
        print("PIP did stop")
    }
    
    func playerViewController(_ playerViewController: AVPlayerViewController, failedToStartPictureInPictureWithError error: Error) {
        print("PIP Error : \(error.localizedDescription)")
    }
    
    func playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart(_ playerViewController: AVPlayerViewController) -> Bool {
        print("PIP should automatically dismiss")
        return false
    }
    
    func playerViewController(_ playerViewController: AVPlayerViewController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void) {
        
//        if let topViewController = navigationController?.topViewController {
//            topViewController.present(playerViewController, animated: true) {
//                print("ready detailvc restore presentViewController")
//                completionHandler(true)
//            }
//        }
//        else {
//            completionHandler(false)
//        }
    }
}
