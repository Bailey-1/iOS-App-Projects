import UIKit
import AVFoundation

var player: AVAudioPlayer!

class ViewController: UIViewController {
    // 300 - 420 - 720
    let eggTimes : [String : Int] = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var totalSeconds : Int = 0 // Create variable in class scope
    var secondsPassed : Int = 0
    
    var timer = Timer()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var secondsPassedLabel: UILabel!
    @IBOutlet weak var totalSecondsLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        /* ? Optional variables might be nil in some case
           ! unwrap them to over write this */
        
        let title = sender.currentTitle! // use exclamation mark because you know that sender will always have a title.
        
        print(title)
        titleLabel.text = title
        print(eggTimes[title]!) // Use ! because you know there will always be a item in the dictionary for the title
        
        totalSeconds = eggTimes[title]!
        totalSecondsLabel.text = String(totalSeconds)
        secondsPassed = 0
        
        progressView.alpha = 1
        updateTimer()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        print("\(secondsPassed)/\(totalSeconds)")
        progressView.progress = Float(secondsPassed) / Float(totalSeconds)

        if secondsPassed < totalSeconds {
            secondsPassedLabel.text = String(secondsPassed)
            secondsPassed += 1
            
        } else {
            timer.invalidate()
            
            progressView.progress = 1.0
            progressView.alpha = 1
            
            titleLabel.text = "Done!"
            secondsPassedLabel.text = String(totalSeconds)
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                self.titleLabel.text = "How do you like your eggs?"
                self.progressView.alpha = 0
                self.secondsPassedLabel.text = ""
                self.totalSecondsLabel.text = ""
            }
        }
    }
    
}
