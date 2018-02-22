//
//  GameScene.swift
//  ButtonDemo
//
//  Created by Oleg on 22/02/2018.
//  Copyright © 2018 Oleg. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var firstButton: OOButtonNode!
    var secondButton: OOButtonNode!
    var thirdButton: OOButtonNode!
    
    override func didMove(to view: SKView) {
        firstButton = childNode(withName: "firstButton") as! OOButtonNode
        firstButton.setTitle("Hello", for: .normal)
        firstButton.font = UIFont.boldSystemFont(ofSize: 40.0)
        firstButton.pressedBlock = {
            NSLog("firstButton pressed")
        }
        
        secondButton = childNode(withName: "secondButton") as! OOButtonNode
        secondButton.setImage(UIImage(named: "hello")!, for: .normal)
        secondButton.setImage(UIImage(named: "hello_pressed")!, for: .highlighted)
        secondButton.pressedBlock = {
            NSLog("secondButton pressed")
        }
        
        thirdButton = childNode(withName: "thirdButton") as! OOButtonNode
        thirdButton.setImage(UIImage(named: "hello")!, for: .normal)
        thirdButton.highlightScale = 0.9
        thirdButton.pressedBlock = {
            NSLog("thirdButton pressed")
        }
    }
}
