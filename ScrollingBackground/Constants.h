//
//  Constants.h
//
//
//  Created by Malik Wahaj Ahmed on 30/12/2014.
//  Copyright (c) 2015 Chota Game. All rights reserved.
//

#import "GameUtils.h"
#import <SpriteKit/SpriteKit.h>


#ifndef ScrollingBackground_Constants_h
#define ScrollingBackground_Constants_h

#define kUpdateConstant 0.016667f

#define kiTunesLink @"http://itunes.apple.com/app/idXXXXXXXXX"

#define kHighScoreLeaderboardCategory @"high_score_coins"

#define kGameHighScore @"GameHighScore"
#define kGameCurrentScore @"GameCurrentScore"

#define kSoundToggle @"SoundToggle"
#define kMusicToggle @"MusicToggle"

#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))

#define APP_RED [SKColor colorWithRed:203/255.0f green:0/255.0f blue:21/255.0f alpha:1.0f]
#define APP_YELLOW [SKColor colorWithRed:249/255.0f green:228/255.0f blue:87/255.0f alpha:1.0f]
#define APP_GREEN [SKColor colorWithRed:140/255.0f green:242/255.0f blue:71/255.0f alpha:1.0f]

#define FILENAME(__VALUE__)  [GameUtils getFileNameForDevice:__VALUE__]
#define ADJUST_X(__VALUE__)  [GameUtils adjustedValueX:__VALUE__]
#define ADJUST_Y(__VALUE__)  [GameUtils adjustedValueY:__VALUE__]

#define SCREEN_SIZE [[UIScreen mainScreen] bounds].size
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define SCREEN_CENTER CGPointMake(SCREEN_WIDTH*0.5f,SCREEN_HEIGHT*0.5f)

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)


#define iOSVERSION [[[UIDevice currentDevice] systemVersion] floatValue]


typedef enum {
    kGameStart,
    kGameRunning,
    kGamePaused,
    kGameOver,
} GameStatus;


#endif
