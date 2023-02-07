//
//  StartScene.swift
//  MAPD724-ICE-4A
//
//  Created by Man Nok Pun on 2023-02-06.
//

import UIKit
import AVFoundation
import SpriteKit
import GameplayKit

class StartScene: SKScene {
    
    // instance variables
    var ocean1: Ocean?
    var ocean2: Ocean?
    
    var screenSize = UIScreen.main.bounds
    var screenHeight: CGFloat?
    var screenWidth: CGFloat?
    
    override func sceneDidLoad() {
      name = "START"
        //add ocean to scene
        ocean1 = Ocean()  // instantiate new Ocean allocate memory
        ocean1?.Reset()
        addChild(ocean1!)
        
        ocean2 = Ocean()  // instantiate new Ocean allocate memory
        ocean2?.position.y = -627
        addChild(ocean2!)
    }
    
    
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
    
    // triggered every frame (about 60 frames/sec
    override func update(_ currentTime: TimeInterval) {
        ocean1?.Update()
        ocean2?.Update()
    }
}
