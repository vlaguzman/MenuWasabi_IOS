//
//  Pedido.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 30/10/12.
//
//

#import "Pedido.h"

@implementation Pedido

@synthesize totalCuenta, id_mesa, id_pedido, platosActuales, bebidasActuales;

-(id)init
{
    totalCuenta = 0;
    return self;
}

-(NSMutableArray *)platosActuales
{
    if (platosActuales == nil) {
        platosActuales = [[NSMutableArray alloc]init];
    }
    return platosActuales;
}

-(void)agregarPlato:(Plato *)_plato
{
    totalCuenta += _plato.precio;
    [self.platosActuales addObject:_plato];
    
}

-(void)eliminarPlato:(Plato *)_plato
{
    NSLog(@"estamos en eliminarPlato del BrainMenu y este es nombre : %@ del plato ", _plato.nombre);
    totalCuenta -= _plato.precio;
    [self.platosActuales removeObject:_plato];
    
}

-(Plato *)demePlatoEnUbicacion:(int)_index{
    Plato *aux = [[Plato alloc]init];
    aux = [platosActuales objectAtIndex:_index];
    NSLog(@"AGREGADO PLATO  %i, %@, %@", aux.precio, aux.nombre, aux.fuente_img);
    return aux;
}

-(BOOL)estaPlato:(Plato *)_plato{
    return [self.platosActuales containsObject:_plato.self];
}

@end
