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

    @IBOutlet weak var playedTime: UILabel!
    
    @IBOutlet weak var PlaySoundLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playAudio()
       
    }
    func playAudio() {
        //sound File
        let soundURL = Bundle.main.path(forResource: "C#", ofType: ".wav")
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundURL!))
            
        } catch {
            print("error")
        }
    }

    @IBAction func PlaySound(_ sender: Any) {
        audioPlayer.play()
        PlaySoundLabel.titleLabel?.text = "Stop Sound"
        print("play sound")
    }
    
}

