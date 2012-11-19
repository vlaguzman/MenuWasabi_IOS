//
//  Pedido.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 30/10/12.
//
//

#import <Foundation/Foundation.h>
#import "Plato.h"

@interface Pedido : NSObject
{
    int totalCuenta;
    NSString *id_pedido, *id_mesa;
    NSMutableArray *platosActuales, *bebidasActuales;
}


@property int totalCuenta;
@property (nonatomic, strong) NSString *id_pedido, *id_mesa;
@property (nonatomic, strong) NSMutableArray *platosActuales, *bebidasActuales;

-(void)agregarPlato:(Plato *)_plato;
-(void)eliminarPlato:(Plato *)_plato;
-(Plato *)demePlatoEnUbicacion:(int)_index;
-(BOOL)estaPlato:(Plato *)_plato;


@end
