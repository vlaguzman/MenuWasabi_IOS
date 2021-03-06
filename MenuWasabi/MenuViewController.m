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

#define tipoEntradas @"1"
#define tipoEnsaladas @"2"
#define tipoSopa @"3"
#define tipoWok @"4"
#define tipoTeppanyaki @"5"
#define tipoSushi @"6"
#define tipoEspeciales @"7"
#define tipoPostres @"8"
#define tipoBebidas @"9"
#define tipoLicores @"10"
#define tipoCombos @"11"


//#import "DAOPlatos.h"
#import "DAOPlatosJSON.h"
#import "DAOTipoBebidasJSON.h"
#import "DAOBebidasJSON.h"
#import "Plato.h"
//#import "DAOTipoPlato.h"
#import "DAOTipoPlatoJSON.h"
#import "TipoPlato.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

@synthesize rootViewController = _rootViewController;



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
    //[self loadDataBase];
    [self loadDataFromServer];
    [self moverBotones];
    // Do any additional setup after loading the view from its nib.
}

- (void)loadDataBase{
   // [[DAOPlatos sharedInstance] loadPlatesFromDB];
}

-(void)loadDataFromServer{
    [[DAOPlatosJSON sharedInstance] loadPlatesFromServer];
    [[DAOTipoBebidasJSON sharedInstance] loadBeverageTypesFromServer];
    [[DAOBebidasJSON sharedInstance] loadBeveragesFromServer];
}

- (void)moverBotones
{

    [self moverBoton:btn_centro posx:390 posy:245 alpha:1.0 duracion:1.0 delay:0.0];
    
    [self moverBoton:btn_entradas posx:453 posy:86 alpha:1.0 duracion:0.5 delay:1.0];
    [self moverBoton:btn_ensaladas posx:579 posy:126 alpha:1.0 duracion:0.5 delay:1.2];
    [self moverBoton:btn_sopas posx:656 posy:236 alpha:1.0 duracion:0.5 delay:1.4];
    [self moverBoton:btn_wok posx:656 posy:360 alpha:1.0 duracion:0.5 delay:1.6];
    [self moverBoton:btn_tepp posx:579 posy:470 alpha:1.0 duracion:0.5 delay:1.8];
    [self moverBoton:btn_sushi posx:453 posy:511 alpha:1.0 duracion:0.5 delay:2.0];
    [self moverBoton:btn_especiales posx:327 posy:470 alpha:1.0 duracion:0.5 delay:2.2];
    [self moverBoton:btn_postres posx:251 posy:360 alpha:1.0 duracion:0.5 delay:2.4];
    [self moverBoton:btn_bebidas posx:251 posy:236 alpha:1.0 duracion:0.5 delay:2.6];
    [self moverBoton:btn_licores posx:327 posy:126 alpha:1.0 duracion:0.5 delay:2.8];
    
    [self moverBoton:fondo_btn posx:251 posy:126 alpha:1.0 duracion:1.0 delay:0.0];
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
    [background release];
    background = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



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

- (IBAction)viewEntradas:(id)sender {
    [self salirMenu:sender];
    [NSTimer scheduledTimerWithTimeInterval:3.3 target:self selector:@selector(layerEntradas:) userInfo:nil repeats:NO];
}

- (IBAction)viewLicores:(id)sender {
    [self salirMenu:sender];
    [NSTimer scheduledTimerWithTimeInterval:3.3 target:self selector:@selector(layerLicores:) userInfo:nil repeats:NO];
}

- (IBAction)viewBebidas:(id)sender {
    [self salirMenu:sender];
    [NSTimer scheduledTimerWithTimeInterval:3.3 target:self selector:@selector(layerBebidas:) userInfo:nil repeats:NO];
}

- (IBAction)viewPostres:(id)sender {
    [self salirMenu:sender];
    [NSTimer scheduledTimerWithTimeInterval:3.3 target:self selector:@selector(layerPostres:) userInfo:nil repeats:NO];
}

- (IBAction)viewEspeciales:(id)sender {
    [self salirMenu:sender];
    [NSTimer scheduledTimerWithTimeInterval:3.3 target:self selector:@selector(layerEspeciales:) userInfo:nil repeats:NO];
}

- (IBAction)viewEnsaladas:(id)sender {
    [self salirMenu:sender];
    [NSTimer scheduledTimerWithTimeInterval:3.3 target:self selector:@selector(layerEnsaladas:) userInfo:nil repeats:NO];
}

- (IBAction)viewTeppanyaki:(id)sender {
    [self salirMenu:sender];
    [NSTimer scheduledTimerWithTimeInterval:3.3 target:self selector:@selector(layerTeppanyaki:) userInfo:nil repeats:NO];
}

- (IBAction)viewWok:(id)sender {
    [self salirMenu:sender];
    [NSTimer scheduledTimerWithTimeInterval:3.3 target:self selector:@selector(layerWok:) userInfo:nil repeats:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
    /*if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        return NO;
    else
        return YES;*/
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    UIInterfaceOrientation orientation = toInterfaceOrientation;
    if((orientation==UIInterfaceOrientationPortrait)||(orientation==UIInterfaceOrientationPortraitUpsideDown))
        [self layerCombos];
      
}


-(IBAction)salirMenu:(id)sender{
    
   [self moverBoton:fondo_btn posx:251 posy:126 alpha:0.0 duracion:3 delay:0.0];
    
   [self moverBoton:btn_licores posx:453 posy:298 alpha:0.0 duracion:0.5 delay:0.0];
   [self moverBoton:btn_bebidas posx:453 posy:298 alpha:0.0 duracion:0.5 delay:0.2];
   [self moverBoton:btn_postres posx:453 posy:298 alpha:0.0 duracion:0.5 delay:0.4];
   [self moverBoton:btn_especiales posx:453 posy:298 alpha:0.0 duracion:0.5 delay:0.6];
   [self moverBoton:btn_sushi posx:453 posy:298 alpha:0.0 duracion:0.5 delay:0.8];
   [self moverBoton:btn_tepp posx:453 posy:298 alpha:0.0 duracion:0.5 delay:1.0];
   [self moverBoton:btn_wok posx:453 posy:298 alpha:0.0 duracion:0.5 delay:1.2];
   [self moverBoton:btn_sopas posx:453 posy:298 alpha:0.0 duracion:0.5 delay:1.4];
   [self moverBoton:btn_ensaladas posx:453 posy:298 alpha:0.0 duracion:0.5 delay:1.6];
   [self moverBoton:btn_entradas posx:453 posy:298 alpha:0.0 duracion:0.5 delay:1.8];
    
   [self moverBoton:btn_centro posx:390 posy:-140 alpha:1.0 duracion:1.0 delay:2.3];
      
}


- (void)layerSushi:(id)arg {
    [self beginLayer:tipoSushi];
}
- (void)layerSopas:(id)arg {
    [self beginLayer:tipoSopa];
}
- (void)layerEntradas:(id)arg {
    [self beginLayer:tipoEntradas];   
}
- (void)layerEnsaladas:(id)arg {
    [self beginLayer:tipoEnsaladas];
}
- (void)layerPostres:(id)arg {
    [self beginLayer:tipoPostres];
}
- (void)layerEspeciales:(id)arg {
    [self beginLayer:tipoEspeciales];
}
- (void)layerTeppanyaki:(id)arg {
    [self beginLayer:tipoTeppanyaki];
}
- (void)layerWok:(id)arg {
    [self beginLayer:tipoWok];
}
- (void)layerBebidas:(id)arg {
    [self beginLayer:tipoBebidas];
}
- (void)layerLicores:(id)arg {
    [self beginLayer:tipoLicores];
}
- (void)layerCombos{
    [self moverBotones];
    if (_rootViewController == nil) {
        self.rootViewController = [[[RootViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    }
    [[BrainMenu sharedInstance] setTipoPlatoActual:tipoCombos];
    [self.navigationController pushViewController:_rootViewController animated:YES];
}

- (void)beginLayer:(NSString*)_tipo{
    [self moverBotones];
    if (_rootViewController == nil) {
        self.rootViewController = [[[RootViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    }
    [[BrainMenu sharedInstance] setTipoPlatoActual:_tipo];
    [self.navigationController pushViewController:_rootViewController animated:YES];
}



- (void)dealloc {
    [_rootViewController release];
    _rootViewController = nil;
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
    [background release];
    [super dealloc];
}

@end
