//
//  PlatoxPedido.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 22/11/12.
//
//

#import <Foundation/Foundation.h>
#import "Plato.h"

@interface PlatoxPedido : NSObject
{
    Plato *plate;
    int amount;
    int parcial;
}
@property (nonatomic, strong) Plato *plate;
@property int amount, parcial;

@end
