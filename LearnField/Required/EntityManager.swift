//
//  EntityManager.swift
//  LearnField
//
//  Created by Yulibar Husni on 09/10/24.
//

import Foundation
import GameplayKit

class EntityManager {
    var entities = Set<GKEntity>()
    
    func add(_ entity: GKEntity) {
        entities.insert(entity)
    }
    
    func remove(_ entity: GKEntity) {
        entities.remove(entity)
    }
    
    func update(deltaTime: TimeInterval) {
        for entity in entities {
            entity.update(deltaTime: deltaTime)
        }
    }
}
