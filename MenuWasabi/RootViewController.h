//
//  RootViewController.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 21/09/12.
//
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Plato.h"
#import "TipoPlato.h"

@interface RootViewController : UIViewController
{
    NSString *path;
    IBOutlet UIButton *btnPrincipal;
    AppController *appControler;
    TipoPlato *auxTipoPlato;
    NSMutableArray *tipoPlatosArray;
}

@property (nonatomic, retain) NSMutableArray *tipoPlatosArray;
@property (nonatomic, strong) NSString *path;
//@property (nonatomic, strong) AppController *appControler;
@property (nonatomic, strong) TipoPlato *auxTipoPlato;

- (IBAction)menuTapped:(id)sender;
- (NSString *)demeNombrePlatoPorId:(id)_id;
- (int)demeTipoPlatoPorId:(id)_id;
- (NSString *)demeFuenteImagenPlatoPorId:(id)_id;
- (NSString *)demeFuenteImagenGrandePlatoPorId:(id)_id;
- (NSString *)demeFuenteImagenPequenoPlatoPorId:(id)_id;
- (NSString *)demeDescripcionPlatoPorId:(id)_id;
- (int)demePrecioPlatoPorId:(id)_id;
- (int)demeTotalCuenta;
- (void)agregarPlato:(id)_id;
- (void)eliminarPlato:(id)_id withKindPlate:(int)_kind;
- (void)cambiarEstadoPedido:(id)_id;
- (int)demeNumeroPlatosEnOrden;
- (Plato *)demeDatosPlatoEnUbicacion:(int)_ubicacion;
-(BOOL)estaPlato:(id)_idplato;
-(int)demeTipoActual;

-(void)addTipoPlato;
- (void)loadTipoDatosFromDB;

@end
