//
//  GameScene.swift
//  SpriteKitPong
//
//  Created by Francisco Soares on 10/5/15.
//  Copyright (c) 2015 frsoares. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var moveableNode : SKNode?
    
    var ballNode : SKNode!
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        
        // Objects to be detected need to have a non-zero contactBitMask
        self.physicsWorld.contactDelegate = self
        
        guard let ballNode = self.childNode(withName: "SKNode_ball") else {
            return
        }
        
        
        ballNode.physicsBody?.applyImpulse(CGVector(dx: 20.0, dy: 0.0))
        
        self.ballNode = ballNode
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        print("Contact started between \(contact.bodyA) and \(contact.bodyB)")
    }
    
    func didEndContact(contact: SKPhysicsContact) {
        print("Contact ended between \(contact.bodyA) and \(contact.bodyB)")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let node = moveableNode {
            
            var loc : CGPoint? = nil
            
            for touch in touches {
                loc = touch.location(in: self)
            }
            
            if let location = loc {
                node.position = CGPoint(x: node.position.x, y: location.y)
            }
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.moveableNode = nil
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            
            let nod = touch.location(in: self)
            
            
            let nodes = self.nodes(at: nod)
            
            for node in nodes {
                if node == self{
                    print("there's self")
                }
                else{
                    if node != ballNode {
                        moveableNode=node
                    }
                }
            }
            
            
            
        }
        
    }
   
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}
