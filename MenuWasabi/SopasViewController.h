//
//  SopasViewController.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 27/09/12.
//
//

#import <UIKit/UIKit.h>

@interface SopasViewController : UIViewController

- (IBAction)menuTapped:(id)sender;

- (NSString *)demeNombrePlatoPorId:(id)_id;
- (NSString *)demeFuenteImagenPlatoPorId:(id)_id ;
- (int)demePrecioPlatoPorId:(id)_id;
- (int)demeTotalCuenta;
- (void)agregarPlato:(id)_id;
- (void)eliminarPlato:(id)_id;




@end
