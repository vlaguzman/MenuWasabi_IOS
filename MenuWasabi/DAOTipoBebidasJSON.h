//
//  DAOTipoBebidasJSON.h
//  MenuWasabi
//
//  Created by Giovanni Lopez on 11/30/12.
//  Copyright (c) 2012 3dementes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TipoBebida.h"

@interface DAOTipoBebidasJSON : NSObject
{
    NSMutableArray *beverageTypesArray;
}

@property (nonatomic, strong) NSMutableArray *beverageTypesArray;

+ (DAOTipoBebidasJSON*)sharedInstance;
- (void)loadBeverageTypesFromServer;

-(int) getNumberOfBeverageTypes;
- (int) getNumberOfBeverageTypes:(NSString *) _kind;

- (TipoBebida*) getBeverageTypeById:(NSString*) _idBeverageType;
- (NSMutableDictionary*) getBeverageTypesByKind:(NSString *) _kind;

@end
