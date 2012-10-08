//
//  RootViewController.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 21/09/12.
//
//


#import "cocos2d.h"

#import "RootViewController.h"
#import "SushiLayer.h"
#import "SopasLayer.h"
#import "Plato.h"
#import "BrainMenu.h"

#define tipoSushi 1

@interface RootViewController()
    @property (nonatomic, strong) Plato *sushi1, *sushi2, *sushi3, *sushi4, *sushi5, *sushi6, *sushi7, *sushi8, *sushi9, *sushi10,
    *sushi11, *sushi12, *sushi13, *sushi14, *sushi15, *sushi16, *sushi17, *sushi18, *sushi19, *sushi20,
    *sushi21, *sushi22, *sushi23, *sushi24, *sushi25, *sushi26, *sushi27, *sushi28, *sushi29, *sushi30,
    *sushi31, *sushi32, *sushi33, *sushi34, *sushi35, *sushi36, *sushi37, *sushi38, *sushi39;
    @property (nonatomic, strong) NSDictionary *platos_sushi;
 //   @property (nonatomic, strong) BrainMenu *brain;
@end


@implementation RootViewController
@synthesize sushi1, sushi10, sushi11, sushi12, sushi13, sushi14, sushi15, sushi16, sushi17, sushi18, sushi19, sushi2, sushi20, sushi21, sushi22, sushi23, sushi24, sushi25, sushi26, sushi27, sushi28, sushi29, sushi3, sushi30, sushi31, sushi32, sushi33, sushi34, sushi35, sushi36, sushi37, sushi38,
    sushi39, sushi4, sushi5, sushi6, sushi7, sushi8, sushi9;
@synthesize platos_sushi;
//@synthesize brain = _brain;
/*
-(BrainMenu *)brain{
    if(!_brain) _brain = [[BrainMenu alloc]init];
    return _brain;
}
*/
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
    CCScene *scene =  [SushiLayer sceneWithVC:self] ;
    [[CCDirector sharedDirector] runWithScene:scene];
    
}

-(void) iniciarPlatos{
    platos_sushi = [[NSDictionary alloc] initWithObjectsAndKeys:sushi1, @(1), sushi2, @(2), sushi3, @(3), sushi4, @(4), sushi5, @(5), sushi6, @(6), sushi7, @(7), sushi8, @(8), sushi9, @(9), sushi10, @(10), sushi11, @(11), sushi12, @(12), sushi13, @(13), sushi14, @(14), sushi15, @(15), sushi16, @(16), sushi17, @(17), sushi18, @(18), sushi19, @(19), sushi20, @(20), sushi21, @(21), sushi22, @(22), sushi23, @(23), sushi24, @(24), sushi25, @(25), sushi26, @(26), sushi27, @(27), sushi28, @(28), sushi29, @(29), sushi30, @(30), sushi31, @(31), sushi32, @(32), sushi33, @(33), sushi34, @(34), sushi35, @(35), sushi36, @(36),sushi37, @(37), sushi18, @(38), sushi39, @(39), nil];
    
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
    
    [super viewDidUnload];
    [[CCDirector sharedDirector] end];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    
    [super dealloc];
}

- (IBAction)menuTapped:(id)sender {
    [[CCDirector sharedDirector] replaceScene: [SopasLayer sceneWithVC:self]];
    //[self.navigationController popViewControllerAnimated:YES];
}

- (void)agregarPlato:(id)_id
{
   // if(!_brain) _brain = [[BrainMenu alloc]init];
   // [_brain agregarPlato:[platos_sushi objectForKey:_id]];
    [[BrainMenu sharedInstance] agregarPlato:[platos_sushi objectForKey:_id]];
    
}
- (void)eliminarPlato:(id)_id
{
    //[_brain eliminarPlato:[platos_sushi objectForKey:_id]];
    [[BrainMenu sharedInstance] eliminarPlato:[platos_sushi objectForKey:_id]];
}

-(int)demeTotalCuenta{
    //return _brain.totalCuenta;
    return [[BrainMenu sharedInstance] totalCuenta];
}

-(void)crearPlatos{
    CCLOG(@"Creadno platos...");
    if(sushi1==nil) sushi1 = [[Plato alloc]init];
    sushi1.id_plato =1;
    sushi1.nombre = @"Anagomaki";
    sushi1.fuente_img = @"anagomaki_big.png";
    sushi1.precio = 12000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi2==nil) sushi2 = [[Plato alloc]init];
    sushi2.id_plato =2;
    sushi2.nombre = @"Avocadocri spy roll";
    sushi2.fuente_img = @"avocadocrispyroll_big.png";
    sushi2.precio = 15000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi3==nil) sushi3 = [[Plato alloc]init];
    sushi3.id_plato = 3;
    sushi3.nombre = @"Bananguil sweet";
    sushi3.fuente_img = @"bananguilsweet_big.png";
    sushi3.precio = 18000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi4==nil) sushi4 = [[Plato alloc]init];
    sushi4.id_plato =4;
    sushi4.nombre = @"California roll";
    sushi4.fuente_img = @"californiaroll_big.png";
    sushi4.precio = 11000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi5==nil) sushi5 = [[Plato alloc]init];
    sushi5.id_plato =5;
    sushi5.nombre = @"California spicy";
    sushi5.fuente_img = @"californiaspicy_big.png";
    sushi5.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi6==nil) sushi6 = [[Plato alloc]init];
    sushi6.id_plato =6;
    sushi6.nombre = @"Crazy roll";
    sushi6.fuente_img = @"crazyroll_big.png";
    sushi6.precio = 13000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi7==nil) sushi7 = [[Plato alloc]init];
    sushi7.id_plato =7;
    sushi7.nombre = @"Ebikan roll";
    sushi7.fuente_img = @"ebikanroll_big.png";
    sushi7.precio = 14000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi8==nil) sushi8 = [[Plato alloc]init];
    sushi8.id_plato =8;
    sushi8.nombre = @"Ebiroll";
    sushi8.fuente_img = @"ebiroll_big.png";
    sushi8.precio = 16000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi9==nil) sushi9 = [[Plato alloc]init];
    sushi9.id_plato =9;
    sushi9.nombre = @"Ebitempura";
    sushi9.fuente_img = @"ebitempura_big.png";
    sushi9.precio = 17000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi10==nil) sushi10 = [[Plato alloc]init];
    sushi10.id_plato =10;
    sushi10.nombre = @"Ebitropical";
    sushi10.fuente_img = @"ebitropical_big.png";
    sushi10.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi11==nil) sushi11 = [[Plato alloc]init];
    sushi11.id_plato =11;
    sushi11.nombre = @"Ellsake roll";
    sushi11.fuente_img = @"ellsakeroll_big.png";
    sushi11.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi12==nil) sushi12 = [[Plato alloc]init];
    sushi12.id_plato =12;
    sushi12.nombre = @"Fabi roll";
    sushi12.fuente_img = @"fabiroll_big.png";
    sushi12.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi13==nil) sushi13 = [[Plato alloc]init];
    sushi13.id_plato =13;
    sushi13.nombre = @"Hot cream roll";
    sushi13.fuente_img = @"hotcreamroll_big.png";
    sushi13.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi14==nil) sushi14 = [[Plato alloc]init];
    sushi14.id_plato =14;
    sushi14.nombre = @"Jens roll";
    sushi14.fuente_img = @"jensroll_big.png";
    sushi14.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi15==nil) sushi15 = [[Plato alloc]init];
    sushi15.id_plato =15;
    sushi15.nombre = @"Jhoels roll";
    sushi15.fuente_img = @"jhoelsroll_big.png";
    sushi15.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi16==nil) sushi16 = [[Plato alloc]init];
    sushi16.id_plato =16;
    sushi16.nombre = @"Kaniroll";
    sushi16.fuente_img = @"kaniroll_big.png";
    sushi16.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi17==nil) sushi17 = [[Plato alloc]init];
    sushi17.id_plato =17;
    sushi17.nombre = @"Kanizu";
    sushi17.fuente_img = @"kanizu_big.png";
    sushi17.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi18==nil) sushi18 = [[Plato alloc]init];
    sushi18.id_plato =18;
    sushi18.nombre = @"Kappamaki";
    sushi18.fuente_img = @"kappamaki_big.png";
    sushi18.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi19==nil) sushi19 = [[Plato alloc]init];
    sushi19.id_plato =19;
    sushi19.nombre = @"Katsuroll";
    sushi19.fuente_img = @"katsuroll_big.png";
    sushi19.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi20==nil) sushi20 = [[Plato alloc]init];
    sushi20.id_plato =20;
    sushi20.nombre = @"Magicroll";
    sushi20.fuente_img = @"magicroll_big.png";
    sushi20.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi21==nil) sushi21 = [[Plato alloc]init];
    sushi21.id_plato =21;
    sushi21.nombre = @"Marmariroll";
    sushi21.fuente_img = @"marmariroll_big.png";
    sushi21.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi22==nil) sushi22 = [[Plato alloc]init];
    sushi22.id_plato =22;
    sushi22.nombre = @"Ojo de tigre";
    sushi22.fuente_img = @"ojodetigre_big.png";
    sushi22.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi23==nil) sushi23 = [[Plato alloc]init];
    sushi23.id_plato =23;
    sushi23.nombre = @"Peach roll mix";
    sushi23.fuente_img = @"peachrollmix_big.png";
    sushi23.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi24==nil) sushi24 = [[Plato alloc]init];
    sushi24.id_plato =24;
    sushi24.nombre = @"Philadelphia roll";
    sushi24.fuente_img = @"philadelphiaroll_big.png";
    sushi24.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi25==nil) sushi25 = [[Plato alloc]init];
    sushi25.id_plato =25;
    sushi25.nombre = @"Rrainbow roll";
    sushi25.fuente_img = @"rainbowroll_big.png";
    sushi25.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi26==nil) sushi26 = [[Plato alloc]init];
    sushi26.id_plato =26;
    sushi26.nombre = @"Sakemaki";
    sushi26.fuente_img = @"sakemaki_big.png";
    sushi26.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi27==nil) sushi27 = [[Plato alloc]init];
    sushi27.id_plato =27;
    sushi27.nombre = @"Saketempura roll";
    sushi27.fuente_img = @"saketempuraroll_big.png";
    sushi27.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi28==nil) sushi28 = [[Plato alloc]init];
    sushi28.id_plato =28;
    sushi28.nombre = @"Skinroll";
    sushi28.fuente_img = @"skinroll_big.png";
    sushi28.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi29==nil) sushi29 = [[Plato alloc]init];
    sushi29.id_plato =29;
    sushi29.nombre = @"Sonanroll";
    sushi29.fuente_img = @"sonanroll_big.png";
    sushi29.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi30==nil) sushi30 = [[Plato alloc]init];
    sushi30.id_plato =30;
    sushi30.nombre = @"Spicy roll sake";
    sushi30.fuente_img = @"spicyrollsake_big.png";
    sushi30.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi31==nil) sushi31 = [[Plato alloc]init];
    sushi31.id_plato =31;
    sushi31.nombre = @"Spicy roll tuna";
    sushi31.fuente_img = @"spicyrolltuna_big.png";
    sushi31.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi32==nil) sushi32 = [[Plato alloc]init];
    sushi32.id_plato =32;
    sushi32.nombre = @"Spider roll";
    sushi32.fuente_img = @"spiderroll_big.png";
    sushi32.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi33==nil) sushi33 = [[Plato alloc]init];
    sushi33.id_plato =33;
    sushi33.nombre = @"Tako roll";
    sushi33.fuente_img = @"takoroll_big.png";
    sushi33.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi34==nil) sushi34 = [[Plato alloc]init];
    sushi34.id_plato =34;
    sushi34.nombre = @"Tekkamaki";
    sushi34.fuente_img = @"tekkamaki_big.png";
    sushi34.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi35==nil) sushi35 = [[Plato alloc]init];
    sushi35.id_plato =35;
    sushi35.nombre = @"Tiradito roll";
    sushi35.fuente_img = @"tiraditoroll_big.png";
    sushi35.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi36==nil) sushi36 = [[Plato alloc]init];
    sushi36.id_plato =36;
    sushi36.nombre = @"Tropical roll";
    sushi36.fuente_img = @"tropicalroll_big.png";
    sushi36.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi37==nil) sushi37 = [[Plato alloc]init];
    sushi37.id_plato =37;
    sushi37.nombre = @"Vegetariano";
    sushi37.fuente_img = @"vegetariano_big.png";
    sushi37.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi38==nil) sushi38 = [[Plato alloc]init];
    sushi38.id_plato =38;
    sushi38.nombre = @"Wasabi roll";
    sushi38.fuente_img = @"wasabiroll_big.png";
    sushi38.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
    if(sushi39==nil) sushi39 = [[Plato alloc]init];
    sushi39.id_plato =39;
    sushi39.nombre = @"Yolscar roll";
    sushi39.fuente_img = @"yolscarroll_big.png";
    sushi39.precio = 10000;
    sushi1.tipo = tipoSushi;
    //  sushi1.pedido = NO;
    
}



-(NSString *)demeNombrePlatoPorId:(id)_id conTipoPlato:(int)_tipo{
    
    Plato *plato_return;
    if(_tipo == 1) plato_return = [platos_sushi objectForKey:_id];
    return plato_return.nombre;
    
}

- (NSString *)demeFuenteImagenPlatoPorId:(id)_id conTipoPlato:(int)_tipo{
    Plato *plato_return;
     CCLOG(@"demeFuenteImagenPlatoPorId");
    if(_tipo == 1) plato_return = [platos_sushi objectForKey:_id];
    return plato_return.fuente_img;
}

- (int)demePrecioPlatoPorId:(id)_id conTipoPlato:(int)_tipo{
    Plato *plato_return;
    if(_tipo == 1) plato_return = [platos_sushi objectForKey:_id];
    return plato_return.precio;
}



@end

