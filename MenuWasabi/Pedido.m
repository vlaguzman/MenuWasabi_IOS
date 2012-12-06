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

-(NSMutableDictionary *)bebidasActuales
{
    if (bebidasActuales == nil) {
        bebidasActuales = [[NSMutableDictionary alloc]init];
    }
    return bebidasActuales;
}

-(void)agregarPlato:(Plato *)_plato
{
    
    totalCuenta += _plato.precio;
    PlatoxPedido *auxPlate = [[PlatoxPedido alloc]init];
    if([self.platosActuales objectForKey:_plato.id_plato]){
        auxPlate = [self.platosActuales objectForKey:_plato.id_plato];
        auxPlate.amount++;
        auxPlate.parcial += _plato.precio;
    }
    else {
        auxPlate.plate = _plato;
        auxPlate.amount = 1;
        auxPlate.parcial = _plato.precio;
    }
    [self.platosActuales setObject:auxPlate forKey:_plato.id_plato];
}


-(void)agregarBebida:(Bebida *)_bebida
{
    
    totalCuenta += _bebida.precio;
    BebidaxPedido *auxBeverage = [[BebidaxPedido alloc]init];
    if([self.bebidasActuales objectForKey:_bebida.id_bebida]){
        NSLog(@" --agregarBebida - ");
        auxBeverage = [self.bebidasActuales objectForKey:_bebida.id_bebida];
        auxBeverage.amount++;
        auxBeverage.parcial += _bebida.precio;
    }
    else {
        NSLog(@" --agregarBebida -- else %@", _bebida.nombre);
        auxBeverage.beverage = _bebida;
        auxBeverage.amount = 1;
        auxBeverage.parcial = _bebida.precio;
    }
    NSLog(@"Cantidad   === %i", bebidasActuales.count);
    [self.bebidasActuales setObject:auxBeverage forKey:_bebida.id_bebida];
     NSLog(@"Cantidad   === %i", bebidasActuales.count);
}


-(int)demeCantidadPlatos:(NSString *)_id{
    PlatoxPedido *auxPlate = [[PlatoxPedido alloc]init];
    auxPlate = [self.platosActuales objectForKey:_id];
    return auxPlate.amount;
}

-(int)demeCantidadBebidas:(NSString *)_id{
    BebidaxPedido *auxBebidas = [[BebidaxPedido alloc]init];
    auxBebidas = [self.bebidasActuales objectForKey:_id];
    return auxBebidas.amount;
}

-(void)eliminarPlato:(Plato *)_plato
{
  
    totalCuenta -= _plato.precio;
    PlatoxPedido *auxPlate = [[PlatoxPedido alloc]init];
    auxPlate = [self.platosActuales objectForKey:_plato.id_plato];
    if (auxPlate.amount>1) {
        auxPlate.amount--;
        auxPlate.parcial -= _plato.precio;
    }
    else {
        [platosActuales removeObjectForKey:_plato.id_plato];
    } 
    
}

-(void)eliminarBebida:(Bebida *)_bebida{
  
    totalCuenta -= _bebida.precio;
    BebidaxPedido *auxBebida = [[BebidaxPedido alloc]init];
    auxBebida = [self.bebidasActuales objectForKey:_bebida.id_bebida];
    if (auxBebida.amount>1) {
        auxBebida.amount--;
        auxBebida.parcial -= _bebida.precio;
    }
    else {
        [bebidasActuales removeObjectForKey:_bebida.id_bebida];
    } 
}

-(Plato *)demePlatoEnUbicacion:(int)_index{
    PlatoxPedido *aux = [[PlatoxPedido alloc]init];

    NSArray *arrayPlates = [platosActuales  allValues];
    aux = [arrayPlates objectAtIndex:_index];
    
    
    return aux.plate;
}

-(Bebida *)demeBebidaEnUbicacion:(int)_index{
    BebidaxPedido *aux = [[BebidaxPedido alloc]init];
    
    NSArray *arrayBeverages = [bebidasActuales allValues];
    aux = [arrayBeverages objectAtIndex:_index];
    
    return aux.beverage;
}

-(PlatoxPedido *)demePlatoyCantidadEnUbicacion:(int)_index{
    PlatoxPedido *aux = [[PlatoxPedido alloc]init];
    NSArray *arrayPlates = [platosActuales  allValues];
    aux = [arrayPlates objectAtIndex:_index];
    return aux;
}

-(BebidaxPedido *)demeBebidayCantidadEnUbicacion:(int)_index{
    BebidaxPedido *aux = [[BebidaxPedido alloc]init];
    NSArray *arrayBeverages = [bebidasActuales  allValues];
    aux = [arrayBeverages objectAtIndex:_index];
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
