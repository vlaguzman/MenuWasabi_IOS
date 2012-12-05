//
//  DAOBebidasJSON.m
//  MenuWasabi
//
//  Created by Giovanni Lopez on 12/1/12.
//  Copyright (c) 2012 3dementes. All rights reserved.
//

#import "DAOBebidasJSON.h"

NSString *URL_GET_BEVERAGES = @"http://www.brainztore.com/wasabi/consultabebidas.php";

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
- (Bebida*) getBeverageById:(NSString*) _idBeverage{
    
    Bebida *auxBeverageReturn = [[Bebida alloc]init];
    Bebida *auxBeverage = [[Bebida alloc]init];
    for (int i=0; i<[beverageArray count]; i++) {
        auxBeverage = [beverageArray objectAtIndex:i];
        if ([auxBeverage.id_bebida intValue] == [_idBeverage intValue]) {
            auxBeverageReturn = auxBeverage;
        }
    }
    return auxBeverageReturn;
}




- (void)loadBeveragesFromServer{
    
    beverageArray = [[NSMutableArray alloc]init];
    NSURL *jsonURL = [NSURL URLWithString:URL_GET_BEVERAGES];
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfURL:jsonURL];
    
    NSDictionary *jsondict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSArray *bebidas = [jsondict objectForKey:@"bebidas"];
    
    for (int num_beverages=0; num_beverages < bebidas.count ; num_beverages++) {
        Bebida *auxBebida = [[Bebida alloc]init];
        
        NSDictionary *bebida= [bebidas objectAtIndex:num_beverages];
        NSString *id_bebida =  [bebida objectForKey:@"id_bebida"];
        auxBebida.id_bebida = id_bebida;
        NSString *nombre =  [bebida objectForKey:@"nombre"];
        auxBebida.nombre = nombre;
        NSLog(@"NOMBRE loadBeveragesFromServer %@", nombre);
        NSString *tipo_bebida =  [bebida objectForKey:@"id_tipoBebida"];
        auxBebida.tipo = [tipo_bebida intValue];
        NSString *categoria =  [bebida objectForKey:@"id_categoriaBebida"];
        auxBebida.categoria = categoria;
        NSNumber *precio_principal = [bebida objectForKey:@"precio_principal"];
        auxBebida.precio = [precio_principal intValue];
        NSNumber *precio_media = [bebida objectForKey:@"precio_media"];
        auxBebida.precio_media = [precio_media intValue];
        NSNumber *precio_trago = [bebida objectForKey:@"precio_trago"];
        auxBebida.precio_trago = [precio_trago intValue];
        
        [beverageArray addObject:auxBebida];
    }
    
}

- (NSMutableArray*) getBeveragesByType:(int) _type{

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
        NSString *precio_principal =  [plato objectForKey:@"precio_principal"];
      //   NSString *precio_principal =  [plato objectForKey:@"precio_principal"];
      //  NSString *precio_principal =  [plato objectForKey:@"precio_principal"];
        if ([precio_principal intValue]!=0) {
            auxBeverage.precio = [precio_principal intValue];
            [actualBeverageArray addObject:auxBeverage];
        }
        else {
            NSLog(@"este plato no ha sido agregado %@", auxBeverage.nombre);
        }
        auxBeverage.nombre = nombre;
    }
    return actualBeverageArray;
    
}

@end
