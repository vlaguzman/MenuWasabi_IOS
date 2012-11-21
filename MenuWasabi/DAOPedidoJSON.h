//
//  DAOPedidoJSON.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 20/11/12.
//
//

#import <Foundation/Foundation.h>
#import "Pedido.h"

@interface DAOPedidoJSON : NSObject
{
    Pedido *actualOrder;
}

@property (nonatomic, strong) Pedido *actualOrder;

+ (DAOPedidoJSON*)sharedInstance;

-(NSMutableArray *)platosActuales;
-(void)agregarPlato:(Plato *)_plato;
-(void)eliminarPlato:(Plato *)_plato;
-(Plato *)demePlatoEnUbicacion:(int)_index;
-(BOOL)estaPlato:(Plato *)_plato;

@end
