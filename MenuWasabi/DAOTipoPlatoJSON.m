//
//  DAOTipoPlatoJSON.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 19/11/12.
//
//

#import "DAOTipoPlatoJSON.h"

NSString *URL_GET_TIPOS = @"http://www.brainztore.com/wasabi/consultatipoplatos.php";

@implementation DAOTipoPlatoJSON
@synthesize tipoPlatoDictionary;

static DAOTipoPlatoJSON *sharedDAOTipoPlatoJSON = nil;

+(DAOTipoPlatoJSON*) sharedInstance
{
    
    if (!sharedDAOTipoPlatoJSON) {
        sharedDAOTipoPlatoJSON = [[super allocWithZone:NULL]init];
    }
    return sharedDAOTipoPlatoJSON;
}
-(int)getNumberOfKindPlates
{
    return [tipoPlatoDictionary count];
}


-(TipoPlato *)getTipoPlatoById:(NSString*)_idTipoPlato
{
    TipoPlato *auxTipoPlato = [[TipoPlato alloc]init];
    auxTipoPlato = [tipoPlatoDictionary objectForKey:_idTipoPlato];
    
    return auxTipoPlato;
}

- (void)loadTipoDatosFromServer{

    tipoPlatoDictionary = [[NSMutableDictionary alloc]init];
    NSURL *jsonURL = [NSURL URLWithString:URL_GET_TIPOS];
    NSError *error = nil;
    NSString *jsonString = [[NSString alloc]initWithContentsOfURL:jsonURL encoding:NSUTF8StringEncoding error:&error];
    NSData *data = [NSData dataWithContentsOfURL:jsonURL];
    
    NSDictionary *jsondict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSArray *tipoplatos = [jsondict objectForKey:@"tipo_platos"];
  //  NSLog(@"loadTipoDatosFromServer -------------------- %@ --- No de tipo platos %i", tipoplatos, tipoplatos.count);
    
    TipoPlato *auxTipoPlato = [[TipoPlato alloc]init];
    
    for (int num_tipos=0; num_tipos<tipoplatos.count; num_tipos++) {
       
        NSDictionary *tipoplato= [tipoplatos objectAtIndex:num_tipos];
       // NSLog(@"tipo -------------------- %@", tipoplato);
        
        NSString *id_tipo = [tipoplato objectForKey:@"id_tipoPlato"];
       // NSLog(@"Tipo -----> %@", id_tipo);
        NSString *nombre = [tipoplato objectForKey:@"nombre"];
       // NSLog(@"Nombre -----> %@", nombre);
        
        auxTipoPlato.id_tipoPlato = id_tipo;
        auxTipoPlato.nombre = nombre;
        
        [tipoPlatoDictionary setObject:auxTipoPlato forKey:auxTipoPlato.id_tipoPlato];
    }
    

    
}

@end
