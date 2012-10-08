//
//  SopasLayer.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 27/09/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
#import "cocos2d.h"
#import "SopasViewController.h"

@interface SopasLayer : CCLayer {
    SopasViewController *_sopasViewController;
    UISwipeGestureRecognizer * _swipeLeftRecognizer;
    UISwipeGestureRecognizer * _swipeRightRecognizer;
}
@property (nonatomic, strong) UISwipeGestureRecognizer * swipeLeftRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer * swipeRightRecognizer;

+(CCScene *) scene;
+(CCScene *) sceneWithVC:(SopasViewController *)sopasViewController;

@end
