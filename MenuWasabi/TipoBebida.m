//
//  TipoBebida.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 17/10/12.
//
//

#import "TipoBebida.h"

@implementation TipoBebida
@synthesize id_tipoBebida, nombre, fuente_img, fuente_img_grande, fuente_img_peq, id_tipo;

-(id)init{
    nombre = @"vacio";
    fuente_img = @"vacio";
    fuente_img_grande = @"vacio";
    fuente_img_peq = @"vacio";
    return self;
}
@end
