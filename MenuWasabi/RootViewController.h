//
//  RootViewController.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 21/09/12.
//
//

#import <UIKit/UIKit.h>
#import "Plato.h"
//#import "MenuViewController.h"

@interface RootViewController : UIViewController
{
   
}
- (IBAction)menuTapped:(id)sender;
- (NSString *)demeNombrePlatoPorId:(id)_id;
- (NSString *)demeFuenteImagenPlatoPorId:(id)_id;
- (NSString *)demeFuenteImagenGrandePlatoPorId:(id)_id;
- (NSString *)demeFuenteImagenPequenoPlatoPorId:(id)_id;
- (NSString *)demeDescripcionPlatoPorId:(id)_id;
- (int)demePrecioPlatoPorId:(id)_id;
- (int)demeTotalCuenta;
- (void)agregarPlato:(id)_id;
- (void)eliminarPlato:(id)_id;
- (void)cambiarEstadoPedido:(id)_id;
- (int)demeNumeroPlatosEnOrden;

- (Plato *)demeDatosPlatoEnUbicacion:(int)_ubicacion;

@end
