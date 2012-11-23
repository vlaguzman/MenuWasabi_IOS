//
//  DAOPedidoJSON.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 20/11/12.
//
//

#import "DAOPedidoJSON.h"
#import "DAOMesaJSON.h"

#define CREATE_NEW_ORDER @"http://www.brainztore.com/wasabi/updateestadomesa.php?mesa=%i&total=%i&estado=%@&cantidadplatos=%i";

@implementation DAOPedidoJSON

@synthesize actualOrder;

static DAOPedidoJSON *sharedDAOPedidoJSON = nil;

+(DAOPedidoJSON*) sharedInstance
{
    if (!sharedDAOPedidoJSON) {
        sharedDAOPedidoJSON = [[super allocWithZone:NULL]init];
        
    }
    return sharedDAOPedidoJSON;
}

-(void)begigOrder{
    if (!actualOrder) {
        NSLog(@"ARRANCAMOS LAS ORDENES");
        actualOrder = [[Pedido alloc]init];
    }
    
}

-(NSDictionary *)platosActuales
{
    return actualOrder.platosActuales;
}

-(void)agregarPlato:(Plato *)_plato
{
    [actualOrder agregarPlato:_plato];
}

-(void)eliminarPlato:(Plato *)_plato
{
    [actualOrder eliminarPlato:_plato];
    
}

-(Plato *)demePlatoEnUbicacion:(int)_index{
    return [actualOrder demePlatoEnUbicacion:_index];
}
-(PlatoxPedido *)demePlatosYCantidadesEnUbicacion:(int)_index{
    return [actualOrder demePlatoyCantidadEnUbicacion:_index];
}

-(int)demeCantidadPlatos:(NSString *)_id{
    return [actualOrder demeCantidadPlatos:_id];
}

-(BOOL)estaPlato:(Plato *)_plato{
    return [actualOrder estaPlato:_plato];
}

-(int)createNewOrder{
    int ret = -1;
    Mesa *tempTable = [[DAOMesaJSON sharedInstance] actualTable];
    NSString *stringURLPlates=@"";
    
    for (int n=0; n<actualOrder.platosActuales.count; n++) {
        if (n>0) {
            stringURLPlates = [[NSString alloc] initWithFormat:@"%@&", stringURLPlates];
        }
    //    Plato *tempPlate = [self demePlatoEnUbicacion:n];
        PlatoxPedido *tempPlatesAndAmounts = [self demePlatosYCantidadesEnUbicacion:n];
        stringURLPlates = [[NSString alloc] initWithFormat:@"%@plato%i=%@&cantidad%i=%i", stringURLPlates, n+1, tempPlatesAndAmounts.plate.id_plato, n+1, tempPlatesAndAmounts.amount];
    }
        
    NSURL *url = [NSURL URLWithString:[[NSString alloc] initWithFormat:@"http://www.brainztore.com/wasabi/insertpedido.php?mesa=%i&total=%i&estado=%@&cantidadplatos=%i&%@", tempTable.numero, actualOrder.totalCuenta, @"solicitado", actualOrder.platosActuales.count, stringURLPlates]];
       
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    conx = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(conx){
        webData=[NSMutableData data];
        NSLog(@"conexión hecha createNewOrder");
        ret = 1;
    }
    return ret;
}


@end
