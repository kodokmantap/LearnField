//
//  PlaneEntity.swift
//  LearnField
//
//  Created by Yulibar Husni on 08/10/24.
//

import Foundation
import GameplayKit
import SpriteKit

class PlaneEntity: GKEntity {
    init(speed: CGFloat, direction: CGVector, position: CGPoint, health: Int) {
        super.init()
        
        // MARK: - Preparing
        guard let nodeScene = SKNode(fileNamed: "Object-Plane.sks"),
              let planeNode = nodeScene.childNode(withName: "Plane"),
              let colliderNode =  planeNode.childNode(withName: "collider") else {
            print("coulnd't load plane node")
            fatalError()
        }
        guard let planePhysicBody = colliderNode.physicsBody else {
            print("coulnd't load plane physics body")
            fatalError()
        }
        
        // MARK: - Adding Components
        self.addComponent(NameComponent(name: "XF-1"))
        self.addComponent(MovementComponent(speed: speed, direction: .zero))
        self.addComponent(HealthComponent(health: planeHealth))
        self.addComponent(TransformComponent(position: .zero))
        self.addComponent(NodeComponent(node: planeNode))
        self.addComponent(ColliderComponent(collider: planePhysicBody))

        // MARK: - Other setup
        sampleMovement()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sampleMovement() {
        let node = self.component(ofType: NodeComponent.self)
        let nodeTexture = node?.node?.childNode(withName: "Plane")
        let moveUpAction = SKAction.moveBy(x: 0, y: 10, duration: 0.3)
        let moveDownAction = SKAction.moveBy(x: 0, y: -10, duration: 0.3)
        let actionSequence = SKAction.repeatForever(SKAction.sequence([moveUpAction, moveDownAction]))
        nodeTexture?.run(actionSequence)
    }
}


