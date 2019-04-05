//
//  MediaGimmnasioViewController.swift
//  GymTec
//
//  Created by cdt307 on 4/4/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//

import UIKit
import MediaPlayer

class MediaGimmnasioViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func PlayVideo(){
        let moviePath = "http://ebookfrenzy.com/ios_book/movie/movie.mov"
        let url = URL(string: moviePath)
        //let url = NSURL.fileURLWithPath(path!)
        let moviePlayer = MPMoviePlayerViewController(contentURL: url)
        if let player = moviePlayer{
            self.presentMoviePlayerViewControllerAnimated(moviePlayer)
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
