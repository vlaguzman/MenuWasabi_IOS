//
//  DAOPlatos.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 30/10/12.
//
//

#import "DAOPlatos.h"

@implementation DAOPlatos

//@synthesize platesDictionary;
@synthesize platesArray;

static DAOPlatos *sharedDAOPlato = nil;

+(DAOPlatos*) sharedInstance
{
    
    if (!sharedDAOPlato) {
        sharedDAOPlato = [[super allocWithZone:NULL]init];
    }
    return sharedDAOPlato;
}
-(int)getNumberOfPlates{
    return [platesArray count];
}

-(int)getNumberOfPlatesByKind:(NSString *)_kind{
    NSMutableArray *platesTemp = [[NSMutableArray alloc]init];
    Plato *auxPlate = [[Plato alloc]init];
    for (int i=0; i<[platesArray count]; i++) {
        auxPlate = [platesArray objectAtIndex:i];
        NSLog(@"Nombre AuxPlateName:%@  auxPlate.tipo: %@ _kind: %@", auxPlate.nombre, auxPlate.tipo, _kind);
        NSLog(@"%d", ([auxPlate.tipo intValue] == [_kind intValue]));
        if ([auxPlate.tipo intValue] == [_kind intValue]) {
            NSLog(@"Estamso adentro de petición de platos por tipo %@", auxPlate.nombre);
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
        NSLog(@"Nombre AuxPlateName:%@  auxPlate.tipo: %@ _kind: %@", auxPlate.nombre, auxPlate.tipo, _kind);
        NSLog(@"%d", ([auxPlate.tipo intValue] == [_kind intValue]));
        if ([auxPlate.tipo intValue] == [_kind intValue]) {
            NSLog(@"Estamso adentro -(NSMutableArray*)getPlatesByKind:(NSString *)_kind{ %@", auxPlate.nombre);
            [platesTemp addObject:auxPlate];
        }
    }
    
    return platesTemp;
}

- (void)loadPlatesFromDB{
    sqlite3 *database;
    sqlite3_stmt *compiledStatement;
  //  platesDictionary =  [[NSMutableDictionary alloc]init];
    platesArray = [[NSMutableArray alloc]init];
    
    appControler = (AppController*)[[UIApplication sharedApplication]delegate];
    
    // Abrimos la base de datos de la ruta indicada en el delegate
    if(sqlite3_open([appControler.databasePath UTF8String], &database) == SQLITE_OK) {
        // Podríamos seleccionar solo algunos, o todos en el orden deseado así:
        // NSString *sqlStatement = [NSString stringWithFormat:@"seletc id_tutorial, sistema, nombre, terminado from Tutoriales"];
        NSString *sqlStatement = [NSString stringWithFormat:@"select * from wsb_plato"];
        // Lanzamos la consulta y recorremos los resultados si todo ha ido OK
        if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
            // Recorremos los resultados. En este caso no habrá.
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
                // Leemos las columnas necesarias. Aunque algunos valores son numéricos, prefiero recuperarlos en string y convertirlos luego, porque da menos problemas.
                NSString *id_plato = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
                NSString *nombre = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                NSString *descripcion = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
                NSString *tipo_plato = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
                NSString *precio = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 4)];
                NSString *img_grande = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 5)];
                NSString *img_pequena = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)];
                NSString *img_principal = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 7)];
                
                Plato *auxPlato = [[Plato alloc]init];
                auxPlato.id_plato = id_plato;
                auxPlato.nombre = nombre;
                auxPlato.descripcion = descripcion;
                auxPlato.tipo = tipo_plato;
                auxPlato.precio = [precio intValue];
                auxPlato.fuente_img_grande = img_grande;
                auxPlato.fuente_img_peq = img_pequena;
                auxPlato.fuente_img = img_principal;
                
                NSLog(@"id:= %@ Nombre:= %@ Descripción %@ %i", auxPlato.id_plato, auxPlato.nombre, auxPlato.descripcion, auxPlato.precio);
               // [platesDictionary setObject:auxPlato forKey:auxPlato.id_plato];
                [platesArray addObject:auxPlato];
                NSLog(@"tipoPlatoDictionary count = %d TIPO %@",[platesArray count], auxPlato.tipo);
            }
        }
        
        else {
            NSLog(@"        ----- Houston, tenemos un problema...      ------ ");
        }
        // Libero la consulta
        sqlite3_finalize(compiledStatement);
        
    }
    // Cierro la base de datos
    sqlite3_close(database);
}

-(Plato *)getPlateById:(NSString *)_idPlate
{
    Plato *auxPlatoReturn = [[Plato alloc]init];
    NSMutableArray *platesTemp = [[NSMutableArray alloc]init];
    Plato *auxPlate = [[Plato alloc]init];
    for (int i=0; i<[platesArray count]; i++) {
        auxPlate = [platesArray objectAtIndex:i];
        NSLog(@"Nombre AuxPlateName:%@  auxPlate.tipo: %@ ", auxPlate.nombre, auxPlate.tipo);
         NSLog(@"INT  %d", ([auxPlate.id_plato intValue] == [_idPlate intValue]));
        NSLog(@"SEGUNDA  %d", (auxPlate.id_plato  == _idPlate ));
        if ([auxPlate.id_plato intValue] == [_idPlate intValue]) {
            NSLog(@"Estamso adentro =) %@", auxPlate.nombre);
            auxPlatoReturn = auxPlate;
        }
    }
    
    return auxPlatoReturn;
}


@end
