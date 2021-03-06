//
//  AppDelegate.m
//  MenuWasabi
//
//  Created by Vladimir Guzman on 21/09/12.
//  Copyright 3dementes 2012. All rights reserved.
//

#import "cocos2d.h"
#import "AppDelegate.h"


#import "DAOMesaJSON.h"

#define nameDataBase @"wdb.sqlite3"
//#define pathExample @"/Users/GOREMAC/Documents/Vladimir/ProyectosIOS/MenuWasabi/MenuWasabi/wdb.sqlite3"


@implementation AppController

@synthesize window=window_, navController=navController_, director=director_;
@synthesize databaseName, databasePath;

@synthesize jsonArray;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

	director_ = (CCDirectorIOS*) [CCDirector sharedDirector];
	// Display FSP and SPF
	[director_ setDisplayStats:YES];
	// set FPS at 60
	[director_ setAnimationInterval:1.0/60];
	// for rotation and other messages
	[director_ setDelegate:self];
	// 2D projection
	[director_ setProjection:kCCDirectorProjection2D];
	// Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
	if( ! [director_ enableRetinaDisplay:YES] )
		CCLOG(@"Retina Display Not supported");
	// Default texture format for PNG/BMP/TIFF/JPEG/GIF images
	// It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
	// You can change anytime.
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
	// If the 1st suffix is not found and if fallback is enabled then fallback suffixes are going to searched. If none is found, it will try with the name without suffix.
	// On iPad HD  : "-ipadhd", "-ipad",  "-hd"
	// On iPad     : "-ipad", "-hd"
	// On iPhone HD: "-hd"
	CCFileUtils *sharedFileUtils = [CCFileUtils sharedFileUtils];
	[sharedFileUtils setEnableFallbackSuffixes:NO];				// Default: NO. No fallback suffixes are going to be used
	[sharedFileUtils setiPhoneRetinaDisplaySuffix:@"-hd"];		// Default on iPhone RetinaDisplay is "-hd"
	[sharedFileUtils setiPadSuffix:@"-ipad"];					// Default on iPad is "ipad"
	[sharedFileUtils setiPadRetinaDisplaySuffix:@"-ipadhd"];	// Default on iPad RetinaDisplay is "-ipadhd"
	// Assume that PVR images have premultiplied alpha
	[CCTexture2D PVRImagesHavePremultipliedAlpha:YES];
    //
    //
    //
   
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    // Añadimos el nombre del fichero de base de datos.
    self.databasePath = [documentsDirectory stringByAppendingPathComponent:nameDataBase];
    //self.databasePath = pathExample;
    NSLog(@"DATA BASE PATH  %@", self.databasePath);
    // Cargo la base de datos
    
    //[self loadDataFromJson];
    //  [self updatePlato];
    // [self loadDataBase];
    //
    //
    //
	
	// Create a Navigation Controller with the Director
	//navController_ = [[UINavigationController alloc] initWithRootViewController:director_];
	navController_.navigationBarHidden = YES;

	// make main window visible
	[window_ makeKeyAndVisible];
	
	return YES;
}



// Supported orientations: Landscape. Customize it for your own needs
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}


// getting a call, pause the game
-(void) applicationWillResignActive:(UIApplication *)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ pause];
}

// call got rejected
-(void) applicationDidBecomeActive:(UIApplication *)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ resume];
}

-(void) applicationDidEnterBackground:(UIApplication*)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ stopAnimation];
}

-(void) applicationWillEnterForeground:(UIApplication*)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ startAnimation];
}

// application will be killed
- (void)applicationWillTerminate:(UIApplication *)application
{
	CC_DIRECTOR_END();
}

// purge memory
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
	[[CCDirector sharedDirector] purgeCachedData];
}

// next delta time will be zero
-(void) applicationSignificantTimeChange:(UIApplication *)application
{
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}
/*
-(void)loadDataBaseA{
    NSArray *rutas = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [rutas objectAtIndex:0];
    //path = [[rutas objectAtIndex:0]stringByAppendingPathComponent:@"prueba.sqlite3"];
    //  path = [documentsDirectory stringByAppendingPathComponent:pathDataBase];
    NSLog(@" PATH %@",pathExample);
    if(![[NSFileManager defaultManager] fileExistsAtPath:pathExample])
    {
        NSLog(@"NO EXISTIA PARCERO");
        sqlite3 *wasabi_db;
        if(sqlite3_open([pathExample UTF8String], &wasabi_db)!=SQLITE_OK)
        {
            sqlite3_close(wasabi_db);
            NSLog(@"Error al abrir la Base de datos");
        }
        else
         {
         NSLog(@"PASAMOS POR EL ELSE PARA CREAR LA TABLA -loadDataBase-");
         char *errorLog;
         char *consulta="CREATE TABLE IF NOT EXISTS PRUEBA (FILA INTEGER PRIMARY KEY, TEXTO TEXT)";
         if(sqlite3_exec(wasabi_db, consulta, NULL, NULL, &errorLog)!=SQLITE_OK)
         NSLog(@"Error creando tabla %s", errorLog);
         sqlite3_close(wasabi_db);
         }
 ///echo '{"platos":'.json_encode($registros).'}';
    }
}
*/

-(void)loadDataFromJson{
  
    NSURL *jsonURL = [NSURL URLWithString:@"http://www.brainztore.com/wasabi/consultatipobebidas.php"];
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfURL:jsonURL];
    NSDictionary *jsondict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSArray *tbebidas = [jsondict objectForKey:@"tipoBebidas"];
    NSLog(@"platos -------------------- %@ --- No de platos %i", tbebidas, tbebidas.count);
    NSDictionary *tbebida= [tbebidas objectAtIndex:3];
    NSLog(@"t bebida -------------------- %@", tbebida);
    NSNumber *tipobebida = [tbebida objectForKey:@"id_tipoBebida"];
    NSLog(@"Tipo Bebida -----> %@", tipobebida);
    NSNumber *tipo = [tbebida objectForKey:@"id_tipo"];
    NSLog(@"Tipo -----> %@", tipo);
    NSString *img_peq = [tbebida objectForKey:@"img_pequena"];
    NSLog(@"img_peq -----> %@", img_peq);
    

    for (int n = 0; n<25; n++) {
        int temp = (n-1)/8;
        int mod = n % 8;
        NSLog(@"---------------------------------------------- ");
        NSLog(@"Entero temporal:(%i - 1 )/ 8 -----> %i",n, temp);
        NSLog(@"MOD:%i mod 8 -----> %i",n, mod);
    
    }
}




-(void)loadTipoPlatosJson{
    //NSURL *jsonURL = [NSURL URLWithString:@"http://localhost:8888/wasabi/consultaplatos.php"];
    NSURL *jsonURL = [NSURL URLWithString:@"http://www.brainztore.com/wasabi/consultatipoplatos.php"];
    
    NSError *error = nil;
    
    NSString *jsonString = [[NSString alloc]initWithContentsOfURL:jsonURL encoding:NSUTF8StringEncoding error:&error];
    NSData *data = [NSData dataWithContentsOfURL:jsonURL];
    
    NSDictionary *jsondict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSArray *tipoplatos = [jsondict objectForKey:@"tipo_platos"];
    NSLog(@"platos -------------------- %@ --- No de platos %i", tipoplatos, tipoplatos.count);
    NSDictionary *tipoplato= [tipoplatos objectAtIndex:3];
    NSLog(@"plato -------------------- %@", tipoplato);

    NSString *id_tipo = [tipoplato objectForKey:@"id_tipoPlato"];
    NSLog(@"Tipo -----> %@", id_tipo);
    NSString *nombre = [tipoplato objectForKey:@"nombre"];
    NSLog(@"Nombre -----> %@", nombre);
    
}

-(void)updatePlato{
    NSURL *url = [NSURL URLWithString:@"http://www.brainztore.com/updateplato.php?id=2&precio=1800"];
   // NSString *datos = [NSString stringWithFormat:@"id=%@&precio=%@", @"2", @"18500"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
   // NSString *longitud = [NSString stringWithFormat:@"%d", [datos length]];
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    //[request addValue:longitud forHTTPHeaderField:@"Content-length"];
    [request setHTTPMethod:@"POST"];
   // [request setHTTPBody:[datos dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"request %@", request);
    conx = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(conx){
        webData=[NSMutableData data];
        NSLog(@"conexión hecha");
    }
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Error en la conexión");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"connectionDidFinishLoading");
}

- (void) loadDataBase{
    NSLog(@"iniciamos loadDataBase ");
    BOOL exito;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [libraryDirectory stringByAppendingPathComponent:nameDataBase];
    NSLog(@"path!!!!!!!! <<<>>>>>>>> %@", writableDBPath);
    //NSString *writableDBPath = pathExample;
   // writableDBPath = self.databaseName;
    exito = [fileManager fileExistsAtPath:self.databasePath];//writableDBPath];
  
    if (exito) return;
    // Si no existe en Library, la copio desde el original.
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:nameDataBase];
    //NSString *defaultDBPath = pathExample;
    exito = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!exito) {
        NSAssert1(0, @"Error al cargar la base de datos, error = '%@'.", [error localizedDescription]);
    }
}

- (void) dealloc
{
	[window_ release];
	[navController_ release];

	[super dealloc];
}
@end

