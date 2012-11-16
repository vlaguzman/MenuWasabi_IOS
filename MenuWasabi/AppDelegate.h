//
//  AppDelegate.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 21/09/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import <sqlite3.h>

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;

	CCDirectorIOS	*director_;							// weak ref
    
    NSString *databaseName;
    NSString *databasePath;
    
    NSMutableArray *jsonArray;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;
@property (nonatomic, strong) NSString *databaseName;
@property (nonatomic, strong) NSString *databasePath;

@property (nonatomic, strong) NSMutableArray *jsonArray;

-(void)loadDataBase;
@end
