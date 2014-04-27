//
//  MyScene.m
//  SimpleGame
//
//  Created by Luis Alberto Lamadrid on 4/26/14.
//  Copyright (c) 2014 Luis Alberto Lamadrid. All rights reserved.
//

#import "MyScene.h"

@interface MyScene ()
@property (nonatomic) SKSpriteNode *player;

//Properties to jeep track of time since last update
@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        NSLog(@"Size: %@", NSStringFromCGSize(size));
        
        //Setting background color and initializing player
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        self.player          = [SKSpriteNode spriteNodeWithImageNamed:@"player"];
        self.player.position = CGPointMake(self.player.size.width/2, self.frame.size.height/2);
        
        //Adding player to the scene
        [self addChild:self.player];
        
    }
    return self;
}

-(void)addMonster{
    //Creating sprite
    SKSpriteNode *monster = [SKSpriteNode spriteNodeWithImageNamed:@"monster"];
    
    //Random Y-Axis value for the monster inside screen
    int minY    = monster.size.height/2;
    int maxY    = self.frame.size.height - monster.size.height/2;
    int rangeY  = maxY - minY;
    int actualY = (arc4random() % rangeY) + minY;
    
    //Positioning monster offscreen to the right
    monster.position = CGPointMake(self.frame.size.width + monster.size.width/2, actualY);
    
    //Adding the monster to the scene
    [self addChild:monster];
    
    //Setting the monster's "speed"
    int minDuration    = 2;
    int maxDuration    = 4;
    int rangeDuration  = maxDuration - minDuration;
    int actualDuration = (arc4random() % rangeDuration) + minDuration;
    
    //Creating actions for the monster, -monster.size... means offscreen to the left
    SKAction *move      = [SKAction moveTo:CGPointMake(-monster.size.width/2, actualY) duration:actualDuration];
    SKAction *move_Done = [SKAction removeFromParent];
    
    //Running said actions with the monster sprite
    [monster runAction:[SKAction sequence:@[move, move_Done]]];

}

//This method is to keep track of the time between updates
-(void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    
    self.lastSpawnTimeInterval += timeSinceLast;
    
    if (self.lastSpawnTimeInterval > 1) {
        self.lastSpawnTimeInterval = 0;
        [self addMonster];
    }
}

//This method is to keep track of the time between updates
-(void)update:(NSTimeInterval)currentTime {
    
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval  = currentTime;
    
    if (timeSinceLast > 1) {
        timeSinceLast = 1.0 / 60.0;
        self.lastUpdateTimeInterval = currentTime;
    }
    
    [self updateWithTimeSinceLastUpdate:timeSinceLast];
}

@end
