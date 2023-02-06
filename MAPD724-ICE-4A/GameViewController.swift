//
//  GameViewController.swift
//  MAPD724-ICE-2A
//
//  Created by Man Nok Pun on 2023-01-16.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet var LivesLabel: UILabel?
    @IBOutlet var ScoreLabel: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(self.view.frame.size.width)
        //print(self.view.frame.size.height)
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities MDPand graphs.
        if let scene = GKScene(fileNamed: "GameScene") {
            
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! GameScene? {
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    view.ignoresSiblingOrder = true
                }
            }
        }
        
        CollisionManager.gameViewController = self
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()

    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateScoreLabel(){
        ScoreLabel?.text = "Score: \(ScoreManager.Score)"
    }
    
    func updateLivesLabel(){
        LivesLabel?.text = "Lives: \(ScoreManager.Lives)"
    }
}
