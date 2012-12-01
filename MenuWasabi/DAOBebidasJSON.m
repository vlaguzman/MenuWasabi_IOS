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
    NSMutableArray *actualBeverageArray;      
    NSURL *jsonURL = [NSURL URLWithString:[[NSString alloc] initWithFormat:@"http://www.brainztore.com/wasabi/consultabebidasxtipo.php?tipo=%i", _type]];
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfURL:jsonURL];
     NSLog(@" ---   DATA %@  ---", data);
    NSDictionary *jsondict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSArray *_bebidas = [jsondict objectForKey:@"bebidas"];
    NSLog(@"getBeveragesByType -Bebidas - %@ --- ", _bebidas);
      
    NSDictionary *bebida= [_bebidas objectAtIndex:0];
      
    int _nombre = [[bebida objectForKey:@"nombre"] intValue];
    NSLog(@"Nombre -----> %i", _nombre);

    actualBeverageArray = [[NSMutableArray alloc]initWithArray:_bebidas];    
    return actualBeverageArray;
    
}

@end
