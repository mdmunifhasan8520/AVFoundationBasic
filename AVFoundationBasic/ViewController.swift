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
    
    //Create a audio Player Object
    var audioPlayer = AVAudioPlayer()
    
    var isPlaying = false //This bool determines if the music is currently playing
    var timer: Timer! // timer property is needed for dispalying the current time of the music track
    
    
    @IBOutlet weak var playedTime: UILabel!
    @IBOutlet weak var PlaySoundLabel: UIButton!
    @IBOutlet weak var playBackSlider: UISlider!
    
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        playAudio()
        playBackSlider.maximumValue = Float(audioPlayer.duration)
        
        var timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(upadteSlider), userInfo: nil, repeats: true)
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
    @IBAction func changeAudioTime(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.currentTime = TimeInterval(playBackSlider.value)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    @objc func updateTime() {
        let currentTime = Int(audioPlayer.currentTime)
        let minutes = currentTime/60
        let seconds = currentTime - minutes * 60
        
        playedTime.text = String(format: "%02d:%02d", minutes,seconds) as String
    }
    
    @objc func upadteSlider() {
        playBackSlider.value = Float(audioPlayer.currentTime)
    }
    
    func playAudio() {
        //sound File
        //let soundURL = Bundle.main.path(forResource: "C#", ofType: ".wav")
        let soundURL = Bundle.main.path(forResource: "atmosphere", ofType: ".mp3")
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundURL!))
            
        } catch {
            print("error")
        }
    }
    
}

