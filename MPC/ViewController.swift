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
    var soundURLs = [NSURL]()
    var metronome = try! AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("90bpm", ofType: "mp3")!))

    @IBOutlet var pads: [UIButton]!
    @IBOutlet weak var BPM: UITextField!
    @IBOutlet weak var playMetro: UIButton!
    
    @IBAction func playSound(sender: UIButton) {
        let tag = sender.tag
        
        if (sounds[tag].playing){
            sounds[tag].stop()
        }
        
        sounds[tag].currentTime = 0
        sounds[tag].play()
    }
    
    @IBAction func playMetro(sender: UIButton) {
        metronome.stop()
        metronome.currentTime = 0
        
        if (playMetro.currentTitle == "Stop") {
            playMetro.setTitle("Play", forState: .Normal)
        }
        else {
            if let newTempo = Float(BPM.text!) {
                metronome.rate = (newTempo / 90.0)
                metronome.play()
                
                playMetro.setTitle("Stop", forState: .Normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.LandscapeLeft.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
        
        // Do any additional setup after loading the view, typically from a nib.
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Clap1", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Clap2", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Clap1", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Cymbals1", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Hats1", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Hats2", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Kick1", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Kick2", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Kick3", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Percs1", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Percs2", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Percs3", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Percs4", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Percs5", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Percs6", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Snare1", ofType: "wav", inDirectory: "Sounds")!))
        soundURLs.append(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Snare2", ofType: "wav", inDirectory: "Sounds")!))
        
        for url in soundURLs {
            sounds.append(try! AVAudioPlayer(contentsOfURL: url))
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

    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.LandscapeLeft,UIInterfaceOrientationMask.LandscapeRight]
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

