//
//  CollisionManager.swift
//  MAPD724-ICE-3A
//
//  Created by Man Nok Pun on 2023-01-30.
//

import SpriteKit
import GameplayKit

class CollisionManager{
    public static var gameViewController: GameViewController?
    
    // Util functions
    public static func SquaredDistance(point1: CGPoint, point2: CGPoint) -> CGFloat {
        let Xs: CGFloat = point2.x - point1.x
        let Ys: CGFloat = point2.y - point1.y
        
        return  Xs * Xs + Ys * Ys
    }
    
    // collision functions
    public static func SquaredRadiusCheck(scene: SKScene, object1: GameObject, object2: GameObject) {
        let P1 = object1.position
        let P2 = object2.position
        let P1Radius = object1.halfHeight!
        let P2Radius = object2.halfHeight!
        let Radii = P1Radius + P2Radius
        
        if(SquaredDistance(point1: P1, point2: P2) < Radii * Radii) {
            if(!object2.isColliding!){
                switch(object2.name){
                    case "island":
                        print("Collided with island")
                        scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                        ScoreManager.Score += 100
                        gameViewController?.updateScoreLabel()
                        break
                    case "cloud":
                        print("Collided with cloud")
                        scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                        ScoreManager.Lives -= 1
                        gameViewController?.updateLivesLabel()
                        break
                    default:
                        break
                }
                object2.isColliding = true
            }
        }
        else {
            
        }
    }
}
