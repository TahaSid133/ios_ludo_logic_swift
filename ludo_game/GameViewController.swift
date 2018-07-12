//
//  ViewController.swift
//  ludo_game
//
//  Created by Luqmaan Siddiqui on 6/28/18.
//  Copyright © 2018 Luqmaan Siddiqui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let ludo_board = UIImageView()
    
    let dice = UIImageView()
    
    let playerLabel = UILabel()
    
    
    func AddLudoBoard(){
        ludo_board.frame = CGRect(x: 0, y: view.frame.height*(1/4), width: view.frame.width, height: view.frame.width)
        ludo_board.image = UIImage(named: "game_board.png")
        view.addSubview(ludo_board)
    }
    
    func  AddPlayers(){
        
    }
    
    func AddDice(){
        dice.frame = CGRect(x:30,y : ludo_board.frame.height+ludo_board.frame.height/2+30, width: 50, height: 50)
        dice.image = UIImage(named: "dice_no_number.png")
        view.addSubview(dice)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddLudoBoard()
        AddPlayers()
        AddDice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

