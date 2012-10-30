//
//  Plato.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 1/10/12.
//
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "TipoPlato.h"

@interface Plato : NSObject
{
    NSString *nombre, *descripcion, *fuente_img, *fuente_img_grande, *fuente_img_peq, *id_plato, *tipo;
    //TipoPlato *tipo;
   // NSDecimalNumber *
    int precio;
    BOOL pedido;
   // BOOL isDirty;
   // BOOL isDetailViewHydrated;
}


@property int precio;
@property BOOL pedido;
@property (nonatomic, strong) NSString *nombre, *descripcion, *fuente_img, *fuente_img_grande, *fuente_img_peq, *id_plato;
@property (nonatomic, strong) NSString *tipo;
//@property (nonatomic, strong) NSDecimalNumber *precio;

//@property (nonatomic, readwrite) BOOL isDirty;
//@property (nonatomic, readwrite) BOOL isDetailViewHydrated;

@end
	