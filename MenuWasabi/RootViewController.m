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
#import "CombosLayer.h"
#import "Plato.h"
#import "TipoBebida.h"
#import "Bebida.h"
#import "BrainMenu.h"
#import <sqlite3.h>


#import "DAOPlatos.h"
#import "DAOTipoPlato.h"

#import "DAOPedidoJSON.h"
#import "DAOBebidasJSON.h"
#import "DAOPlatosJSON.h"
#import "DAOTipoPlatoJSON.h"

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



@interface RootViewController()
    
    @property (nonatomic, strong) NSDictionary *platos;

@end


CCScene *scene;
@implementation RootViewController

@synthesize platos;
@synthesize path, auxTipoPlato, tipoPlatosArray;
//@synthesize appControler, auxTipoPlato;


// Add these new methods


- (void)setupCocos2D {

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
    if ([self demeTipoActual] != tipoCombos){
        scene =  [SushiLayer sceneWithVC:self];
    }
    else{
        scene = [CombosLayer sceneWithVC:self];
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    [self LoadScene];
    [[CCDirector sharedDirector] replaceScene:scene];
    if([self demeTipoActual]==tipoCombos)[btnPrincipal setAlpha:0];
    else [btnPrincipal setAlpha:1];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [super viewWillAppear:animated];
    [[CCDirector sharedDirector]startAnimation];

}

- (void)viewDidLoad {
   
    [super viewDidLoad];
    [self setupCocos2D];
    
    appControler = (AppController*)[[UIApplication sharedApplication]delegate];
    tipoPlatosArray = [[NSMutableArray alloc]init];
    
    //[self addTipoPlato];
    //[self loadTipoDatosFromDB];
    [self loadTipoDatosFromServer];
    [[DAOPedidoJSON sharedInstance] begigOrder];
   // [self loadDataBase];
   // [self grabarTabla];
    //[self leerTabla];
}

- (void)loadTipoDatosFromDB{
    [[DAOTipoPlato sharedInstance] loadTipoDatosFromDB];
    TipoPlato *t;
    t = [[DAOTipoPlato sharedInstance] getTipoPlatoById:@"2"];
    NSLog(@"ESTE ES EL NOMBRE DEL TIPO PLATO CON ID %i --- %@", 2, t.nombre);
}

- (void)loadTipoDatosFromServer{
    [[DAOTipoPlatoJSON sharedInstance] loadTipoDatosFromServer];
    TipoPlato *t;
    t = [[DAOTipoPlato sharedInstance] getTipoPlatoById:@"2"];
    NSLog(@"ESTE ES EL NOMBRE DEL TIPO PLATO CON ID %i --- %@", 2, t.nombre);
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	//return YES;
    //if((interfaceOrientation==UIInterfaceOrientationPortrait)||(interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown))
    if ([self demeTipoActual] == tipoCombos)
        return YES;
    else
        return NO;
}

//
// This callback only will be called when GAME_AUTOROTATION == kGameAutorotationUIViewController
//
#if GAME_AUTOROTATION == kGameAutorotationUIViewController
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
//
    
    [[CCDirector sharedDirector] stopAnimation];
    [self.navigationController popViewControllerAnimated:YES];
	//
	// Assuming that the main window has the size of the screen
	// BUG: This won't work if the EAGLView is not fullscreen
	///
	/*CGRect screenRect = [[UIScreen mainScreen] bounds];
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
     glView.frame = rect;*/
}
#endif // GAME_AUTOROTATION == kGameAutorotationUIViewController


-(void)leerTabla{
     NSLog(@"leerTabla YA ENTRAMOS -------------------------");
    if([[NSFileManager defaultManager]fileExistsAtPath:path])
    {
         NSLog(@"PASAMOS EL IF");
        sqlite3 *wasabi_db;
        if(sqlite3_open([path UTF8String], &wasabi_db)!=SQLITE_OK)
        {
            sqlite3_close(wasabi_db);
            NSLog(@"error al abrir la base de datos");
        }
        else
        {
            char *consulta = "SELECT * FROM wsb_tipoPlato ORDER BY id_tipoPlato";
            sqlite3_stmt *resultado;
            if(sqlite3_prepare(wasabi_db, consulta, -1, &resultado, nil)==SQLITE_OK){
                while (sqlite3_step(resultado)==SQLITE_ROW) {
                    int id_tipoPlato=sqlite3_column_int(resultado, 0);
                    char *nombre = (char *) sqlite3_column_text(resultado, 1);
                    NSLog(@"%i %s",id_tipoPlato, nombre);
                }
            }
            sqlite3_close(wasabi_db);
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    
    [btnPrincipal release];
    btnPrincipal = nil;
    [btnClose release];
    btnClose = nil;
    [super viewDidUnload];
    [[CCDirector sharedDirector] end];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [scene release];
    [btnPrincipal release];
    [btnClose release];
    [super dealloc];
}

- (IBAction)menuTapped:(id)sender {
    // scene = [[CCScene alloc]init];
    //[scene delete:sender];
    if([self demeTipoActual]!=tipoCombos){
        [[CCDirector sharedDirector] stopAnimation];
        [self.navigationController popViewControllerAnimated:YES];

    }
}
/*
-(void)grabarTabla
{
    sqlite3 *db;
    if(sqlite3_open([path UTF8String], &db)!=SQLITE_OK){
        NSLog(@"no se pudo abrir la base de datos para guardar");
        sqlite3_close(db);
    }
    else{
        char *consulta = "INSERT INTO wsb_plato (TEXTO) VALUES (?);";
        
        int id_ = 0;
        char *nombre = "Anagomaki";
        char *prueba_insertar = "carambolas";
        char *fuente_img = "anagomaki_big.png";
        char *fuente_img_grande = "anagomaki_big_g.png";
        char *fuente_img_peq = "anagomaki_big_p.png";
        char *descripcion = "esto es una descripcion";
        int tipo = tipoSushi;
        int precio = 12000;
        sqlite3_stmt *resultado;
        if(sqlite3_prepare_v2(db, consulta, -1, &resultado, nil)==SQLITE_OK)
        {
            sqlite3_bind_int(resultado, 1, 0);
            sqlite3_bind_text(resultado, 1, [sushi1.nombre UTF8String], -1, NULL);
        }
        if(sqlite3_step(resultado)!=SQLITE_DONE)
            NSLog(@"ERROR ACTUALIZANDO VALOR");
    }
}*/
-(int)getNumberOfPlates{
  //  return  [[DAOPlatos sharedInstance] getNumberOfPlates];
    return  [[DAOPlatosJSON sharedInstance] getNumberOfPlates];
}


-(NSString *)demeTipoActual{
    return [[BrainMenu sharedInstance] tipoPlatoActual];
}

-(BOOL)estaPlato:(NSString*)_id{
   // return [[BrainMenu sharedInstance] estaPlato:[[DAOPlatos sharedInstance] getPlateById:_id]];// [platos objectForKey:_id]];
    return [[DAOPedidoJSON sharedInstance] estaPlato:[[DAOPlatosJSON sharedInstance] getPlateById:_id]];

}

-(NSString *)demeNombrePlatoPorId:(NSString*)_id{
   // Plato *plato_return = [[DAOPlatos sharedInstance] getPlateById:_id];//[platos objectForKey:_id];
    Plato *plato_return = [[DAOPlatosJSON sharedInstance] getPlateById:_id];
    return plato_return.nombre;
}

-(NSString *)demeTipoPlatoPorId:(NSString*)_id{
   // Plato *plato_return = [[DAOPlatos sharedInstance] getPlateById:_id];//[platos objectForKey:_id];
     Plato *plato_return = [[DAOPlatosJSON sharedInstance] getPlateById:_id];
    return plato_return.tipo;
}

-(int)demeCantidadPlatoPorId:(NSString*)_id{
    return [[DAOPedidoJSON sharedInstance] demeCantidadPlatos:_id];
}

-(int)demeCantidadBebidaPorId:(NSString*)_id{
    return [[DAOPedidoJSON sharedInstance] demeCantidadBebidas:_id];
}

-(NSString *)demeDescripcionPlatoPorId:(NSString*)_id{
    Plato *plato_return;
    NSString *description=@"";
    NSString *_tipo = [self demeTipoActual];
    BOOL _tipoBool = YES;
    
    if(_tipo == tipoBebidas) _tipoBool = NO;
    if(_tipo == tipoLicores) _tipoBool = NO;
    
    if(_tipoBool){
       // plato_return = [[DAOPlatos sharedInstance] getPlateById:_id];//[platos objectForKey:_id];
        plato_return = [[DAOPlatosJSON sharedInstance] getPlateById:_id];
        description = plato_return.descripcion;
    }

    return description;
}

- (NSString *)demeFuenteImagenPlatoPorId:(NSString*)_id{
    //Plato *plato_return = [[DAOPlatos sharedInstance] getPlateById:_id];//[platos objectForKey:_id];
    Plato *plato_return = [[DAOPlatosJSON sharedInstance] getPlateById:_id];
    return plato_return.fuente_img;
}

- (NSString *)demeFuenteImagenGrandePlatoPorId:(NSString*)_id{
    //Plato *plato_return = [[DAOPlatos sharedInstance] getPlateById:_id];//[platos objectForKey:_id];
    Plato *plato_return = [[DAOPlatosJSON sharedInstance] getPlateById:_id];
    return plato_return.fuente_img_grande;
}

- (NSString *)demeFuenteImagenPequenoPlatoPorId:(NSString*)_id{
   // Plato *plato_return = [[DAOPlatos sharedInstance] getPlateById:_id];//[platos objectForKey:_id];
    Plato *plato_return = [[DAOPlatosJSON sharedInstance] getPlateById:_id];
    return plato_return.fuente_img_peq;
}

- (int)demePrecioPlatoPorId:(NSString*)_id
{
    Plato *plato_return;
    int precio=0;
    NSString *_tipo = [self demeTipoActual];
    BOOL _tipoBool = YES;
    
    if(_tipo == tipoBebidas) _tipoBool = NO;
    if(_tipo == tipoLicores) _tipoBool = NO;
    
    if(_tipoBool){
       // plato_return = [[DAOPlatos sharedInstance] getPlateById:_id];//[platos objectForKey:_id];
        plato_return = [[DAOPlatosJSON sharedInstance] getPlateById:_id];
        precio = plato_return.precio;
    }

    return precio;
}

- (int)demeNumeroPlatosEnOrden
{
    return [DAOPedidoJSON sharedInstance].actualOrder.platosActuales.count;
}

- (int)demeNumeroBebidasEnOrden
{
    return [DAOPedidoJSON sharedInstance].actualOrder.bebidasActuales.count;
}

- (Plato *)demeDatosPlatoEnUbicacion:(int)_ubicacion{
    return [[DAOPedidoJSON sharedInstance] demePlatoEnUbicacion:_ubicacion];
}

- (Bebida *)demeDatosBebidaEnUbicacion:(int)_ubicacion{
    return [[DAOPedidoJSON sharedInstance] demeBebidaEnUbicacion:_ubicacion];
}

- (void)agregarPlato:(NSString*)_id
{
    [[DAOPedidoJSON sharedInstance] agregarPlato:[[DAOPlatosJSON sharedInstance] getPlateById:_id]];
}
- (void)agregarBebida:(NSString*)_id
{
    [[DAOPedidoJSON sharedInstance] agregarBebida:[[DAOBebidasJSON sharedInstance] getBeverageById:_id]];
}

- (void)eliminarPlato:(NSString*)_id withKindPlate:(NSString*)_kind
{
    [[DAOPedidoJSON sharedInstance] eliminarPlato:[[DAOPlatosJSON sharedInstance] getPlateById:_id]];
}

- (void)deleteBeverage:(NSString*)_id withBeverageType:(NSString*)_kind{
    [[DAOPedidoJSON sharedInstance] eliminarBebida:[[DAOBebidasJSON sharedInstance] getBeverageById:_id]];
}

-(int)demeTotalCuenta{
    return [DAOPedidoJSON sharedInstance].actualOrder.totalCuenta;
}

-(int)createNewOrder{
    return [[DAOPedidoJSON sharedInstance] createNewOrder];
}

-(void)hidePrincipalButton{
    [self moverBoton:btnPrincipal posx:385 posy:-300 alpha:1.0 duracion:1.0 delay:0.0];
}
-(void)showCloseButton:(int)_posx withPosY:(int)_posy{
    [self moverBoton:btnClose posx:_posx posy:_posy alpha:1.0 duracion:1.0 delay:0.0];
}

- (IBAction)closeApp:(id)sender {
    exit(0);
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

@end

