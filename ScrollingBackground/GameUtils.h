//
//  GameUtils.h
//  
//
//  Created by Malik Wahaj Ahmed on 31/12/2014.
//  Copyright (c) 2015 Chota Game. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "Constants.h"
#import "AGSpriteButton.h"

@interface GameUtils : NSObject


+(void)rotateAnimation:(SKSpriteNode *) aSprite;
+(void)scaleAnimation:(SKSpriteNode *) aSprite;
+(void)animateWithAtlas:(NSString *)atlasName parentSprite:(SKSpriteNode*)spriteNode repeatCount:(int)count;

+(float)getVolumeLevel;

+(float)adjustedValueX:(float) aValue;
+(float)adjustedValueY:(float) aValue;

+(SKSpriteNode *)createSpriteWithFileName : (NSString *)fileName scale: (float)scale position:(CGPoint)position parentNode: (SKNode*)parentNode;

+(SKLabelNode *)createLabelWithText : (NSString*)text fontName: (NSString*)fontName fontSize: (CGFloat)fontSize color: (SKColor*)color position: (CGPoint)position parentNode: (SKNode *)parentNode;

+(AGSpriteButton*)createSpriteButton : (NSString *)fileName scale: (float)scale position:(CGPoint)position target:(id)target selector:(SEL)selector withObject:(id)object forControlEvent:(AGButtonControlEvent)controlEvent parentNode: (SKNode*)parentNode;

+(NSString*)getFileNameForDevice:(NSString *) aFilename;

+(void)saveValue:(int) aValue userdefaultVariable:(NSString *) aUserDefaultVariable;
+(int)getValueFor:(NSString*) aUserDefaultVariable;


@end
