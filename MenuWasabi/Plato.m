//
//  Plato.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 1/10/12.
//
//

#import "Plato.h"

@implementation Plato

@synthesize id_plato, nombre, fuente_img, fuente_img_grande, fuente_img_peq, pedido, precio, tipo;

-(id)init{
    nombre = @"vacio";
    fuente_img = @"vacio";
    fuente_img_grande = @"vacio";
    fuente_img_peq = @"vacio";
    precio = 0;
    tipo = -1;
    pedido = NO;
    return self;
}
@end
