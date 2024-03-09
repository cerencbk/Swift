import UIKit

class ViewController: UIViewController {
    
    var score = 0
    var timer = Timer()
    var counter = 0
    
    
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
        
        //Timer
        
        counter = 10
        timeLabel.text = "Time: \(counter)"
         
    // bu fonsiyonu ekranda 10 dan geriye saymak için kullandık
     //   sleep fonsiyonu kullansaydık ekranda gözükmediği için ekranda saniyelik olarak uyutacak fakat ekranda da bu uyutmanın sonucunu görmek için sleep kullandık ve iiçnde de selectör kullandık ki içerisine şatlar ekledik
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
                
    }
    
    @objc func countDown(){
        timeLabel.text = "Timer: \(counter)"
        counter -= 1
        
        if counter == 0 {
            //invaidate fonsiyonu durdurmaya yarıyor
            timer.invalidate()
            
            //Allet
        
            let alert = UIAlertController(title:"Time is Up", message: "Do want to play game? ", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
            let replayeButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) {
                (UIAlertAction) in
                // REplay Button
            }
            alert.addAction(okButton)
            alert.addAction(replayeButton)
            self.present(alert, animated: true, completion: nil)
        }
    }

    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    

}




