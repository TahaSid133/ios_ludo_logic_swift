

import UIKit





class NumberOfPlayersViewController: UIViewController {
    func sendNumberOfPlayers(players: String) {
        print(players)
    }
    

    var NumberOfPlayers = String()
    //var delegateOne : SendNumberOfPlayers!
    
    
    
    
    func AddButtons(){
        for i in 2...4{
            let button = UIButton()
            button.frame = CGRect(x: 0.0, y: Double(view.frame.height*(1/4)+100)+Double((100*(i-2))), width: Double(view.frame.width), height: 75.0)
            button.setTitle("\(i) player(s)", for: .normal)
            button.backgroundColor = UIColor.red
            button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
            view.addSubview(button)
        }
    }
    
    @objc func buttonPressed(sender:UIButton){
        if let numberOfPlayers = sender.titleLabel?.text{
            NumberOfPlayers = numberOfPlayers
            performSegue(withIdentifier: "blah", sender: Any.self)
            
        }
       
    }
    
 
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let dest = segue.destination as! GameViewController
//
//        dest.number_of_players = NumberOfPlayers
//
//        dest.performSegue(withIdentifier: "blah", sender: (Any).self)
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AddButtons()
        print("finishedloading")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GameViewController{
            destination.numberOfPlayers = Int(String(NumberOfPlayers.first!))!
           // destination.delegateBlah = self 
        }
    }
   

}
