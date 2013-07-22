//
//  HZYMyScene.h
//  Maze
//

//  Copyright (c) 2013 Hannia Zia. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface HZYMyScene : SKScene <SKPhysicsContactDelegate>

@property SKSpriteNode *pikachu;
-(void)makeWall:(CGPoint)point;



@end
