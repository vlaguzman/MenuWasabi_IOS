//
//  BrainMenu.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 2/10/12.
//
//

#import <Foundation/Foundation.h>
#import "Plato.h"

@interface BrainMenu : NSObject
{
    int totalCuenta;
    int tipoPlatoActual;
}

@property int totalCuenta, tipoPlatoActual;

+ (BrainMenu*) sharedInstance;

-(void)agregarPlato:(Plato *)_plato;
-(void)eliminarPlato:(Plato *)_plato;

@end
