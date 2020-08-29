//
//  GameScene.swift
//  Pachinko
//
//  Created by Anuj Rajput on 29/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        let box = SKSpriteNode(color: .red, size: CGSize(width: 64, height: 64))
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 64, height: 64))
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        box.position = location
        addChild(box)
    }
}
