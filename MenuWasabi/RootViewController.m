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
#import "Plato.h"
#import "TipoBebida.h"
#import "BrainMenu.h"

#define tipoSushi 1
#define tipoTeppanyaki 2
#define tipoSopa 3
#define tipoEspeciales 4
#define tipoEntradas 5
#define tipoEnsaladas 6
#define tipoWok 7
#define tipoPostres 8
#define tipoBebidas 9
#define tipoLicores 10

@interface RootViewController()
    
    @property (nonatomic, strong) Plato *sushi1, *sushi2, *sushi3, *sushi4, *sushi5, *sushi6, *sushi7, *sushi8, *sushi9, *sushi10,
    *sushi11, *sushi12, *sushi13, *sushi14, *sushi15, *sushi16, *sushi17, *sushi18, *sushi19, *sushi20,
    *sushi21, *sushi22, *sushi23, *sushi24, *sushi25, *sushi26, *sushi27, *sushi28, *sushi29, *sushi30,
    *sushi31, *sushi32, *sushi33, *sushi34, *sushi35, *sushi36, *sushi37, *sushi38, *sushi39;
    @property (nonatomic, strong) Plato *sopa1, *ensalada1, *especial1, *teppanyaki1, *teppanyaki2;
    @property (nonatomic, strong) Plato *entrada1, *entrada2, *entrada3, *entrada4, *entrada5, *entrada6, *entrada7, *entrada8, *entrada9, *entrada10;
    @property (nonatomic, strong) Plato *postre1, *postre2, *postre3;
    @property (nonatomic, strong) TipoBebida *bebida1, *bebida2, *bebida3, *licor1, *licor2, *licor3, *licor4, *licor5, *licor6;
    @property (nonatomic, strong) NSDictionary *platos, *platos_sushi, *platos_teppanyaki, *platos_sopa, *platos_especiales, *platos_entradas, *platos_ensaladas, *platos_wok, *platos_postres, *platos_bebidas, *platos_licores;

@end


CCScene *scene;
@implementation RootViewController
@synthesize sushi1, sushi10, sushi11, sushi12, sushi13, sushi14, sushi15, sushi16, sushi17, sushi18, sushi19, sushi2, sushi20, sushi21, sushi22, sushi23, sushi24, sushi25, sushi26, sushi27, sushi28, sushi29, sushi3, sushi30, sushi31, sushi32, sushi33, sushi34, sushi35, sushi36, sushi37, sushi38,sushi39, sushi4, sushi5, sushi6, sushi7, sushi8, sushi9, sopa1, entrada1, entrada2, entrada3, entrada4, entrada5, entrada6, entrada7, entrada8, entrada9, entrada10, ensalada1, postre1, postre2, postre3, teppanyaki1, teppanyaki2, especial1, bebida1, bebida2, bebida3, licor1, licor2, licor3, licor4, licor5, licor6;
@synthesize platos, platos_sushi, platos_sopa, platos_entradas, platos_teppanyaki, platos_bebidas, platos_ensaladas, platos_especiales, platos_licores, platos_postres, platos_wok;



// Add these new methods


- (void)setupCocos2D {
    [self crearPlatosSushi];
    [self crearPlatosSopa];
    [self crearPlatosEntradas];
    [self crearPlatosEnsaladas];
    [self crearPlatosPostres];
    [self crearPlatosEspeciales];
    [self crearPlatosTeppanyaki];
    [self crearPlatosBebidas];
    [self crearPlatosLicores];
    [self beginPlates];
    EAGLView *glView = [EAGLView viewWithFrame:self.view.bounds
                                   pixelFormat:kEAGLColorFormatRGB565	// kEAGLColorFormatRGBA8
                                   depthFormat:0                        // GL_DEPTH_COMPONENT16_OES
                        ];
    glView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view insertSubview:glView atIndex:0];
    [[CCDirector sharedDirector] setOpenGLView:glView];
    
    [self LoadScene];
    [[CCDirector sharedDirector] runWithScene:scene];
   
}

-(void) LoadScene{
    scene =  [SushiLayer sceneWithVC:self];

}

-(void)beginPlates{
    platos = [[NSDictionary alloc] initWithObjectsAndKeys:sushi1, @(1), sushi2, @(2), sushi3, @(3), sushi4, @(4), sushi5, @(5), sushi6, @(6), sushi7, @(7), sushi8, @(8), sushi9, @(9), sushi10, @(10), sushi11, @(11), sushi12, @(12), sushi13, @(13), sushi14, @(14), sushi15, @(15), sushi16, @(16), sushi17, @(17), sushi18, @(18), sushi19, @(19), sushi20, @(20), sushi21, @(21), sushi22, @(22), sushi23, @(23), sushi24, @(24), sushi25, @(25), sushi26, @(26), sushi27, @(27), sushi28, @(28), sushi29, @(29), sushi30, @(30), sushi31, @(31), sushi32, @(32), sushi33, @(33), sushi34, @(34), sushi35, @(35), sushi36, @(36),sushi37, @(37), sushi18, @(38), sushi39, @(39),teppanyaki1, @(201), teppanyaki2, @(202), sopa1, @(301),especial1, @(401),entrada1, @(501), entrada2, @(502), entrada3, @(503), entrada4, @(504), entrada5, @(505), entrada6, @(506), entrada7, @(507), entrada8, @(508), entrada9, @(509), entrada10, @(510),ensalada1, @(601), postre1, @(801), postre2, @(802), postre3, @(803),bebida1, @(901), bebida2, @(902), bebida3, @(903),licor1, @(1001), licor2, @(1002), licor3, @(1003), licor4, @(1004), licor5, @(1005), licor6, @(1006), nil];
}

/*
-(void) iniciarPlatosSushi{

    platos_sushi = [[NSDictionary alloc] initWithObjectsAndKeys:sushi1, @(1), sushi2, @(2), sushi3, @(3), sushi4, @(4), sushi5, @(5), sushi6, @(6), sushi7, @(7), sushi8, @(8), sushi9, @(9), sushi10, @(10), sushi11, @(11), sushi12, @(12), sushi13, @(13), sushi14, @(14), sushi15, @(15), sushi16, @(16), sushi17, @(17), sushi18, @(18), sushi19, @(19), sushi20, @(20), sushi21, @(21), sushi22, @(22), sushi23, @(23), sushi24, @(24), sushi25, @(25), sushi26, @(26), sushi27, @(27), sushi28, @(28), sushi29, @(29), sushi30, @(30), sushi31, @(31), sushi32, @(32), sushi33, @(33), sushi34, @(34), sushi35, @(35), sushi36, @(36),sushi37, @(37), sushi18, @(38), sushi39, @(39), nil];
}

-(void) iniciarPlatosTeppanyaki{
     platos_teppanyaki = [[NSDictionary alloc] initWithObjectsAndKeys:teppanyaki1, @(201), teppanyaki2, @(202), nil];
}

-(void) iniciarPlatosSopa{
    platos_sopa = [[NSDictionary alloc] initWithObjectsAndKeys:sopa1, @(301),  nil];
}

-(void) iniciarPlatosEspeciales{
    platos_especiales = [[NSDictionary alloc] initWithObjectsAndKeys:especial1, @(401),  nil];
}

-(void) iniciarPlatosEntradas{
    platos_entradas = [[NSDictionary alloc] initWithObjectsAndKeys:entrada1, @(501), entrada2, @(502), entrada3, @(503), entrada4, @(504), entrada5, @(505), entrada6, @(506), entrada7, @(507), entrada8, @(508), entrada9, @(509), entrada10, @(510), nil];
}

-(void) iniciarPlatosEnsaladas{
    platos_ensaladas = [[NSDictionary alloc] initWithObjectsAndKeys:ensalada1, @(601),  nil];
}

-(void) iniciarPlatosWok{
   CCLOG(@"OJO iniciarPlatosEnsaladas SIN IMPLEMENTAR");
}

-(void) iniciarPostres{
     platos_postres = [[NSDictionary alloc] initWithObjectsAndKeys:postre1, @(801), postre2, @(802), postre3, @(803), nil];
}

-(void) iniciarBebidas{
    platos_bebidas = [[NSDictionary alloc] initWithObjectsAndKeys:bebida1, @(901), bebida2, @(902), bebida3, @(903), nil];
}

-(void) iniciarLicores{
   platos_licores = [[NSDictionary alloc] initWithObjectsAndKeys:licor1, @(1001), licor2, @(1002), licor3, @(1003), licor4, @(1004), licor5, @(1005), licor6, @(1006), nil];
}
 */

- (void) viewWillAppear:(BOOL)animated
{
    [self LoadScene];
    [[CCDirector sharedDirector] replaceScene:scene];

    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [super viewWillAppear:animated];
    [[CCDirector sharedDirector]startAnimation];

}

- (void)viewDidLoad {
   
    [super viewDidLoad];
    [self setupCocos2D];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	//return YES;
    if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
        return NO;
    else
        return YES;
}
/*
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
*/
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
    
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)crearPlatosSushi{
   
    if(sushi1==nil) sushi1 = [[Plato alloc]init];
    sushi1.id_plato =1;
    sushi1.nombre = @"Anagomaki";
    sushi1.fuente_img = @"anagomaki_big.png";
    sushi1.fuente_img_grande = @"anagomaki_big_g.png";
    sushi1.fuente_img_peq = @"anagomaki_big_p.png";
    sushi1.precio = 12000;
    sushi1.tipo = tipoSushi;
        
    if(sushi2==nil) sushi2 = [[Plato alloc]init];
    sushi2.id_plato =2;
    sushi2.nombre = @"Avocadocri spy roll";
    sushi2.fuente_img = @"avocadocrispyroll_big.png";
    sushi2.fuente_img_grande = @"avocadocrispyroll_big_g.png";
    sushi2.fuente_img_peq = @"avocadocrispyroll_big_p.png";
    sushi2.precio = 15000;
    sushi2.tipo = tipoSushi;
        
    if(sushi3==nil) sushi3 = [[Plato alloc]init];
    sushi3.id_plato = 3;
    sushi3.nombre = @"Bananguil sweet";
    sushi3.fuente_img = @"bananguilsweet_big.png";
    sushi3.fuente_img_grande = @"bananguilsweet_big_g.png";
    sushi3.fuente_img_peq = @"bananguilsweet_big_p.png";
    sushi3.precio = 18000;
    sushi3.tipo = tipoSushi;
        
    if(sushi4==nil) sushi4 = [[Plato alloc]init];
    sushi4.id_plato =4;
    sushi4.nombre = @"California roll";
    sushi4.fuente_img = @"californiaroll_big.png";
    sushi4.fuente_img_grande = @"californiaroll_big_g.png";
    sushi4.fuente_img_peq = @"californiaroll_big_p.png";
    sushi4.precio = 11000;
    sushi4.tipo = tipoSushi;
        
    if(sushi5==nil) sushi5 = [[Plato alloc]init];
    sushi5.id_plato =5;
    sushi5.nombre = @"California spicy";
    sushi5.fuente_img = @"californiaspicy_big.png";
    sushi5.fuente_img_grande = @"californiaspicy_big_g.png";
    sushi5.fuente_img_peq = @"californiaspicy_big_p.png";
    sushi5.precio = 10000;
    sushi5.tipo = tipoSushi;
       
    if(sushi6==nil) sushi6 = [[Plato alloc]init];
    sushi6.id_plato =6;
    sushi6.nombre = @"Crazy roll";
    sushi6.fuente_img = @"crazyroll_big.png";
    sushi6.fuente_img_grande = @"crazyroll_big_g.png";
    sushi6.fuente_img_peq = @"crazyroll_big_p.png";
    sushi6.precio = 13000;
    sushi6.tipo = tipoSushi;
        
    if(sushi7==nil) sushi7 = [[Plato alloc]init];
    sushi7.id_plato =7;
    sushi7.nombre = @"Ebikan roll";
    sushi7.fuente_img = @"ebikanroll_big.png";
    sushi7.fuente_img_grande = @"ebikanroll_big_g.png";
    sushi7.fuente_img_peq = @"ebikanroll_big_p.png";
    sushi7.precio = 14000;
    sushi7.tipo = tipoSushi;
        
    if(sushi8==nil) sushi8 = [[Plato alloc]init];
    sushi8.id_plato =8;
    sushi8.nombre = @"Ebi roll";
    sushi8.fuente_img = @"ebiroll_big.png";
    sushi8.fuente_img_grande = @"ebiroll_big_g.png";
    sushi8.fuente_img_peq = @"ebiroll_big_p.png";
    sushi8.precio = 16000;
    sushi8.tipo = tipoSushi;
        
    if(sushi9==nil) sushi9 = [[Plato alloc]init];
    sushi9.id_plato =9;
    sushi9.nombre = @"Ebitempura";
    sushi9.fuente_img = @"ebitempura_big.png";
    sushi9.fuente_img_grande = @"ebitempura_big_g.png";
    sushi9.fuente_img_peq = @"ebitempura_big_p.png";
    sushi9.precio = 17000;
    sushi9.tipo = tipoSushi;
       
    if(sushi10==nil) sushi10 = [[Plato alloc]init];
    sushi10.id_plato =10;
    sushi10.nombre = @"Ebitropical";
    sushi10.fuente_img = @"ebitropical_big.png";
    sushi10.fuente_img_grande = @"ebitropical_big_g.png";
    sushi10.fuente_img_peq = @"ebitropical_big_p.png";
    sushi10.precio = 10000;
    sushi10.tipo = tipoSushi;
        
    if(sushi11==nil) sushi11 = [[Plato alloc]init];
    sushi11.id_plato =11;
    sushi11.nombre = @"Ellsake roll";
    sushi11.fuente_img = @"ellsakeroll_big.png";
    sushi11.fuente_img_grande = @"ellsakeroll_big_g.png";
    sushi11.fuente_img_peq = @"ellsakeroll_big_p.png";
    sushi11.precio = 10000;
    sushi11.tipo = tipoSushi;
      
    if(sushi12==nil) sushi12 = [[Plato alloc]init];
    sushi12.id_plato =12;
    sushi12.nombre = @"Fabi roll";
    sushi12.fuente_img = @"fabiroll_big.png";
    sushi12.fuente_img_grande = @"fabiroll_big_g.png";
    sushi12.fuente_img_peq = @"fabiroll_big_p.png";
    sushi12.precio = 10000;
    sushi12.tipo = tipoSushi;
       
    if(sushi13==nil) sushi13 = [[Plato alloc]init];
    sushi13.id_plato =13;
    sushi13.nombre = @"Hot cream roll";
    sushi13.fuente_img = @"hotcreamroll_big.png";
    sushi13.fuente_img_grande = @"hotcreamroll_big_g.png";
    sushi13.fuente_img_peq = @"hotcreamroll_big_p.png";
    sushi13.precio = 10000;
    sushi13.tipo = tipoSushi;
       
    if(sushi14==nil) sushi14 = [[Plato alloc]init];
    sushi14.id_plato =14;
    sushi14.nombre = @"Jens roll";
    sushi14.fuente_img = @"jensroll_big.png";
    sushi14.fuente_img_grande = @"jensroll_big_g.png";
    sushi14.fuente_img_peq = @"jensroll_big_p.png";
    sushi14.precio = 10000;
    sushi14.tipo = tipoSushi;
       
    if(sushi15==nil) sushi15 = [[Plato alloc]init];
    sushi15.id_plato =15;
    sushi15.nombre = @"Jhoels roll";
    sushi15.fuente_img = @"jhoelsroll_big.png";
    sushi15.fuente_img_grande = @"jhoelsroll_big_g.png";
    sushi15.fuente_img_peq = @"jhoelsroll_big_p.png";
    sushi15.precio = 10000;
    sushi15.tipo = tipoSushi;
       
    if(sushi16==nil) sushi16 = [[Plato alloc]init];
    sushi16.id_plato =16;
    sushi16.nombre = @"Kani roll";
    sushi16.fuente_img = @"kaniroll_big.png";
    sushi16.fuente_img_grande = @"kaniroll_big_g.png";
    sushi16.fuente_img_peq = @"kaniroll_big_p.png";
    sushi16.precio = 10000;
    sushi16.tipo = tipoSushi;
        
    if(sushi17==nil) sushi17 = [[Plato alloc]init];
    sushi17.id_plato =17;
    sushi17.nombre = @"Kanizu";
    sushi17.fuente_img = @"kanizu_big.png";
    sushi17.fuente_img_grande = @"kanizu_big_g.png";
    sushi17.fuente_img_peq = @"kanizu_big_p.png";
    sushi17.precio = 10000;
    sushi17.tipo = tipoSushi;
       
    CCLOG(@"Falta pequena >>>>> Kappamaki");
    if(sushi18==nil) sushi18 = [[Plato alloc]init];
    sushi18.id_plato =18;
    sushi18.nombre = @"Kappamaki";
    sushi18.fuente_img = @"kappamaki_big.png";
    sushi18.fuente_img_grande = @"kappamaki_big_g.png";
    sushi18.fuente_img_peq = @"kappamaki_big_p.png";
    sushi18.precio = 10000;
    sushi18.tipo = tipoSushi;
     
    if(sushi19==nil) sushi19 = [[Plato alloc]init];
    sushi19.id_plato =19;
    sushi19.nombre = @"Katsu roll";
    sushi19.fuente_img = @"katsuroll_big.png";
    sushi19.fuente_img_grande = @"katsuroll_big_g.png";
    sushi19.fuente_img_peq = @"kappamaki_big_p.png";
    sushi19.precio = 10000;
    sushi19.tipo = tipoSushi;
        
    if(sushi20==nil) sushi20 = [[Plato alloc]init];
    sushi20.id_plato =20;
    sushi20.nombre = @"Magic roll";
    sushi20.fuente_img = @"magicroll_big.png";
    sushi20.fuente_img_grande = @"magicroll_big_g.png";
    sushi20.fuente_img_peq = @"magicroll_big_p.png";
    sushi20.precio = 10000;
    sushi20.tipo = tipoSushi;
        
    if(sushi21==nil) sushi21 = [[Plato alloc]init];
    sushi21.id_plato =21;
    sushi21.nombre = @"Marmari roll";
    sushi21.fuente_img = @"marmariroll_big.png";
    sushi21.fuente_img_grande = @"marmariroll_big_g.png";
    sushi21.fuente_img_peq = @"marmariroll_big_p.png";
    sushi21.precio = 10000;
    sushi21.tipo = tipoSushi;
    
    if(sushi22==nil) sushi22 = [[Plato alloc]init];
    sushi22.id_plato =22;
    sushi22.nombre = @"Ojo de tigre";
    sushi22.fuente_img = @"ojodetigre_big.png";
    sushi22.fuente_img_grande = @"ojodetigre_big_g.png";
    sushi22.fuente_img_peq = @"ojodetigre_big_p.png";
    sushi22.precio = 10000;
    sushi22.tipo = tipoSushi;
    
    if(sushi23==nil) sushi23 = [[Plato alloc]init];
    sushi23.id_plato =23;
    sushi23.nombre = @"Peach roll mix";
    sushi23.fuente_img = @"peachrollmix_big.png";
    sushi23.fuente_img_grande = @"peachrollmix_big_g.png";
    sushi23.fuente_img_peq = @"peachrollmix_big_p.png";
    sushi23.precio = 10000;
    sushi23.tipo = tipoSushi;
   
   
    if(sushi24==nil) sushi24 = [[Plato alloc]init];
    sushi24.id_plato =24;
    sushi24.nombre = @"Philadelphia roll";
    sushi24.fuente_img = @"philadelphiaroll_big.png";
    sushi24.fuente_img_grande = @"philadelphiaroll_big_g.png";
    sushi24.fuente_img_peq = @"philadelphiaroll_big_p.png.png";
    sushi24.precio = 10000;
    sushi24.tipo = tipoSushi;
    
     CCLOG(@"FALTA AGREGAR TODAS LA IMAGENES DE RAINBOW - SUSHI 25");
    if(sushi25==nil) sushi25 = [[Plato alloc]init];
    sushi25.id_plato =25;
    sushi25.nombre = @"Rrainbow roll";
    sushi25.fuente_img = @"californiaroll_big.png";
    sushi25.fuente_img_grande = @"californiaroll_big_g.png";
    sushi25.fuente_img_peq = @"californiaroll_big_p.png";
    sushi25.precio = 10000;
    sushi25.tipo = tipoSushi;
    
    if(sushi26==nil) sushi26 = [[Plato alloc]init];
    sushi26.id_plato =26;
    sushi26.nombre = @"Sakemaki";
    sushi26.fuente_img = @"sakemaki_big.png";
    sushi26.fuente_img_grande= @"sakemaki_big_g.png";
    sushi26.fuente_img_peq = @"sakemaki_big_p.png";
    sushi26.precio = 10000;
    sushi26.tipo = tipoSushi;
    
    if(sushi27==nil) sushi27 = [[Plato alloc]init];
    sushi27.id_plato =27;
    sushi27.nombre = @"Saketempura roll";
    sushi27.fuente_img = @"saketempuraroll_big.png";
    sushi27.fuente_img_grande= @"saketempuraroll_big_g.png";
    sushi27.fuente_img_peq = @"saketempuraroll_big_p.png";
    sushi27.precio = 10000;
    sushi27.tipo = tipoSushi;
    
    if(sushi28==nil) sushi28 = [[Plato alloc]init];
    sushi28.id_plato =28;
    sushi28.nombre = @"Skin roll";
    sushi28.fuente_img = @"skinroll_big.png";
    sushi28.fuente_img_grande = @"skinroll_big_g.png";
    sushi28.fuente_img_peq = @"skinroll_big_p.png";
    sushi28.precio = 10000;
    sushi28.tipo = tipoSushi;
    
    if(sushi29==nil) sushi29 = [[Plato alloc]init];
    sushi29.id_plato =29;
    sushi29.nombre = @"Sonan roll";
    sushi29.fuente_img = @"sonanroll_big.png";
    sushi29.fuente_img_grande = @"sonanroll_big_g.png";
    sushi29.fuente_img_peq = @"sonanroll_big_p.png";
    sushi29.precio = 10000;
    sushi29.tipo = tipoSushi;
    
    if(sushi30==nil) sushi30 = [[Plato alloc]init];
    sushi30.id_plato =30;
    sushi30.nombre = @"Spicy roll sake";
    sushi30.fuente_img = @"spicyrollsake_big.png";
    sushi30.fuente_img_grande = @"spicyrollsake_big_g.png";
    sushi30.fuente_img_peq = @"spicyrollsake_big_p.png";
    sushi30.precio = 10000;
    sushi30.tipo = tipoSushi;
    
    if(sushi31==nil) sushi31 = [[Plato alloc]init];
    sushi31.id_plato =31;
    sushi31.nombre = @"Spicy roll tuna";
    sushi31.fuente_img = @"spicyrolltuna_big.png";
    sushi31.fuente_img_grande = @"spicyrolltuna_big_g.png";
    sushi31.fuente_img_peq = @"spicyrolltuna_big_p.png";
    sushi31.precio = 10000;
    sushi31.tipo = tipoSushi;
    
    if(sushi32==nil) sushi32 = [[Plato alloc]init];
    sushi32.id_plato =32;
    sushi32.nombre = @"Spider roll";
    sushi32.fuente_img = @"spiderroll_big.png";
    sushi32.fuente_img_grande = @"spiderroll_big_g.png";
    sushi32.fuente_img_peq = @"spiderroll_big_p.png";
    sushi32.precio = 10000;
    sushi32.tipo = tipoSushi;
    
    if(sushi33==nil) sushi33 = [[Plato alloc]init];
    sushi33.id_plato =33;
    sushi33.nombre = @"Tako roll";
    sushi33.fuente_img = @"takoroll_big.png";
    sushi33.fuente_img_grande = @"takoroll_big_g.png";
    sushi33.fuente_img_peq = @"takoroll_big_p.png";
    sushi33.precio = 10000;
    sushi33.tipo = tipoSushi;
    
    if(sushi34==nil) sushi34 = [[Plato alloc]init];
    sushi34.id_plato =34;
    sushi34.nombre = @"Tekkamaki";
    sushi34.fuente_img = @"tekkamaki_big.png";
    sushi34.fuente_img_grande= @"tekkamaki_big_g.png";
    sushi34.fuente_img_peq = @"tekkamaki_big_p.png";
    sushi34.precio = 10000;
    sushi34.tipo = tipoSushi;
    
    if(sushi35==nil) sushi35 = [[Plato alloc]init];
    sushi35.id_plato =35;
    sushi35.nombre = @"Tiradito roll";
    sushi35.fuente_img = @"tiraditoroll_big.png";
    sushi35.fuente_img_grande = @"tiraditoroll_big_g.png";
    sushi35.fuente_img_peq = @"tiraditoroll_big_p.png";
    sushi35.precio = 10000;
    sushi35.tipo = tipoSushi;
    
    if(sushi36==nil) sushi36 = [[Plato alloc]init];
    sushi36.id_plato =36;
    sushi36.nombre = @"Tropical roll";
    sushi36.fuente_img = @"tropicalroll_big.png";
    sushi36.fuente_img_grande = @"tropicalroll_big_g.png";
    sushi36.fuente_img_peq = @"tropicalroll_big_p.png";
    sushi36.precio = 10000;
    sushi36.tipo = tipoSushi;
    
    if(sushi37==nil) sushi37 = [[Plato alloc]init];
    sushi37.id_plato =37;
    sushi37.nombre = @"Vegetariano";
    sushi37.fuente_img = @"vegetariano_big.png";
    sushi37.fuente_img_grande = @"vegetariano_big_g.png";
    sushi37.fuente_img_peq = @"vegetariano_big_p.png";
    sushi37.precio = 10000;
    sushi37.tipo = tipoSushi;
    
    if(sushi38==nil) sushi38 = [[Plato alloc]init];
    sushi38.id_plato =38;
    sushi38.nombre = @"Wasabi roll";
    sushi38.fuente_img = @"wasabiroll_big.png";
    sushi38.fuente_img_grande = @"yolscarroll_big_g.png";
    sushi38.fuente_img_peq = @"yolscarroll_big_p.png";
    sushi38.precio = 10000;
    sushi38.tipo = tipoSushi;
    
    if(sushi39==nil) sushi39 = [[Plato alloc]init];
    sushi39.id_plato =39;
    sushi39.nombre = @"Yolscar roll";
    sushi39.fuente_img = @"yolscarroll_big.png";
    sushi39.fuente_img_grande = @"yolscarroll_big_g.png";
    sushi39.fuente_img_peq = @"yolscarroll_big_p.png";
    sushi39.precio = 10000;
    sushi39.tipo = tipoSushi;
    
}

-(void)crearPlatosTeppanyaki{
    
    if(teppanyaki1==nil) teppanyaki1 = [[Plato alloc]init];
    teppanyaki1.id_plato =201;
    teppanyaki1.nombre = @"Eby Yaky";
    teppanyaki1.descripcion = @"Descripcion Descripcion \nDescripcion Descripcion";
    teppanyaki1.fuente_img = @"eby-yaky.png";
    teppanyaki1.fuente_img_grande = @"eby-yaky_g.png";
    teppanyaki1.fuente_img_peq = @"eby-yaky_p.png";
    teppanyaki1.precio = 18000;
    teppanyaki1.tipo = tipoTeppanyaki;
    
    
    if(teppanyaki2==nil) teppanyaki2 = [[Plato alloc]init];
    teppanyaki2.id_plato =202;
    teppanyaki2.nombre = @"Teppanyaki Carnes";
    teppanyaki2.descripcion = @"Descripcion Descripcion \nDescripcion Descripcion";
    teppanyaki2.fuente_img = @"teppanyaki_carnes.png";
    teppanyaki2.fuente_img_grande = @"teppanyaki_carnes_g.png";
    teppanyaki2.fuente_img_peq = @"teppanyaki_carnes_p.png";
    teppanyaki2.precio = 18000;
    teppanyaki2.tipo = tipoTeppanyaki;
}

-(void)crearPlatosSopa{
    
    if(sopa1==nil) sopa1 = [[Plato alloc]init];
    sopa1.id_plato =301;
    sopa1.nombre = @"Sopa Chiraschi Sushi";
    sopa1.descripcion = @"Descripcion Descripcion \nDescripcion Descripcion";
    sopa1.fuente_img = @"sopa_chiraschi-sushi.png";
    sopa1.fuente_img_grande = @"sopa_chiraschi-sushi_grande.png";
    sopa1.fuente_img_peq = @"sopa_chiraschi-sushi_p.png";
    sopa1.precio = 8000;
    sopa1.tipo = tipoSopa;
    
 }

-(void)crearPlatosEspeciales{
    if(especial1==nil) especial1 = [[Plato alloc]init];
    especial1.id_plato =401;
    especial1.nombre = @"Especial Titanic";
    especial1.descripcion = @"Descripcion Descripcion \nDescripcion Descripcion";
    especial1.fuente_img = @"titanic.png";
    especial1.fuente_img_grande = @"titanic_g.png";
    especial1.fuente_img_peq = @"titanic_p.png";
    especial1.precio = 25000;
    especial1.tipo = tipoEspeciales;
}

-(void)crearPlatosEntradas{
     
    if(entrada1==nil) entrada1 = [[Plato alloc]init];
    entrada1.id_plato =501;
    entrada1.nombre = @"Eby Crispy";
    entrada1.descripcion = @"Descripcion Descripcion \nDescripcion Descripcion";
    entrada1.fuente_img = @"entrada_eby-crispy.png";
    entrada1.fuente_img_grande = @"entrada_tacos-thai_g.png";
    entrada1.fuente_img_peq = @"entrada_eby-crispy_p.png";
    entrada1.precio = 8000;
    entrada1.tipo = tipoEntradas;
    
    if(entrada2==nil) entrada2 = [[Plato alloc]init];
    entrada2.id_plato =502;
    entrada2.nombre = @"Kany Kamma Ball";
    entrada2.descripcion =  @"Descripcion Descripcion \nDescripcion Descripcion";
    entrada2.fuente_img = @"entrada_kany-kamma-ball.png";
    entrada2.fuente_img_grande = @"entrada_kany-kamma-ball_g.png";
    entrada2.fuente_img_peq = @"entrada_kany-kamma-ball_p.png";
    entrada2.precio = 8000;
    entrada2.tipo = tipoEntradas;
    
    if(entrada3==nil) entrada3 = [[Plato alloc]init];
    entrada3.id_plato =503;
    entrada3.nombre = @"Niguiri Salmon";
    entrada3.descripcion = @"Descripcion Descripcion \nDescripcion Descripcion";
    entrada3.fuente_img = @"entrada_niguiri-salmon.png";
    entrada3.fuente_img_grande = @"entrada_niguiri-salmon_g.png";
    entrada3.fuente_img_peq = @"entrada_niguiri-salmon_p.png";
    entrada3.precio = 8000;
    entrada3.tipo = tipoEntradas;
    
    if(entrada4==nil) entrada4 = [[Plato alloc]init];
    entrada4.id_plato =504;
    entrada4.nombre = @"Oriental Taste ";
    entrada4.descripcion =  @"Descripcion Descripcion \nDescripcion Descripcion";
    entrada4.fuente_img = @"entrada_oriental_taste.png";
    entrada4.fuente_img_grande = @"entrada_oriental_taste_g.png";
    entrada4.fuente_img_peq = @"entrada_oriental_taste_p.png";
    entrada4.precio = 8000;
    entrada4.tipo = tipoEntradas;
    
    if(entrada5==nil) entrada5 = [[Plato alloc]init];
    entrada5.id_plato =505;
    entrada5.nombre = @"Sashimi";
    entrada5.descripcion = @"Descripcion Descripcion \nDescripcion Descripcion";
    entrada5.fuente_img = @"entrada_sashimi.png";
    entrada5.fuente_img_grande = @"entrada_sashimi_g.png";
    entrada5.fuente_img_peq = @"entrada_sashimi_p.png";
    entrada5.precio = 8000;
    entrada5.tipo = tipoEntradas;
    
    if(entrada6==nil) entrada6 = [[Plato alloc]init];
    entrada6.id_plato =506;
    entrada6.nombre = @"Sea Mix Open";
    entrada6.descripcion =  @"Descripcion Descripcion \nDescripcion Descripcion";
    entrada6.fuente_img = @"entrada_sea-mix-open.png";
    entrada6.fuente_img_grande = @"entrada_sea-mix-open_g.png";
    entrada6.fuente_img_peq = @"entrada_sea-mix-open_p.png";
    entrada6.precio = 8000;
    entrada6.tipo = tipoEntradas;
    
    if(entrada7==nil) entrada7 = [[Plato alloc]init];
    entrada7.id_plato =507;
    entrada7.nombre = @"Summer Rolls";
    entrada7.descripcion = @"Descripcion Descripcion \nDescripcion Descripcion";
    entrada7.fuente_img = @"entrada_summer-rolls.png";
    entrada7.fuente_img_grande = @"entrada_summer-rolls_g.png";
    entrada7.fuente_img_peq = @"entrada_summer-rolls_p.png";
    entrada7.precio = 8000;
    entrada7.tipo = tipoEntradas;
    
    if(entrada8==nil) entrada8 = [[Plato alloc]init];
    entrada8.id_plato =508;
    entrada8.nombre = @"Tacos Thai";
    entrada8.descripcion = @"Descripcion Descripcion \nDescripcion Descripcion";;
    entrada8.fuente_img = @"entrada_tacos-thai.png";
    entrada8.fuente_img_grande = @"entrada_tacos-thai_g.png";
    entrada8.fuente_img_peq = @"entrada_tacos-thai_p.png";
    entrada8.precio = 8000;
    entrada8.tipo = tipoEntradas;
    
    if(entrada9==nil) entrada9 = [[Plato alloc]init];
    entrada9.id_plato =509;
    entrada9.nombre = @"Ceviche Mixto";
    entrada9.descripcion = @"Descripcion Descripcion \nDescripcion Descripcion";
    entrada9.fuente_img = @"ceviche-mixto.png";
    entrada9.fuente_img_grande = @"ceviche-mixto_g.png";
    entrada9.fuente_img_peq = @"ceviche-mixto_p.png";
    entrada9.precio = 8000;
    entrada9.tipo = tipoEntradas;
    
    if(entrada10==nil) entrada10 = [[Plato alloc]init];
    entrada10.id_plato =510;
    entrada10.nombre = @"Tiradito de mero";
    entrada10.descripcion = @"Descripcion Descripcion \nDescripcion Descripcion";;
    entrada10.fuente_img = @"tiradito-de-mero.png";
    entrada10.fuente_img_grande = @"tiradito-de-mero_g.png";
    entrada10.fuente_img_peq = @"tiradito-de-mero_p.png";
    entrada10.precio = 8000;
    entrada10.tipo = tipoEntradas;

}

-(void)crearPlatosEnsaladas{
    if(ensalada1==nil) ensalada1 = [[Plato alloc]init];
    ensalada1.id_plato =601;
    ensalada1.nombre = @"Ensalada de pollo";
    ensalada1.descripcion = @"Descripcion Descripcion \nDescripcion Descripcion";
    ensalada1.fuente_img = @"ensalada-de-pollo.png";
    ensalada1.fuente_img_grande = @"ensalada-de-pollo_g.png";
    ensalada1.fuente_img_peq = @"ensalada-de-pollo_p.png";
    ensalada1.precio = 21000;
    ensalada1.tipo = tipoEnsaladas;
}

-(void)crearPlatosWok{

}

-(void)crearPlatosPostres{

    if(postre1==nil) postre1 = [[Plato alloc]init];
    postre1.id_plato =801;
    postre1.nombre = @"Nutella fruit roll";
    postre1.descripcion = @"Descripcion Descripcion \nDescripcion Descripcion";
    postre1.fuente_img = @"Nutella-fruit-roll.png";
    postre1.fuente_img_grande = @"Nutella-fruit-roll_g.png";
    postre1.fuente_img_peq = @"Nutella-fruit-roll_p.png";
    postre1.precio = 21000;
    postre1.tipo = tipoPostres;
    
    if(postre2==nil) postre2 = [[Plato alloc]init];
    postre2.id_plato =802;
    postre2.nombre = @"Passion fruit sensation";
    postre2.descripcion = @"Descripcion Descripcion \nDescripcion Descripcion";
    postre2.fuente_img = @"Passion-fruit-sensation.png";
    postre2.fuente_img_grande = @"Passion-fruit-sensation_g.png";
    postre2.fuente_img_peq = @"Passion-fruit-sensation_p.png";
    postre2.precio = 21000;
    postre2.tipo = tipoPostres;
    
    if(postre3==nil) postre3 = [[Plato alloc]init];
    postre3.id_plato =803;
    postre3.nombre = @"Passion fruit sensation";
    postre3.descripcion = @"Descripcion Descripcion \nDescripcion Descripcion";
    postre3.fuente_img = @"Passion-fruit-sensation-cereza.png";
    postre3.fuente_img_grande = @"Passion-fruit-sensation-cereza_g.png";
    postre3.fuente_img_peq = @"Passion-fruit-sensation-cereza_p.png";
    postre3.precio = 21000;
    postre3.tipo = tipoPostres;
}

-(void)crearPlatosBebidas{

    if(bebida1==nil) bebida1 = [[TipoBebida alloc]init];
    bebida1.id_bebida =901;
    bebida1.nombre = @"Bebidas Calientes";
    bebida1.fuente_img = @"beb_calientes.png";
    bebida1.fuente_img_grande = @"lista_bebidas.jpg";
    bebida1.fuente_img_peq = @"beb_calientes.png_p.png";
    bebida1.tipo = tipoBebidas;
    
    if(bebida2==nil) bebida2 = [[TipoBebida alloc]init];
    bebida2.id_bebida =902;
    bebida2.nombre = @"Gaseosas";
    bebida2.fuente_img = @"gaseosa.png";
    bebida2.fuente_img_grande = @"lista_bebidas.jpg";
    bebida2.fuente_img_peq = @"gaseosa_p.png";
    bebida2.tipo = tipoBebidas;
    
    if(bebida3==nil) bebida3 = [[TipoBebida alloc]init];
    bebida3.id_bebida =903;
    bebida3.nombre = @"Jugos";
    bebida3.fuente_img = @"jugos.png";
    bebida3.fuente_img_grande = @"lista_bebidas.jpg";
    bebida3.fuente_img_peq = @"jugos_p.png";
    bebida3.tipo = tipoBebidas;
}

-(void)crearPlatosLicores{

    if(licor1==nil) licor1 = [[TipoBebida alloc]init];
    licor1.id_bebida =1001;
    licor1.nombre = @"Aperitivos";
    licor1.fuente_img = @"aperitivos.png";
    licor1.fuente_img_grande = @"lista_bebidas.jpg";
    licor1.fuente_img_peq = @"aperitivos_p.png";
    licor1.tipo = tipoLicores;
    
    if(licor2==nil) licor2 = [[TipoBebida alloc]init];
    licor2.id_bebida =1002;
    licor2.nombre = @"Cervezas";
    licor2.fuente_img = @"cerveza.png";
    licor2.fuente_img_grande = @"lista_bebidas.jpg";
    licor2.fuente_img_peq = @"cerveza_p.png";
    licor2.tipo = tipoLicores;
    
    if(licor3==nil) licor3 = [[TipoBebida alloc]init];
    licor3.id_bebida =1003;
    licor3.nombre = @"Cocteles";
    licor3.fuente_img = @"cocteles.png";
    licor3.fuente_img_grande = @"lista_bebidas.jpg";
    licor3.fuente_img_peq = @"cocteles_p.png";
    licor3.tipo = tipoLicores;
    
    if(licor4==nil) licor4 = [[TipoBebida alloc]init];
    licor4.id_bebida =1004;
    licor4.nombre = @"Licores";
    licor4.fuente_img = @"licores.png";
    licor4.fuente_img_grande = @"lista_bebidas.jpg";
    licor4.fuente_img_peq = @"licores_p.png";
    licor4.tipo = tipoLicores;
    
    if(licor5==nil) licor5 = [[TipoBebida alloc]init];
    licor5.id_bebida =1005;
    licor5.nombre = @"Pouse";
    licor5.fuente_img = @"pouse.png";
    licor5.fuente_img_grande = @"lista_bebidas.jpg";
    licor5.fuente_img_peq = @"pouse_p.png";
    licor5.tipo = tipoLicores;
    
    if(licor6==nil) licor6 = [[TipoBebida alloc]init];
    licor6.id_bebida =1006;
    licor6.nombre = @"Vinos";
    licor6.fuente_img = @"vinos.png";
    licor6.fuente_img_grande = @"lista_bebidas.jpg";
    licor6.fuente_img_peq = @"vinos_p.png";
    licor6.tipo = tipoLicores;
}
-(int)demeTipoActual{
    return [[BrainMenu sharedInstance] tipoPlatoActual];
}

-(BOOL)estaPlato:(id)_id{
    return [[BrainMenu sharedInstance] estaPlato:[platos objectForKey:_id]];
}

-(NSString *)demeNombrePlatoPorId:(id)_id{
    Plato *plato_return = [platos objectForKey:_id];
    return plato_return.nombre;
}

-(int)demeTipoPlatoPorId:(id)_id{
    Plato *plato_return = [platos objectForKey:_id];
    return plato_return.tipo;
}


-(NSString *)demeDescripcionPlatoPorId:(id)_id{
    Plato *plato_return;
    NSString *description=@"";
    int _tipo = [self demeTipoActual];
    BOOL _tipoBool = YES;
    
    if(_tipo == tipoBebidas) _tipoBool = NO;
    if(_tipo == tipoLicores) _tipoBool = NO;
    
    if(_tipoBool){
        plato_return = [platos objectForKey:_id];
        description = plato_return.descripcion;
    }

    return description;
}

- (NSString *)demeFuenteImagenPlatoPorId:(id)_id{
    Plato *plato_return = [platos objectForKey:_id];
    return plato_return.fuente_img;
}

- (NSString *)demeFuenteImagenGrandePlatoPorId:(id)_id{
    Plato *plato_return = [platos objectForKey:_id];
    return plato_return.fuente_img_grande;
}

- (NSString *)demeFuenteImagenPequenoPlatoPorId:(id)_id{
    Plato *plato_return = [platos objectForKey:_id];
    return plato_return.fuente_img_peq;
}

- (int)demePrecioPlatoPorId:(id)_id
{
    Plato *plato_return;
    int precio=0;
    int _tipo = [self demeTipoActual];
    BOOL _tipoBool = YES;
    
    if(_tipo == tipoBebidas) _tipoBool = NO;
    if(_tipo == tipoLicores) _tipoBool = NO;
    
    if(_tipoBool){
        plato_return = [platos objectForKey:_id];
        precio = plato_return.precio;
    }

    return precio;
}

- (int)demeNumeroPlatosEnOrden
{
    return [BrainMenu sharedInstance].platosAgregados.count;
}

- (Plato *)demeDatosPlatoEnUbicacion:(int)_ubicacion{
    return [[BrainMenu sharedInstance] demePlatoEnUbicacion:_ubicacion];
}


- (void)agregarPlato:(id)_id
{
    [[BrainMenu sharedInstance] agregarPlato:[platos objectForKey:_id]];
}

- (void)eliminarPlato:(id)_id withKindPlate:(int)_kind
{
    [[BrainMenu sharedInstance] eliminarPlato:[platos objectForKey:_id]];
}

-(int)demeTotalCuenta{
    return [[BrainMenu sharedInstance] totalCuenta];
}

@end

