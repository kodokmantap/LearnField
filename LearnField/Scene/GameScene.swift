//
//  GameScene.swift
//  LearnField
//
//  Created by Yulibar Husni on 07/10/24.
//

import Foundation
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var lastUpdateTime: TimeInterval? = nil
    let flightSystem = FlightSystem()
    var planeEntity: PlaneEntity?
    let entityManager = EntityManager()
    var spawnSystem: SpawnSystem?
    
    override func didMove(to view: SKView) {
        
        // Initialize the spawn system with a spawn interval of 2 seconds
        let spawnComponent = SpawnComponent()
        let spawnerEntity = GKEntity()
        spawnerEntity.addComponent(spawnComponent)
        entityManager.add(spawnerEntity)
        
        // Set up the spawn system
        spawnSystem = SpawnSystem(scene: self, entityManager: entityManager)
        spawnSystem!.addComponent(foundIn: spawnerEntity) // Register the spawner entity
    }
    
    override func update(_ currentTime: TimeInterval) {
        let deltaTime = currentTime - (lastUpdateTime ?? currentTime)
        lastUpdateTime = currentTime
        
        // Update entity manager and systems
        spawnSystem!.update(deltaTime: deltaTime)
        entityManager.update(deltaTime: deltaTime)
    }
}
