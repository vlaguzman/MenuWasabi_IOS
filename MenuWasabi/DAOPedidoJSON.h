//
//  DAOPedidoJSON.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 20/11/12.
//
//

#import <Foundation/Foundation.h>
#import "Pedido.h"
#import "Bebida.h"

#import "PlatoxPedido.h"

@interface DAOPedidoJSON : NSObject
{
    Pedido *actualOrder;
    NSURLConnection *conx;
    NSMutableData *webData;
}

@property (nonatomic, strong) Pedido *actualOrder;

+ (DAOPedidoJSON*)sharedInstance;

-(void)begigOrder;

-(NSDictionary *)platosActuales;
-(void)agregarPlato:(Plato *)_plato;
-(void)agregarBebida:(Bebida *)_bebida;
-(void)eliminarPlato:(Plato *)_plato;
-(void)eliminarBebida:(Bebida *)_bebida;
-(Plato *)demePlatoEnUbicacion:(int)_index;
-(Bebida *)demeBebidaEnUbicacion:(int)_index;
-(BOOL)estaPlato:(Plato *)_plato;
-(int)demeCantidadPlatos:(NSString *)_id;
-(int)demeCantidadBebidas:(NSString *)_id;
-(int)createNewOrder;

@end
