//
//  ViewController.swift
//  TicTacToe
//
//  Created by Barry Keane on 9/11/17.
//  Copyright © 2017 Inotec. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var activePlayer = 0       // 0 is nought 1 is crosses
    
    var activeGame = true
    
    var gameState = [2, 2, 2, 2, 2, 2, 2, 2, 2]   // 0 represents nought, 1 is cross, 2 is empty
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: Any)
    {
        self.activePlayer = 0       // 0 is nought 1 is crosses
        
        self.activeGame = true
        
        self.gameState = [2, 2, 2, 2, 2, 2, 2, 2, 2]   // 0 represents nought, 1 is cross, 2 is empty
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        for i in 1..<10
        {
            if let button = view.viewWithTag(i) as? UIButton
            {
                button.setImage(nil, for: [])
                //button.setImage(UIImage.init(CGImage: nil), for: [])
            }
            
        }

    }
    
    
    @IBAction func buttonPressed(_ sender: Any)
    {
        //(sender as AnyObject).setImage(UIImage(named: "nought.png"), for: .normal)
        let activePosition = (sender as AnyObject).tag - 1
        
        if gameState[activePosition] == 2 && activeGame
        {
            gameState[activePosition] = activePlayer
            
            if activePlayer == 0
            {
                (sender as AnyObject).setImage(UIImage(named: "nought.png"), for: [])               // empty array also specifies "normal" state
            } else {
                (sender as AnyObject).setImage(UIImage(named: "cross.png"), for: [])               // empty array also specifies "normal" state
            }
            
            // first time through the loop, combination = [0,1,2]
            for combination in winningCombinations
            {
                
                // IF gameState [0,1,2][0]
                // IF
                if gameState[combination[0]] != 2 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
                {
                    // We have a winner
                    activeGame = false
                    
                    if gameState[combination[0]] == 0
                    {
                        winnerLabel.text = "Nought has won"
                    } else {
                        winnerLabel.text = "Cross has won"
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.isHidden = false
                        self.playAgainButton.isHidden = false
                    })
                    
                }
                
            }
            
            activePlayer += 1
            activePlayer = activePlayer % 2
            
        }
    }
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

