//
//  MenuViewController.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 21/09/12.
//
//

#import "MenuViewController.h"
#import "cocos2d.h"
#import "CCActionInterval.h"
#import "BrainMenu.h"

#define tipoSushi 1
#define tipoSopa 2

@interface MenuViewController ()

@end

@implementation MenuViewController

@synthesize rootViewController = _rootViewController;
@synthesize sopasViewController = _sopasViewController;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self moverBotones];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)moverBotones
{
    
    [self moverBoton:btn_centro posx:390 posy:245 alpha:1.0 duracion:1.0 delay:0.0];
    
    [self moverBoton:btn_sushi posx:461 posy:150 alpha:1.0 duracion:0.5 delay:1.0];
    [self moverBoton:btn_tepp posx:571 posy:173 alpha:1.0 duracion:0.5 delay:1.2];
    [self moverBoton:btn_sopas posx:627 posy:279 alpha:1.0 duracion:0.5 delay:1.4];
    [self moverBoton:btn_especiales posx:627 posy:385 alpha:1.0 duracion:0.5 delay:1.6];
    [self moverBoton:btn_entradas posx:571 posy:475 alpha:1.0 duracion:0.5 delay:1.8];
    [self moverBoton:btn_ensaladas posx:461 posy:499 alpha:1.0 duracion:0.5 delay:2.0];
    [self moverBoton:btn_wok posx:351 posy:475 alpha:1.0 duracion:0.5 delay:2.2];
    [self moverBoton:btn_postres posx:287 posy:385 alpha:1.0 duracion:0.5 delay:2.4];
    [self moverBoton:btn_bebidas posx:287 posy:279 alpha:1.0 duracion:0.5 delay:2.6];
    [self moverBoton:btn_licores posx:351 posy:178 alpha:1.0 duracion:0.5 delay:2.8];
    
    [self moverBoton:fondo_btn posx:251 posy:126 alpha:0.5 duracion:3 delay:1.4];
}
- (void)viewDidUnload
{
   
  
    [btn_sushi release];
    btn_sushi = nil;
    [btn_centro release];
    btn_centro = nil;
    [btn_wok release];
    btn_wok = nil;
    [btn_tepp release];
    btn_tepp = nil;
    [btn_sopas release];
    btn_sopas = nil;
    [btn_ensaladas release];
    btn_ensaladas = nil;
    [btn_especiales release];
    btn_especiales = nil;
    [btn_postres release];
    btn_postres = nil;
    [btn_bebidas release];
    btn_bebidas = nil;
    [btn_entradas release];
    btn_entradas = nil;
    [btn_licores release];
    btn_licores = nil;
    [fondo_btn release];
    fondo_btn = nil;
    [fondo_btn release];
    fondo_btn = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

//251-126

-(void)moverBoton:(UIButton *)botn_ posx:(int)x_ posy:(int)y_ alpha:(double)alpha_ duracion:(double)tiempo_ delay:(double)delay_{
    
    [UIView beginAnimations:@"advancedAimations" context:nil];
    [UIView setAnimationDuration:tiempo_];
    [UIView setAnimationDelay:delay_];
    
    CGRect botonFrame = botn_.frame;
    botn_.alpha=alpha_;
    botonFrame.origin.x=x_;
    botonFrame.origin.y=y_;
    botn_.frame=botonFrame;
    
    [UIView commitAnimations];
}

- (IBAction)viewTapped:(id)sender {
    [self salirMenu:sender];
    [NSTimer scheduledTimerWithTimeInterval:3.3 target:self selector:@selector(layerSushi:) userInfo:nil repeats:NO];
}

- (IBAction)viewSopas:(id)sender {
    [self salirMenu:sender];
    [NSTimer scheduledTimerWithTimeInterval:3.3 target:self selector:@selector(layerSopas:) userInfo:nil repeats:NO];
}

-(IBAction)salirMenu:(id)sender{
    
   [self moverBoton:fondo_btn posx:251 posy:126 alpha:0.0 duracion:3 delay:0.0];
    
   [self moverBoton:btn_licores posx:467 posy:401 alpha:0.0 duracion:0.5 delay:0.0];
   [self moverBoton:btn_bebidas posx:467 posy:401 alpha:0.0 duracion:0.5 delay:0.2];
   [self moverBoton:btn_postres posx:467 posy:401 alpha:0.0 duracion:0.5 delay:0.4];
   [self moverBoton:btn_wok posx:467 posy:401 alpha:0.0 duracion:0.5 delay:0.6];
   [self moverBoton:btn_ensaladas posx:467 posy:401 alpha:0.0 duracion:0.5 delay:0.8];
   [self moverBoton:btn_entradas posx:467 posy:401 alpha:0.0 duracion:0.5 delay:1.0];
   [self moverBoton:btn_especiales posx:467 posy:401 alpha:0.0 duracion:0.5 delay:1.2];
   [self moverBoton:btn_sopas posx:467 posy:401 alpha:0.0 duracion:0.5 delay:1.4];
   [self moverBoton:btn_tepp posx:467 posy:401 alpha:0.0 duracion:0.5 delay:1.6];
   [self moverBoton:btn_sushi posx:467 posy:401 alpha:0.0 duracion:0.5 delay:1.8];
    
   [self moverBoton:btn_centro posx:390 posy:-140 alpha:1.0 duracion:1.0 delay:2.3];
    
      
}



- (void)layerSushi:(id)arg {
    [self moverBotones];
    if (_rootViewController == nil) {
        self.rootViewController = [[[RootViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    }
 
    [[BrainMenu sharedInstance] setTipoPlatoActual:tipoSushi];
    [self.navigationController pushViewController:_rootViewController animated:YES];
}
- (void)layerSopas:(id)arg {
    [self moverBotones];
    if (_rootViewController == nil) {
        self.rootViewController = [[[RootViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    }
    [[BrainMenu sharedInstance] setTipoPlatoActual:tipoSopa];
    [self.navigationController pushViewController:_rootViewController animated:YES];
    
}


- (void)dealloc {
    [_rootViewController release];
    _rootViewController = nil;
    [_sopasViewController release];
    _sopasViewController = nil;
    [btn_sushi release];
    [btn_centro release];
    [btn_wok release];
    [btn_tepp release];
    [btn_sopas release];
    [btn_ensaladas release];
    [btn_especiales release];
    [btn_postres release];
    [btn_bebidas release];
    [btn_entradas release];
    [btn_licores release];
    [fondo_btn release];
    [fondo_btn release];
    [super dealloc];
}

@end
