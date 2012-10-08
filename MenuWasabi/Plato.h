//
//  Plato.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 1/10/12.
//
//

#import <Foundation/Foundation.h>

@interface Plato : NSObject
{
    NSString *nombre, *fuente_img;
    int id_plato, precio, tipo;
    BOOL pedido;
}

@property int id_plato, precio, tipo;
@property BOOL pedido;
@property (nonatomic, strong) NSString *nombre, *fuente_img;

@end
