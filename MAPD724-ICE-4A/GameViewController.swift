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
    
    @IBOutlet var LivesLabel: UILabel!
    @IBOutlet var ScoreLabel: UILabel!
    
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    var currentScene: GKScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentStartScene()
        
        
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
    
    func setScene( sceneName: String ) {
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities MDPand graphs.
        currentScene = GKScene(fileNamed: sceneName)
            
            // Get the SKScene from the loaded GKScene
        if let sceneNode = currentScene!.rootNode as! SKScene? {
            // Set the scale mode to scale to fit the window
            sceneNode.scaleMode = .aspectFill
            
            // Present the scene
            if let view = self.view as! SKView? {
                view.presentScene(sceneNode)
                view.ignoresSiblingOrder = true
            }
        }
        
    }
    
    func presentEndScene() {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        setScene(sceneName: "EndScene")
    }
    
    func presentStartScene() {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        setScene(sceneName: "StartScene")
    }
    @IBAction func onStartButtonPressed(_ sender: UIButton) {
        StartLabel.isHidden = true
        StartButton.isHidden = true
        
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        
        CollisionManager.gameViewController = self
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
    }
}
