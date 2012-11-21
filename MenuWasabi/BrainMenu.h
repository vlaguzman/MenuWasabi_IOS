//
//  BrainMenu.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 2/10/12.
//
//

#import <Foundation/Foundation.h>
#import "Plato.h"

@interface BrainMenu : NSObject
{
    NSString *tipoPlatoActual;
}

@property (nonatomic, strong) NSString *tipoPlatoActual;

+ (BrainMenu*) sharedInstance;


@end
