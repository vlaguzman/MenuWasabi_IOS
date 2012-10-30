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
    NSString *tipoPlatoActual;
    NSMutableArray *platosAgregados;
}

@property int totalCuenta;//, tipoPlatoActual;
@property (nonatomic, strong) NSMutableArray *platosAgregados;
@property (nonatomic, strong) NSString *tipoPlatoActual;

+ (BrainMenu*) sharedInstance;

-(void)agregarPlato:(Plato *)_plato;
-(void)eliminarPlato:(Plato *)_plato;
-(Plato *)demePlatoEnUbicacion:(int)_index;
-(BOOL)estaPlato:(Plato *)_plato;


@end
