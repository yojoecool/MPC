//
//  ViewController.swift
//  MPC
//
//  Created by Bridges Penn on 11/30/16.
//  Copyright © 2016 Bridges Penn. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
    var sounds = [AVAudioPlayer]()
    var soundURLs = [URL]()
    var metronome = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "90bpm", ofType: "mp3")!))

    @IBOutlet var pads: [UIButton]!
    @IBOutlet weak var BPM: UITextField!
    @IBOutlet weak var playMetro: UIButton!
    
    @IBAction func playSound(_ sender: UIButton) {
        let tag = sender.tag
        
        if (sounds[tag].isPlaying){
            sounds[tag].stop()
        }
        
        sounds[tag].currentTime = 0
        sounds[tag].play()
    }
    
    @IBAction func playMetro(_ sender: UIButton) {
        metronome.stop()
        metronome.currentTime = 0
        
        if (playMetro.currentTitle == "Stop") {
            playMetro.setTitle("Play", for: UIControlState())
        }
        else {
            if let newTempo = Float(BPM.text!) {
                metronome.rate = (newTempo / 90.0)
                metronome.play()
                
                playMetro.setTitle("Stop", for: UIControlState())
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        // Do any additional setup after loading the view, typically from a nib.
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Clap1", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Clap2", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Clap1", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Cymbals1", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Hats1", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Hats2", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Kick1", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Kick2", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Kick3", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Percs1", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Percs2", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Percs3", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Percs4", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Percs5", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Percs6", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Snare1", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(URL(fileURLWithPath: Bundle.main.path(forResource: "Snare2", ofType: "wav", inDirectory: "Sounds")!))
        
        for url in soundURLs {
            sounds.append(try! AVAudioPlayer(contentsOf: url))
        }
        
        metronome.enableRate = true
        metronome.numberOfLoops = -1
        metronome.volume = 3.0
        
        BPM.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.landscapeLeft,UIInterfaceOrientationMask.landscapeRight]
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

