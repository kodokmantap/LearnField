//
//  SpawnComponent.swift
//  LearnField
//
//  Created by Yulibar Husni on 09/10/24.
//


import Foundation
import GameplayKit

class SpawnComponent: GKComponent {
    var spawnInterval: TimeInterval
    var lastSpawnTime: TimeInterval = 0
    
    override init() {
        self.spawnInterval = TimeInterval(spawnFrequency)
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
