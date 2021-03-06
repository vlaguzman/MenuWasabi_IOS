//
//  MenuViewController.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 21/09/12.
//
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"


@interface MenuViewController : UIViewController
{
    
    IBOutlet UIButton *btn_centro;
    IBOutlet UIButton *btn_sushi;
    IBOutlet UIButton *btn_wok;
    IBOutlet UIButton *btn_tepp;
    IBOutlet UIButton *btn_sopas;
    IBOutlet UIButton *btn_ensaladas;
    IBOutlet UIButton *btn_especiales;
    IBOutlet UIButton *btn_postres;
    IBOutlet UIButton *btn_bebidas;
    IBOutlet UIButton *btn_entradas;
    IBOutlet UIButton *btn_licores;
    IBOutlet UIButton *fondo_btn;
   
    IBOutlet UIImageView *background;
    RootViewController *_rootViewController;
  
}


@property (retain) RootViewController *rootViewController;


- (IBAction)viewTapped:(id)sender;
- (IBAction)viewSopas:(id)sender;
- (IBAction)viewEntradas:(id)sender;
- (IBAction)viewLicores:(id)sender;
- (IBAction)viewBebidas:(id)sender;
- (IBAction)viewPostres:(id)sender;
- (IBAction)viewEspeciales:(id)sender;
- (IBAction)viewEnsaladas:(id)sender;
- (IBAction)viewTeppanyaki:(id)sender;
- (IBAction)viewWok:(id)sender;

-(void)moverBoton:(UIButton *)botn_ posx:(int)x_ posy:(int)y_ alpha:(double)alpha_ duracion:(double)tiempo_ delay:(double)delay_;



@end
