//
//  DAOBebidasJSON.m
//  MenuWasabi
//
//  Created by Giovanni Lopez on 12/1/12.
//  Copyright (c) 2012 3dementes. All rights reserved.
//

#import "DAOBebidasJSON.h"

@implementation DAOBebidasJSON

@synthesize beverageArray;


static DAOBebidasJSON *sharedDAOBebidasJSON = nil;

+(DAOBebidasJSON*) sharedInstance
{
    
    if (!sharedDAOBebidasJSON) {
        sharedDAOBebidasJSON = [[super allocWithZone:NULL]init];
    }
    return sharedDAOBebidasJSON;
}

- (NSMutableArray*) getBeveragesByType:(int) _type{

    NSLog(@"getBeveragesByType -   type - %i --- ", _type);
    NSMutableArray *actualBeverageArray = [[NSMutableArray alloc] init];      
    
    NSURL *jsonURL = [NSURL URLWithString:[[NSString alloc] initWithFormat:@"http://www.brainztore.com/wasabi/consultabebidasxtipo.php?tipo=%i", _type]];
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfURL:jsonURL];
    NSDictionary *jsondict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSArray *_bebidas = [jsondict objectForKey:@"bebidas"];
    
    for (int num_beverares=0; num_beverares < _bebidas.count ; num_beverares++) {
        Bebida *auxBeverage = [[Bebida alloc]init];
        
        NSDictionary *plato= [_bebidas objectAtIndex:num_beverares];
        NSString *nombre =  [plato objectForKey:@"nombre"];
        auxBeverage.nombre = nombre;
        NSString *precio_principal =  [plato objectForKey:@"precio_principal"];
        auxBeverage.precio = [precio_principal intValue];
        
        [actualBeverageArray addObject:auxBeverage];
    }
    

    return actualBeverageArray;
    
}

@end
