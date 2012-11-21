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

-(NSMutableArray *)platosActuales
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

-(BOOL)estaPlato:(Plato *)_plato{
    return [actualOrder estaPlato:_plato];
}

@end
