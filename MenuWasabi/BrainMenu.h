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
    NSMutableArray *platosAgregados;
}

@property int totalCuenta, tipoPlatoActual;
@property (nonatomic, strong) NSMutableArray *platosAgregados;

+ (BrainMenu*) sharedInstance;

-(void)agregarPlato:(Plato *)_plato;
-(void)eliminarPlato:(Plato *)_plato;
-(Plato *)demePlatoEnUbicacion:(int)_index;


@end
