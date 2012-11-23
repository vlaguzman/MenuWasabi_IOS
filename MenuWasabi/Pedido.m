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

-(NSMutableDictionary *)platosActuales
{
    if (platosActuales == nil) {
        platosActuales = [[NSMutableDictionary alloc]init];
    }
    return platosActuales;
}

-(void)agregarPlato:(Plato *)_plato
{
    totalCuenta += _plato.precio;
    PlatoxPedido *auxPlate = [[PlatoxPedido alloc]init];
    if([self.platosActuales objectForKey:_plato.id_plato]){
        auxPlate = [self.platosActuales objectForKey:_plato.id_plato];
        auxPlate.amount++;
    }
    else {
        auxPlate.plate = _plato;
        auxPlate.amount = 1;
    }
    [self.platosActuales setObject:auxPlate forKey:_plato.id_plato];
}

-(int)demeCantidadPlatos:(NSString *)_id{
    PlatoxPedido *auxPlate = [[PlatoxPedido alloc]init];
    auxPlate = [self.platosActuales objectForKey:_id];
    return auxPlate.amount;
}

-(void)eliminarPlato:(Plato *)_plato
{
    NSLog(@"estamos en eliminarPlato del BrainMenu y este es nombre : %@ del plato ", _plato.nombre);
    totalCuenta -= _plato.precio;
    PlatoxPedido *auxPlate = [[PlatoxPedido alloc]init];
    auxPlate = [self.platosActuales objectForKey:_plato.id_plato];
    if (auxPlate.amount>1) {
        auxPlate.amount--;
    }
    else {
        [platosActuales removeObjectForKey:_plato.id_plato];
    } 
    
}

-(Plato *)demePlatoEnUbicacion:(int)_index{
    PlatoxPedido *aux = [[PlatoxPedido alloc]init];

    NSArray *arrayPlates = [platosActuales  allValues];
    aux = [arrayPlates objectAtIndex:_index];
    
    
    return aux.plate;
}
-(PlatoxPedido *)demePlatoyCantidadEnUbicacion:(int)_index{
    PlatoxPedido *aux = [[PlatoxPedido alloc]init];
    
    NSArray *arrayPlates = [platosActuales  allValues];
    aux = [arrayPlates objectAtIndex:_index];
    
    
    return aux;
}

-(BOOL)estaPlato:(Plato *)_plato{
    BOOL rtrn = NO;
    if([self.platosActuales objectForKey:_plato.id_plato]){
        rtrn = YES;
    }
    return rtrn;
}

@end
