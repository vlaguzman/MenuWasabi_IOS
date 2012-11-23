//
//  BrainMenu.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 2/10/12.
//
//

#import "BrainMenu.h"

@interface BrainMenu()


@end

@implementation BrainMenu

@synthesize tipoPlatoActual = _tipoPlatoActual;

static BrainMenu *sharedBrainMenu = nil;

+ (BrainMenu*) sharedInstance
{
    if(!sharedBrainMenu){
        sharedBrainMenu = [[super allocWithZone:NULL] init];
    }
    return sharedBrainMenu;
    
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [[self sharedInstance] retain];
}
- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;  //denotes an object that cannot be released
}


- (id)autorelease
{
    return self;
}

@end
