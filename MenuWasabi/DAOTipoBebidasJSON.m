//
//  DAOTipoBebidasJSON.m
//  MenuWasabi
//
//  Created by Giovanni Lopez on 11/30/12.
//  Copyright (c) 2012 3dementes. All rights reserved.
//

#import "DAOTipoBebidasJSON.h"
NSString *URL_GET_TIPO_BEBIDAS = @"http://www.brainztore.com/wasabi/consultatipobebidas.php";

@implementation DAOTipoBebidasJSON

@synthesize beverageTypesArray;

static DAOTipoBebidasJSON *sharedDAOTipoBebidasJSON = nil;

+ (DAOTipoBebidasJSON*)sharedInstance{
    if (!sharedDAOTipoBebidasJSON) {
        sharedDAOTipoBebidasJSON = [[super allocWithZone:NULL]init];
    }
    return sharedDAOTipoBebidasJSON;
}

-(int) getNumberOfBeverageTypes{
    return [beverageTypesArray count];
}

- (int) getNumberOfBeverageTypes:(NSString *) _kind{}

//solicitado
- (void)loadBeverageTypesFromServer{
    beverageTypesArray = [[NSMutableArray alloc]init];
    NSURL *jsonURL = [NSURL URLWithString:URL_GET_TIPO_BEBIDAS];
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfURL:jsonURL];
    
    NSDictionary *jsondict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSArray *tipoBebidas = [jsondict objectForKey:@"tipoBebidas"];
    
    for (int num_beberage=0; num_beberage < tipoBebidas.count ; num_beberage++) {
        TipoBebida *auxBeverageType = [[TipoBebida alloc]init];
        
        NSDictionary *tipoBebida= [tipoBebidas objectAtIndex:num_beberage];
        NSString *id_beberageType =  [tipoBebida objectForKey:@"id_tipoBebida"];
        auxBeverageType.id_tipoBebida = id_beberageType;
        NSString *nombre =  [tipoBebida objectForKey:@"nombre"];
        auxBeverageType.nombre = nombre;
        NSString *img_silueta =  [tipoBebida objectForKey:@"img_silueta"];
        auxBeverageType.fuente_img_grande = img_silueta;
        NSString *img_pequena =  [tipoBebida objectForKey:@"img_pequena"];
        auxBeverageType.fuente_img_peq = img_pequena;
        NSString *img_principal =  [tipoBebida objectForKey:@"img_principal"];
        auxBeverageType.fuente_img = img_principal;
        
        [beverageTypesArray addObject:auxBeverageType];
    }

}

- (TipoBebida*) getBeverageTypeById:(NSString*) _idPlate{}


- (NSMutableArray*) getBeverageTypesByKind:(NSString *) _kind{
    NSMutableArray *beverageTypesTemp = [[NSMutableArray alloc]init];
    TipoBebida *auxBeverage = [[TipoBebida alloc]init];
    for (int i=0; i<[beverageTypesArray count]; i++) {
        auxBeverage = [beverageTypesArray objectAtIndex:i];
        if ([auxBeverage.id_tipoBebida intValue] == [_kind intValue]) {
            [beverageTypesTemp addObject:auxBeverage];
        }
    }
    return beverageTypesTemp;
}

@end
