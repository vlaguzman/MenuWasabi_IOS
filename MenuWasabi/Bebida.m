//
//  Bebida.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 17/10/12.
//
//

#import "Bebida.h"

@implementation Bebida
@synthesize id_plato, nombre, precio, tipo;

-(id)init{
    nombre = @"vacio";
    precio = 0;
    tipo = -1;
    return self;
}
@end
