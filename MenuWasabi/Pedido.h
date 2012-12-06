//
//  Pedido.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 30/10/12.
//
//

#import <Foundation/Foundation.h>
#import "Plato.h"
#import "Bebida.h"
#import "PlatoxPedido.h"
#import "BebidaxPedido.h"

@interface Pedido : NSObject
{
    int totalCuenta;
    NSString *id_pedido, *id_mesa;
    NSMutableDictionary *platosActuales, *bebidasActuales;
}


@property int totalCuenta;
@property (nonatomic, strong) NSString *id_pedido, *id_mesa;
@property (nonatomic, strong) NSMutableDictionary *platosActuales, *bebidasActuales;

-(void)agregarPlato:(Plato *)_plato;
-(void)agregarBebida:(Bebida *)_bebida;

-(void)eliminarPlato:(Plato *)_plato;
-(void)eliminarBebida:(Bebida *)_bebida;

-(Plato *)demePlatoEnUbicacion:(int)_index;
-(Bebida *)demeBebidaEnUbicacion:(int)_index;

-(PlatoxPedido *)demePlatoyCantidadEnUbicacion:(int)_index;
-(BOOL)estaPlato:(Plato *)_plato;

-(int)demeCantidadPlatos:(NSString *)_id;
-(int)demeCantidadBebidas:(NSString *)_id;


@end
