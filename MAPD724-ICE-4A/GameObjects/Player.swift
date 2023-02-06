//
//  Player.swift
//  MAPD724-ICE-1A
//
//  Created by Man Nok Pun on 2023-01-16.
//

import SpriteKit
import GameplayKit

class Player: GameObject {
    init(){
        super.init(imageString: "plane", initScale: 2)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder) not implemented")
    }
    
    override func Start(){
        zPosition = Layer.PLANE.rawValue
        Reset()
    }
    override func Update(){
        CheckBounds()
    }
    override func CheckBounds(){
        // constrain player on left boundary
        if(position.x <= -320){
            position.x = -320
        }
        // constrain player on right boundary
        if(position.x >= 320){
            position.x = 320
        }
    }
    override func Reset(){
        position.y = -640
    }
    func TouchMove(newPos: CGPoint){
        position = newPos
    }
}
