//
//  GameUtils.m
//  OGA
//
//  Created by Malik Wahaj Ahmed on 31/12/2014.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GameUtils.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation GameUtils


+(void)rotateAnimation:(SKSpriteNode *) aSprite {
    
    id action = [SKAction rotateToAngle:15 duration:2];
    id action2 = [SKAction rotateToAngle:-15 duration:2];
    
    id seq = [SKAction sequence:@[action,action2]];
    id act = [SKAction repeatActionForever:seq];
    
    [aSprite runAction:act];
}

+(void)scaleAnimation:(SKSpriteNode *) aSprite {
    
    id action = [SKAction scaleTo:0.95f duration:2];
    id action2 = [SKAction scaleTo:1.05f duration:2];
    
    id seq = [SKAction sequence:@[action,action2]];
    id act = [SKAction repeatActionForever:seq];
    
    [aSprite runAction:act];
    
}

+(void)animateWithAtlas:(NSString *)atlasName parentSprite:(SKSpriteNode*)spriteNode repeatCount:(int)count {
    
    SKTextureAtlas * atlas = [SKTextureAtlas atlasNamed:atlasName];
    NSArray * array = [atlas textureNames];
    NSArray * sortedArray = [array sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSMutableArray * textureArray = [NSMutableArray array];
    
    for (NSString * fileName in sortedArray) {
        SKTexture * texture = [atlas textureNamed:fileName];
        [textureArray addObject:texture];
    }
    
    SKAction * animate = [SKAction animateWithTextures:textureArray timePerFrame:0.05];
    count == 0 ? [spriteNode runAction:[SKAction repeatActionForever:animate]] : [spriteNode runAction:[SKAction repeatAction:animate count:count]];
}

+(float)getVolumeLevel {
    MPVolumeView *slide = [MPVolumeView new];
    UISlider *volumeViewSlider;
    
    for (UIView *view in [slide subviews]){
        if ([[[view class] description] isEqualToString:@"MPVolumeSlider"]) {
            volumeViewSlider = (UISlider *) view;
        }
    }
    
    float val = [volumeViewSlider value];
    
    return val;
}

+(float)adjustedValueX:(float) aValue {
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        // Do something when in landscape
        
        return SCREEN_WIDTH * (float)aValue/(float)480;
    }
    else
    {
        // Do something when in portrait
        return SCREEN_WIDTH * (float)aValue/(float)320;
    }
    
}

+(float)adjustedValueY:(float) aValue {
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        // Do something when in landscape
        
        return SCREEN_HEIGHT * (float)aValue/(float)320;
    }
    else
    {
        // Do something when in portrait
        return SCREEN_HEIGHT * (float)aValue/(float)480;
    }
    
}

+(SKSpriteNode *)createSpriteWithFileName : (NSString *)fileName scale: (float)scale position:(CGPoint)position parentNode: (SKNode*)parentNode {
    
    SKSpriteNode * sprite = [SKSpriteNode spriteNodeWithImageNamed:fileName];
    [sprite setScale:scale];
    [sprite setPosition:position];
    [parentNode addChild:sprite];
    return sprite;
    
}

+(SKLabelNode *)createLabelWithText : (NSString*)text fontName: (NSString*)fontName fontSize: (CGFloat)fontSize color: (SKColor*)color position: (CGPoint)position parentNode: (SKNode *)parentNode {
    
    SKLabelNode * label = [SKLabelNode labelNodeWithText:text];
    [label setFontName:fontName];
    [label setFontSize:fontSize];
    [label setPosition:position];
    [label setFontColor:color];
    [parentNode addChild:label];
    return label;
}

+(AGSpriteButton*)createSpriteButton : (NSString *)fileName scale: (float)scale position:(CGPoint)position target:(id)target selector:(SEL)selector withObject:(id)object forControlEvent:(AGButtonControlEvent)controlEvent parentNode: (SKNode*)parentNode {
    
    AGSpriteButton * button = [AGSpriteButton buttonWithImageNamed:fileName];
    [button setScale:scale];
    [button setPosition:position];
    [button addTarget:target selector:selector withObject:object forControlEvent:controlEvent];
    [parentNode addChild:button];
    return button;
    
}

+(NSString*)getFileNameForDevice:(NSString *) aFilename {

    NSString * finalFileName = nil;
    if (IS_IPHONE_4_OR_LESS) {
        finalFileName = [NSString stringWithFormat:@"%@@2x.png",aFilename];
    }
    else if (IS_IPHONE_5){
        finalFileName = [NSString stringWithFormat:@"%@-568h@2x.png",aFilename];
    }
    else if (IS_IPHONE_6) {
        finalFileName = [NSString stringWithFormat:@"%@-667h@2x.png",aFilename];
    }
    else if (IS_IPHONE_6P) {
        finalFileName = [NSString stringWithFormat:@"%@@3x.png",aFilename];
    }
    else if (IS_IPAD && IS_RETINA) {
        finalFileName = [NSString stringWithFormat:@"%@-ipadhd.png",aFilename];
    }
    else if (IS_IPAD && !IS_RETINA) {
        finalFileName = [NSString stringWithFormat:@"%@-ipad.png",aFilename];
    }
    return finalFileName;
}

+(void)saveValue:(int) aValue userdefaultVariable:(NSString *) aUserDefaultVariable {
    
    int score = [[[NSUserDefaults standardUserDefaults]valueForKey:aUserDefaultVariable]intValue];
    if (score != 0) {
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:aUserDefaultVariable];
    }
    [[NSUserDefaults standardUserDefaults]setValue:[NSNumber numberWithInt:aValue] forKey:aUserDefaultVariable];
}

+(int)getValueFor:(NSString*) aUserDefaultVariable {

    if ([[NSUserDefaults standardUserDefaults]valueForKey:aUserDefaultVariable] == nil) {
        [[NSUserDefaults standardUserDefaults]setValue:[NSNumber numberWithInt
                                                        :[aUserDefaultVariable isEqualToString:kMusicToggle] ||
                                                        [aUserDefaultVariable isEqualToString:kSoundToggle] ? 1 : 0 ] forKey:aUserDefaultVariable];
    }
    
    return [[[NSUserDefaults standardUserDefaults]valueForKey:aUserDefaultVariable]intValue];
}

@end
