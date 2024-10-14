//
//  ContentView.swift
//  LearnField
//
//  Created by Yulibar Husni on 16/07/24.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    var body: some View {
        SpriteKitView()
            .ignoresSafeArea()
    }
}

struct SpriteKitView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let skView = SKView(frame: UIScreen.main.bounds)
        
        // Load the SKScene
        guard let scene = SKScene(fileNamed: "MyScene.sks") else {
            print("file not found")
            fatalError()
        }
        scene.scaleMode = .resizeFill
        // Present the scenezz
        skView.presentScene(scene)
        skView.showsFPS = true
        skView.showsDrawCount = true
        viewController.view = skView
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update the view controller if needed.
    }
}


#Preview {
    ContentView()
}
