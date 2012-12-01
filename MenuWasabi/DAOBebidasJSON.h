//
//  DAOBebidasJSON.h
//  MenuWasabi
//
//  Created by Giovanni Lopez on 12/1/12.
//  Copyright (c) 2012 3dementes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bebida.h"

@interface DAOBebidasJSON : NSObject
{

    NSMutableArray *beverageArray;
    NSURLConnection *conx;
    NSMutableData *webData;
}

@property (nonatomic, strong) NSMutableArray *beverageArray;

+ (DAOBebidasJSON*)sharedInstance;
- (NSMutableArray*) getBeveragesByType:(int) _type;

@end
