//
//  GameScene.swift
//  SpriteKitPong
//
//  Created by Francisco Soares on 10/5/15.
//  Copyright (c) 2015 frsoares. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var moveableNode : SKNode?
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let node = moveableNode {
            
            var loc : CGPoint? = nil
            
            for touch in touches {
                loc = touch.locationInNode(self)
            }
            
            if let location = loc {
                node.position = CGPoint(x: node.position.x, y: location.y)
            }
            
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    
//        if let node = moveableNode {
//            
//            var loc : CGPoint? = nil
//            
//            for touch in touches {
//                loc = touch.locationInNode(self)
//            }
//            
//            if let location = loc {
//                node.position = location
//            }
//            
//        }
        
        self.moveableNode = nil
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }
        
        for touch in touches {
            
            let nod = touch.locationInNode(self)
            
            
            let nodes = nodesAtPoint(nod)
            
            for node in nodes {
                if node == self{
                    print("there's self")
                }
                else{
                    moveableNode=node
                }
            }
            
            
            
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
