//
//  Bebida.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 17/10/12.
//
//

#import <Foundation/Foundation.h>

@interface Bebida : NSObject
{
    NSString *nombre, *categoria;
    int id_plato, precio, precio_media, tipo;
}

@property int id_plato, precio, precio_media, tipo;
@property (nonatomic, strong) NSString *nombre, *categoria;

@end
