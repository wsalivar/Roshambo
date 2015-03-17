//  RochamboViewController.swift
//
//  Created by William Salivar on 3/15/15.
//  Copyright (c) 2015 William Salivar. All rights reserved.
//

import Foundation
import UIKit

class RochamboViewController: UIViewController {
    
    var aiSelection: Int?
    var playerSelection: Int?
    
    let rochamboImages =
    [
        UIImage(named: "PaperCoversRock.jpg"),
        UIImage(named: "RockCrushesScissors.jpeg"),
        UIImage(named: "ScissorsCutPaper.jpg"),
        UIImage(named: "tie.png")
    ]
    
    let outcomes =
    [
        "Paper",
        "Rock",
        "Scissors"
    ]
    
    let actions =
    [
        "covers",
        "crushes",
        "cut"
    ]
    
    @IBOutlet var winningImage: UIImageView!
    @IBOutlet weak var outcomeLabel: UILabel!
    
    override func viewWillAppear(animated: Bool)
    {
        var computerOutcome: String = ""
        var playerOutcome: String = ""
        var winLose: String = "You Lose!"
        var displayString: String = ""
        
        var abnormalState: Bool = false;
        
        let aiChoice = self.aiSelection
        let playerChoice = self.playerSelection
        
        if ((aiChoice?.value != nil) && playerChoice?.value != nil)
        {        
            // Check to see if AI and player chose the same thing.  If so,
            // then indicate a tie and move on
            if (aiChoice != playerChoice && aiChoice! >= 0 && aiChoice! < 4)
            {
                computerOutcome = outcomes[aiChoice!]
                playerOutcome = outcomes[playerChoice!]
                
                switch (aiChoice!)
                {
                case 0: // paper
                    if (playerChoice == 2) // scissors
                    {
                        winLose = "You Win!"
                    }
                case 1:  // rock
                    if (playerChoice == 0) // paper
                    {
                        winLose = "You Win!"
                    }
                 case 2:  // scissors
                    if (playerChoice == 1) // rock
                    {
                        winLose = "You Win!"
                    }
                default:
                    displayString = "The computer lost it's marbles!  Y"
                    abnormalState = true
                }
        
                if (!abnormalState)
                {
                    if (winLose == "You Win!")
                    {
                        displayString = playerOutcome + " " + actions[playerChoice!] + " " + computerOutcome + ".  " + winLose
                        self.winningImage.image = rochamboImages[playerChoice!]
                    }
                    else // AI won
                    {
                        displayString = computerOutcome + " " + actions[aiChoice!] + " " + playerOutcome + ".  " + winLose
                        self.winningImage.image = rochamboImages[aiChoice!]
                    }
                }
                
            }
            else if (!abnormalState)  // Tie
            {
                displayString = "You both chose " + outcomes[playerChoice!] + ".  It is a tie!"
                self.winningImage.image = rochamboImages[3]
            }
        
            outcomeLabel.text = displayString
        }
        else
        {
            self.winningImage.image = nil;
        }
        
        self.winningImage.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool)
    {
        UIView.animateWithDuration(0.3)
        {
            self.winningImage.alpha = 1
        }
    }
        
    /**
    *    dismiss this view controller
    */
    @IBAction func dismiss()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}


