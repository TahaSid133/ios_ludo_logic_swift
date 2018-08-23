Class Helper { 
        
func hideEverythingExceptDice(){
        selectPlayerToPlayWith.isHidden = true
        playTokenButton.isHidden = true
        displaySelectLable.isHidden = true
       // playingText.isHidden = true
        universalPosition.isHidden = true
    }
    
    func setPlayerToPlay(){
        switch currentPlayer {
        case 0:
            player_1_UILabel.textColor = UIColor.magenta
            playingText.text = "Player 1's turn,roll the dice"
            player_2_UILabel.textColor = UIColor.black
            player_3_UILabel.textColor = UIColor.black
            player_4_UILabel.textColor = UIColor.black
            currentColor = UIColor.blue
        case 1:
            
            player_2_UILabel.textColor = UIColor.magenta
            playingText.text = "Player 2's turn,roll the dice"
            player_1_UILabel.textColor = UIColor.black
            player_3_UILabel.textColor = UIColor.black
            player_4_UILabel.textColor = UIColor.black
            currentColor = UIColor.yellow
        case 2:
            
            player_3_UILabel.textColor = UIColor.magenta
            playingText.text = "Player 3's turn,roll the dice"
            player_1_UILabel.textColor = UIColor.black
            player_2_UILabel.textColor = UIColor.black
            player_4_UILabel.textColor = UIColor.black
            currentColor = UIColor.green
        case 3:
            
            player_4_UILabel.textColor = UIColor.magenta
            playingText.text = "Player 4's turn,roll the dice"
            player_2_UILabel.textColor = UIColor.black
            player_3_UILabel.textColor = UIColor.black
            player_1_UILabel.textColor = UIColor.black
            currentColor = UIColor.red
            
        default:
            playingText.text = "Something wierd is happening"
        }
        
        
        
    }
    
    
    
    
    func  AddPlayers(){
        for i in 1...numberOfPlayers{
            
            let tokenTrackerObj = tokenTraker(position: 0, universalPosition: 0)
            let tokens = Tokens(token_one: tokenTrackerObj, token_two: tokenTrackerObj, token_three: tokenTrackerObj, token_four: tokenTrackerObj)
            players.append(player(playerNumber: i, tokens:tokens))
            
        }
    }
@objc func playTokenButtonClicked(sender:UIButton){
        
        
        //Increment the token position and universal position accordingly if the token position is greter than 0 or else increse the token position by one
      
        
        let tokenChosen = tokens[selectPlayerToPlayWith.selectedRow(inComponent: 0)]
    
        
        
        switch tokenChosen {
        case "a":
            //initial condition for players whos tokens are in the 0th position
            if players[currentPlayer].tokens.token_one.position == 0{
                players[currentPlayer].tokens.token_one.position = 1
                players[currentPlayer].tokens.token_one.universalPosition = initialPositions[currentPlayer]
                sendBackToHouse(universalPos: players[currentPlayer].tokens.token_one.universalPosition)
                grid[initialPositions[currentPlayer]].backgroundColor = currentColor
                break
            }
            players[currentPlayer].tokens.token_one.position += diceRoll
            if players[currentPlayer].tokens.token_one.universalPosition+diceRoll >= board_max_count{
                players[currentPlayer].tokens.token_one.universalPosition = diceRoll +  players[currentPlayer].tokens.token_one.universalPosition - board_max_count
                sendBackToHouse(universalPos: players[currentPlayer].tokens.token_one.universalPosition)
                grid[players[currentPlayer].tokens.token_one.universalPosition].backgroundColor = currentColor
                grid[players[currentPlayer].tokens.token_one.universalPosition-diceRoll+board_max_count].backgroundColor = UIColor.gray
                
                
                if players[currentPlayer].tokens.token_two.universalPosition != 0{
                grid[players[currentPlayer].tokens.token_two.universalPosition].backgroundColor = currentColor
                }
                
                if players[currentPlayer].tokens.token_three.universalPosition != 0{
                    
                grid[players[currentPlayer].tokens.token_three.universalPosition].backgroundColor = currentColor
                }
                if players[currentPlayer].tokens.token_four.universalPosition != 0{
                    grid[players[currentPlayer].tokens.token_four.universalPosition].backgroundColor = currentColor
                }
                
                break
            }
            players[currentPlayer].tokens.token_one.universalPosition += diceRoll
            sendBackToHouse(universalPos: players[currentPlayer].tokens.token_one.universalPosition)
              grid[players[currentPlayer].tokens.token_one.universalPosition].backgroundColor = currentColor
            grid[players[currentPlayer].tokens.token_one.universalPosition-diceRoll].backgroundColor = UIColor.gray
          
            
            if players[currentPlayer].tokens.token_two.universalPosition != 0{
                grid[players[currentPlayer].tokens.token_two.universalPosition].backgroundColor = currentColor
            }
            
            if players[currentPlayer].tokens.token_three.universalPosition != 0{
                
                grid[players[currentPlayer].tokens.token_three.universalPosition].backgroundColor = currentColor
            }
            if players[currentPlayer].tokens.token_four.universalPosition != 0{
                grid[players[currentPlayer].tokens.token_four.universalPosition].backgroundColor = currentColor
            }
            
        case "b":
            if players[currentPlayer].tokens.token_two.position == 0{
                players[currentPlayer].tokens.token_two.position = 1
                players[currentPlayer].tokens.token_two.universalPosition = initialPositions[currentPlayer]
                sendBackToHouse(universalPos: players[currentPlayer].tokens.token_two.universalPosition)
                grid[initialPositions[currentPlayer]].backgroundColor = currentColor
                break
            }
            players[currentPlayer].tokens.token_two.position += diceRoll
            if players[currentPlayer].tokens.token_two.universalPosition+diceRoll >= board_max_count{
                players[currentPlayer].tokens.token_two.universalPosition = diceRoll +  players[currentPlayer].tokens.token_two.universalPosition - board_max_count
                sendBackToHouse(universalPos: players[currentPlayer].tokens.token_two.universalPosition)
                grid[players[currentPlayer].tokens.token_two.universalPosition].backgroundColor = currentColor
                grid[players[currentPlayer].tokens.token_two.universalPosition-diceRoll+board_max_count].backgroundColor = UIColor.gray
                
                if players[currentPlayer].tokens.token_one.universalPosition != 0{
                    grid[players[currentPlayer].tokens.token_one.universalPosition].backgroundColor = currentColor
                }
                if players[currentPlayer].tokens.token_three.universalPosition != 0{
                    grid[players[currentPlayer].tokens.token_three.universalPosition].backgroundColor = currentColor
                }
                if players[currentPlayer].tokens.token_four.universalPosition != 0{
                    grid[players[currentPlayer].tokens.token_four.universalPosition].backgroundColor = currentColor
                }
                
                break
            }
            players[currentPlayer].tokens.token_two.universalPosition += diceRoll
            sendBackToHouse(universalPos: players[currentPlayer].tokens.token_two.universalPosition)
              grid[players[currentPlayer].tokens.token_two.universalPosition].backgroundColor = currentColor
            grid[players[currentPlayer].tokens.token_two.universalPosition-diceRoll].backgroundColor = UIColor.gray
            
            
            if players[currentPlayer].tokens.token_one.universalPosition != 0{
                grid[players[currentPlayer].tokens.token_one.universalPosition].backgroundColor = currentColor
            }
            if players[currentPlayer].tokens.token_three.universalPosition != 0{
                grid[players[currentPlayer].tokens.token_three.universalPosition].backgroundColor = currentColor
            }
            if players[currentPlayer].tokens.token_four.universalPosition != 0{
                grid[players[currentPlayer].tokens.token_four.universalPosition].backgroundColor = currentColor
            }

        case "c":
            if players[currentPlayer].tokens.token_three.position == 0{
                players[currentPlayer].tokens.token_three.position = 1
                players[currentPlayer].tokens.token_three.universalPosition = initialPositions[currentPlayer]
                sendBackToHouse(universalPos: players[currentPlayer].tokens.token_three.universalPosition)
                grid[initialPositions[currentPlayer]].backgroundColor = currentColor
                
                break
            }
            players[currentPlayer].tokens.token_three.position += diceRoll
            if players[currentPlayer].tokens.token_three.universalPosition+diceRoll >= board_max_count{
                players[currentPlayer].tokens.token_three.universalPosition = diceRoll +  players[currentPlayer].tokens.token_three.universalPosition - board_max_count
                sendBackToHouse(universalPos: players[currentPlayer].tokens.token_three.universalPosition)
                  grid[players[currentPlayer].tokens.token_three.universalPosition].backgroundColor = currentColor
                grid[players[currentPlayer].tokens.token_three.universalPosition-diceRoll+board_max_count].backgroundColor = UIColor.gray
                
                
                
                
                if players[currentPlayer].tokens.token_one.universalPosition != 0{
                    grid[players[currentPlayer].tokens.token_one.universalPosition].backgroundColor = currentColor
                }
                if players[currentPlayer].tokens.token_two.universalPosition != 0{
                    grid[players[currentPlayer].tokens.token_two.universalPosition].backgroundColor = currentColor
                }
                if players[currentPlayer].tokens.token_four.universalPosition != 0{
                    grid[players[currentPlayer].tokens.token_four.universalPosition].backgroundColor = currentColor
                }
                break
            }
            players[currentPlayer].tokens.token_three.universalPosition += diceRoll
            sendBackToHouse(universalPos: players[currentPlayer].tokens.token_three.universalPosition)
              grid[players[currentPlayer].tokens.token_three.universalPosition].backgroundColor = currentColor
            grid[players[currentPlayer].tokens.token_three.universalPosition-diceRoll].backgroundColor = UIColor.gray

            if players[currentPlayer].tokens.token_one.universalPosition != 0{
                grid[players[currentPlayer].tokens.token_one.universalPosition].backgroundColor = currentColor
            }
            if players[currentPlayer].tokens.token_two.universalPosition != 0{
                grid[players[currentPlayer].tokens.token_two.universalPosition].backgroundColor = currentColor
            }
            if players[currentPlayer].tokens.token_four.universalPosition != 0{
                grid[players[currentPlayer].tokens.token_four.universalPosition].backgroundColor = currentColor
            }

        case "d":
            if players[currentPlayer].tokens.token_four.position == 0{
                players[currentPlayer].tokens.token_four.position = 1
                players[currentPlayer].tokens.token_four.universalPosition = initialPositions[currentPlayer]
                sendBackToHouse(universalPos: players[currentPlayer].tokens.token_four.universalPosition)
                grid[initialPositions[currentPlayer]].backgroundColor = currentColor
                break
            }
            players[currentPlayer].tokens.token_four.position += diceRoll
            if players[currentPlayer].tokens.token_four.universalPosition+diceRoll >= board_max_count{
                players[currentPlayer].tokens.token_four.universalPosition = diceRoll +  players[currentPlayer].tokens.token_four.universalPosition - board_max_count
                sendBackToHouse(universalPos: players[currentPlayer].tokens.token_four.universalPosition)
                grid[players[currentPlayer].tokens.token_four.universalPosition].backgroundColor = currentColor
                grid[players[currentPlayer].tokens.token_four.universalPosition-diceRoll+board_max_count].backgroundColor = UIColor.gray
                
                if players[currentPlayer].tokens.token_one.universalPosition != 0{
                    grid[players[currentPlayer].tokens.token_one.universalPosition].backgroundColor = currentColor
                }
                if players[currentPlayer].tokens.token_two.universalPosition != 0{
                    grid[players[currentPlayer].tokens.token_two.universalPosition].backgroundColor = currentColor
                }
                if players[currentPlayer].tokens.token_three.universalPosition != 0{
                    grid[players[currentPlayer].tokens.token_three.universalPosition].backgroundColor = currentColor
                }
                break
            }
            players[currentPlayer].tokens.token_four.universalPosition += diceRoll
            sendBackToHouse(universalPos: players[currentPlayer].tokens.token_four.universalPosition)
            grid[players[currentPlayer].tokens.token_four.universalPosition].backgroundColor = currentColor
            grid[players[currentPlayer].tokens.token_four.universalPosition-diceRoll].backgroundColor = UIColor.gray
            
            if players[currentPlayer].tokens.token_one.universalPosition != 0{
                grid[players[currentPlayer].tokens.token_one.universalPosition].backgroundColor = currentColor
            }
            if players[currentPlayer].tokens.token_two.universalPosition != 0{
                grid[players[currentPlayer].tokens.token_two.universalPosition].backgroundColor = currentColor
            }
            if players[currentPlayer].tokens.token_three.universalPosition != 0{
                grid[players[currentPlayer].tokens.token_three.universalPosition].backgroundColor = currentColor
            }


        default:
            print("somethings wrong")
        }
        print()
        print(players[currentPlayer].tokens.token_one.universalPosition)
        print(players[currentPlayer].tokens.token_two.universalPosition)
        print(players[currentPlayer].tokens.token_three.universalPosition)
        print(players[currentPlayer].tokens.token_four.universalPosition)
        
        let a = players[currentPlayer].tokens.token_one.position
        let b = players[currentPlayer].tokens.token_two.position
        let c = players[currentPlayer].tokens.token_three.position
        let d = players[currentPlayer].tokens.token_four.position
        
        
        
        
        if a == finish_line_count && b == finish_line_count && c == finish_line_count && d == finish_line_count
        {
          gameOver()
        }
        putPlayerLabels()
        
        currentPlayer = currentPlayer + 1
        if currentPlayer == numberOfPlayers{
            currentPlayer = 0
        }
        setPlayerToPlay()
        setDiceIntImage()
        hideEverythingExceptDice()
        
        
      
        
}
    }
