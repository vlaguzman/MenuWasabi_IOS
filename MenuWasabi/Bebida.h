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
    NSString *nombre;
    int id_plato, precio, tipo;
}

@property int id_plato, precio, tipo;
@property (nonatomic, strong) NSString *nombre;

@end
