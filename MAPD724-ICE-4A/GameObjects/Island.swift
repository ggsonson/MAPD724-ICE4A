//
//  Island.swift
//  MAPD724-ICE-2A
//
//  Created by Man Nok Pun on 2023-01-23.
//

import SpriteKit
import GameplayKit

class Island : GameObject{
    
    init(){
        super.init(imageString: "island", initScale: 2)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(")
    }
    
    override func Start(){
        zPosition = Layer.ISLAND.rawValue
        verticalSpeed = 5.0
    }
    override func Update(){
        Move()
        CheckBounds()
    }
    override func CheckBounds(){
        if(position.y <= -876) {
            Reset()
        }
    }
    override func Reset(){
        position.y = 876
        let randomX: Int = (randomSource?.nextInt(upperBound: 626))! - 313
        position.x = CGFloat(randomX)
        isColliding = false
    }
    func Move(){
        position.y -= verticalSpeed!
    }
}
