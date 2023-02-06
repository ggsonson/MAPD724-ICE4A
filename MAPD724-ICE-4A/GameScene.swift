//
//  GameScene.swift
//  MAPD724-ICE-2A
//
//  Created by Man Nok Pun on 2023-01-16.
//
import UIKit
import AVFoundation
import SpriteKit
import GameplayKit


class GameScene: SKScene {
    
    // instance variables
    var ocean1: Ocean?
    var ocean2: Ocean?
    var player: Player?
    var island: Island?
    var clouds: [Cloud] = []
    
    var screenSize = UIScreen.main.bounds
    var screenHeight: CGFloat?
    var screenWidth: CGFloat?
    
    override func sceneDidLoad() {
      name = "GAME"
        screenHeight = screenSize.height
        screenWidth = screenSize.width
        
        //add ocean to scene
        ocean1 = Ocean()  // instantiate new Ocean allocate memory
        ocean1?.Reset()
        addChild(ocean1!)
        
        ocean2 = Ocean()  // instantiate new Ocean allocate memory
        ocean2?.position.y = -627
        addChild(ocean2!)
        
        player = Player()  // instantiate new Player allocate memory
        addChild(player!)
        
        island = Island()  // instantiate new Island allocate memory
        addChild(island!)
        
        for index in 0...2 {
            let cloud: Cloud = Cloud()  // instantiate new Cloud allocate memory
            clouds.append(cloud)
            addChild(cloud)
        }
        
        let engineSoune = SKAudioNode(fileNamed: "engine.mp3")
        addChild(engineSoune)
        engineSoune.autoplayLooped = true
        
        // preload / prewarm impulse sounds
        do {
            //let sounds: [String] = ["thunder", "yay"]
            //for sound in sounds {
                let path: String = Bundle.main.path(forResource: "yay", ofType: "mp3")!
                let url: URL = URL(fileURLWithPath: path)
                let avPlayer: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                avPlayer.prepareToPlay()
            
                let path2: String = Bundle.main.path(forResource: "thunder", ofType: "mp3")!
                let url2: URL = URL(fileURLWithPath: path2)
                let avPlayer2: AVAudioPlayer = try AVAudioPlayer(contentsOf: url2)
                avPlayer2.prepareToPlay()
            //}
        } catch {
            
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
    }
    
    func touchUp(atPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
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
        player?.Update()
        island?.Update()
        for cloud in clouds {
            cloud.Update()
            CollisionManager.SquaredRadiusCheck(scene: self, object1: player!, object2: cloud)
        }
        CollisionManager.SquaredRadiusCheck(scene: self, object1: player!, object2: island!)
    }
}
