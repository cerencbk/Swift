import UIKit

class ViewController: UIViewController {
    
    var score = 0
    var timer = Timer()
    var counter = 0
    var kennyArray = [UIImageView()]
    var hideTimer = Timer()
    var highScore = 0
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        
        //Highscore check
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        if storedHighScore ==  nil{
            highScore = 0
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int{
            highScore = newScore
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        
        // Resimlerin tıklanılabilir olması için
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        
        
        // Brada özellikle action var çünkü resme tıklandığında ne olmasını istiyorsak onun fonksiyonunu ekledik
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        
        // resim ve increaseScore birbirine bağlı çalıştığı için fonksiyonun her resim için farklı çalışması gerekiyor ve bunun için de ayrı ayrı bu şekide birbine bağladık diyebiliriz
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)
        
        kennyArray = [kenny1,kenny2,kenny3,kenny4,kenny5,kenny6,kenny7,kenny8,kenny9]
//        kennyArray.append(kenny1)  bu şekilde de dizi tek tek tanımlanabilirdi
        
        
//Timer start
        counter = 10
        timeLabel.text = "Time: \(counter)"
         
    // bu fonsiyonu ekranda 10 dan geriye saymak için kullandık
     //   sleep fonsiyonu kullansaydık ekranda gözükmediği için ekranda saniyelik olarak uyutacak fakat ekranda da bu uyutmanın sonucunu görmek için sleep kullandık ve iiçnde de selectör kullandık ki içerisine şatlar ekledik
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
          
        hideKenny()
    }
    //didload end
    
    @objc func hideKenny(){
        for kenny in kennyArray{
            kenny.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        kennyArray[random].isHidden = false
        
        if counter == 1 {
            // Resimlerin tıklanılabilir olması için
            kenny1.isUserInteractionEnabled = false
            kenny2.isUserInteractionEnabled = false
            kenny3.isUserInteractionEnabled = false
            kenny4.isUserInteractionEnabled = false
            kenny5.isUserInteractionEnabled = false
            kenny6.isUserInteractionEnabled = false
            kenny7.isUserInteractionEnabled = false
            kenny8.isUserInteractionEnabled = false
            kenny9.isUserInteractionEnabled = false
        }

    }
    
    @objc func countDown(){
        timeLabel.text = "Timer: \(counter)"
        counter -= 1
        
        if counter == 0 {
            //invaidate fonsiyonu durdurmaya yarıyor
            timer.invalidate()
            hideTimer.invalidate()
            
            for kenny in kennyArray{
                kenny.isHidden = false
            }
            
            //High Score
            if self.score > self.highScore{
                self.highScore = self.score
                highScoreLabel.text = "Highscore: \(highScore)"
                UserDefaults.standard.setValue(self.highScore, forKey: "highscore")
            }
            
            
            //Allet
            let alert = UIAlertController(title:"Time is Up", message: "Do want to play game? ", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
            let replayeButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) {
                (UIAlertAction) in
                //Replay func
                // Resimlerin tıklanılabilir olması için
                self.kenny1.isUserInteractionEnabled = true
                self.kenny2.isUserInteractionEnabled = true
                self.kenny3.isUserInteractionEnabled = true
                self.kenny4.isUserInteractionEnabled = true
                self.kenny5.isUserInteractionEnabled = true
                self.kenny6.isUserInteractionEnabled = true
                self.kenny7.isUserInteractionEnabled = true
                self.kenny8.isUserInteractionEnabled = true
                self.kenny9.isUserInteractionEnabled = true
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideKenny), userInfo: nil, repeats: true)
                
            }
            alert.addAction(okButton)
            alert.addAction(replayeButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    //Timer end

    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    

}




