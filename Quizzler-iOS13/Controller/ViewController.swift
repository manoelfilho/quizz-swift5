import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var progreesBar: UIProgressView!

    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    
    @IBOutlet weak var score: UILabel!
    
    var player: AVAudioPlayer!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progreesBar.progress = 0.0
        score.text = "Score "
        updateUI()
    }

    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //Text
        
        let actualAnswer = quizBrain.checkAnswer(userAnswer)
        
        if actualAnswer {
            
            sender.backgroundColor = UIColor.green
            
        }else{
            
            sender.backgroundColor = UIColor.red
            let url = Bundle.main.url(forResource: "fausto", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 2.0, target:self, selector: #selector(updateUI), userInfo:nil, repeats: true)
        
    }
    
    @objc func updateUI(){
        labelQuestion.text = quizBrain.getQuestion(quizBrain.questionNumber)
        
        //update buttons
        buttonOne.setTitle(quizBrain.getOptions(quizBrain.questionNumber)[0], for: .normal)
        buttonTwo.setTitle(quizBrain.getOptions(quizBrain.questionNumber)[1], for: .normal)
        buttonThree.setTitle(quizBrain.getOptions(quizBrain.questionNumber)[2], for: .normal)
        
        buttonOne.backgroundColor = UIColor.clear
        buttonTwo.backgroundColor = UIColor.clear
        buttonThree.backgroundColor = UIColor.clear
        
        progreesBar.progress = quizBrain.getProgree()
        score.text = "Score: " + String(quizBrain.getScore())
    }
    
}

