//
//  PlaneComponents.swift
//  LearnField
//
//  Created by Yulibar Husni on 08/10/24.
//

import Foundation
import GameplayKit

class NameComponent: GKComponent {
    var name: String
    init(name: String) {
        self.name = name
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class NodeComponent: GKComponent {
    var node: SKNode?
    
    init(node: SKNode? = nil) {
        self.node = node
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HealthComponent: GKComponent {
    var health: Int = planeHealth
    init(health: Int) {
        super.init()
        self.health = health
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MovementComponent: GKComponent {
    var speed: CGFloat = planeSpeed
    var direction: CGVector = .zero
    init(speed: CGFloat, direction: CGVector) {
        super.init()
        self.speed = speed
        self.direction = direction
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ColliderComponent: GKComponent {
    var collider: SKPhysicsBody?
    init(collider: SKPhysicsBody) {
        super.init()
        self.collider = collider
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TransformComponent: GKComponent {
    var position: CGPoint = .zero
    init(position: CGPoint) {
        super.init()
        self.position = position
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
