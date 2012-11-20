//
//  DAOPlatosJSON.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 19/11/12.
//
//

#import "DAOPlatosJSON.h"

NSString *URL_GET_PLATES = @"http://www.brainztore.com/wasabi/consultaplatos.php";

@implementation DAOPlatosJSON

//@synthesize platesDictionary;
@synthesize platesArray;


static DAOPlatosJSON *sharedDAOPlatoJSON = nil;

+(DAOPlatosJSON*) sharedInstance
{
    
    if (!sharedDAOPlatoJSON) {
        sharedDAOPlatoJSON = [[super allocWithZone:NULL]init];
    }
    return sharedDAOPlatoJSON;
}

-(int)getNumberOfPlates{
    return [platesArray count];
}

-(int)getNumberOfPlatesByKind:(NSString *)_kind{
    NSMutableArray *platesTemp = [[NSMutableArray alloc]init];
    Plato *auxPlate = [[Plato alloc]init];
    for (int i=0; i<[platesArray count]; i++) {
        auxPlate = [platesArray objectAtIndex:i];
        if ([auxPlate.tipo intValue] == [_kind intValue]) {
            [platesTemp addObject:auxPlate];
        }
    }
    return [platesTemp count];
}

-(NSMutableArray*)getPlatesByKind:(NSString *)_kind{
    NSMutableArray *platesTemp = [[NSMutableArray alloc]init];
    Plato *auxPlate = [[Plato alloc]init];
    for (int i=0; i<[platesArray count]; i++) {
        auxPlate = [platesArray objectAtIndex:i];
        if ([auxPlate.tipo intValue] == [_kind intValue]) {
            [platesTemp addObject:auxPlate];
        }
    }
    
    return platesTemp;
}

-(Plato *)getPlateById:(NSString *)_idPlate
{
    Plato *auxPlatoReturn = [[Plato alloc]init];
    NSMutableArray *platesTemp = [[NSMutableArray alloc]init];
    Plato *auxPlate = [[Plato alloc]init];
    for (int i=0; i<[platesArray count]; i++) {
        auxPlate = [platesArray objectAtIndex:i];
        if ([auxPlate.id_plato intValue] == [_idPlate intValue]) {
            
            auxPlatoReturn = auxPlate;
        }
    }
    
    return auxPlatoReturn;
}



- (void)loadPlatesFromServer{

    platesArray = [[NSMutableArray alloc]init];
    NSURL *jsonURL = [NSURL URLWithString:URL_GET_PLATES];
    NSError *error = nil;
    NSString *jsonString = [[NSString alloc]initWithContentsOfURL:jsonURL encoding:NSUTF8StringEncoding error:&error];
    NSData *data = [NSData dataWithContentsOfURL:jsonURL];
    
    NSDictionary *jsondict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSArray *platos = [jsondict objectForKey:@"platos"];
    NSLog(@"loadPlatesFromServer - %@ platos.count := %i -", platos, platos.count);
    
    
    
    for (int num_plates=0; num_plates < platos.count ; num_plates++) {
        Plato *auxPlato = [[Plato alloc]init];
        
        NSDictionary *plato= [platos objectAtIndex:num_plates];
        NSLog(@"este es el plato que se está agregando-------------------- %@", plato);
        
        NSString *id_plato =  [plato objectForKey:@"id_plato"];
        NSLog(@"ID plato -----> %@", id_plato);
        auxPlato.id_plato = id_plato;
        NSLog(@"ID plato - auxPlato.id_plato ----> %@", auxPlato.id_plato);
        
        NSString *tipo_plato =  [plato objectForKey:@"id_tipoplato"];
        NSLog(@"tipo_plato -----> %@", tipo_plato);
        auxPlato.tipo = tipo_plato;
        
        NSString *nombre =  [plato objectForKey:@"nombre"];
        NSLog(@"Nombre -----> %@", nombre);
        auxPlato.nombre = nombre;
        
        NSString *descripcion =  [plato objectForKey:@"descripcion"];
        NSLog(@"descripcion -----> %@", descripcion);
        auxPlato.descripcion = descripcion;
        
        NSNumber *precio = [plato objectForKey:@"precio"];
        NSLog(@"Precio -----> %@", precio);
        auxPlato.precio = [precio intValue];
       
        NSString *img_grande =  [plato objectForKey:@"img_grande"];
        NSLog(@"img_grande -----> %@", img_grande);
        auxPlato.fuente_img_grande = img_grande;
        
        NSString *img_pequena =  [plato objectForKey:@"img_pequena"];
        NSLog(@"img_pequena -----> %@", img_pequena);
        auxPlato.fuente_img_peq = img_pequena;
        
        NSString *img_principal =  [plato objectForKey:@"img_principal"];
        NSLog(@"img_principal -----> %@", img_principal);
        auxPlato.fuente_img = img_principal;
        
        [platesArray addObject:auxPlato];
    }

}


@end
