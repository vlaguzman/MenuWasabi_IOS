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
    NSURLConnection *conx;
    NSMutableData *webData;
}

@property (nonatomic, strong) Pedido *actualOrder;

+ (DAOPedidoJSON*)sharedInstance;

-(void)begigOrder;

-(NSMutableArray *)platosActuales;
-(void)agregarPlato:(Plato *)_plato;
-(void)eliminarPlato:(Plato *)_plato;
-(Plato *)demePlatoEnUbicacion:(int)_index;
-(BOOL)estaPlato:(Plato *)_plato;

-(int)createNewOrder;

@end
