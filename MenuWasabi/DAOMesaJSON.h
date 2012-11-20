//
//  DAOMesaJSON.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 20/11/12.
//
//

#import <Foundation/Foundation.h>
#import "Mesa.h"

@interface DAOMesaJSON : NSObject
{
    Mesa *actualTable;
}

@property (nonatomic, strong) Mesa *actualTable;

+ (DAOMesaJSON*)sharedInstance;
- (Mesa*)getTableByNumber:(int)_number;

@end
