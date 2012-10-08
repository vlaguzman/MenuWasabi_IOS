//
//  MainMenuViewController.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 21/09/12.
//
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "MenuViewController.h"

@interface MainMenuViewController : UIViewController{
//    RootViewController *_rootViewController;
    MenuViewController *_menuViewController;
}

//@property (retain) RootViewController *rootViewController;
@property (retain) MenuViewController *menuViewController;

- (IBAction)viewTapped:(id)sender;

@end
