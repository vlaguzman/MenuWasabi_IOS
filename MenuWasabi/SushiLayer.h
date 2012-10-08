//
//  SushiLayer.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 21/09/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
#import "cocos2d.h"
#import "RootViewController.h"

@interface SushiLayer : CCLayer 
{
    RootViewController * _rootViewController;
    UISwipeGestureRecognizer * _swipeLeftRecognizer;
    UISwipeGestureRecognizer * _swipeRightRecognizer;
}
@property (nonatomic, strong) UISwipeGestureRecognizer * swipeLeftRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer * swipeRightRecognizer;

+(CCScene *) scene;
+(CCScene *) sceneWithVC:(RootViewController *)rootViewController;
@end
