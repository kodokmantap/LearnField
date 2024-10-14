//
//  FlightSystem.swift
//  LearnField
//
//  Created by Yulibar Husni on 08/10/24.
//

import Foundation
import GameplayKit

class FlightSystem: GKComponentSystem<MovementComponent> {
    
    func flyUp() {
        
    }
    
    func flyDown() {
        
    }
    
    override func update(deltaTime: TimeInterval) {
        for component in components {
            guard let entity = component.entity,
                    let transform = entity.component(ofType: TransformComponent.self) else
            { continue }
            
            transform.position.x -= component.speed * CGFloat(deltaTime)
            if transform.position.x <= -100 {
                
            }
        }
    }
}

