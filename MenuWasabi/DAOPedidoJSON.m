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

-(void)agregarBebida:(Bebida *)_bebida
{
    [actualOrder agregarBebida:_bebida];
}

-(void)eliminarPlato:(Plato *)_plato
{
    [actualOrder eliminarPlato:_plato];
    
}

-(void)eliminarBebida:(Bebida *)_bebida
{
    [actualOrder eliminarBebida:_bebida];
    
}

-(Plato *)demePlatoEnUbicacion:(int)_index{
    return [actualOrder demePlatoEnUbicacion:_index];
}

-(Bebida *)demeBebidaEnUbicacion:(int)_index{
    return [actualOrder demeBebidaEnUbicacion:_index];
}

-(PlatoxPedido *)demePlatosYCantidadesEnUbicacion:(int)_index{
    return [actualOrder demePlatoyCantidadEnUbicacion:_index];
}

-(BebidaxPedido *)demeBebidasYCantidadesEnUbicacion:(int)_index{
    return [actualOrder demeBebidayCantidadEnUbicacion:_index];
}

-(int)demeCantidadPlatos:(NSString *)_id{
    return [actualOrder demeCantidadPlatos:_id];
}


-(int)demeCantidadBebidas:(NSString *)_id{
    return [actualOrder demeCantidadBebidas:_id];
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
        PlatoxPedido *tempPlatesAndAmounts = [self demePlatosYCantidadesEnUbicacion:n];
        stringURLPlates = [[NSString alloc] initWithFormat:@"%@plato%i=%@&cantidad%i=%i&parcial%i=%i", stringURLPlates, n+1, tempPlatesAndAmounts.plate.id_plato, n+1, tempPlatesAndAmounts.amount, n+1, tempPlatesAndAmounts.parcial];
    }
    
    NSString *stringURLBeverages=@"";
    
    for (int n=0; n<actualOrder.bebidasActuales.count; n++) {
        if (n>0) {
            stringURLBeverages = [[NSString alloc] initWithFormat:@"%@&", stringURLBeverages];
        }
        BebidaxPedido *tempBeveragesAndAmounts = [self demeBebidasYCantidadesEnUbicacion:n];
        stringURLBeverages = [[NSString alloc] initWithFormat:@"%@bebida%i=%@&cantidadb%i=%i&parcialb%i=%i", stringURLBeverages, n+1, tempBeveragesAndAmounts.beverage.id_bebida, n+1, tempBeveragesAndAmounts.amount, n+1, tempBeveragesAndAmounts.parcial];
    }    
        
    NSURL *url = [NSURL URLWithString:[[NSString alloc] initWithFormat:@"http://www.brainztore.com/wasabi/insertpedido.php?mesa=%i&total=%i&estado=%@&cantidadplatos=%i&%@&cantidadbebidas=%i&%@", tempTable.numero, actualOrder.totalCuenta, @"solicitado", actualOrder.platosActuales.count, stringURLPlates, actualOrder.bebidasActuales.count, stringURLBeverages]];
    NSLog(@" ------   Esta es la URL   ------   %@", url);
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
