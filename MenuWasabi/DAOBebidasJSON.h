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

- (void)loadBeveragesFromServer;
+ (DAOBebidasJSON*)sharedInstance;
- (NSMutableArray*) getBeveragesByType:(int) _type;
- (Bebida*) getBeverageById:(NSString*) _idBeverage;

@end
