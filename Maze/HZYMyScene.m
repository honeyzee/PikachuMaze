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
const uint32_t potions = 0x1 << 2;
const uint32_t ashes = 0x1 << 3;

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
        start.fontSize = 7;
        start.position = CGPointMake(10, 5);
        start.fontColor = [SKColor redColor];
        
        [self addChild:start];
        
        //PIKACHU
        _pikachu = [[SKSpriteNode alloc]initWithImageNamed:@"pikachu.png"];
        _pikachu.size = CGSizeMake(35, 35);
        _pikachu.position = CGPointMake(30, 30);
        
        _pikachu.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(35, 35)];
        _pikachu.physicsBody.affectedByGravity = NO;
        _pikachu.physicsBody.categoryBitMask = pikachus;
        _pikachu.physicsBody.collisionBitMask = digletts | potions;
        _pikachu.physicsBody.contactTestBitMask = digletts | potions;
        _pikachu.physicsBody.allowsRotation = NO;
        [self addChild:_pikachu];
        
        //ASH
        _ash = [[SKSpriteNode alloc] initWithImageNamed:@"ash.png"];
        _ash.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetHeight(self.frame) - 50);
        _ash.size = CGSizeMake(50, 50);
        _ash.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(50, 50)];
        _ash.physicsBody.affectedByGravity = NO;
        [self addChild:_ash];
        
        //POTION
        _potion = [[SKSpriteNode alloc] initWithImageNamed:@"potion.png"];
        _potion.position = CGPointMake(250, 50);
        _potion.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(35, 35)];
        _potion.physicsBody.affectedByGravity = NO;
        _potion.physicsBody.categoryBitMask = potions;
        _potion.physicsBody.collisionBitMask = pikachus;
        _potion.physicsBody.collisionBitMask = pikachus;
        _potion.size = CGSizeMake(10, 10);
        
        [self addChild:_potion];
        
        
        [self makeRaichu:CGPointMake(20, 400)];
        [self makeRaichu:CGPointMake(60, 400)];
        [self makeRaichu:CGPointMake(90, 400)];
        [self makeRaichu:CGPointMake(120, 400)];
        
        [self makeRaichu:CGPointMake(20, 450)];
        [self makeRaichu:CGPointMake(60, 450)];
        [self makeRaichu:CGPointMake(90, 450)];
        [self makeRaichu:CGPointMake(120, 450)];
        
        [self makeRaichu:CGPointMake(20, 500)];
        [self makeRaichu:CGPointMake(60, 500)];
        [self makeRaichu:CGPointMake(90, 500)];
        [self makeRaichu:CGPointMake(120, 500)];
        
        //                          x    y
        [self makeWall:CGPointMake(250, 250)];
        [self makeWall:CGPointMake(200, 250)];
        [self makeWall:CGPointMake(250, 200)];
        [self makeWall:CGPointMake(250, 150)];
        [self makeWall:CGPointMake(250, 100)];
       
        [self makeWall:CGPointMake(250, 10)];
        
       // [self makeWall:CGPointMake(250, 140)];
        [self makeWall:CGPointMake(300, 150)];
        [self makeWall:CGPointMake(300, 250)];
     
        [self makeWall:CGPointMake(50, 10)];
        [self makeWall:CGPointMake(50, 60)];
        [self makeWall:CGPointMake(50, 110)];
        
        [self makeWall:CGPointMake(100, 110)];
        [self makeWall:CGPointMake(150, 110)];
        
        [self makeWall:CGPointMake(150, 25)];
        
        
        [self makeWall:CGPointMake(10, 200)];
        [self makeWall:CGPointMake(60, 200)];
        [self makeWall:CGPointMake(110, 200)];
         [self makeWall:CGPointMake(110, 250)];
        
        
        [self makeWall:CGPointMake(10, 300)];
        [self makeWall:CGPointMake(10, 350)];
        
      //  [self makeWall:CGPointMake(60, 350)];
        [self makeWall:CGPointMake(110, 350)];
        [self makeWall:CGPointMake(160, 350)];
        [self makeWall:CGPointMake(210, 350)];
        [self makeWall:CGPointMake(260, 350)];
        [self makeWall:CGPointMake(310, 350)];
        [self makeWall:CGPointMake(360, 350)];
        [self makeWall:CGPointMake(410, 350)];
        
       
      
        
        
    }
    return self;
}

-(void)didBeginContact:(SKPhysicsContact *)contact
{
    if ((contact.bodyA.node == _pikachu || contact.bodyB.node == _pikachu) && (contact.bodyA.node == _potion || contact.bodyB.node == _potion))
                                                                            
    {
        [_potion removeFromParent];
        SKLabelNode *congrats = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        congrats.text = @"YOU GOT A POTION!";
        congrats.position = CGPointMake(250, CGRectGetHeight(self.frame) - 50);
        congrats.fontSize = 10;
        
        [self addChild:congrats];
        
    }
    else if ((contact.bodyA.node == _pikachu || contact.bodyB.node == _pikachu) && (contact.bodyA.node == _ash || contact.bodyB.node == _ash))
        
    {
        SKLabelNode *winner = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        winner.text = @"YOU WIN";
        winner.position = CGPointMake(CGRectGetMidX(self.frame), 50);
        winner.fontSize = 68;
        winner.fontColor = [SKColor yellowColor];
        [self addChild:winner];
        
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
    diglett.size = CGSizeMake(50, 50);
    diglett.position = point;
    diglett.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:(CGSizeMake(50, 50))];
    [[diglett physicsBody] setAffectedByGravity:NO];
    diglett.physicsBody.categoryBitMask = digletts;
    diglett.physicsBody.collisionBitMask = pikachus;
    diglett.physicsBody.contactTestBitMask = pikachus;
    diglett.physicsBody.allowsRotation = NO;
    diglett.physicsBody.dynamic = NO;
    diglett.physicsBody.restitution = 0.0;
    [self addChild:diglett];
}

- (void)makeRaichu:(CGPoint)point
{
    SKSpriteNode *raichu = [[SKSpriteNode alloc] initWithImageNamed:@"raichu.png"];
    raichu.size = CGSizeMake(40, 40);
    raichu.position = point;
    raichu.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(40, 40)];
    raichu.physicsBody.affectedByGravity = NO;
    //raichu.physicsBody.collisionBitMask = pikachus;
    //raichu.physicsBody.contactTestBitMask = pikachus;
    
    [self addChild:raichu];
    
}

@end
