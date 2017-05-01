//
//  ViewController.swift
//  backToBack
//
//  Created by BishopHill on 4/30/17.
//  Copyright © 2017 Dumb Unicorn. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "bach", ofType: "mp3")
    var timer = Timer()
    
    func updateScrubber() {
        
        scrubber.value = Float(player.currentTime)
        
    }
    

    @IBAction func play(_ sender: AnyObject) {
        
        player.play()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
        
    }
    @IBAction func volumeChanged(_ sender: AnyObject) {
        
        player.volume = volumeSlider.value
        
    }
    
    @IBOutlet var volumeSlider: UISlider!
    
    
    @IBAction func scrubberMoved(_ sender: AnyObject) {
        
        player.currentTime = TimeInterval(scrubber.value)
        
    }
    
    
    
    @IBOutlet var scrubber: UISlider!
    
    @IBAction func stop(_ sender: AnyObject) {
        
        timer.invalidate()
        player.pause()
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
        } catch {
            
            // process error
            
        }
        
    }
    
    @IBAction func pause(_ sender: AnyObject) {
        
        player.pause()
        timer.invalidate()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            scrubber.maximumValue = Float(player.duration)
            
        } catch {
            
    }
        
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

