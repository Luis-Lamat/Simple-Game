//
//  MyScene.m
//  SimpleGame
//
//  Created by Luis Alberto Lamadrid on 4/26/14.
//  Copyright (c) 2014 Luis Alberto Lamadrid. All rights reserved.
//

#import "MyScene.h"

// 1
@interface MyScene ()
@property (nonatomic) SKSpriteNode *player;
@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        NSLog(@"Size: %@", NSStringFromCGSize(size));
        
        //Setting background color and initializing player
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        self.player          = [SKSpriteNode spriteNodeWithImageNamed:@"player"];
        self.player.position = CGPointMake(100, 100);
        
        //Adding player to the scene
        [self addChild:self.player];
        
    }
    return self;
}

@end
