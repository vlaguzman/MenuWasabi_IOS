//
//  DAOTipoPlato.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 30/10/12.
//
//

#import "DAOTipoPlato.h"

@implementation DAOTipoPlato


@synthesize tipoPlatoDictionary;

static DAOTipoPlato *sharedDAOTipoPlato = nil;

+(DAOTipoPlato*) sharedInstance
{
    
    if (!sharedDAOTipoPlato) {
        sharedDAOTipoPlato = [[super allocWithZone:NULL]init];
    }
    return sharedDAOTipoPlato;
}
-(int)getNumberOfKindPlates
{
    return [tipoPlatoDictionary count];
}

- (void)loadTipoDatosFromDB{
    sqlite3 *database;
    sqlite3_stmt *compiledStatement;
       tipoPlatoDictionary =  [[NSMutableDictionary alloc]init];
    
    appControler = (AppController*)[[UIApplication sharedApplication]delegate];
    
    // Abrimos la base de datos de la ruta indicada en el delegate
    if(sqlite3_open([appControler.databasePath UTF8String], &database) == SQLITE_OK) {
        // Podríamos seleccionar solo algunos, o todos en el orden deseado así:
        // NSString *sqlStatement = [NSString stringWithFormat:@"seletc id_tutorial, sistema, nombre, terminado from Tutoriales"];
        NSString *sqlStatement = [NSString stringWithFormat:@"select * from wsb_tipoPlato"];
        // Lanzamos la consulta y recorremos los resultados si todo ha ido OK
        if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
            // Recorremos los resultados. En este caso no habrá.
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
                // Leemos las columnas necesarias. Aunque algunos valores son numéricos, prefiero recuperarlos en string y convertirlos luego, porque da menos problemas.
                NSString *id_tipoPlato = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
                NSString *nombre = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                TipoPlato *auxTipoPlato = [[TipoPlato alloc]init];
                auxTipoPlato.id_tipoPlato = id_tipoPlato;
                auxTipoPlato.nombre = nombre;
                NSLog(@"id:= %@ Nombre:= %@", auxTipoPlato.id_tipoPlato, auxTipoPlato.nombre);
                [tipoPlatoDictionary setObject:auxTipoPlato forKey:auxTipoPlato.id_tipoPlato];
                NSLog(@"tipoPlatoDictionary count = %d",[tipoPlatoDictionary count]);
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

-(TipoPlato *)getTipoPlatoById:(NSString*)_idTipoPlato
{
    TipoPlato *auxTipoPlato = [[TipoPlato alloc]init];
    auxTipoPlato = [tipoPlatoDictionary objectForKey:_idTipoPlato];
    
    return auxTipoPlato;
}



-(void)addTipoPlato{
    TipoPlato *auxTipoPlato;

    if(auxTipoPlato == nil)
    {
        auxTipoPlato = [[TipoPlato alloc]init];
    }
    // Establecemos el nombre al objeto.
    auxTipoPlato.nombre = @"Prueba2";
    // Ahora instanciamos la variable database de tipo sqlite3
    sqlite3 *database;
    // Creamos el sqlite3_stmt que contendrá después la sentencia a ejecutar compilada.
    sqlite3_stmt *compiledStatement;
    appControler = (AppController*)[[UIApplication sharedApplication]delegate];
    // Abrimos la base de datos de la ruta indicada en el delegate
     NSLog(@"        ----- if(sqlite3_open([appControler.databasePath UTF8String], &database) == SQLITE_OK) {      ------ ");
    if(sqlite3_open([appControler.databasePath UTF8String], &database) == SQLITE_OK) {
        
        // Si no ha habido errores al abrir, creamos la sentencia de inserción.
        // Como id_noticia es autoincremental, no lo indicaremos nosotros.
        NSString *sqlStatement = [NSString stringWithFormat:@"Insert into \"wsb_tipoPlato\" (\"nombre\") VALUES (\"%@\")",
                                  auxTipoPlato.nombre
                                  ];
        
        CCLOG(sqlStatement);
        // (\"sistema\",\"nombre\", \"terminado\") VALUES (\"%@\",\"%@\",\"%d\")"
        // Lanzamos la consulta y recorremos los resultados si todo ha ido OK
        if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, nil) == SQLITE_OK) {
            // En otros casos recorremos los resultados. En este caso no habrá.
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                char *id_tipoPlato= (char *)sqlite3_column_int(compiledStatement, 0);
                char *nombre = (char *) sqlite3_column_text(compiledStatement, 1);
                NSLog(@"%s %s",id_tipoPlato, nombre);
            }
            
        }
        else {
            NSLog(@"ERROR AGREGANDO PRUEBA");
        }
        
        // Libero la consulta
        sqlite3_finalize(compiledStatement);
    }
    // Cierro la base de datos
    sqlite3_close(database);
    
    // Si todo ha ido bien podemos abandonar la ventana e ir a la superior.
    //Aquí también podéis utilizar un UIAlertView para notificar al usuario de que la inserción ha sido correcta.
    //[self.navigationController popViewControllerAnimated:YES];
    
    
}

@end
