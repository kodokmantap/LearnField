//
//  SpawnSystem.swift
//  LearnField
//
//  Created by Yulibar Husni on 09/10/24.
//

import Foundation
import SpriteKit
import GameplayKit

class SpawnSystem: GKComponentSystem<GKComponent> {
    let scene: SKScene
    let entityManager: EntityManager

    init(scene: SKScene, entityManager: EntityManager) {
        self.scene = scene
        self.entityManager = entityManager
        super.init(componentClass: SpawnComponent.self)
    }
    
    func randomSpawnObject() {
        // Generate a random position
        let randomX = CGFloat.random(in: -200...300)
        let randomY = CGFloat.random(in: -300...300)
        let randomPosition = CGPoint(x: randomX, y: randomY)
        
        // Create and add a new enemy
        let plane = PlaneEntity(speed: planeSpeed, direction: .zero, position: randomPosition, health: planeHealth)
        
        let planeRender = plane.component(ofType: NodeComponent.self)?.node
        
        // Add Plane entity to the main EntityManager
        entityManager.add(plane)
        
        if let node = planeRender {
            node.position = randomPosition
            node.removeFromParent()
            scene.addChild(node)
            print(plane.description, "Spawned plane at \(randomPosition)")
        }
    }

    override func update(deltaTime seconds: TimeInterval) {
        for component in components {
            guard let spawnComponent = component as? SpawnComponent else { continue }
            
            // Check if enough time has passed to spawn a new enemy
            spawnComponent.lastSpawnTime += seconds
            if spawnComponent.lastSpawnTime >= spawnComponent.spawnInterval {
                // Reset spawn timer
                spawnComponent.lastSpawnTime = 0
                randomSpawnObject()
            }
        }
    }
}
