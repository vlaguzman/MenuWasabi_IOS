//
//  CombosLayer.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 24/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
#import "cocos2d.h"
#import "RootViewController.h"

@interface CombosLayer : CCLayer {
     RootViewController * _rootViewController;
}
+(CCScene *) sceneWithVC:(RootViewController *)rootViewController;
@end
