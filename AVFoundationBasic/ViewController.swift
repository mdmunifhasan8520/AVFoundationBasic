//
//  ViewController.swift
//  AVFoundationBasic
//
//  Created by Mac PC on 2/18/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //Create audio Player Object
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sound File
        let sound = Bundle.main.path(forResource: "C#", ofType: ".wav")
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            
        } catch {
            print("error")
        }
    }

    @IBAction func PlaySound(_ sender: Any) {
        audioPlayer.play()
        print("play sound")
    }
    
}

