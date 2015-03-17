//
//  GameStartViewController.swift
//  Roshambo
//
//  Created by William Salivar on 3/15/15.
//  Copyright (c) 2015 William Salivar. All rights reserved.
//

import UIKit

class GameStartViewController: UIViewController {

    @IBOutlet weak var scissorsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func randomOutcome() -> Int
    {
        // Generate random Int32 value from 0 to 2
        let randomValue = arc4random() % 3
                
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let controller = segue.destinationViewController as RochamboViewController
        
        controller.aiSelection = self.randomOutcome()
        
        // If this came straight from our scissors button, set the player
        // selection appropriately
        if let button = sender as? UIButton
        {
            if (button == scissorsButton)
            {
                controller.playerSelection = 2
            }
        }
        else
        {
            controller.playerSelection = 0
        }
        
    }
    
    @IBAction func RockPressed(sender: UIButton)
    {
        var controller:RochamboViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("RochamboViewController") as RochamboViewController
        
        controller.aiSelection = self.randomOutcome()
        controller.playerSelection = 1
        
        self.presentViewController(controller, animated: true, completion: nil)
    }

    @IBAction func PaperPressed(sender: UIButton)
    {
        performSegueWithIdentifier("viewSegue", sender: self)
    }
}
