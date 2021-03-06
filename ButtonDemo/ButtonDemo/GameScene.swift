//
//  GameScene.swift
//  ButtonDemo
//
//  Created by Oleg on 22/02/2018.
//  Copyright © 2018 Oleg. All rights reserved.
//

import GameplayKit

class GameScene: SKScene {
    
    var firstButton: OOButtonNode!
    var secondButton: OOButtonNode!
    var thirdButton: OOButtonNode!
    var fourthButton: OOButtonNode!
    var fifthButton: OOButtonNode!
    
    override func didMove(to view: SKView) {
        firstButton = childNode(withName: "firstButton") as! OOButtonNode
        firstButton.setTitle("Hello", for: .normal)
        firstButton.font = UIFont.boldSystemFont(ofSize: 40.0)
        firstButton.pressedBlock = { (buttonNode) in
            NSLog("firstButton pressed")
        }
        
        secondButton = childNode(withName: "secondButton") as! OOButtonNode
        secondButton.setImage(UIImage(named: "hello")!, for: .normal)
        secondButton.setImage(UIImage(named: "hello_pressed")!, for: .pressed)
        secondButton.pressedBlock = { (buttonNode) in
            NSLog("secondButton pressed")
        }
        
        thirdButton = childNode(withName: "thirdButton") as! OOButtonNode
        thirdButton.setImage(UIImage(named: "hello")!, for: .normal)
        thirdButton.pressedScale = 0.9
        thirdButton.pressedBlock = { (buttonNode) in
            NSLog("thirdButton pressed")
        }
        
        //create programmatically
        fourthButton = OOButtonNode()
        addChild(fourthButton)
        fourthButton.setTitle("Hello", for: .normal)
        fourthButton.setTitleColor(.black, for: .normal)
        fourthButton.setTitleColor(.blue, for: .pressed)
        fourthButton.font = UIFont.boldSystemFont(ofSize: 40.0)
        fourthButton.size = CGSize(width: 200.0, height: 65.0)
        fourthButton.setBackgroundColor(.yellow, for: .normal)
        fourthButton.pressedScale = 0.9
        fourthButton.pressedBlock = { [weak self] (buttonNode) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.fifthButton.enabled = !strongSelf.fifthButton.enabled
        }
        
        fifthButton = childNode(withName: "fifthButton") as! OOButtonNode
        fifthButton.setTitle("Hello", for: .normal)
        fifthButton.setTitleColor(.black, for: .normal)
        fifthButton.font = UIFont.boldSystemFont(ofSize: 40.0)
        fifthButton.size = CGSize(width: 200.0, height: 65.0)
        fifthButton.setBackgroundColor(.yellow, for: .normal)
        fifthButton.setBackgroundColor(.red, for: .pressed)
        fifthButton.setBackgroundColor(.lightGray, for: .disabled)
        fifthButton.pressedBlock = { (buttonNode) in
            NSLog("fifthButton pressed")
        }
    }
}
