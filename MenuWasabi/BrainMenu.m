//
//  BrainMenu.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 2/10/12.
//
//

#import "BrainMenu.h"

@interface BrainMenu()


@end

@implementation BrainMenu

@synthesize platosAgregados = _platosAgregados;
@synthesize totalCuenta = _totalCuenta;
@synthesize tipoPlatoActual = _tipoPlatoActual;

static BrainMenu *sharedBrainMenu = nil;

+ (BrainMenu*) sharedInstance
{
    if(!sharedBrainMenu){
        sharedBrainMenu = [[super allocWithZone:NULL] init];;
    }
    return sharedBrainMenu;
    
}

-(NSMutableArray *)platosAgregados
{
    if (_platosAgregados == nil) {
        _platosAgregados = [[NSMutableArray alloc]init];
    }
    return _platosAgregados;
}

-(void)agregarPlato:(Plato *)_plato
{
    _totalCuenta += _plato.precio;
    [self.platosAgregados addObject:_plato];
    

}

-(void)eliminarPlato:(Plato *)_plato
{
    _totalCuenta -= _plato.precio;
    [self.platosAgregados removeObject:_plato];
    
}

-(Plato *)demePlatoEnUbicacion:(int)_index{
    Plato *aux = [[Plato alloc]init];
    aux = [_platosAgregados objectAtIndex:_index];
    NSLog(@"AGREGADO PLATO  %i, %@, %@", aux.precio, aux.nombre, aux.fuente_img);
    return aux;
}


+ (id)allocWithZone:(NSZone *)zone
{
    return [[self sharedInstance] retain];
}
- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;  //denotes an object that cannot be released
}


- (id)autorelease
{
    return self;
}

@end
