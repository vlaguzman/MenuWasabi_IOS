//
//  SopasViewController.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 27/09/12.
//
//

#import "SopasViewController.h"
#import "SopasLayer.h"
#import "Plato.h"
#import "BrainMenu.h"

#define tipoSopa 2

@interface SopasViewController ()
    @property (nonatomic, strong) Plato *sopa1, *sopa2, *sopa3, *sopa4, *sopa5, *sopa6, *sopa7, *sopa8, *sopa9, *sopa10;
    @property (nonatomic, strong) NSDictionary *platos_sopa;
@end

@implementation SopasViewController

@synthesize sopa1, sopa2, sopa3, sopa4, sopa5, sopa6, sopa7, sopa8, sopa9, sopa10;
@synthesize platos_sopa;

// Add these new methods
- (void)setupCocos2D {
    CCLOG(@"Configurando COCOS...");
    [self crearPlatos];
    [self iniciarPlatos];
    
    EAGLView *glView = [EAGLView viewWithFrame:self.view.bounds
                                   pixelFormat:kEAGLColorFormatRGB565	// kEAGLColorFormatRGBA8
                                   depthFormat:0                        // GL_DEPTH_COMPONENT16_OES
                        ];
    glView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view insertSubview:glView atIndex:0];
    [[CCDirector sharedDirector] setOpenGLView:glView];
    
    CCScene *scene =  [SopasLayer sceneWithVC:self] ;
    [[CCDirector sharedDirector] runWithScene:scene];
}
-(void) iniciarPlatos{
    platos_sopa = [[NSDictionary alloc] initWithObjectsAndKeys:sopa1, @(1), sopa2, @(2), sopa3, @(3), sopa4, @(4), sopa5, @(5), sopa6, @(6), sopa7, @(7), sopa8, @(8), sopa9, @(9), sopa10, @(10),  nil];
    
}


- (void) viewWillAppear:(BOOL)animated
{
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [super viewWillAppear:animated];
    
    [[CCDirector sharedDirector]startAnimation];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCocos2D];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	
	//
	// There are 2 ways to support auto-rotation:
	//  - The OpenGL / cocos2d way
	//     - Faster, but doesn't rotate the UIKit objects
	//  - The ViewController way
	//    - A bit slower, but the UiKit objects are placed in the right place
	//
	
#if GAME_AUTOROTATION==kGameAutorotationNone
	//
	// EAGLView won't be autorotated.
	// Since this method should return YES in at least 1 orientation,
	// we return YES only in the Portrait orientation
	//
	return ( interfaceOrientation == UIInterfaceOrientationPortrait );
	
#elif GAME_AUTOROTATION==kGameAutorotationCCDirector
	//
	// EAGLView will be rotated by cocos2d
	//
	// Sample: Autorotate only in landscape mode
	//
	if( interfaceOrientation == UIInterfaceOrientationLandscapeLeft ) {
		[[CCDirector sharedDirector] setDeviceOrientation: kCCDeviceOrientationLandscapeRight];
	} else if( interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		[[CCDirector sharedDirector] setDeviceOrientation: kCCDeviceOrientationLandscapeLeft];
	}
	
	// Since this method should return YES in at least 1 orientation,
	// we return YES only in the Portrait orientation
	return ( interfaceOrientation == UIInterfaceOrientationPortrait );
	
#elif GAME_AUTOROTATION == kGameAutorotationUIViewController
	//
	// EAGLView will be rotated by the UIViewController
	//
	// Sample: Autorotate only in landscpe mode
	//
	// return YES for the supported orientations
	
	return ( UIInterfaceOrientationIsLandscape( interfaceOrientation ) );
	
#else
#error Unknown value in GAME_AUTOROTATION
	
#endif // GAME_AUTOROTATION
	
	
	// Shold not happen
	return NO;
}

//
// This callback only will be called when GAME_AUTOROTATION == kGameAutorotationUIViewController
//
#if GAME_AUTOROTATION == kGameAutorotationUIViewController
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	//
	// Assuming that the main window has the size of the screen
	// BUG: This won't work if the EAGLView is not fullscreen
	///
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	CGRect rect = CGRectZero;
    
	
	if(toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
		rect = screenRect;
	
	else if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
		rect.size = CGSizeMake( screenRect.size.height, screenRect.size.width );
	
	CCDirector *director = [CCDirector sharedDirector];
	CCGLView *glView = [director openGLView];
	float contentScaleFactor = [director contentScaleFactor];
	
	if( contentScaleFactor != 1 ) {
		rect.size.width *= contentScaleFactor;
		rect.size.height *= contentScaleFactor;
	}
	glView.frame = rect;
}
#endif // GAME_AUTOROTATION == kGameAutorotationUIViewController


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
   //   CCLOG("CERRRANDO APROVECHE");
    [super viewDidUnload];
    [[CCDirector sharedDirector] end];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [platos_sopa dealloc];
    [sopa1 dealloc];
    [sopa2 dealloc];
    [sopa3 dealloc];
    [sopa4 dealloc];
    [sopa5 dealloc];
    [sopa6 dealloc];
    [sopa7 dealloc];
    [sopa8 dealloc];
    [sopa9 dealloc];
    [sopa10 dealloc];
  
    [super dealloc];
}


- (IBAction)menuTapped:(id)sender {
   
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)agregarPlato:(id)_id
{
    // if(!_brain) _brain = [[BrainMenu alloc]init];
    // [_brain agregarPlato:[platos_sushi objectForKey:_id]];
    [[BrainMenu sharedInstance] agregarPlato:[platos_sopa objectForKey:_id]];
    
}
- (void)eliminarPlato:(id)_id
{
    //[_brain eliminarPlato:[platos_sushi objectForKey:_id]];
    [[BrainMenu sharedInstance] eliminarPlato:[platos_sopa objectForKey:_id]];
}

-(int)demeTotalCuenta{
    //return _brain.totalCuenta;
    return [[BrainMenu sharedInstance] totalCuenta];
}

-(void)crearPlatos{
    CCLOG(@"Creadno platos...");
    
    if(sopa1==nil) sopa1 = [[Plato alloc]init];
    sopa1.id_plato =1;
    sopa1.nombre = @"Anagomaki";
    sopa1.fuente_img = @"anagomaki_big.png";
    sopa1.precio = 8000;
    sopa1.tipo = tipoSopa;
    
    if(sopa2==nil) sopa2 = [[Plato alloc]init];
    sopa2.id_plato =2;
    sopa2.nombre = @"Anagomaki";
    sopa2.fuente_img = @"anagomaki_big.png";
    sopa2.precio = 7000;
    sopa2.tipo = tipoSopa;
    
    if(sopa3==nil) sopa3 = [[Plato alloc]init];
    sopa3.id_plato =3;
    sopa3.nombre = @"Anagomaki";
    sopa3.fuente_img = @"anagomaki_big.png";
    sopa3.precio = 8000;
    sopa3.tipo = tipoSopa;
    
    if(sopa4==nil) sopa4 = [[Plato alloc]init];
    sopa4.id_plato =4;
    sopa4.nombre = @"Anagomaki";
    sopa4.fuente_img = @"anagomaki_big.png";
    sopa4.precio = 7000;
    sopa4.tipo = tipoSopa;
    
    if(sopa5==nil) sopa5 = [[Plato alloc]init];
    sopa5.id_plato =5;
    sopa5.nombre = @"Anagomaki";
    sopa5.fuente_img = @"anagomaki_big.png";
    sopa5.precio = 8000;
    sopa5.tipo = tipoSopa;
    
    if(sopa6==nil) sopa6 = [[Plato alloc]init];
    sopa6.id_plato =6;
    sopa6.nombre = @"Anagomaki";
    sopa6.fuente_img = @"anagomaki_big.png";
    sopa6.precio = 7000;
    sopa6.tipo = tipoSopa;
    
    if(sopa7==nil) sopa7 = [[Plato alloc]init];
    sopa7.id_plato =7;
    sopa7.nombre = @"Anagomaki";
    sopa7.fuente_img = @"anagomaki_big.png";
    sopa7.precio = 8000;
    sopa7.tipo = tipoSopa;
    
    if(sopa8==nil) sopa8 = [[Plato alloc]init];
    sopa8.id_plato =8;
    sopa8.nombre = @"Anagomaki";
    sopa8.fuente_img = @"anagomaki_big.png";
    sopa8.precio = 7000;
    sopa8.tipo = tipoSopa;
    
    if(sopa9==nil) sopa9 = [[Plato alloc]init];
    sopa9.id_plato =9;
    sopa9.nombre = @"Anagomaki";
    sopa9.fuente_img = @"anagomaki_big.png";
    sopa9.precio = 8000;
    sopa9.tipo = tipoSopa;
    
    if(sopa10==nil) sopa10 = [[Plato alloc]init];
    sopa10.id_plato =10;
    sopa10.nombre = @"Anagomaki";
    sopa10.fuente_img = @"anagomaki_big.png";
    sopa10.precio = 7000;
    sopa10.tipo = tipoSopa;
    
}



-(NSString *)demeNombrePlatoPorId:(id)_id{
    
    Plato *plato_return;
    plato_return = [platos_sopa objectForKey:_id];
    return plato_return.nombre;
    
}

- (NSString *)demeFuenteImagenPlatoPorId:(id)_id {
    Plato *plato_return;
    CCLOG(@"demeFuenteImagenPlatoPorId");
    plato_return = [platos_sopa objectForKey:_id];
    return plato_return.fuente_img;
}

- (int)demePrecioPlatoPorId:(id)_id{
    Plato *plato_return;
    plato_return = [platos_sopa objectForKey:_id];
    return plato_return.precio;
}


@end
