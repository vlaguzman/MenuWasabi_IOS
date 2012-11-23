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

}
+(CCScene *) sceneWithVC:(RootViewController *)rootViewController;

@end
