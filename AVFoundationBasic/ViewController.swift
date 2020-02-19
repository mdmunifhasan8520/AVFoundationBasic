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
    var isPlaying = false
    var timer: Timer!

    @IBOutlet weak var playedTime: UILabel!
    @IBOutlet weak var PlaySoundLabel: UIButton!
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        playAudio()
       
    }
    
    @IBAction func stopMusic(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        isPlaying = false
        
    }
    
    @IBAction func playOrPauseMusic(_ sender: Any) {
        if isPlaying {
            audioPlayer.stop()
            isPlaying = false
        } else {
            audioPlayer.play()
            isPlaying = true
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateTime() {
        let currentTime = Int(audioPlayer.currentTime)
        let minutes = currentTime/60
        let seconds = currentTime - minutes * 60
        
        playedTime.text = String(format: "%02d:%02d", minutes,seconds) as String
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
    
}

