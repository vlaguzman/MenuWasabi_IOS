//
//  SushiLayer.m
//  MenuWasabi
//  CUIDADO
//  Created by GIOVANNI LOPEZ on 21/09/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SushiLayer.h"
#import "Plato.h"
#import "AppDelegate.h"
#import "CCTouchDispatcher.h"
#import "CCActionInterval.h"
#import "BrainMenu.h"
#import "DAOPlatos.h"

#define kMoveMedium 0.2
#define kMoveFast 0.05
#define kSlow     200
#define kMedium   3000
#define kFast     20000
#define tSlow     2
#define tMedium   1
#define tFast     0.5

#define fontSizeDescription 16

//Limites de la grilla de imagenes por el touch
#define limitMoveLeftMenuFactor -240
#define limitMoveLeftMenuFactorSushi -249
#define limitMoveLeft -140

#define paddingDescriptionPlatesMenu 500

//Padding asignado a los labels que contienen los precios
#define paddingPrincipalPlates 250//

#define paddingTinyPlates 128


//Posiciones Nombres Menu
#define posXprincipalMenuSushi -140
#define posXprincipalMenuTeppanyaki 140
#define posXprincipalMenuSopa 270
#define posXprincipalMenuEspeciales 270
#define posXprincipalMenuEntradas -140
#define posXprincipalMenuEnsaladas 270
#define posXprincipalMenuWok 0
#define posXprincipalMenuPostres 20
#define posXprincipalMenuLicores -140
#define posXimagenBotonTotalPagar 385
#define posYimagenBotonTotalPagar -140
#define posXlabelTotal 320
#define posYlabelTotal -120

#define posXBigPlatesMenu 1300

#define posXBigPlatesMenuEntradas 1200

#define posXBigPlatesDescription -200
#define posXShowBigPlatesDescription 250
#define posYBigPlatesDescription 500

#define posXmenuPedidos -50
#define posYmenuPedidos -100


//Cada tipo de plato tiene un identificador para efecto de carag de imagenes
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


#define kindFactorSushi 0
#define kindFactorTeppanyaki 200
#define kindFactorSopa 300
#define kindFactorEspeciales 400
#define kindFactorEntradas 500
#define kindFactorEnsaladas 600
#define kindFactorWok 700
#define kindFactorPostres 800
#define kindFactorBebidas 900
#define kindFactorLicores 1000

#define AHalfWinSizeX 512
#define AHalfWinSizeY 384


static const ccColor3B ccDARKRED={139,0,0};
//
int KindFactor = 0;
//Posiciones
int posXnombres=0;
int posYnombres=0;
int posXprincipalMenu = 0;
int limitMoveRight = 0;
//limitMoveLeft = 0;
int numPlates = 1;
int numDrinks = 1;
int posYPlatesMenu = 0;


// Valores Boton Agregar y dettalles producto
int posXaparecerDetalles = 250;
int posYaparecerDetalles = 500;
int posXdesaparecerDetalles = -200;
int posydesaparecerDetalles = 500;
int posXaparecerAgregar = 740;
int posYaparecerAgregar = 350;
int posXdesaparecerAgregar = 740;
//int posYBigPlatesDescription = ;

int _fontSizeTotal = 34;
int _fontSizeFotter = 11;
int _fontSizeTitleName = 16;
int _fontSizeTitlePrice = 14;
int _fontSizeOrderPrice = 14;
int _fontSizeOrderName = 13;
int _fontSizePricesDrink = 10;
int _fontSizeNameDrink = 10;


//Nombres de archivos de imagenes
NSString *bigPlateDescription = @"descripcion.png";
NSString *btnHacerPedido = @"btn_hacerpedido.png";
NSString *btnClose = @"btn_cerrar.png";
NSString *font = @"Helvetica";
//NSString *fontTotal = @"Marker Felt";
//NSString *fontNames = @"Marker Felt";

NSString *backgroundImage = @"bg_detalle.jpg";
NSString *btnAddPlate = @"btn_agregar.png";
NSString *btnGoBack = @"btn_regresar.png";
NSString *sectionTinyPlates = @"barra_agregar.png";
NSString *upImage = @"flecha_total_up.png";
NSString *DownImage = @"flecha_total.png";
NSString *fotter = @"pata_02.png";
NSString *textFotter = @" Domicilios: (+57)(1) 522 6412                                         Calle 109 # 17-55 piso 2, Bogotá. Ver mapa   info@wasabisushilounge.co                                                                                      Powered by 3dementes";

CCSprite *plato_grande1, *descripcion, *cuadro_total;


CCLabelTTF *label, *label2;
CCLabelTTF *label_descripcion, *label_fotter;
CCLabelTTF *label_total;
CGPoint  initialPoint;
//CGFloat xVelocityA, xVelocityB;
float timei, timem, pos, resul_dif, time_efect;
int changedLevel, difPlatesNames;

int firstX, firstY, iactualPlate;

CGFloat finalX;
CGFloat finalY;
CGFloat animationDuration;

CCMenu *menu, *menu_bebidas, *menu_atras, *menu_agregar, *menu_barra, *menu_pedidos, *menu_platosgrandes, *menu_detalles, *menu_up_down;
CGSize winSize;

CCMenu *menuprueba;
CCMenuItemImage *itemAux2, *item_up_down;
BOOL bool_swipe = YES;


@implementation SushiLayer
@synthesize swipeLeftRecognizer = _swipeLeftRecognizer;
@synthesize swipeRightRecognizer = _swipeRightRecognizer;


-(void)changeValueNumPlates{
    NSString *tipoPlato = [_rootViewController demeTipoActual];
    
    NSLog(@"TIPO: %@", tipoPlato);
    NSLog(@"%d", [tipoPlato intValue] == [tipoTeppanyaki intValue]);
    NSLog(@"%d", (tipoPlato == tipoTeppanyaki));
    
    if(tipoPlato == tipoSushi){
        KindFactor = kindFactorSushi;
        numPlates = 39;
        posXprincipalMenu = posXprincipalMenuSushi;
        limitMoveRight = ((numPlates-4) * limitMoveLeftMenuFactorSushi)+limitMoveLeft;
    }
    else if (tipoPlato == tipoTeppanyaki){
        NSLog(@"MENOS MAL");
        KindFactor = kindFactorTeppanyaki;
        numPlates = 2;
        posXprincipalMenu = posXprincipalMenuTeppanyaki;

    }
    else if (tipoPlato == tipoSopa){
        KindFactor = kindFactorSopa;
        numPlates = 1;
        posXprincipalMenu = posXprincipalMenuSopa;
    }
    else if (tipoPlato == tipoEspeciales){
        KindFactor = kindFactorEspeciales;
        numPlates = 1;
        posXprincipalMenu = posXprincipalMenuEspeciales;
    }
    else if (tipoPlato == tipoEntradas){
        KindFactor = kindFactorEntradas;
        numPlates = 8;
        posXprincipalMenu = posXprincipalMenuEntradas;
        limitMoveRight = ((numPlates-4) * limitMoveLeftMenuFactor)+limitMoveLeft;
    }
    else if (tipoPlato == tipoEnsaladas){
        KindFactor = kindFactorEnsaladas;
        numPlates = 1;
        posXprincipalMenu = posXprincipalMenuEnsaladas;
    }
    else if (tipoPlato == tipoPostres){
        KindFactor = kindFactorPostres;
        numPlates = 3;
        posXprincipalMenu = posXprincipalMenuPostres;
    }
    else if (tipoPlato == tipoBebidas){
        KindFactor = kindFactorBebidas;
        numPlates = 3;
        posXprincipalMenu = posXprincipalMenuPostres;
    }
    else if (tipoPlato == tipoLicores){
        KindFactor = kindFactorLicores;
        numPlates = 6;
        posXprincipalMenu = posXprincipalMenuLicores;
        limitMoveRight = ((numPlates-4) * limitMoveLeftMenuFactor)+limitMoveLeft;
    }
}


+(CCScene *) sceneWithVC:(RootViewController *)rootViewController
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	// 'layer' is an autorelease object.
    SushiLayer *layer = [[[SushiLayer alloc] initWithVC:rootViewController] autorelease];
	// add layer as a child to scene
	[scene addChild: layer];
	return scene;
}



-(id) initWithVC: (RootViewController *) rootViewController
{
    if( (self=[super init] )) {
        _rootViewController = rootViewController;
        bool_swipe=YES;
        [self changeValueNumPlates];

        CGSize winSize = [[CCDirector sharedDirector] winSize];
        self.isTouchEnabled = YES;
        
        CCSprite *background;
        background = [CCSprite spriteWithFile:backgroundImage rect:CGRectMake(0, 0, 1024, 768)];
        background.position = ccp(AHalfWinSizeX, AHalfWinSizeY);
        [self addChild:background];

        CCMenuItemLabel *itemNombrePlato, *itemPrecio;
        CCMenuItemImage *itemAux;
        CCLabelTTF *nombre_plato;
        CCLabelTTF *precio_plato;
        NSString *strnombrePlato;
        NSString *strprecioPlato;
        
        menu = [[CCMenu alloc]init];
       
        NSMutableArray *platos = [[NSMutableArray alloc]init];
        platos = [[DAOPlatos sharedInstance] getPlatesByKind:[_rootViewController demeTipoActual]];
        Plato *auxPlate = [[Plato alloc]init];
        
        for (int i = 0; i < [platos count]; i++) {
            auxPlate = [platos objectAtIndex:i];
            
            nombre_plato = [[CCLabelTTF alloc]initWithString:@"" fontName:font fontSize:_fontSizeTitleName];
            precio_plato = [[CCLabelTTF alloc]initWithString:@"" fontName:font fontSize:_fontSizeTitlePrice];
            
            
            //strnombrePlato = [_rootViewController demeNombrePlatoPorId:@(i+KindFactor)];
            strnombrePlato = auxPlate.nombre;
            [nombre_plato setString:strnombrePlato];
            
            NSString *_tipo = [_rootViewController demeTipoActual];
            BOOL _tipoBool = YES;
            if(_tipo == tipoBebidas) _tipoBool = NO;
            if(_tipo == tipoLicores) _tipoBool = NO;
            
            if(_tipoBool){
                //strprecioPlato = [[NSString alloc] initWithFormat:@"$ %i", [_rootViewController demePrecioPlatoPorId:@(i+KindFactor)]];
                strprecioPlato = [[NSString alloc]initWithFormat:@"$ %i", auxPlate.precio];
                [precio_plato setString:strprecioPlato];
            }
            itemNombrePlato = [CCMenuItemLabel itemWithLabel:nombre_plato target:self selector:@selector(onPushSceneTranLabel:)];
            itemPrecio = [CCMenuItemLabel itemWithLabel:precio_plato target:self selector:@selector(onPushSceneTranLabel:)];
            //itemAux = [CCMenuItemImage itemWithNormalImage:[_rootViewController demeFuenteImagenPlatoPorId:@(i+KindFactor)] selectedImage:[_rootViewController demeFuenteImagenPlatoPorId:@(i+KindFactor)] target:self selector:@selector(onPushSceneTranImage:)];
            itemAux = [CCMenuItemImage itemWithNormalImage:auxPlate.fuente_img selectedImage:auxPlate.fuente_img target:self selector:@selector(onPushSceneTranImage:)];
           // itemAux.tag=i+KindFactor;
           itemAux.tag=[auxPlate.id_plato intValue];
            
            itemAux.position = CGPointMake(itemAux.position.x +(i*paddingPrincipalPlates), itemAux.position.y);
            itemNombrePlato.position = CGPointMake(itemNombrePlato.position.x +(i*paddingPrincipalPlates), 165);
            itemPrecio.position = CGPointMake(itemPrecio.position.x +(i*paddingPrincipalPlates)+5, 148);
            
            [menu addChild:itemAux];
            [menu addChild:itemNombrePlato];
            [menu addChild:itemPrecio];
            
        }
        
        menu.position = CGPointMake(posXprincipalMenu, AHalfWinSizeY);
 		[self addChild: menu];
        
        menu_platosgrandes = [[CCMenu alloc]init];
        itemAux2 = [[CCMenuItemImage alloc]init];
        menu_platosgrandes.position = CGPointMake(posXBigPlatesMenu, AHalfWinSizeY);
        [menu_platosgrandes addChild:itemAux2];
        
        [self addChild:menu_platosgrandes];
        
        menu_detalles = [[CCMenu alloc]init];

        itemAux =  [CCMenuItemImage itemWithNormalImage:bigPlateDescription selectedImage:bigPlateDescription target:self selector:@selector(onPushSceneTran:)];
        [menu_detalles addChild:itemAux];

        menu_detalles.position = CGPointMake(posXBigPlatesDescription, posYBigPlatesDescription);
        [menu_detalles alignItemsVerticallyWithPadding:paddingDescriptionPlatesMenu];
        [self addChild:menu_detalles];
                
        label_descripcion = [CCLabelTTF labelWithString:@"Total" fontName:font fontSize:fontSizeDescription];
        label_descripcion.position =  ccp(posXBigPlatesDescription , posYBigPlatesDescription);
		[self addChild: label_descripcion];
        
        CCMenuItemImage *item_atras = [CCMenuItemImage itemWithNormalImage:btnGoBack selectedImage:btnGoBack target:self selector:@selector(onGoBack:)];
        
        menu_atras = [CCMenu menuWithItems:item_atras, nil];
        menu_atras.position = CGPointMake(940, winSize.height+100);
        [menu_atras alignItemsVertically];
        [self addChild:menu_atras];
        
        CCMenuItemImage *item_agregar = [CCMenuItemImage itemWithNormalImage:btnAddPlate selectedImage:btnAddPlate target:self selector:@selector(onAddPlate:)];
        
        //menu agregar oculto
        menu_agregar = [CCMenu menuWithItems:item_agregar, nil];
        menu_agregar.position = CGPointMake(640, winSize.height+100);
        [menu_agregar alignItemsVertically];
        [self addChild:menu_agregar];

        
        CCMenuItemImage *item_barra = [CCMenuItemImage itemWithNormalImage:sectionTinyPlates selectedImage:sectionTinyPlates target:self selector:@selector(nothingHere:)];
        menu_barra = [[CCMenu alloc]init];
        [menu_barra addChild:item_barra];
        
        //menu agregar oculto
        //menu_barra = [CCMenu menuWithItems:item_barra, item_up_down, nil];
        menu_barra.position = CGPointMake(522, -50);
        [menu_barra alignItemsVertically];
        [self addChild:menu_barra];
        
        //
        // Menú inferior - Total cuenta
        //
        
        CCMenuItemImage *imgBtnTotal;
        CCMenuItemLabel *lblTotal;
        
        label_total = [CCLabelTTF labelWithString:@"" fontName:font fontSize:_fontSizeTotal];
        [label_total setColor:ccDARKRED];
        lblTotal = [CCMenuItemLabel itemWithLabel:label_total target:self selector:@selector(nothingHere:)];
        
        imgBtnTotal = [CCMenuItemImage itemWithNormalImage:btnHacerPedido selectedImage:btnHacerPedido target:self selector:@selector(nothingHere:)];

        menu_up_down = [[CCMenu alloc]init];
        item_up_down =  [CCMenuItemImage itemWithNormalImage:upImage selectedImage:upImage target:self selector:@selector(onUpDown:)];
        
        imgBtnTotal.position = CGPointMake(posXimagenBotonTotalPagar, posYimagenBotonTotalPagar);
        lblTotal.position = CGPointMake(posXlabelTotal, posYlabelTotal);
        
        [menu_up_down addChild:imgBtnTotal];
        [menu_up_down addChild:lblTotal];
        [menu_up_down addChild:item_up_down];
        
        menu_up_down.position = CGPointMake(522, 35);
        [self addChild:menu_up_down];
        
        //
        //
        //
        
        
        menu_pedidos = [[CCMenu alloc]init];
        menu_pedidos.position = CGPointMake(posXmenuPedidos, posYmenuPedidos);
        [self addChild:menu_pedidos];

        
        CCSprite *img_fotter;
        img_fotter = [CCSprite spriteWithFile:fotter rect:CGRectMake(0, 0, 1024, 26)];
        img_fotter.position = ccp(522, 5);
        [self addChild:img_fotter];
        
        label_fotter = [CCLabelTTF labelWithString:textFotter fontName:font fontSize:_fontSizeFotter];
        //[label_total setColor:ccDARKRED];
		label_fotter.position =  ccp(522 , 8);
		[self addChild: label_fotter];
    
         
         UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
         [panRecognizer setMinimumNumberOfTouches:1];
         [panRecognizer setMaximumNumberOfTouches:1];
         //[panRecognizer setDelegate:self];
         [[[CCDirector sharedDirector] openGLView] addGestureRecognizer:panRecognizer];
         [panRecognizer release];
         
       /*
    
        self.swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveLeft)];//moveRight)];
        _swipeLeftRecognizer.numberOfTouchesRequired=1;
        _swipeLeftRecognizer.direction=UISwipeGestureRecognizerDirectionRight;
        [[[CCDirector sharedDirector] openGLView]  addGestureRecognizer:_swipeLeftRecognizer];
        [self.swipeLeftRecognizer release];
        
        self.swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveRight)];//moveLeft)];
        _swipeRightRecognizer.numberOfTouchesRequired=1;
        _swipeRightRecognizer.direction=UISwipeGestureRecognizerDirectionLeft;
        [[[CCDirector sharedDirector] openGLView] addGestureRecognizer:_swipeRightRecognizer];
        [self.swipeRightRecognizer release];
        */
        [self updateTotalBill];
        [self loadMenuResume];
    }
    
    return self;
}



// FUNCION DE MOVIMIENTO USANDO EL PANUIGESTURE
-(void)move:(id)sender {
    if(numPlates>4){
        if(bool_swipe){
            [[[CCDirector sharedDirector] openGLView]bringSubviewToFront:[(UIPanGestureRecognizer*)sender view]];
            if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
                CGFloat velocityX = [(UIPanGestureRecognizer*)sender velocityInView:[[CCDirector sharedDirector] openGLView]].x;
                CCLOG(@"--------------------------------------------");
                time_efect = velocityX*0.0002;
                CCLOG(@"velocityX, %f - TIME EFECT %f", velocityX, time_efect);
                CCLOG(@"--------------------------------------------");
                pos = menu.position.x;
                pos+=velocityX;
                if(pos < limitMoveRight ){
                    pos = limitMoveRight;
                }
                else if(pos > limitMoveLeft){
                    pos =limitMoveLeft;
                }
                winSize = [[CCDirector sharedDirector] winSize];
                [self moveMenu_withMenu: menu withXpox:pos withYpos:AHalfWinSizeY withTimeTransition:1];
            }
        }
    }
}
/*

-(void)moveRight{
    if(numPlates > 4){
        if(bool_swipe){
                        
            pos = menu.position.x;
         
            winSize = [[CCDirector sharedDirector] winSize];
            if(resul_dif<kMoveFast){
                
                pos-=resul_dif*kFast;
                time_efect=tFast;
                CCLOG(@"--------------------------------------------------------");
                CCLOG(@"resul_dif<kMoveFast :=  kFast %f  || resul_dif %f || POS %f ", kMoveFast, resul_dif, pos);
                CCLOG(@"--------------------------------------------------------");
              
                
            }
            else if (resul_dif<kMoveMedium){
                pos-=resul_dif*kMedium;
                time_efect = tMedium;
                CCLOG(@"--------------------------------------------------------");
                CCLOG(@"resul_dif<kMoveMedium :=  kMedium %d  || resul_dif %f || POS %f ", kMoveMedium, resul_dif, pos);
                CCLOG(@"--------------------------------------------------------");
            }
            else{
                pos-=resul_dif*kSlow;
                time_efect=tSlow;
                CCLOG(@"--------------------------------------------------------");
                CCLOG(@"resul_dif<KmoveSlow :=  kSlow %d  || resul_dif %d || POS %d ", kSlow, resul_dif, pos);
                CCLOG(@"--------------------------------------------------------");
            }
            if(pos < limitMoveRight ){
                pos = limitMoveRight;
            }
            CCLOG(@"moveRight   este es el POS %f y este el resul_dif %f TIME EFECT %f", pos, resul_dif, time_efect);
            [self moveMenu_withMenu: menu withXpox:pos withYpos:AHalfWinSizeY withTimeTransition:time_efect];
        }
    }
}


-(void)moveLeft{
    if(numPlates>4){
        if(bool_swipe){
    
            pos = menu.position.x;
           
            winSize = [[CCDirector sharedDirector] winSize];
            if(resul_dif<kMoveFast){
                pos+=resul_dif*kFast;
                time_efect=tFast;
                CCLOG(@"--------------------------------------------------------");
                 CCLOG(@"resul_dif<kMoveFast :=  kFast %f  || resul_dif %f || POS %f ", kMoveFast, resul_dif, pos);
                 CCLOG(@"--------------------------------------------------------");
            }
            else if (resul_dif<kMoveMedium){
                pos+=resul_dif*kMedium;
                time_efect = tMedium;
                CCLOG(@"--------------------------------------------------------");
                CCLOG(@"resul_dif<kMoveMedium :=  kMedium %f  || resul_dif %f || POS %f ", kMoveMedium, resul_dif, pos);
                CCLOG(@"--------------------------------------------------------");
               
            }
            else{
                pos+=resul_dif*kSlow;
                time_efect=tFast;
                CCLOG(@"--------------------------------------------------------");
                CCLOG(@"resul_dif<KmoveSlow :=  kSlow %f  || resul_dif %f || POS %f ", kSlow, resul_dif, pos);
                CCLOG(@"--------------------------------------------------------");
                

            }
            if(pos > limitMoveLeft){
                pos =limitMoveLeft;
            }
            CCLOG(@"moveLeft   este es el POS %f y este el resul_dif %f TIME EFECT %f", pos, resul_dif, time_efect);
            [self moveMenu_withMenu: menu withXpox:pos withYpos:AHalfWinSizeY withTimeTransition:time_efect];
        }
    }
}

*/
- (void)onExit {
  	//[self removeAllChildrenWithCleanup:YES];
  //  [[[CCDirector sharedDirector] openGLView] removeGestureRecognizer:_swipeLeftRecognizer];
   // [[[CCDirector sharedDirector] openGLView] removeGestureRecognizer:_swipeRightRecognizer];
    
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
   
    UITouch *touch = [touches anyObject];
    timem = touch.timestamp;
    resul_dif = timem - timei;
   // CCLOG(@"timem > %f  resul_dif>%f ", timem, resul_dif);
    [self removeChild:label cleanup:TRUE];

}


- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
   
    UITouch *touch = [touches anyObject];
    timei = touch.timestamp;
  
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
}

/*
- (void)handleLeftSwipe:(UISwipeGestureRecognizer *)swipeRecognizer {
    CCLOG(@"Swipe Left!");
    [self moveLeft];
    
}

- (void)handleRightSwipe:(UISwipeGestureRecognizer *)swipeRecognizer {
    CCLOG(@"Swipe Right!");
    [self moveRight];
    
}
 */
-(void) nothingHere: (id *) sender
{
    CCLOG(@"------------------- nothingHere ----------------------");
}


-(void) onPushSceneTranImage: (CCMenuItemImage *) sender
{
   //bool_swipe=NO;
    CCLOG(@" onPushSceneTranImage Tag sender: %i", [sender tag]);
    iactualPlate = [sender tag];
    [self desaparecerMenus];
    Plato *pl = [[Plato alloc]init];
    pl = [[DAOPlatos sharedInstance] getPlateById:[[NSString alloc]initWithFormat:@"%i", iactualPlate]];
   CCLOG(@" onPushSceneTranImage Vamos a ver si se hace algo  %@", pl.nombre);
    // [label_descripcion setString:[_rootViewController demeDescripcionPlatoPorId:@(iactualPlate)]];
    [label_descripcion setString:pl.descripcion];

    //[itemAux2 setNormalImage:[CCMenuItemImage itemWithNormalImage:[_rootViewController demeFuenteImagenGrandePlatoPorId:@(iactualPlate)] selectedImage:[_rootViewController demeFuenteImagenGrandePlatoPorId:@(iactualPlate)]]];
    [itemAux2 setNormalImage:[CCMenuItemImage itemWithNormalImage:pl.fuente_img_grande selectedImage:pl.fuente_img_grande]];
    
    NSString *_tipo = [_rootViewController demeTipoActual];
    BOOL _tipoBool = NO;
    if(_tipo == tipoBebidas) _tipoBool = YES;
    if(_tipo == tipoLicores) _tipoBool = YES;
    
    if(_tipoBool){
        // PENDIENTE: Configurar tipo de bebidas
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(loadDrinks:) userInfo:nil repeats:NO];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(aparecerElementos:) userInfo:nil repeats:NO];
    
    
}

- (void) loadDrinks:(id)arg{

    CCLOG(@" loadDrinks en SushiLayer sin implementar");
    //
    // Menú de bebidas
    //
    
    CCMenuItemLabel *itemLabelNameDrink, *itemLabelPrincipalPriceDrink, *itemLabelSecondPriceDrink;
    CCMenuItemImage *itemImageButtonAddDrink;
    CCLabelTTF *nameDrink, *principalPriceDrink, *secondPriceDrink;
    NSString *strNameDrink, *strPrincipalPriceDrink, *strSecondPriceDrink;
    
    menu_bebidas = [[CCMenu alloc]init];
    for (int i = 1; i <= numDrinks; i++) {
        
        nameDrink = [[CCLabelTTF alloc]initWithString:@"" fontName:font fontSize:_fontSizeNameDrink];
        principalPriceDrink = [[CCLabelTTF alloc]initWithString:@"" fontName:font fontSize:_fontSizePricesDrink];
        secondPriceDrink = [[CCLabelTTF alloc]initWithString:@"" fontName:font fontSize:_fontSizePricesDrink];
   /*
        strNameDrink = [_rootViewController demeNombrePlatoPorId:@(i+KindFactor)];
        [nombre_plato setString:strnombrePlato];
        
        int _tipo = [_rootViewController demeTipoActual];
        BOOL _tipoBool = YES;
        if(_tipo == tipoBebidas) _tipoBool = NO;
        if(_tipo == tipoLicores) _tipoBool = NO;
        
        if(_tipoBool){
            strprecioPlato = [[NSString alloc] initWithFormat:@"$ %i", [_rootViewController demePrecioPlatoPorId:@(i+KindFactor)]];
            [precio_plato setString:strprecioPlato];
        }
        itemNombrePlato = [CCMenuItemLabel itemWithLabel:nombre_plato target:self selector:@selector(onPushSceneTranLabel:)];
        itemPrecio = [CCMenuItemLabel itemWithLabel:precio_plato target:self selector:@selector(onPushSceneTranLabel:)];
        itemAux = [CCMenuItemImage itemWithNormalImage:[_rootViewController demeFuenteImagenPlatoPorId:@(i+KindFactor)] selectedImage:[_rootViewController demeFuenteImagenPlatoPorId:@(i+KindFactor)] target:self selector:@selector(onPushSceneTranImage:)];
        itemAux.tag=i+KindFactor;
        
        itemAux.position = CGPointMake(itemAux.position.x +(i*paddingPrincipalPlates), itemAux.position.y);
        itemNombrePlato.position = CGPointMake(itemNombrePlato.position.x +(i*paddingPrincipalPlates)+5, 165);
        itemPrecio.position = CGPointMake(itemPrecio.position.x +(i*paddingPrincipalPlates)+5, 148);
        
        [menu addChild:itemAux];
        [menu addChild:itemNombrePlato];
        [menu addChild:itemPrecio];
        */
    }
    
    //
    // Fin menú bebidas
    //

    
}


-(void)aparecerMenus:(id)arg{
    bool_swipe=YES;
    winSize = [[CCDirector sharedDirector] winSize];
    [self moveMenu_withMenu: menu withXpox:menu.position.x withYpos:AHalfWinSizeY withTimeTransition:1.0];
    
}

-(void)desaparecerMenus{
    bool_swipe=NO;
    winSize = [[CCDirector sharedDirector] winSize];
    
    [self moveMenu_withMenu: menu withXpox:menu.position.x withYpos:winSize.height+200 withTimeTransition:1.0];
    
}

-(void)aparecerElementos:(id)arg{
    winSize = [[CCDirector sharedDirector] winSize];

    [self moveMenu_withMenu:menu_platosgrandes withXpox:AHalfWinSizeX withYpos:menu_platosgrandes.position.y withTimeTransition:1.0];
    [self moveMenu_withMenu:menu_atras withXpox:940 withYpos:740 withTimeTransition:1.0];
    
    NSString *_tipo = [_rootViewController demeTipoActual];
    BOOL _tipoBool = YES;
    if(_tipo == tipoBebidas) _tipoBool = NO;
    if(_tipo == tipoLicores) _tipoBool = NO;
    
    if(_tipoBool){
        
        [self moveMenu_withMenu:menu_detalles withXpox:posXShowBigPlatesDescription withYpos:posYBigPlatesDescription withTimeTransition:1.0];
        [self moveLabel:label_descripcion with_pox:posXShowBigPlatesDescription with_posy:posYBigPlatesDescription withTimeTransition:1.0];
        if ((![_rootViewController estaPlato:[[NSString alloc]initWithFormat:@"%i", iactualPlate]])&&(_rootViewController.demeNumeroPlatosEnOrden < 6)) {
            
                [self moveMenu_withMenu:menu_agregar withXpox:posXaparecerAgregar withYpos:posYaparecerAgregar withTimeTransition:1.0];
        }
    }

}

-(void)desaparecerElementos{
    winSize = [[CCDirector sharedDirector] winSize];
    
    [self moveMenu_withMenu:menu_platosgrandes withXpox:posXBigPlatesMenu withYpos:menu_platosgrandes.position.y withTimeTransition:1.0];
    [self moveMenu_withMenu:menu_detalles withXpox:posXdesaparecerDetalles withYpos:posYBigPlatesDescription withTimeTransition:1.0];
    [self moveMenu_withMenu:menu_atras withXpox:940 withYpos:winSize.height+100 withTimeTransition:1.0];
    [self moveMenu_withMenu:menu_agregar withXpox:posXdesaparecerAgregar withYpos:winSize.height+100 withTimeTransition:1.0];
    [self moveLabel:label_descripcion with_pox:posXdesaparecerDetalles with_posy:posYBigPlatesDescription withTimeTransition:1.0];
    
    iactualPlate = -1;
}

-(void)moveMenu_withMenu:(CCMenu *)_menu withXpox:(float) _posx withYpos:(float)_posyA withTimeTransition:(float)_time{
    CCLOG(@" moveMenu_withMenu %f", pos);
    id mover = [CCMoveTo actionWithDuration:_time position:ccp(_posx,_posyA)];
    
    [_menu runAction:mover];
}


-(void) moveSprite:(CCSprite *)_sprite with_pox:(float)_posx with_posy:(float)_posy withTimeTransition:(float)_time{
    id mover3 = [CCMoveTo actionWithDuration:_time position:ccp(_posx,_posy)];
    [_sprite runAction:mover3];
}

-(void) moveLabel:(CCLabelTTF *)_label with_pox:(float)_posx with_posy:(float)_posy withTimeTransition:(float)_time{
    id move= [CCMoveTo actionWithDuration:_time position:ccp(_posx,_posy)];
    [_label runAction:move];
}

-(void) moveItemImage:(CCMenuItemImage *)_itemImage with_pox:(float)_posx with_posy:(float)_posy withTimeTransition:(float)_time{
    id moveii = [CCMoveTo actionWithDuration:_time position:ccp(_posx,_posy)];
    [_itemImage runAction:moveii];
}

-(void) onGoBack:(id) sender
{
    [self desaparecerElementos];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(aparecerMenus:) userInfo:nil repeats:NO];
    
}

-(void) onAddPlate:(id) sender
{
    
    if (![_rootViewController estaPlato:[[NSString alloc]initWithFormat:@"%i", iactualPlate]]) {
        Plato *pl = [[DAOPlatos sharedInstance] getPlateById:[[NSString alloc]initWithFormat:@"%i", iactualPlate]];
        [_rootViewController agregarPlato:pl.id_plato];
        int numPlates = [_rootViewController demeNumeroPlatosEnOrden];
        [self loadPlateWithIdPlate:pl.id_plato withSourceImg:pl.fuente_img_peq withSourceClose:btnClose withPrice:pl.precio withKindPlate:pl.tipo withName:pl.nombre withNum:numPlates];
        [self updateTotalBill];
        //RETIRO EL BOTON DE AGREGAR
        [self moveMenu_withMenu:menu_agregar withXpox:posXdesaparecerAgregar withYpos:winSize.height+100 withTimeTransition:1.0];
        if(menu_barra.position.y!=120){
            [self onUpDown:self];
        }
        
    }
    
}



-(void) loadMenuResume{
    Plato *platoTemp = [[Plato alloc]init];
    int cantidadPlatos = [_rootViewController demeNumeroPlatosEnOrden];
    for (int n=0; n<cantidadPlatos; n++) {
        platoTemp = [_rootViewController demeDatosPlatoEnUbicacion:n];
        CCLOG(@"tipo plato caragdo ID %@ TIPO %@", platoTemp.id_plato, platoTemp.tipo);
        [self loadPlateWithIdPlate:platoTemp.id_plato withSourceImg:platoTemp.fuente_img_peq withSourceClose:btnClose withPrice:platoTemp.precio withKindPlate: platoTemp.tipo withName:platoTemp.nombre withNum: (n+1)];
    }
}

-(void)loadPlateWithIdPlate:(NSString *) _idPlate withSourceImg:(NSString *) _sourceImg withSourceClose:(NSString *) _sourceImgClose withPrice:(int) _price withKindPlate:(NSString *) _tipo withName:(NSString *)_name withNum:(int)_num{
    CCMenuItemImage *itemImg, *itemCerrar;
    CCMenuItemLabel *itemPrecio, *itemName;
    
    //Creo una imagen para agregar al menu
    itemImg = [CCMenuItemImage itemWithNormalImage:_sourceImg selectedImage:_sourceImg target:nil selector:nil];
    //asigno el id del plato actual en caso de necesitar eliminarlo
    itemImg.tag = [_idPlate intValue];
    
    //Creo una imagen para el btn cerrar
    itemCerrar = [CCMenuItemImage itemWithNormalImage:_sourceImgClose selectedImage:_sourceImgClose target:self selector:@selector(onDeletePlate:)];
    //asigno el mismo id que el de la imagen para cuando sea necesario eliminar la imagen
    itemCerrar.tag = [_idPlate intValue];
    itemCerrar.accessibilityValue = _tipo;
    
    //Creo un label para mostrar el valor del plato
    CCLabelTTF *precio_plato = [[CCLabelTTF alloc]initWithString:@"precio" fontName:font fontSize:_fontSizeOrderPrice];
    //traigo el precio del plato actual
    NSString *str_precio = [[NSString alloc]initWithFormat:@"$ %i", _price];
    [precio_plato setString:str_precio];
    //agrego el label al menu y le asigno el mismo id que las imagenes anteriores
    itemPrecio = [CCMenuItemLabel itemWithLabel:precio_plato];
    itemPrecio.tag = [_idPlate intValue];
    
    CCLabelTTF *name_plate = [[CCLabelTTF alloc]initWithString:@"precio" fontName:font fontSize:_fontSizeOrderName];
    [name_plate setString:_name];
    itemName = [CCMenuItemLabel itemWithLabel:name_plate];
    itemName.tag = [_idPlate intValue];
    
    itemImg.position = CGPointMake(itemImg.position.x +(_num*paddingTinyPlates), itemImg.position.y);
    itemName.position = CGPointMake(itemPrecio.position.x +(_num*paddingTinyPlates), -45);
    itemPrecio.position = CGPointMake(itemPrecio.position.x +(_num*paddingTinyPlates), -60);
    itemCerrar.position = CGPointMake(itemCerrar.position.x +(_num*paddingTinyPlates)+50, 35);
    
    
    [menu_pedidos addChild:itemImg];
    [menu_pedidos addChild:itemName];
    [menu_pedidos addChild:itemPrecio];
    [menu_pedidos addChild:itemCerrar];
    
}


-(void) updateTotalBill{
    NSString *str_total = [[NSString alloc]initWithFormat:@"$ %i", [_rootViewController demeTotalCuenta]];
    [label_total setString:str_total];
}

-(void) onDeletePlate:(id) sender
{
    CCLOG(@"onDeletePlate %i", [_rootViewController demeNumeroPlatosEnOrden]);
    NSInteger _tag = [sender tag];
    NSString *_kind_str = [sender accessibilityValue];
    NSInteger _kind = [_kind_str integerValue];
    
    
    [_rootViewController eliminarPlato:@([sender tag]) withKindPlate:_kind];
    [menu_pedidos removeAllChildrenWithCleanup:YES];
    [self loadMenuResume];
    NSString *str_total = [[NSString alloc]initWithFormat:@"$ %i", [_rootViewController demeTotalCuenta]];
    [label_total setString:str_total];
    
    
    if((iactualPlate == _tag)||(!([_rootViewController estaPlato:@(iactualPlate)])&&(iactualPlate!=-1)&&(_rootViewController.demeNumeroPlatosEnOrden < 6))){
        [self moveMenu_withMenu:menu_agregar withXpox:posXaparecerAgregar withYpos:posYaparecerAgregar withTimeTransition:1.0];
    }
    
}

-(void) onUpDown:(id) sender
{
    int posy = menu_barra.position.y;
    if(posy!=120){
        posy = 120;
        [item_up_down setNormalImage:[CCMenuItemImage itemWithNormalImage:DownImage selectedImage:DownImage]];
    }
    else {
        posy = -50;
        [item_up_down setNormalImage:[CCMenuItemImage itemWithNormalImage:upImage selectedImage:upImage]];
    }
    
    [self moveMenu_withMenu:menu_up_down withXpox:menu_up_down.position.x withYpos:posy+85 withTimeTransition:0.5];
    [self moveMenu_withMenu:menu_barra withXpox:menu_barra.position.x withYpos:posy withTimeTransition:0.5];
    [self moveMenu_withMenu:menu_pedidos withXpox:menu_pedidos.position.x withYpos:posy withTimeTransition:0.5];
    [self moveSprite: cuadro_total with_pox:cuadro_total.position.x with_posy:posy withTimeTransition:0.5];


}

- (void) dealloc
{
    
    [_swipeLeftRecognizer release];
    _swipeLeftRecognizer = nil;
    [_swipeRightRecognizer release];
    _swipeRightRecognizer = nil;
	[super dealloc];
}


@end
