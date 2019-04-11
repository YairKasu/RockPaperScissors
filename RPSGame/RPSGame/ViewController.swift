//
//  ViewController.swift
//  RPSGame
//
//  Created by Yair Kasuker on 24/03/2019.
//  Copyright © 2019 Yair Kasuker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var RPSTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    @IBOutlet weak var btnScissor: UIButton!
    @IBOutlet weak var btnRock: UIButton!
    @IBOutlet weak var btnPaper: UIButton!
    @IBOutlet weak var btnStartGame: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetBoard()
    }
    
    func resetBoard(){
        RPSTitle.text = "RPS Game"
        lblSubtitle.text = "Scissor,Rock,Paper"
        btnScissor.isHidden = false
        btnScissor.isEnabled = true
        btnRock.isHidden = false
        btnRock.isEnabled = true
        btnPaper.isHidden = false
        btnPaper.isEnabled = true
        btnStartGame.isHidden = true
    }
    func play(_ playerTurn: Sign){
        btnRock.isEnabled = false
        btnPaper.isEnabled = false
        btnScissor.isEnabled = false
        
        let opponet = randomSign()
        RPSTitle.text = opponet.emoji
        
        let gameResult = playerTurn.opponetTurn(opponet)
        switch gameResult {
        case .draw:
            lblSubtitle.text = "It's a Draw"
        case .lose:
            lblSubtitle.text = "You Lose!!"
        case .win:
            lblSubtitle.text = "You Win!!"
        case .start :
            lblSubtitle.text = "Scissor,Rock,Paper"
        }
        
        switch playerTurn {
        case .rock:
            btnRock.isHidden = false
            btnPaper.isHidden = true
            btnScissor.isHidden = true
        case .paper:
            btnRock.isHidden = true
            btnPaper.isHidden = false
            btnScissor.isHidden = true
        case .scissors:
            btnRock.isHidden = true
            btnPaper.isHidden = true
            btnScissor.isHidden = false
        }
        btnStartGame.isHidden = false
    }
    
    @IBAction func StartGame(_ sender: UIButton) {
        resetBoard()
    }
    
    @IBAction func ActScissor(_ sender: UIButton) {
        play(.scissors)
    }
    
    @IBAction func ActRock(_ sender: UIButton) {
        play(.rock)
    }
    
    @IBAction func ActPaper(_ sender: UIButton) {
        play(.paper)
    }
    
}

