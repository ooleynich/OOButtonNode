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
    
    override func didMove(to view: SKView) {
        firstButton = childNode(withName: "firstButton") as! OOButtonNode
        firstButton.title = "Hello"
    }
    
    /*
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
 */
}
