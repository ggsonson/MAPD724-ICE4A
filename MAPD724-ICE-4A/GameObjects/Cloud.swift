
//
//  Cloud.swift
//  MAPD724-ICE-2A
//
//  Created by Man Nok Pun on 2023-01-23.
//

import SpriteKit
import GameplayKit

class Cloud : GameObject{
    
    init(){
        super.init(imageString: "cloud", initScale: 2)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(")
    }
    
    override func Start(){
        zPosition = Layer.CLOUD.rawValue
        alpha = 0.8
        Reset()
    }
    override func Update(){
        Move()
        CheckBounds()
    }
    override func CheckBounds(){
        if(position.y <= -902) {
            Reset()
        }
    }
    override func Reset(){
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5) + 5.0
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * -4) + 2.0
        
        
        let randomX: Int = (randomSource?.nextInt(upperBound: 524))! - 262
        let randomY: Int = (randomSource?.nextInt(upperBound: 500))! + 902
        position.x = CGFloat(randomX)
        position.y = CGFloat(randomY)
        isColliding = false
    }
    func Move(){
        position.y -= verticalSpeed!
        position.x -= horizontalSpeed!
    }
}
