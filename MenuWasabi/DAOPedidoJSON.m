//
//  DAOPedidoJSON.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 20/11/12.
//
//

#import "DAOPedidoJSON.h"

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

-(NSMutableArray *)platosActuales
{
   // [self begigOrder];
    return actualOrder.platosActuales;
}

-(void)agregarPlato:(Plato *)_plato
{
   // [self begigOrder];
    [actualOrder agregarPlato:_plato];
}

-(void)eliminarPlato:(Plato *)_plato
{
   // [self begigOrder];
    [actualOrder eliminarPlato:_plato];
    
}

-(Plato *)demePlatoEnUbicacion:(int)_index{
  //  [self begigOrder];
    return [actualOrder demePlatoEnUbicacion:_index];
}

-(BOOL)estaPlato:(Plato *)_plato{
  //  [self begigOrder];
    return [actualOrder estaPlato:_plato];
}

@end
