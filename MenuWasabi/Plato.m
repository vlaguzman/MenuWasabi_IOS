//
//  Plato.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 1/10/12.
//
//

#import "Plato.h"

@implementation Plato

@synthesize id_plato, nombre, fuente_img, pedido, precio, tipo;

-(id)init{
    nombre = @"vacio";
    fuente_img = @"vacio";
    precio = 0;
    tipo = -1;
    pedido = NO;
    return self;
}
@end
