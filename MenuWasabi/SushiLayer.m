//
//  SushiLayer.m
//  MenuWasabi
//  Created by Vladimir Guzmán on 21/09/12.
//  Copyright 2012 3dementes All rights reserved.
//

#import "SushiLayer.h"
#import "Plato.h"
#import "TipoBebida.h"
#import "AppDelegate.h"
#import "CCTouchDispatcher.h"
#import "CCActionInterval.h"
#import "DAOTipoBebidasJSON.h"
#import "DAOPlatosJSON.h"
#import "DAOBebidasJSON.h"

#define kMoveMedium 0.2
#define kMoveFast 0.05
#define kSlow     200
#define kMedium   3000
#define kFast     20000
#define tSlow     2
#define tMedium   1
#define tFast     0.5

#define fontSizeDescription 14

//Limites de la grilla de imagenes por el touch
#define limitMoveLeftMenuFactor -240
#define limitMoveLeftMenuFactorSushi -249
#define limitMoveLeft 140

#define paddingDescriptionPlatesMenu 500

//Padding asignado a los labels que contienen los precios
#define paddingPrincipalPlates 250//

#define paddingTinyPlates 128

//Posiciones Nombres Menu
#define posXprincipalMenuOnePlate 510
#define posXprincipalMenuTwoPlates 380
#define posXprincipalMenuThreePlates 260
#define posXprincipalMenuMorePlates 140

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

#define AHalfWinSizeX 512
#define AHalfWinSizeY 384

#define X_POS_BEVERAGES_RIGHT -170
#define X_POS_BEVERAGES_LEFT 35
#define Y_POS_BEVERAGES_TOP 160
#define Y_POS_BEVERAGES_MTOP 55
#define Y_POS_BEVERAGES_MBOTTOM -50
#define Y_POS_BEVERAGES_BOTTOM -155
#define DIFFERENCE_X_POS_NAME 115
#define DIFFERENCE_X_POS_PRICE 55
#define DIFFERENCE_X_POS_BTN 55
#define DIFFERENCE_Y_POS_NAME 10
#define DIFFERENCE_Y_POS_PRICE -10
#define DIFFERENCE_Y_POS_BTN -30
#define PADDING_BEVERAGE_MENU 800
#define TEXT_FOOD @"comida"
#define TEXT_BEVERAGE @"bebida"

static const ccColor3B ccDARKRED={139,0,0};
//

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
int _fontSizeTitleName = 15;
int _fontSizeTitlePrice = 14;
int _fontSizeBeverageName = 12;
int _fontSizeBeveragePrice = 12;
int _fontSizeOrderPrice = 14;
int _fontSizeOrderName = 11;
int _fontSizePricesDrink = 10;
int _fontSizeNameDrink = 10;


//Nombres de archivos de imagenes
NSString *bigPlateImageDescription = @"descripcion.png";
NSString *btnHacerPedido = @"btn_hacerpedido.png";
NSString *btnClose = @"btn_cerrar.png";
NSString *btnCloseApp = @"btn_closeapp.png";
NSString *font = @"Helvetica";
//NSString *fontTotal = @"Marker Felt";
//NSString *fontNames = @"Marker Felt";

NSString *backgroundImage = @"bg_detalle.jpg";
NSString *btnAddPlate = @"btn_agregar.png";
NSString *btnAddBeverage = @"btn_agregar_bebidas.png";
NSString *btnGoBack = @"btn_regresar.png";
NSString *sectionTinyPlates = @"barra_agregar.png";
NSString *upImage = @"flecha_total_up.png";
NSString *DownImage = @"flecha_total.png";
NSString *thanxImage = @"fin_hor.png";
NSString *totalImage = @"total_a_pagar_h.png";
NSString *sectionLeftImage = @"left2.png";
NSString *fotter = @"pata_02.png";
NSString *flechaIzq = @"flecha_izq.png";
NSString *flechaDer = @"flecha_der.png";
NSString *textFotter = @" Domicilios: (+57)(1) 522 6412                                         Calle 109 # 17-55 piso 2, Bogotá. Ver mapa   info@wasabisushilounge.co                                                                                      Powered by 3dementes";
NSString *beverageBaseImage = @"base_bebidas.png";
NSString *flechaIzqBebidas = @"flecha_izq_bebidas.png";
NSString *flechaDerBebidas = @"flecha_der_bebidas.png";

CCSprite *plato_grande1, *descripcion, *cuadro_total;
CCSprite *spriteThanxsImage;

CCLabelTTF *label, *label2;
CCLabelTTF *label_descripcion, *label_fotter;
CCLabelTTF *label_total;
CGPoint  initialPoint;
float timei, timem, pos, resul_dif, time_efect;
int changedLevel, difPlatesNames;

int firstX, firstY, iactualPlate;
int numOfPages=0, actualPage=0;
int pos_izq = 0, pos_der = 0;

CGFloat finalX;
CGFloat finalY;
CGFloat animationDuration;

CCMenu *menu, *menu_bebidas, *menu_atras, *menu_agregar, *menu_barra, *menu_pedidos, *menu_platosgrandes, *menu_detalles, *menu_up_down, *menu_total, *menu_hacerpedido, *menu_flechas, *menu_bebidas_detalle, *menu_navegacion_bebidas, *menu_botones_agregar_bebidas;
CGSize winSize;

CCMenu *menuprueba;
CCMenuItemImage *itemAux2, *item_up_down;
BOOL bool_swipe = YES;
BOOL es_comida = YES;

NSString *tipoActual;
NSMutableArray *bebidas;
NSMutableDictionary *beveragesTypes, *validatorKind;
@implementation SushiLayer


-(void)changeValueNumPlates{
    NSMutableArray *platos = [[NSMutableArray alloc]init];
    platos = [[DAOPlatosJSON sharedInstance] getPlatesByKind:[_rootViewController demeTipoActual]];
    numPlates = [platos count];
    [self evalueNumPlates];
}

-(void)changeValueNumPlatesBeverages{
    beveragesTypes = [[NSMutableDictionary alloc]init];
    beveragesTypes = [[DAOTipoBebidasJSON sharedInstance] getBeverageTypesByKind:[_rootViewController demeTipoActual]];
    numPlates = [beveragesTypes count];
    [self evalueNumPlates];
}

-(void)evalueNumPlates{
    if (numPlates == 1) {
        posXprincipalMenu = posXprincipalMenuOnePlate;
    }
    else if (numPlates == 2){
        posXprincipalMenu = posXprincipalMenuTwoPlates;
    }
    else if (numPlates == 3){
        posXprincipalMenu = posXprincipalMenuThreePlates;
    }
    else if (numPlates >= 4){
        posXprincipalMenu = posXprincipalMenuMorePlates;
        limitMoveRight = ((numPlates-4) * limitMoveLeftMenuFactorSushi)+limitMoveLeft;
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
        es_comida = YES;
        bool_swipe = YES;
        actualPage=0;
        
        
        validatorKind = [[NSMutableDictionary alloc] init];
        _rootViewController = rootViewController;
        
        
        pos_der = _rootViewController.demeNumeroPlatosEnOrden + _rootViewController.demeNumeroBebidasEnOrden;
        
        tipoActual = [_rootViewController demeTipoActual];
        if(tipoActual == tipoBebidas) es_comida = NO;
        if(tipoActual == tipoLicores) es_comida = NO;
        if (es_comida) {
                [self changeValueNumPlates];
        }
        else {
            [self changeValueNumPlatesBeverages];
        }
        
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
        itemNombrePlato = [[CCMenuItemLabel alloc]init];
        itemPrecio = [[CCMenuItemLabel alloc]init];
        itemAux = [[CCMenuItemImage alloc]init];
        
        if (es_comida) {
            NSMutableArray *platos = [[NSMutableArray alloc]init];
            platos = [[DAOPlatosJSON sharedInstance] getPlatesByKind:[_rootViewController demeTipoActual]];
            Plato *auxPlate = [[Plato alloc]init];
        
            for (int i = 0; i < [platos count]; i++) {
            
                auxPlate = [platos objectAtIndex:i];
         
                nombre_plato = [CCLabelTTF labelWithString:@"" dimensions:CGSizeMake(165, 60) hAlignment:UITextAlignmentCenter vAlignment:UITextAlignmentCenter fontName:font fontSize:_fontSizeTitleName];
                precio_plato = [CCLabelTTF labelWithString:@"" dimensions:CGSizeMake(165, 60) hAlignment:UITextAlignmentCenter vAlignment:UITextAlignmentCenter fontName:font fontSize:_fontSizeTitlePrice];
                strnombrePlato = auxPlate.nombre;
                [nombre_plato setString:strnombrePlato];
                
                strprecioPlato = [[NSString alloc]initWithFormat:@"$ %i", auxPlate.precio];
                [precio_plato setString:strprecioPlato];
                
                itemNombrePlato = [CCMenuItemLabel itemWithLabel:nombre_plato target:self selector:@selector(onPushSceneTranLabel:)];
                itemPrecio = [CCMenuItemLabel itemWithLabel:precio_plato target:self selector:@selector(onPushSceneTranLabel:)];
            
                itemAux = [CCMenuItemImage itemWithNormalImage:auxPlate.fuente_img selectedImage:auxPlate.fuente_img target:self selector:@selector(onPushSceneTranImage:)];
                itemAux.tag=[auxPlate.id_plato intValue];
            
                itemAux.position = CGPointMake(itemAux.position.x +(i*paddingPrincipalPlates), itemAux.position.y);
                itemNombrePlato.position = CGPointMake(itemNombrePlato.position.x +(i*paddingPrincipalPlates), 168);
                itemPrecio.position = CGPointMake(itemPrecio.position.x +(i*paddingPrincipalPlates), 145);
            
                [menu addChild:itemAux];
                [menu addChild:itemNombrePlato];
                [menu addChild:itemPrecio];
            
            }
        }
        else {
          //  bebidas = [[NSMutableDictionary alloc]init];
            beveragesTypes = [[DAOTipoBebidasJSON sharedInstance] getBeverageTypesByKind:[_rootViewController demeTipoActual]];
            TipoBebida *auxTipoBebida = [[TipoBebida alloc]init];
            int i = 0;
            for (NSString* key in beveragesTypes) {
                auxTipoBebida = [beveragesTypes objectForKey:key];
                itemAux = [CCMenuItemImage itemWithNormalImage:auxTipoBebida.fuente_img selectedImage:auxTipoBebida.fuente_img target:self selector:@selector(onPushSceneTranImageBeverage:)];
                itemAux.tag=[auxTipoBebida.id_tipoBebida intValue];
                itemAux.position = CGPointMake(itemAux.position.x +(i*paddingPrincipalPlates), itemAux.position.y);
                
                [menu addChild:itemAux];
                i++;
            }
            
            menu_bebidas_detalle = [[CCMenu alloc]init];
            menu_bebidas_detalle.position = CGPointMake(posXBigPlatesMenu, AHalfWinSizeY); 
            [self addChild:menu_bebidas_detalle];
            
            menu_botones_agregar_bebidas = [[CCMenu alloc]init];
            menu_botones_agregar_bebidas.position = CGPointMake(posXBigPlatesMenu, AHalfWinSizeY); 
            [self addChild:menu_botones_agregar_bebidas];
            
            menu_navegacion_bebidas = [[CCMenu alloc]init];
            menu_navegacion_bebidas.position = CGPointMake(posXBigPlatesMenu, AHalfWinSizeY); 
            [self addChild:menu_navegacion_bebidas];
            
        }
     
        menu.position = CGPointMake(posXprincipalMenu, AHalfWinSizeY);
 		[self addChild: menu];
        //
        //Menú platos grandes
        //
        menu_platosgrandes = [[CCMenu alloc]init];
        itemAux2 = [[CCMenuItemImage alloc]init];
        menu_platosgrandes.position = CGPointMake(posXBigPlatesMenu, AHalfWinSizeY);
        [menu_platosgrandes addChild:itemAux2];
        [self addChild:menu_platosgrandes];
        //
        //Menú descipción platos grandes
        //
        menu_detalles = [[CCMenu alloc]init];
        CCMenuItemImage *itemBigPlateDescription;
        itemBigPlateDescription = [[CCMenuItemImage alloc]init];
        itemBigPlateDescription =  [CCMenuItemImage itemWithNormalImage:bigPlateImageDescription selectedImage:bigPlateImageDescription];
        [menu_detalles addChild:itemBigPlateDescription];
        menu_detalles.position = CGPointMake(posXBigPlatesDescription, posYBigPlatesDescription);
        [menu_detalles alignItemsVerticallyWithPadding:paddingDescriptionPlatesMenu];
        [self addChild:menu_detalles];
       
        label_descripcion = [CCLabelTTF labelWithString:@"Total" dimensions:CGSizeMake(180, 100) hAlignment:UITextAlignmentCenter vAlignment:UITextAlignmentCenter  fontName:font fontSize:fontSizeDescription];
        label_descripcion.position =  ccp(posXBigPlatesDescription , posYBigPlatesDescription);
        
		[self addChild: label_descripcion];
        //
        //Menú botón atrás
        //
        CCMenuItemImage *item_atras = [CCMenuItemImage itemWithNormalImage:btnGoBack selectedImage:btnGoBack target:self selector:@selector(onGoBack:)];
        menu_atras = [CCMenu menuWithItems:item_atras, nil];
        menu_atras.position = CGPointMake(940, winSize.height+100);
        [menu_atras alignItemsVertically];
        [self addChild:menu_atras];
        //
        //menu agregar oculto
        //
        CCMenuItemImage *item_agregar = [CCMenuItemImage itemWithNormalImage:btnAddPlate selectedImage:btnAddPlate target:self selector:@selector(onAddPlate:)];
        menu_agregar = [CCMenu menuWithItems:item_agregar, nil];
        menu_agregar.position = CGPointMake(640, winSize.height+100);
        [menu_agregar alignItemsVertically];
        [self addChild:menu_agregar];
        //
        //menu agregar oculto
        //
        menu_barra = [[CCMenu alloc]init];
        CCMenuItemImage *item_barra = [CCMenuItemImage itemWithNormalImage:sectionTinyPlates selectedImage:sectionTinyPlates];
        [menu_barra addChild:item_barra];
        menu_barra.position = CGPointMake(515, -50);
        [menu_barra alignItemsVertically];
        [self addChild:menu_barra];
        //
        // Menú inferior 
        //
        menu_up_down = [[CCMenu alloc]init];
        item_up_down =  [CCMenuItemImage itemWithNormalImage:upImage selectedImage:upImage target:self selector:@selector(onUpDown:)];
        [menu_up_down addChild:item_up_down];
        menu_up_down.position = CGPointMake(515, 35);
        [self addChild:menu_up_down];
        //
        //Menú grilla platos actuales
        //
        menu_pedidos = [[CCMenu alloc]init];
        menu_pedidos.position = CGPointMake(posXmenuPedidos+10-7, posYmenuPedidos);
        [self addChild:menu_pedidos];
        //
        //Menú total cuenta
        //
        menu_total = [[CCMenu alloc]init];
        CCMenuItemImage *imgTotal, *imgSectionLeft;
        CCMenuItemLabel *lblTotal;
        imgTotal = [CCMenuItemImage itemWithNormalImage:totalImage selectedImage:totalImage];
        imgSectionLeft = [CCMenuItemImage itemWithNormalImage:sectionLeftImage selectedImage:sectionLeftImage];
        label_total = [CCLabelTTF labelWithString:@"" fontName:font fontSize:_fontSizeTotal];
        [label_total setColor:ccDARKRED];
        lblTotal = [CCMenuItemLabel itemWithLabel:label_total];
        lblTotal.position = CGPointMake(-80, -32);
        imgSectionLeft.position = CGPointMake(-895, 0);
        [menu_total addChild:imgSectionLeft];
        [menu_total addChild:imgTotal];
        [menu_total addChild:lblTotal];
         menu_total.position = CGPointMake(903, posYmenuPedidos);
        [self addChild:menu_total];
        //
        //Menú botones desplazamiento
        //
        menu_flechas = [[CCMenu alloc]init];
        CCMenuItemImage *item_izq = [CCMenuItemImage itemWithNormalImage:flechaIzq selectedImage:flechaIzq target:self selector:@selector(moveLeftMenuActualPlates:)];
        CCMenuItemImage *item_der = [CCMenuItemImage itemWithNormalImage:flechaDer selectedImage:flechaDer target:self selector:@selector(moveRightMenuActualPlates:)];
        item_izq.position = CGPointMake(-500, -20);
        item_der.position = CGPointMake(270, -20);
        [menu_flechas addChild:item_izq];
        [menu_flechas addChild:item_der];
        menu_flechas.position = CGPointMake(515, posYmenuPedidos);
        [self addChild:menu_flechas];

        //
        //Menú Botón total cuenta
        //
        menu_hacerpedido = [[CCMenu alloc]init];
        CCMenuItemImage *imgBtnTotal;
        imgBtnTotal = [CCMenuItemImage itemWithNormalImage:btnHacerPedido selectedImage:btnHacerPedido target:self selector:@selector(makeOrder:)];
        imgBtnTotal.position = CGPointMake(-10, -50);
        [menu_hacerpedido addChild:imgBtnTotal];
        menu_hacerpedido.position = CGPointMake(903, posYmenuPedidos);
        [self addChild:menu_hacerpedido];
        //
        // Fotter
        //
        CCSprite *img_fotter;
        img_fotter = [CCSprite spriteWithFile:fotter rect:CGRectMake(0, 0, 1024, 26)];
        img_fotter.position = ccp(522, 5);
        [self addChild:img_fotter];
        label_fotter = [CCLabelTTF labelWithString:textFotter fontName:font fontSize:_fontSizeFotter];
		label_fotter.position =  ccp(522 , 8);
		[self addChild: label_fotter];
        //
        // Imagen "Gracias por su compra"
        //
        spriteThanxsImage = [CCSprite spriteWithFile:thanxImage rect:CGRectMake(0, 0, 1024, 768)];
        spriteThanxsImage.position = ccp(AHalfWinSizeX, -AHalfWinSizeY);
        [self addChild:spriteThanxsImage];
        
        //
        // Reconocimiento de toruch
        //
         UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
         [panRecognizer setMinimumNumberOfTouches:1];
         [panRecognizer setMaximumNumberOfTouches:1];
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
                
                [self moveMenu_withMenu: menu withXpox:pos withYpos:AHalfWinSizeY withTimeTransition:1];
            }
        }
    }
}

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

-(void) makeOrder: (id *) sender
{
    if ([_rootViewController createNewOrder] == 1) {
        [self moveSprite: spriteThanxsImage with_pox:AHalfWinSizeX with_posy:AHalfWinSizeY withTimeTransition:0.5];
        [_rootViewController hidePrincipalButton];
        [_rootViewController showCloseButton:470 withPosY:AHalfWinSizeY-45];
    }
}


-(void) onPushSceneTranImage: (CCMenuItemImage *) sender
{
    iactualPlate = [sender tag];
    [self desaparecerMenus];
    Plato *pl = [[Plato alloc]init];
    pl = [[DAOPlatosJSON sharedInstance] getPlateById:[[NSString alloc]initWithFormat:@"%i", iactualPlate]];
    [label_descripcion setString:pl.descripcion];
    [itemAux2 setNormalImage:[CCMenuItemImage itemWithNormalImage:pl.fuente_img_grande selectedImage:pl.fuente_img_grande]];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(aparecerElementos:) userInfo:nil repeats:NO];
    
}

-(void) onPushSceneTranImageBeverage: (CCMenuItemImage *) sender
{
    iactualPlate = [sender tag];
    [self desaparecerMenus];
    TipoBebida *auxTipoBebida = [[TipoBebida alloc]init];
    auxTipoBebida = [beveragesTypes objectForKey:[[NSString alloc]initWithFormat:@"%i", iactualPlate]];
    NSMutableArray *beverages = [[NSMutableArray alloc] init];
    beverages = [[DAOBebidasJSON sharedInstance] getBeveragesByType:iactualPlate];

    Bebida *auxBeverage = [[Bebida alloc]init];
    CCMenuItemLabel *itemBeverageName, *itemPrice;
    CCMenuItemImage *itemShape, *itemBtnAddBeverage;
    CCLabelTTF *beverage_name;
    CCLabelTTF *beverage_price;
    NSString *strBeverageName;
    NSString *strBeveragePrice;
    
    [menu_bebidas_detalle removeAllChildrenWithCleanup:YES];
    [menu_botones_agregar_bebidas removeAllChildrenWithCleanup:YES];
    
    CCMenuItemImage *beveragesBase;
   
    itemBeverageName = [[CCMenuItemLabel alloc]init];
    itemBtnAddBeverage = [[CCMenuItemImage alloc]init];
    itemPrice = [[CCMenuItemLabel alloc]init];
    itemShape = [[CCMenuItemImage alloc]init];
    int mod = 0;
    int page = 0;
    int previous_page = -1;
    
    for (int i = 0; i < [beverages count]; i++) {
        page = i/8;
        mod = i % 8;
        auxBeverage = [beverages objectAtIndex:i];

        
        beverage_name = [CCLabelTTF labelWithString:@"" dimensions:CGSizeMake(165, 60) hAlignment:UITextAlignmentLeft vAlignment:UITextAlignmentCenter fontName:font fontSize:_fontSizeBeverageName];
        beverage_price = [CCLabelTTF labelWithString:@"" dimensions:CGSizeMake(165, 60) hAlignment:UITextAlignmentCenter vAlignment:UITextAlignmentCenter fontName:font fontSize:_fontSizeBeveragePrice];
        
        strBeverageName = auxBeverage.nombre;
        [beverage_name setString:strBeverageName];
        strBeveragePrice = [[NSString alloc]initWithFormat:@"$ %i", auxBeverage.precio];
        [beverage_price setString:strBeveragePrice];
        
        itemBeverageName = [CCMenuItemLabel itemWithLabel:beverage_name];
        itemPrice = [CCMenuItemLabel itemWithLabel:beverage_price];
        itemShape = [CCMenuItemImage itemWithNormalImage:auxTipoBebida.fuente_img_grande selectedImage:auxTipoBebida.fuente_img_grande];
        //
        //Averiguar porqué estoy reduciendo en 1 el tag
        //

        
        itemBtnAddBeverage = [CCMenuItemImage itemWithNormalImage:btnAddBeverage selectedImage:btnAddBeverage target:self selector:@selector(onAddPlate:)];
        itemBtnAddBeverage.tag = [auxBeverage.id_bebida intValue];
        
        if (mod==0) {
            itemShape.position = CGPointMake(X_POS_BEVERAGES_RIGHT+(PADDING_BEVERAGE_MENU*page), Y_POS_BEVERAGES_TOP);
            itemBeverageName.position = CGPointMake(X_POS_BEVERAGES_RIGHT+DIFFERENCE_X_POS_NAME+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_TOP+DIFFERENCE_Y_POS_NAME);
            itemPrice.position = CGPointMake(X_POS_BEVERAGES_RIGHT+DIFFERENCE_X_POS_PRICE+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_TOP+DIFFERENCE_Y_POS_PRICE);
            itemBtnAddBeverage.position =  CGPointMake(X_POS_BEVERAGES_RIGHT+DIFFERENCE_X_POS_BTN+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_TOP+DIFFERENCE_Y_POS_BTN);
        }
        else if (mod==1){
            itemShape.position = CGPointMake(X_POS_BEVERAGES_RIGHT+(PADDING_BEVERAGE_MENU*page), Y_POS_BEVERAGES_MTOP);
            itemBeverageName.position = CGPointMake(X_POS_BEVERAGES_RIGHT+DIFFERENCE_X_POS_NAME+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_MTOP+DIFFERENCE_Y_POS_NAME);
            itemPrice.position = CGPointMake(X_POS_BEVERAGES_RIGHT+DIFFERENCE_X_POS_PRICE+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_MTOP+DIFFERENCE_Y_POS_PRICE);
            itemBtnAddBeverage.position =  CGPointMake(X_POS_BEVERAGES_RIGHT+DIFFERENCE_X_POS_BTN+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_MTOP+DIFFERENCE_Y_POS_BTN);
        }
        else if (mod==2){
            itemShape.position = CGPointMake(X_POS_BEVERAGES_RIGHT+(PADDING_BEVERAGE_MENU*page), Y_POS_BEVERAGES_MBOTTOM);
            itemBeverageName.position = CGPointMake(X_POS_BEVERAGES_RIGHT+DIFFERENCE_X_POS_NAME+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_MBOTTOM+DIFFERENCE_Y_POS_NAME);
            itemPrice.position = CGPointMake(X_POS_BEVERAGES_RIGHT+DIFFERENCE_X_POS_PRICE+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_MBOTTOM+DIFFERENCE_Y_POS_PRICE);
            itemBtnAddBeverage.position =  CGPointMake(X_POS_BEVERAGES_RIGHT+DIFFERENCE_X_POS_BTN+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_MBOTTOM+DIFFERENCE_Y_POS_BTN);        
        }
        else if (mod==3){
            itemShape.position = CGPointMake(X_POS_BEVERAGES_RIGHT+(PADDING_BEVERAGE_MENU*page), Y_POS_BEVERAGES_BOTTOM);
            itemBeverageName.position = CGPointMake(X_POS_BEVERAGES_RIGHT+DIFFERENCE_X_POS_NAME+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_BOTTOM+DIFFERENCE_Y_POS_NAME);
            itemPrice.position = CGPointMake(X_POS_BEVERAGES_RIGHT+DIFFERENCE_X_POS_PRICE+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_BOTTOM+DIFFERENCE_Y_POS_PRICE);
            itemBtnAddBeverage.position =  CGPointMake(X_POS_BEVERAGES_RIGHT+DIFFERENCE_X_POS_BTN+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_BOTTOM+DIFFERENCE_Y_POS_BTN);        
        }
        else if (mod==4){
            itemShape.position = CGPointMake(X_POS_BEVERAGES_LEFT+(PADDING_BEVERAGE_MENU*page), Y_POS_BEVERAGES_TOP);
            itemBeverageName.position = CGPointMake(X_POS_BEVERAGES_LEFT+DIFFERENCE_X_POS_NAME+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_TOP+DIFFERENCE_Y_POS_NAME);
            itemPrice.position = CGPointMake(X_POS_BEVERAGES_LEFT+DIFFERENCE_X_POS_PRICE+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_TOP+DIFFERENCE_Y_POS_PRICE);
            itemBtnAddBeverage.position =  CGPointMake(X_POS_BEVERAGES_LEFT+DIFFERENCE_X_POS_BTN+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_TOP+DIFFERENCE_Y_POS_BTN);
        }
        else if  (mod==5) {
            itemShape.position = CGPointMake(X_POS_BEVERAGES_LEFT+(PADDING_BEVERAGE_MENU*page), Y_POS_BEVERAGES_MTOP);
            itemBeverageName.position = CGPointMake(X_POS_BEVERAGES_LEFT+DIFFERENCE_X_POS_NAME+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_MTOP+DIFFERENCE_Y_POS_NAME);
            itemPrice.position = CGPointMake(X_POS_BEVERAGES_LEFT+DIFFERENCE_X_POS_PRICE+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_MTOP+DIFFERENCE_Y_POS_PRICE);
            itemBtnAddBeverage.position =  CGPointMake(X_POS_BEVERAGES_LEFT+DIFFERENCE_X_POS_BTN+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_MTOP+DIFFERENCE_Y_POS_BTN);
        }
        else if (mod==6){
            itemShape.position = CGPointMake(X_POS_BEVERAGES_LEFT+(PADDING_BEVERAGE_MENU*page), Y_POS_BEVERAGES_MBOTTOM);
            itemBeverageName.position = CGPointMake(X_POS_BEVERAGES_LEFT+DIFFERENCE_X_POS_NAME+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_MBOTTOM+DIFFERENCE_Y_POS_NAME);
            itemPrice.position = CGPointMake(X_POS_BEVERAGES_LEFT+DIFFERENCE_X_POS_PRICE+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_MBOTTOM+DIFFERENCE_Y_POS_PRICE);
            itemBtnAddBeverage.position =  CGPointMake(X_POS_BEVERAGES_LEFT+DIFFERENCE_X_POS_BTN+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_MBOTTOM+DIFFERENCE_Y_POS_BTN);
        }
        else if (mod==7){
            itemShape.position = CGPointMake(X_POS_BEVERAGES_LEFT+(PADDING_BEVERAGE_MENU*page), Y_POS_BEVERAGES_BOTTOM);
            itemBeverageName.position = CGPointMake(X_POS_BEVERAGES_LEFT+DIFFERENCE_X_POS_NAME+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_BOTTOM+DIFFERENCE_Y_POS_NAME);
            itemPrice.position = CGPointMake(X_POS_BEVERAGES_LEFT+DIFFERENCE_X_POS_PRICE+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_BOTTOM+DIFFERENCE_Y_POS_PRICE);
            itemBtnAddBeverage.position =  CGPointMake(X_POS_BEVERAGES_LEFT+DIFFERENCE_X_POS_BTN+(PADDING_BEVERAGE_MENU*page),Y_POS_BEVERAGES_BOTTOM+DIFFERENCE_Y_POS_BTN);        
        }
        

        if (previous_page!=page) {
            beveragesBase = [[CCMenuItemImage alloc] init];
            beveragesBase = [CCMenuItemImage itemWithNormalImage:beverageBaseImage selectedImage:beverageBaseImage]; 
            beveragesBase.position = ccp(page*PADDING_BEVERAGE_MENU ,0);
            [menu_bebidas_detalle addChild:beveragesBase];
        }
        
        [menu_bebidas_detalle addChild:itemShape];
        [menu_bebidas_detalle addChild:itemBeverageName];
        [menu_bebidas_detalle addChild:itemPrice];
        
        [menu_botones_agregar_bebidas addChild:itemBtnAddBeverage];
        
        
        previous_page = page;
        
    }
    numOfPages = page;
    if (page>0) {
        CCMenuItemImage *itemArrowLeftBeverage = [[CCMenuItemImage alloc]init];
        CCMenuItemImage *itemArrowRightBeverage = [[CCMenuItemImage alloc]init];
        itemArrowLeftBeverage = [CCMenuItemImage itemWithNormalImage:flechaIzqBebidas selectedImage:flechaIzqBebidas target:self selector:@selector(moveLeftBeverageMenu:)];
        itemArrowRightBeverage = [CCMenuItemImage itemWithNormalImage:flechaDerBebidas selectedImage:flechaDerBebidas target:self selector:@selector(moveRightBeverageMenu:)];
        itemArrowLeftBeverage.position = ccp(-250, 0);
        itemArrowRightBeverage.position = ccp(250, 0);
        [menu_navegacion_bebidas addChild:itemArrowLeftBeverage];
        [menu_navegacion_bebidas addChild:itemArrowRightBeverage];
    }
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(aparecerElementosBebidas:) userInfo:nil repeats:NO];

}


-(void)aparecerMenus:(id)arg{
    bool_swipe=YES;
    [self moveMenu_withMenu: menu withXpox:menu.position.x withYpos:AHalfWinSizeY withTimeTransition:1.0];
}

-(void)desaparecerMenus{
    bool_swipe=NO;
    winSize = [[CCDirector sharedDirector] winSize];
    [self moveMenu_withMenu:menu withXpox:menu.position.x withYpos:winSize.height+200 withTimeTransition:1.0];
}

-(void)aparecerElementos:(id)arg{
    [self moveMenu_withMenu:menu_platosgrandes withXpox:AHalfWinSizeX withYpos:menu_platosgrandes.position.y withTimeTransition:1.0];
    [self moveMenu_withMenu:menu_atras withXpox:940 withYpos:740 withTimeTransition:1.0];
    [self moveMenu_withMenu:menu_detalles withXpox:posXShowBigPlatesDescription withYpos:posYBigPlatesDescription withTimeTransition:1.0];
    [self moveLabel:label_descripcion with_pox:posXShowBigPlatesDescription with_posy:posYBigPlatesDescription withTimeTransition:1.0];
    [self moveMenu_withMenu:menu_agregar withXpox:posXaparecerAgregar withYpos:posYaparecerAgregar withTimeTransition:1.0];
}

-(void)aparecerElementosBebidas:(id)arg{
    [self moveMenu_withMenu:menu_bebidas_detalle withXpox:AHalfWinSizeX withYpos:menu_bebidas_detalle.position.y withTimeTransition:1.0];
    [self moveMenu_withMenu:menu_botones_agregar_bebidas withXpox:AHalfWinSizeX withYpos:menu_botones_agregar_bebidas.position.y withTimeTransition:1.0];
    
    [self moveMenu_withMenu:menu_navegacion_bebidas withXpox:AHalfWinSizeX withYpos:menu_navegacion_bebidas.position.y withTimeTransition:1.0];
    [self moveMenu_withMenu:menu_atras withXpox:940 withYpos:740 withTimeTransition:1.0];
}

-(void)desaparecerElementos{
    winSize = [[CCDirector sharedDirector] winSize];
    
    [self moveMenu_withMenu:menu_platosgrandes withXpox:posXBigPlatesMenu withYpos:menu_platosgrandes.position.y withTimeTransition:1.0];
    [self moveMenu_withMenu:menu_detalles withXpox:posXdesaparecerDetalles withYpos:posYBigPlatesDescription withTimeTransition:1.0];
    [self moveMenu_withMenu:menu_atras withXpox:940 withYpos:winSize.height+100 withTimeTransition:1.0];
    [self moveMenu_withMenu:menu_agregar withXpox:posXdesaparecerAgregar withYpos:winSize.height+100 withTimeTransition:1.0];
    [self moveLabel:label_descripcion with_pox:posXdesaparecerDetalles with_posy:posYBigPlatesDescription withTimeTransition:1.0];
    
    [self moveMenu_withMenu:menu_bebidas_detalle withXpox:posXBigPlatesMenu withYpos:menu_bebidas_detalle.position.y withTimeTransition:1.0];
    [self moveMenu_withMenu:menu_botones_agregar_bebidas withXpox:posXBigPlatesMenu withYpos:menu_botones_agregar_bebidas.position.y withTimeTransition:1.0];
    
    [self moveMenu_withMenu:menu_navegacion_bebidas withXpox:posXBigPlatesMenu withYpos:menu_navegacion_bebidas.position.y withTimeTransition:1.0];
    
    iactualPlate = -1;
}

-(void)moveMenu_withMenu:(CCMenu *)_menu withXpox:(float) _posx withYpos:(float)_posyA withTimeTransition:(float)_time{
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

-(void) moveLeftBeverageMenu:(id)sender
{
    if (actualPage>0) {
        [self moveMenu_withMenu:menu_bebidas_detalle withXpox:menu_bebidas_detalle.position.x+800 withYpos:menu_bebidas_detalle.position.y withTimeTransition:1.0];
        [self moveMenu_withMenu:menu_botones_agregar_bebidas withXpox:menu_botones_agregar_bebidas.position.x+800 withYpos:menu_botones_agregar_bebidas.position.y withTimeTransition:1.0];
        actualPage--;
    }

}

-(void) moveRightBeverageMenu:(id)sender
{
    if (actualPage<numOfPages) {
        [self moveMenu_withMenu:menu_bebidas_detalle withXpox:menu_bebidas_detalle.position.x-800 withYpos:menu_bebidas_detalle.position.y withTimeTransition:1.0];
        [self moveMenu_withMenu:menu_botones_agregar_bebidas withXpox:menu_botones_agregar_bebidas.position.x-800 withYpos:menu_botones_agregar_bebidas.position.y withTimeTransition:1.0];
        actualPage++;
    }


}

-(void) onGoBack:(id) sender
{
    actualPage = 0;
    [self desaparecerElementos];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(aparecerMenus:) userInfo:nil repeats:NO];
    
}

-(void) onAddPlate:(id) sender
{
    pos_der++;
    if (es_comida) {
        [_rootViewController agregarPlato:[[NSString alloc]initWithFormat:@"%i", iactualPlate]];
    }    
    else {
        [_rootViewController agregarBebida:[[NSString alloc]initWithFormat:@"%i", [sender tag]]];
    }
    [menu_pedidos removeAllChildrenWithCleanup:YES];    
      
     /*
      int numPlates = [_rootViewController demeNumeroPlatosEnOrden];
         int plateAmount = [_rootViewController demeCantidadPlatoPorId:pl.id_plato];
         if(plateAmount>1){
            [menu_pedidos removeAllChildrenWithCleanup:YES];
         }
          else {
            [self loadPlateWithIdPlate:pl.id_plato withSourceImg:pl.fuente_img_peq withSourceClose:btnClose withPrice:pl.precio withKindPlate:pl.tipo withName:pl.   nombre withNum:numPlates withAmount:plateAmount];
        }
      */
            
    [self updateTotalBill];
    if(menu_barra.position.y!=120){
        [self onUpDown:self];
    }
    [self loadMenuResume];
}



-(void)loadPlateWithIdPlate:(NSString *) _idPlate withSourceImg:(NSString *) _sourceImg withSourceClose:(NSString *) _sourceImgClose withPrice:(int) _price withKindPlate:(NSString *) _tipo withName:(NSString *)_name withNum:(int)_num withAmount:(int)_amount withKindFood:(NSString *) _kind_food{
    CCMenuItemImage *itemImg, *itemCerrar;
    CCMenuItemLabel *itemPrecio, *itemName, *itemAmount;
    
    //Creo una imagen para agregar al menu
    itemImg = [CCMenuItemImage itemWithNormalImage:_sourceImg selectedImage:_sourceImg target:nil selector:nil];
    //asigno el id del plato actual en caso de necesitar eliminarlo
    itemImg.tag = [_idPlate intValue];
    
    //Creo una imagen para el btn cerrar
    itemCerrar = [CCMenuItemImage itemWithNormalImage:_sourceImgClose selectedImage:_sourceImgClose target:self selector:@selector(onDeletePlate:)];
    //asigno el mismo id que el de la imagen para cuando sea necesario eliminar la imagen
    itemCerrar.tag = [_idPlate intValue];
    itemCerrar.accessibilityValue = _tipo;
    itemCerrar.accessibilityLanguage = _kind_food;
    
    //Creo un label para mostrar el valor del plato
    CCLabelTTF *precio_plato = [[CCLabelTTF alloc]initWithString:@"precio" fontName:font fontSize:_fontSizeOrderPrice];
    //traigo el precio del plato actual
    NSString *str_precio = [[NSString alloc]initWithFormat:@"$ %i", _price];
    [precio_plato setString:str_precio];
    //agrego el label al menu y le asigno el mismo id que las imagenes anteriores
    itemPrecio = [CCMenuItemLabel itemWithLabel:precio_plato];
    itemPrecio.tag = [_idPlate intValue];
    
    CCLabelTTF *name_plate = [CCLabelTTF labelWithString:@"name" dimensions:CGSizeMake(100, 60) hAlignment:UITextAlignmentCenter vAlignment:UITextAlignmentCenter fontName:font fontSize:_fontSizeOrderName];
    [name_plate setString:_name];
    itemName = [CCMenuItemLabel itemWithLabel:name_plate];
    itemName.tag = [_idPlate intValue];
    
    CCLabelTTF *amount_plates = [CCLabelTTF labelWithString:@"amount" fontName:font fontSize:_fontSizeOrderName];
    NSString *str_amount = [[NSString alloc]initWithFormat:@"x %i", _amount];
    [amount_plates setString:str_amount];
    itemAmount = [CCMenuItemLabel itemWithLabel:amount_plates];
    itemAmount.tag = [_idPlate intValue];
    
    itemImg.position = CGPointMake(itemImg.position.x +(_num*paddingTinyPlates), itemImg.position.y);
    itemAmount.position = CGPointMake(itemPrecio.position.x +(_num*paddingTinyPlates)+50, -30);
    itemName.position = CGPointMake(itemPrecio.position.x +(_num*paddingTinyPlates)+5, -45);
    itemPrecio.position = CGPointMake(itemPrecio.position.x +(_num*paddingTinyPlates), -70);
    itemCerrar.position = CGPointMake(itemCerrar.position.x +(_num*paddingTinyPlates)+50, 35);
    
    [menu_pedidos addChild:itemImg];
    [menu_pedidos addChild:itemAmount];
    [menu_pedidos addChild:itemName];
    [menu_pedidos addChild:itemPrecio];
    [menu_pedidos addChild:itemCerrar];
    
}

-(void) loadMenuResume{
    Plato *platoTemp = [[Plato alloc]init];
    int cantidadPlatos = [_rootViewController demeNumeroPlatosEnOrden];
    int num_p;
    
    for (num_p=0; num_p<cantidadPlatos; num_p++) {
        platoTemp = [_rootViewController demeDatosPlatoEnUbicacion:num_p];
        [self loadPlateWithIdPlate:platoTemp.id_plato withSourceImg:platoTemp.fuente_img_peq withSourceClose:btnClose withPrice:platoTemp.precio withKindPlate: platoTemp.tipo withName:platoTemp.nombre withNum: (num_p+1) withAmount:[_rootViewController demeCantidadPlatoPorId:platoTemp.id_plato] withKindFood:TEXT_FOOD];
    }
    
    Bebida *bebidaTemp = [[Bebida alloc]init];
    int cantidadBebidas = [_rootViewController demeNumeroBebidasEnOrden];
    TipoBebida *tipoBebidaTemp; 

    for (int n=0; n<cantidadBebidas; n++) {
        num_p++;
        bebidaTemp = [_rootViewController demeDatosBebidaEnUbicacion:n];
        int tipo_bebida = bebidaTemp.tipo;
        tipoBebidaTemp = [[DAOTipoBebidasJSON sharedInstance] getBeverageTypeById:[[NSString alloc] initWithFormat:@"%i",tipo_bebida]];
        [self loadPlateWithIdPlate:bebidaTemp.id_bebida withSourceImg:tipoBebidaTemp.fuente_img_peq withSourceClose:btnClose withPrice:bebidaTemp.precio withKindPlate: [[NSString alloc] initWithFormat:@"%i",bebidaTemp.tipo ] withName:bebidaTemp.nombre withNum: (num_p) withAmount:[_rootViewController demeCantidadBebidaPorId:bebidaTemp.id_bebida] withKindFood:TEXT_BEVERAGE];
        
    }
    
}

-(void) updateTotalBill{
    NSString *str_total = [[NSString alloc]initWithFormat:@"$ %i", [_rootViewController demeTotalCuenta]];
    [label_total setString:str_total];
}

-(void) onDeletePlate:(id) sender
{
    NSInteger _tag = [sender tag];
    NSString *_kind_str = [sender accessibilityValue];
    NSString *_kind_food = [sender accessibilityLanguage];

    if (_kind_food == TEXT_FOOD) {
        [_rootViewController eliminarPlato:[[NSString alloc]initWithFormat:@"%i", _tag] withKindPlate:_kind_str];
    }
    else{
        [_rootViewController deleteBeverage:[[NSString alloc]initWithFormat:@"%i", _tag] withBeverageType:_kind_str];
    }
    
    
    [menu_pedidos removeAllChildrenWithCleanup:YES];
    [self loadMenuResume];
    NSString *str_total = [[NSString alloc]initWithFormat:@"$ %i", [_rootViewController demeTotalCuenta]];
    [label_total setString:str_total];
    if ((_rootViewController.demeNumeroPlatosEnOrden + _rootViewController.demeNumeroBebidasEnOrden) <= 6) {
        [self moveMenu_withMenu:menu_pedidos withXpox:posXmenuPedidos withYpos:menu_pedidos.position.y withTimeTransition:1];
    }
    pos_der--;
    
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
    [self moveMenu_withMenu:menu_total withXpox:menu_total.position.x withYpos:posy withTimeTransition:0.5];
    [self moveMenu_withMenu:menu_hacerpedido withXpox:menu_total.position.x withYpos:posy withTimeTransition:0.5];
    [self moveMenu_withMenu:menu_flechas withXpox:menu_flechas.position.x withYpos:posy withTimeTransition:0.5];
    [self moveSprite: cuadro_total with_pox:cuadro_total.position.x with_posy:posy withTimeTransition:0.5];


}

-(void)moveLeftMenuActualPlates:(id) sender{
    NSLog(@"Antes Left  - pos der %i - pos izq %i", pos_der, pos_izq);
    if (((_rootViewController.demeNumeroPlatosEnOrden + _rootViewController.demeNumeroBebidasEnOrden) > 6)&&(pos_izq<0)) {
        [self moveMenu_withMenu:menu_pedidos withXpox:menu_pedidos.position.x+128 withYpos:menu_pedidos.position.y withTimeTransition:0.3];
        pos_der++;
        pos_izq++;
    }
     NSLog(@"Después Left  - pos der %i - pos izq %i", pos_der, pos_izq);
}


-(void)moveRightMenuActualPlates:(id) sender{
     NSLog(@"Antes Right  - pos der %i - pos izq %i", pos_der, pos_izq);
    if (((_rootViewController.demeNumeroPlatosEnOrden + _rootViewController.demeNumeroBebidasEnOrden)> 6)&&(pos_der > 6)) {
        
        [self moveMenu_withMenu:menu_pedidos withXpox:menu_pedidos.position.x-128 withYpos:menu_pedidos.position.y withTimeTransition:0.3];
        pos_izq--;
        pos_der--;
    }
     NSLog(@"Después Right  - pos der %i - pos izq %i", pos_der, pos_izq);
}


- (void) dealloc
{
	[super dealloc];
}


@end
