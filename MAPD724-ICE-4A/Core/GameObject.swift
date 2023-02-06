//
//  GameObject.swift
//  MAPD724-ICE-1A
//
//  Created by Man Nok Pun (301269138) on 2023-01-16.
//

import GameplayKit
import SpriteKit

class GameObject : SKSpriteNode, GameProtocol {
    // public instance members
    var horizontalSpeed: CGFloat?
    var verticalSpeed: CGFloat?
    var width: CGFloat?
    var height: CGFloat?
    var halfWidth: CGFloat?
    var halfHeight: CGFloat?
    var scale: CGFloat?
    var isColliding: Bool?
    var randomSource: GKARC4RandomSource?
    var randomDist: GKRandomDistribution?
    
    // constructor
    init(imageString: String, initScale: CGFloat){
        let texture = SKTexture(imageNamed: imageString) //texture = Image
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        
        scale = initScale
        setScale(scale!)
        width = texture.size().width * scale!
        height = texture.size().height * scale!
        halfWidth = width! * 0.5
        halfHeight = height! * 0.5
        isColliding = false
        name = imageString
        randomSource = GKARC4RandomSource()
    }
    required init?(coder aDecoder: NSCoder){
        fatalError("init(")
    }
    func CheckBounds(){}
    func Reset(){}
    func Start(){}
    func Update(){}
    
    
}
