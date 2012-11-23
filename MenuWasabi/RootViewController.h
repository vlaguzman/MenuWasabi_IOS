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
    IBOutlet UIButton *btnClose;
    
}
@property (nonatomic, strong) TipoPlato *auxTipoPlato;
@property (nonatomic, retain) NSMutableArray *tipoPlatosArray;
@property (nonatomic, strong) NSString *path;
//@property (nonatomic, strong) AppController *appControler;


- (IBAction)menuTapped:(id)sender;
- (NSString *)demeNombrePlatoPorId:(NSString*)_id;
- (NSString *)demeTipoPlatoPorId:(NSString*)_id;
- (NSString *)demeFuenteImagenPlatoPorId:(NSString*)_id;
- (NSString *)demeFuenteImagenGrandePlatoPorId:(NSString*)_id;
- (NSString *)demeFuenteImagenPequenoPlatoPorId:(NSString*)_id;
- (NSString *)demeDescripcionPlatoPorId:(NSString*)_id;
- (int)demePrecioPlatoPorId:(NSString*)_id;
- (int)demeTotalCuenta;
- (void)agregarPlato:(NSString*)_id;
- (void)eliminarPlato:(NSString*)_id withKindPlate:(NSString*)_kind;
- (void)cambiarEstadoPedido:(NSString*)_id;
- (int)demeNumeroPlatosEnOrden;
- (Plato *)demeDatosPlatoEnUbicacion:(int)_ubicacion;
-(BOOL)estaPlato:(NSString*)_idplato;
-(NSString *)demeTipoActual;
-(int)demeCantidadPlatoPorId:(NSString*)_id;
-(void)addTipoPlato;
- (void)loadTipoDatosFromDB;

-(int)getNumberOfPlates;
-(int)getNumberOfPlatesWithKind:(NSString*)_kind;

-(int)createNewOrder;

-(void)hidePrincipalButton;
-(void)showCloseButton:(int)_posx withPosY:(int)_posy;
- (IBAction)closeApp:(id)sender;

@end
