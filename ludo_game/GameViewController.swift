//
//  ViewController.swift
//  ludo_game
//
//  Created by Luqmaan Siddiqui on 6/28/18.
//  Copyright © 2018 Luqmaan Siddiqui. All rights reserved.
//

import UIKit


class GameViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {

   
    let finish_line_count = 60
    let board_max_count = 52
    var tokens=[String]()
    var diceRoll = Int()
    var currentPlayer = 0
    var initialPositions = [1,14,28,42]
    
    var playTokenButton = UIButton()
    let selectPlayerToPlayWith = UIPickerView()
    var numberOfPlayers = Int()
    let dice = UIButton()
    var players = [player]()
    var completeBoard = [Int]()
    let playingText = UILabel()
    let universalPosition = UILabel()
    
    
    var player_1_UILabel = UILabel()
    var player_1_Token_1 = UILabel()
    var player_1_Token_2 = UILabel()
    var player_1_Token_3 = UILabel()
    var player_1_Token_4 = UILabel()
    
    
    var player_2_UILabel = UILabel()
    var player_2_Token_1 = UILabel()
    var player_2_Token_2 = UILabel()
    var player_2_Token_3 = UILabel()
    var player_2_Token_4 = UILabel()
    
    
    var player_3_UILabel = UILabel()
    var player_3_Token_1 = UILabel()
    var player_3_Token_2 = UILabel()
    var player_3_Token_3 = UILabel()
    var player_3_Token_4 = UILabel()
    
    
    var player_4_UILabel = UILabel()
    var player_4_Token_1 = UILabel()
    var player_4_Token_2 = UILabel()
    var player_4_Token_3 = UILabel()
    var player_4_Token_4 = UILabel()
    
    let displaySelectLable = UILabel()
    
    var currentColor = UIColor()
    
    
    let board_view_1 = UILabel()
    let board_view_2 = UILabel()
    let board_view_3 = UILabel()
    let board_view_4 = UILabel()
    let board_view_5 = UILabel()
    let board_view_6 = UILabel()
    let board_view_7 = UILabel()
    let board_view_8 = UILabel()
    let board_view_9 = UILabel()
    let board_view_10 = UILabel()
    let board_view_11 = UILabel()
    let board_view_12 = UILabel()
    let board_view_13 = UILabel()
    let board_view_14 = UILabel()
    let board_view_15 = UILabel()
    let board_view_16 = UILabel()
    let board_view_17 = UILabel()
    let board_view_18 = UILabel()
    let board_view_19 = UILabel()
    let board_view_20 = UILabel()
    
    let board_view_21 = UILabel()
    let board_view_22 = UILabel()
    let board_view_23 = UILabel()
    let board_view_24 = UILabel()
    let board_view_25 = UILabel()
    let board_view_26 = UILabel()
    let board_view_27 = UILabel()
    let board_view_28 = UILabel()
    let board_view_29 = UILabel()
    let board_view_30 = UILabel()
    let board_view_31 = UILabel()
    let board_view_32 = UILabel()
    let board_view_33 = UILabel()
    let board_view_34 = UILabel()
    let board_view_35 = UILabel()
    let board_view_36 = UILabel()
    let board_view_37 = UILabel()
    let board_view_38 = UILabel()
    let board_view_39 = UILabel()
    let board_view_40 = UILabel()
    
    let board_view_41 = UILabel()
    let board_view_42 = UILabel()
    let board_view_43 = UILabel()
    let board_view_44 = UILabel()
    let board_view_45 = UILabel()
    let board_view_46 = UILabel()
    let board_view_47 = UILabel()
    let board_view_48 = UILabel()
    let board_view_49 = UILabel()
    let board_view_50 = UILabel()
    let board_view_51 = UILabel()
    let board_view_52 = UILabel()
    
    
    var grid = [UILabel]()
    
    func CreateGameGridView(){
        
        grid = [board_view_1,board_view_2,board_view_3,board_view_4,board_view_5,board_view_6,board_view_7,board_view_8,board_view_9,board_view_10,
                
                board_view_11,board_view_12,board_view_13,board_view_14,board_view_15,board_view_16,board_view_17,board_view_18,board_view_19,board_view_20,
                
                board_view_21,board_view_22,board_view_23,board_view_24,board_view_25,board_view_26,board_view_27,board_view_28,board_view_29,board_view_30,
                
                board_view_31,board_view_32,board_view_33,board_view_34,board_view_35,board_view_36,board_view_37,board_view_38,board_view_39,board_view_40,
                
                board_view_41,board_view_42,board_view_43,board_view_44,board_view_45,board_view_46,board_view_47,board_view_48,board_view_49,board_view_50,
                
                board_view_51,board_view_52
        ]
       
        
        var count = 0
        for i in 1...4{
          //  print("outer iteration")
            for j in 1...13{
               // print(i*j)
                //print(i)
                grid[count].frame = CGRect(x: 30+(j*20), y: Int(playingText.frame.maxY+CGFloat(20*i)+20), width: 10, height: 10)
          
            grid[count].backgroundColor = UIColor.gray
            view.addSubview(grid[count])
         
                count+=1
                print(count)
            }
        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        AddDice()
        AddPlayers()
        putPlayerLabels()
        AddTokenLabels()
        displaySelectLabel()
        displayPickerView()
        displaPplayTokenButton()
        displayPLayingText()
        displayUniversalPosition()
        hideEverythingExceptDice()
        setPlayerToPlay()
        CreateGameGridView()
     }
    
    
    
    func AddDice(){
        let dice_no_image = UIImage(named: "dice_no_number.png")
        dice.frame = CGRect(x:view.frame.width/2-40,y : view.frame.height*(3/4), width: 80, height: 80)
        dice.setImage(dice_no_image, for: .normal)
        dice.addTarget(self, action: #selector(rollDice(sender:)), for: .touchUpInside)
        view.addSubview(dice)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let positionOnBoard = "Position on board: "
        switch row{
        case 0:
            universalPosition.text =  positionOnBoard + String(players[currentPlayer].tokens.token_one.universalPosition)
        case 1:
            universalPosition.text = positionOnBoard + String(players[currentPlayer].tokens.token_one.universalPosition)
        case 2:
            universalPosition.text =  positionOnBoard + String(players[currentPlayer].tokens.token_one.universalPosition)
        case 3:
            universalPosition.text = positionOnBoard + String( players[currentPlayer].tokens.token_one.universalPosition)
        default:
            universalPosition.text = "Something wrong"
        }
        playTokenButton.isHidden = false
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tokens[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tokens.count
    }
    
    
    
   
    
    
    func displayPickerView(){
        selectPlayerToPlayWith.dataSource = self
        selectPlayerToPlayWith.delegate = self
        selectPlayerToPlayWith.frame = CGRect(x: 0, y: Int(displaySelectLable.frame.maxY+5), width: Int(view.frame.width), height: 80)
        view.addSubview(selectPlayerToPlayWith)
    }
    
    func displaPplayTokenButton(){
        playTokenButton.frame = CGRect(x:0 , y: Int(selectPlayerToPlayWith.frame.maxY+10), width: Int(view.frame.width), height: 30)
        playTokenButton.backgroundColor = UIColor.red
        playTokenButton.titleLabel?.textColor = UIColor.white
        playTokenButton.setTitle("Play!", for: .normal)
        playTokenButton.addTarget(self, action: #selector(playTokenButtonClicked(sender:)), for: .touchUpInside)
        view.addSubview(playTokenButton)
        
    }
    
    
    
    func displayPLayingText(){

        playingText.frame = CGRect(x: 0, y: Int(playTokenButton.frame.maxY+10), width: Int(view.frame.width), height: 30)
        //playingText.text="Player 1's turn"
        playingText.textAlignment = .center
        view.addSubview(playingText)
    }
    
    
    func displayUniversalPosition(){
        universalPosition.frame = CGRect(x: 0, y: Int(playingText.frame.maxY+10), width: Int(view.frame.width), height: 30)
        universalPosition.textAlignment = .center
        universalPosition.text = "Position on board"
        view.addSubview(universalPosition)
    }
    
   
   
    
   
    
    
   
  
    

    
    func AddTokenLabels(){
        let label_t_T = UILabel()
        let label_t_1 = UILabel()
        let label_t_2 = UILabel()
        let label_t_3 = UILabel()
        let label_t_4 = UILabel()
        
        label_t_T.frame=CGRect(x: 5, y: y_position_label, width: 15, height:30)
        label_t_1.frame=CGRect(x: 5, y: y_position_t_1, width: 15, height:30)
        label_t_2.frame=CGRect(x: 5, y: y_position_t_2, width: 15, height: 30)
        label_t_3.frame=CGRect(x: 5, y: y_position_t_3, width: 15, height: 30)
        label_t_4.frame=CGRect(x: 5, y: y_position_t_4, width: 15, height: 30)
        
        label_t_1.text="a"
        label_t_2.text="b"
        label_t_3.text="c"
        label_t_4.text="d"
        label_t_T.text = "T"
        
        view.addSubview(label_t_1)
        view.addSubview(label_t_2)
        view.addSubview(label_t_3)
        view.addSubview(label_t_4)
        view.addSubview(label_t_T)
    }
    
    let y_position_label = 100
    let y_position_t_1 = 126
    let y_position_t_2 = 150
    let y_position_t_3 = 175
    let y_position_t_4 = 200
    
    
    func DisplayPlayerOne(){
         let x_pos = 45
        let widthLabel = 75
       // player_1_UILabel.backgroundColor = UIColor.brown
     // player_1_UILabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 60, left: 265, bottom: 600, right: 10), size: .init(width: 60, height:60))
         player_1_UILabel.frame = CGRect(x: x_pos, y: y_position_label, width: widthLabel, height: 30)
        player_1_UILabel.text = "Player 1"
        view.addSubview(player_1_UILabel)
        
        player_1_Token_1.frame = CGRect(x: x_pos, y: y_position_t_1, width: widthLabel, height: 30)
        player_1_Token_1.text = "\(players[0].tokens.token_one.position)"
        view.addSubview(player_1_Token_1)
        
        player_1_Token_2.frame = CGRect(x: x_pos, y: y_position_t_2, width: widthLabel, height: 30)
        player_1_Token_2.text = "\(players[0].tokens.token_two.position)"
        view.addSubview(player_1_Token_2)
        
        player_1_Token_3.frame = CGRect(x: x_pos, y: y_position_t_3, width: widthLabel, height: 30)
        player_1_Token_3.text = "\(players[0].tokens.token_three.position)"
        view.addSubview(player_1_Token_3)
        
        player_1_Token_4.frame = CGRect(x: x_pos, y: y_position_t_4, width: widthLabel, height: 30)
        player_1_Token_4.text = "\(players[0].tokens.token_four.position)"
        view.addSubview(player_1_Token_4)
    }
    
    
   
    
    
    func DisplayPlayerTwo(){
        let x_pos = player_1_UILabel.frame.maxX+8
         let widthLabel = 75
        player_2_UILabel.frame = CGRect(x: Int(x_pos), y: y_position_label, width: widthLabel, height: 30)
        player_2_UILabel.text = "Player 2"
        view.addSubview(player_2_UILabel)
        
        player_2_Token_1.frame = CGRect(x: Int(x_pos), y: y_position_t_1, width: widthLabel, height: 30)
        player_2_Token_1.text = "\(players[1].tokens.token_one.position)"
        view.addSubview(player_2_Token_1)
        
        player_2_Token_2.frame = CGRect(x: Int(x_pos), y: y_position_t_2, width: widthLabel, height: 30)
        player_2_Token_2.text = "\(players[1].tokens.token_two.position)"
        view.addSubview(player_2_Token_2)
        
        player_2_Token_3.frame = CGRect(x: Int(x_pos), y: y_position_t_3, width: widthLabel, height: 30)
        player_2_Token_3.text = "\(players[1].tokens.token_three.position)"
        view.addSubview(player_2_Token_3)
        
        player_2_Token_4.frame = CGRect(x: Int(x_pos), y: y_position_t_4, width: widthLabel, height: 30)
        player_2_Token_4.text = "\(players[1].tokens.token_four.position)"
        view.addSubview(player_2_Token_4)
    }
    
    
    func DisplayPlayerThree(){
        let x_pos = 8+player_2_UILabel.frame.maxX
        let widthLabel = 75
        player_3_UILabel.frame = CGRect(x: Int(x_pos), y: y_position_label, width: widthLabel, height: 30)
        player_3_UILabel.text = "Player 3"
        view.addSubview(player_3_UILabel)
        
        player_3_Token_1.frame = CGRect(x: Int(x_pos), y: y_position_t_1, width: widthLabel, height: 30)
        player_3_Token_1.text = "\(players[2].tokens.token_one.position)"
        view.addSubview(player_3_Token_1)
        
        player_3_Token_2.frame = CGRect(x: Int(x_pos), y: y_position_t_2, width: widthLabel, height: 30)
        player_3_Token_2.text = "\(players[2].tokens.token_two.position)"
        view.addSubview(player_3_Token_2)
        
        player_3_Token_3.frame = CGRect(x: Int(x_pos), y: y_position_t_3, width: widthLabel, height: 30)
        player_3_Token_3.text = "\(players[2].tokens.token_three.position)"
        view.addSubview(player_3_Token_3)
        
        player_3_Token_4.frame = CGRect(x: Int(x_pos), y: y_position_t_4, width:widthLabel, height: 30)
        player_3_Token_4.text = "\(players[2].tokens.token_four.position)"
        view.addSubview(player_3_Token_4)
    }
    
    
    func DisplayPlayerFour(){
        let x_pos = 8+player_3_UILabel.frame.maxX
        let width_label = 75
        player_4_UILabel.frame = CGRect(x: Int(x_pos), y: y_position_label, width: width_label, height: 30)
        player_4_UILabel.text = "Player 4"
        view.addSubview(player_4_UILabel)
        
        player_4_Token_1.frame = CGRect(x: Int(x_pos), y: y_position_t_1, width: width_label, height: 30)
        player_4_Token_1.text = "\(players[3].tokens.token_one.position)"
        view.addSubview(player_4_Token_1)
        
        player_4_Token_2.frame = CGRect(x: Int(x_pos), y: y_position_t_2, width: width_label, height: 30)
        player_4_Token_2.text = "\(players[3].tokens.token_two.position)"
        view.addSubview(player_4_Token_2)
        
        player_4_Token_3.frame = CGRect(x: Int(x_pos), y: y_position_t_3, width:width_label, height: 30)
        player_4_Token_3.text = "\(players[3].tokens.token_three.position)"
        view.addSubview(player_4_Token_3)
        
        player_4_Token_4.frame = CGRect(x: Int(x_pos), y: y_position_t_4, width: width_label, height: 30)
        player_4_Token_4.text = "\(players[3].tokens.token_four.position)"
        view.addSubview(player_4_Token_4)
    }
    
    
    func displayTwoTeamLabels()
    {
      DisplayPlayerOne()
      DisplayPlayerTwo()
    }
    
    
    func   displayThreeTeamLabels()
   {
    displayTwoTeamLabels()
    DisplayPlayerThree()
   }
    
    
    func displayFourTeamLabels(){
        displayThreeTeamLabels()
        DisplayPlayerFour()
    }
    
    
    func putPlayerLabels(){
    
        switch numberOfPlayers {
        case 2:
            displayTwoTeamLabels()
        case 3:
            displayThreeTeamLabels()
        case 4:
            displayFourTeamLabels()
        default:
            displayTwoTeamLabels()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}






