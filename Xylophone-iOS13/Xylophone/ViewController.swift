import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        print("Start: \(sender.titleLabel!.text!)")
        sender.alpha = 0.5
        playSound(soundName: sender.titleLabel!.text!)
        
        // Schedule a code block for 0.2 seconds time
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            sender.alpha = 1
            print("End: \(sender.titleLabel!.text!)")
        }
    }
    
    func playSound(soundName:String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
