//
//  ViewController.swift
//  Player
//
//  Created by DA MAC M1 157 on 2023/07/29.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //ui obj
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var volumeSilder: UISlider!
    @IBOutlet weak var playFromURLButton: UIButton!
    @IBOutlet weak var playFromProjectButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    var player = AVAudioPlayer()
    var generalPlayer = AVPlayer()
    
    
    // first loading func
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

    @IBAction func playFIle_action(_ sender: UIButton) {
        
        let path = Bundle.main.path(forResource: "wandakada", ofType: "mp3")
        let url = URL(string: path!)
        
        do {
            try player = AVAudioPlayer(contentsOf: url!)
            player.prepareToPlay()
            player.play()
        } catch {
            print("error while playing: \(error)")
        }
        
    }
    
    @IBAction func playURL_action(_ sender: UIButton) {
        
        let string = "https://www.aasouthafrica.org.za/wp-content/uploads/2023/04/Meeting-2-Friday-11h00-AA-Convention-2023.mp3"
        let url = URL(string: string)
        
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error == nil {
                self.generalPlayer = AVPlayer(url: url!)
                self.generalPlayer.play()
            }
        }.resume()

    }
    
    @IBAction func stop_action(_ sender: UIButton) {
    }
    @IBAction func pauseaction(_ sender: UIButton) {
    }
    
    
    
    
    
    
    
    
}

