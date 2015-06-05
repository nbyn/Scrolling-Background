//
//  GameScene.m
//  ScrollingBackground
//
//  Created by Malik Wahaj Ahmed on 05/06/2015.
//  Copyright (c) 2015 Chota Game. All rights reserved.
//

#import "GameScene.h"
#import "Constants.h"

@interface GameScene() {
    SKSpriteNode * bg;
    SKSpriteNode * bg2;

}

@end


@implementation GameScene

-(instancetype)initWithSize:(CGSize)size {
    
    if (self = [super initWithSize:size]) {
        [self createUI];
        [self createScroll];
    }
    return self;
}

-(void)createUI {
 
     bg = [SKSpriteNode spriteNodeWithImageNamed:FILENAME(@"background")];
     bg.position = CGPointMake(bg.size.width/2,bg.size.height/2);
     [self addChild:bg];
}
 
 
-(void)createScroll {
 
     bg2 = [SKSpriteNode spriteNodeWithImageNamed:FILENAME(@"background")];
     bg2.position = CGPointMake(SCREEN_WIDTH,0);
     [self addChild:bg2 ];
     
     SKAction *wait = [SKAction waitForDuration:0.01667f];
     SKAction *performSelector = [SKAction performSelector:@selector(scroll) onTarget:self];
     SKAction *sequence = [SKAction sequence:@[performSelector, wait]];
     SKAction *repeat   = [SKAction repeatActionForever:sequence];
     [self runAction:repeat];
}
 
 
-(void)scroll {
 
    float _scrollSpeed = 150;
    //    NSLog(@"Scroll SPEED:: %f",scrollSpeed);

    if (bg.position.x < bg2.position.x){
         bg.position = CGPointMake(bg.position.x - (_scrollSpeed * kUpdateConstant),bg.size.height/2);
         bg2.position = CGPointMake(bg.position.x+bg.size.width,bg2.size.height/2);
     }else{
         bg2.position = CGPointMake(bg2.position.x - (_scrollSpeed * kUpdateConstant),bg2.size.height/2);
         bg.position = CGPointMake(bg2.position.x+bg2.size.width ,bg.size.height/2);
     }
     
     //reset offscreen position
     if (bg.position.x <-bg.size.width/2) {
         bg.position = CGPointMake(bg2.position.x+bg2.size.width,bg.size.width/2);
     }
     else if (bg2.position.x < -bg2.size.width/2) {
         bg2.position = CGPointMake(bg.position.x+bg.size.width, bg2.size.width/2);
     }
}
 


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
