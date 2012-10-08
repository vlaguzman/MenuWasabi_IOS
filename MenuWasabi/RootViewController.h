//
//  RootViewController.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 21/09/12.
//
//

#import <UIKit/UIKit.h>
//#import "MenuViewController.h"

@interface RootViewController : UIViewController
{
   
}
- (IBAction)menuTapped:(id)sender;
- (NSString *)demeNombrePlatoPorId:(id)_id conTipoPlato:(int)_tipo;
- (NSString *)demeFuenteImagenPlatoPorId:(id)_id conTipoPlato:(int)_tipo;
- (int)demePrecioPlatoPorId:(id)_id conTipoPlato:(int)_tipo;
- (int)demeTotalCuenta;
- (void)agregarPlato:(id)_id;
- (void)eliminarPlato:(id)_id;
- (void)cambiarEstadoPedido:(id)_id conTipoPlato:(int)_tipo;

@end
