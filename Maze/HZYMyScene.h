//
//  HZYMyScene.h
//  Maze
//

//  Copyright (c) 2013 Hannia Zia. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface HZYMyScene : SKScene <SKPhysicsContactDelegate>

@property SKSpriteNode *pikachu;
@property SKSpriteNode *potion;
@property SKSpriteNode *ash;
-(void)makeWall:(CGPoint)point;
- (void)makeRaichu:(CGPoint)point;



@end
