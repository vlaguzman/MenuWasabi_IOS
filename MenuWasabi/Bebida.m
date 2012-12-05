//
//  Bebida.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 17/10/12.
//
//

#import "Bebida.h"

@implementation Bebida
@synthesize id_bebida, nombre, precio, precio_media, precio_trago, categoria, tipo;

-(id)init{
    nombre = @"vacio";
    categoria = @"sin categoria";
    precio = 0;
    precio_media = 0;
    precio_trago = 0;
    tipo = -1;
    return self;
}
@end
