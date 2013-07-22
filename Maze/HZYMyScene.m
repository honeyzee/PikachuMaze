//
//  HZYMyScene.m
//  Maze
//
//  Created by Hannia Zia on 7/22/13.
//  Copyright (c) 2013 Hannia Zia. All rights reserved.
//

#import "HZYMyScene.h"

const uint32_t digletts = 0x1 << 0;
const uint32_t pikachus = 0x1 << 1;

@implementation HZYMyScene


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.physicsWorld.contactDelegate = self;
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hannia's Maze Game";
        myLabel.fontSize = 20;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
        
        SKLabelNode *start = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        start.text = @"START";
        start.fontSize = 5;
        start.position = CGPointMake(10, 5);
        start.fontColor = [SKColor redColor];
        
        [self addChild:start];
        
        _pikachu = [[SKSpriteNode alloc]initWithImageNamed:@"pikachu.png"];
        _pikachu.size = CGSizeMake(15, 15);
        _pikachu.position = CGPointMake(25, 10);
        
        _pikachu.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(15, 15)];
        _pikachu.physicsBody.affectedByGravity = NO;
        _pikachu.physicsBody.categoryBitMask = pikachus;
        _pikachu.physicsBody.collisionBitMask = digletts;
        _pikachu.physicsBody.contactTestBitMask = digletts;
        _pikachu.physicsBody.allowsRotation = NO;
        [self addChild:_pikachu];
        
        //                          x    y
        [self makeWall:CGPointMake(250, 250)];
        [self makeWall:CGPointMake(230, 250)];
        [self makeWall:CGPointMake(250, 220)];
        [self makeWall:CGPointMake(250, 200)];
        [self makeWall:CGPointMake(250, 180)];
        [self makeWall:CGPointMake(250, 160)];
        [self makeWall:CGPointMake(250, 140)];
        [self makeWall:CGPointMake(280, 140)];
        [self makeWall:CGPointMake(310, 250)];
        [self makeWall:CGPointMake(330, 250)];
        [self makeWall:CGPointMake(360, 250)];
        
        [self makeWall:CGPointMake(30, 10)];
        [self makeWall:CGPointMake(30, 40)];
        [self makeWall:CGPointMake(30, 70)];
        [self makeWall:CGPointMake(360, 250)];
        [self makeWall:CGPointMake(360, 250)];
        [self makeWall:CGPointMake(360, 250)];
        [self makeWall:CGPointMake(360, 250)];
        [self makeWall:CGPointMake(360, 250)];
        [self makeWall:CGPointMake(360, 250)];
      
        
        
    }
    return self;
}

-(void)didBeginContact:(SKPhysicsContact *)contact
{
    if (contact.bodyA.node == _pikachu || contact.bodyB.node == _pikachu)
    {
        SKAction 
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        
        CGPoint location = [touch locationInNode:self];
        
        _pikachu.position = location;
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

- (void)makeWall:(CGPoint)point {
    SKSpriteNode *diglett = [[SKSpriteNode alloc] initWithImageNamed:@"Diglett.png"];
    diglett.size = CGSizeMake(30, 30);
    diglett.position = point;
    diglett.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:(CGSizeMake(40, 40))];
    [[diglett physicsBody] setAffectedByGravity:NO];
    diglett.physicsBody.categoryBitMask = digletts;
    diglett.physicsBody.collisionBitMask = pikachus;
    diglett.physicsBody.contactTestBitMask = pikachus;
    diglett.physicsBody.allowsRotation = NO;
    diglett.physicsBody.dynamic = NO;
    diglett.physicsBody.restitution = 0.0;
    [self addChild:diglett];
}

@end
