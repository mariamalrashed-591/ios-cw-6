//
//  ViewController.swift
//  ios-cw-6-x-o
//
//  Created by Mariam on 9/26/20.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var turnLabel: UILabel!
    var counter = 0
    
    @IBAction func click(_ sender: UIButton) {
        if counter % 2 == 0 {
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(UIColor.yellow, for: .normal)
            turnLabel.text = "O turn"
        }
        else{
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(UIColor.orange, for: .normal)
            turnLabel.text = "X turn"
        }
        counter = counter + 1
        sender.isEnabled = false
        checkXwin()
        checkOwin()
    }
    
    func checkXwin() {
        let row1 = b1.titleLabel?.text == "X" && b2.titleLabel?.text == "X" && b3.titleLabel?.text == "X"
        let row2 = b4.titleLabel?.text == "X" && b5.titleLabel?.text == "X" && b6.titleLabel?.text == "X"
        let row3 = b7.titleLabel?.text == "X" && b8.titleLabel?.text == "X" && b9.titleLabel?.text == "X"
        
        let column1 = b1.titleLabel?.text == "X" && b4.titleLabel?.text == "X" && b7.titleLabel?.text == "X"
        let column2 = b2.titleLabel?.text == "X" && b5.titleLabel?.text == "X" && b8.titleLabel?.text == "X"
        let column3 = b3.titleLabel?.text == "X" && b6.titleLabel?.text == "X" && b9.titleLabel?.text == "X"
        
        let diagonal1 = b1.titleLabel?.text == "X" && b5.titleLabel?.text == "X" && b9.titleLabel?.text == "X"
        let diagonal2 = b3.titleLabel?.text == "X" && b5.titleLabel?.text == "X" && b7.titleLabel?.text == "X"
        
        if row1 || row2 || row3 || column1 || column2 || column3 || diagonal1 || diagonal2 {
            resultLabel.text = " X wins!"
        }
    }
    
    func checkOwin() {
        let row1 = b1.titleLabel?.text == "O" && b2.titleLabel?.text == "O" && b3.titleLabel?.text == "O"
        let row2 = b4.titleLabel?.text == "O" && b5.titleLabel?.text == "O" && b6.titleLabel?.text == "O"
        let row3 = b7.titleLabel?.text == "O" && b8.titleLabel?.text == "O" && b9.titleLabel?.text == "O"
        
        let column1 = b1.titleLabel?.text == "O" && b4.titleLabel?.text == "O" && b7.titleLabel?.text == "O"
        let column2 = b2.titleLabel?.text == "O" && b5.titleLabel?.text == "O" && b8.titleLabel?.text == "O"
        let column3 = b3.titleLabel?.text == "O" && b6.titleLabel?.text == "O" && b9.titleLabel?.text == "O"
        
        let diagonal1 = b1.titleLabel?.text == "O" && b5.titleLabel?.text == "O" && b9.titleLabel?.text == "O"
        let diagonal2 = b3.titleLabel?.text == "O" && b5.titleLabel?.text == "O" && b7.titleLabel?.text == "O"
        
        if row1 || row2 || row3 || column1 || column2 || column3 || diagonal1 || diagonal2 {
            resultLabel.text = " O wins!"
        }
    }
    func winning(winner: String) {
        if  (b1.titleLabel?.text == winner && b2.titleLabel?.text == winner && b3.titleLabel?.text == winner) ||
            (b4.titleLabel?.text == winner && b5.titleLabel?.text == winner && b6.titleLabel?.text == winner) ||
            (b7.titleLabel?.text == winner && b8.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b1.titleLabel?.text == winner && b4.titleLabel?.text == winner && b7.titleLabel?.text == winner) ||
            (b2.titleLabel?.text == winner && b5.titleLabel?.text == winner && b8.titleLabel?.text == winner) ||
            (b3.titleLabel?.text == winner && b6.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b1.titleLabel?.text == winner && b5.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b3.titleLabel?.text == winner && b5.titleLabel?.text == winner && b7.titleLabel?.text == winner)
        {
            let alertController = UIAlertController (title: "\(winner) has won", message: "press restart to play again", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "restart", style: .cancel, handler: nil)
            
            alertController.addAction(restartAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    
    @IBAction func restart(_ sender: Any) {
        let buttons: [UIButton] = [b1, b2, b3, b4, b5, b6, b7, b8, b9]
        for button in buttons {
            button.setTitle("", for: .normal)
            button.titleLabel?.text = ""
            button.isUserInteractionEnabled = true}
        //reset other variables to starting conditions
        counter = 0
        turnLabel.text = "X turn"
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

