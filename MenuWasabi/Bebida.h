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
    NSString *nombre, *categoria, *id_bebida;
    int precio, precio_media, precio_trago, tipo;
}

@property int precio, precio_media, precio_trago, tipo;
@property (nonatomic, strong) NSString *nombre, *categoria, *id_bebida;

@end
