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


#define kMoveMedium 0.2
#define kMoveFast 0.05
#define kSlow     200
#define kMedium   3000
#define kFast     20000
#define tSlow     2
#define tMedium   1
#define tFast     0.5

#define fontSizeDescription 20

//Limites de la grilla de imagenes por el touch
#define limitMoveRightSushi 5250
#define limitMoveRightEntradas 1170
#define limitMoveLeftSushi -4165
#define limitMoveLeftEntradas -100


#define posInicial 100
#define paddingDescriptionPlatesMenu 500

//Padding asignado a los labels que contienen los precios
#define paddingBigPlatesMenuSushi 240
#define paddingBigPlatesMenuSopas 0
#define paddingBigPlatesMenuEntradas 240

#define paddingPrices 50
#define paddingNombresSushi 142
#define paddingNombresSopas 163
#define paddingNombresEntradas 170
#define paddingPrincipalPlatesSushi 100
#define paddingPrincipalPlatesEntradas 120

//Posiciones Nombres Menu
#define posXprincipalMenuSushi 130
#define posXBigPlatesMenuSushi 1200
#define posYBigPlatesMenuSushi -9850// Para bajar la primera imagen, disminuir el número
#define posXBigPlatesMenuEntradas 1200
#define posYBigPlatesMenuEntradas -1800
#define posXBigPlatesDescription -200
#define posXShowBigPlatesDescription 250
#define posYBigPlatesDescription 500
#define posXnombresSushi 140
#define posYnombresSushi 540
#define posXnombresSopas 510
#define posYnombresSopas 538

//Espacio entre platos grandes - factor para cuando se muestran los platos
#define spaceAmongBigPlatesSushi 538
#define spaceAmongBigPlatesEntradas 538 // 638 Si es necesario subir las imagenes, se aumenta el número

//Cada tipo de plato tiene un identificador para efecto de carag de imagenes
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

//Posiciones
int posXnombres=0;
int posYnombres=0;
int posXprincipalMenu = 0;
int limitMoveRight = 0, limitMoveLeft = 0;
int numPlates = 1;
int posXBigPlatesMenu = 0;
int posYPlatesMenu = 0;
int posYBigPlatesMenu = 0;
int paddingBigPlatesMenu = 0;
int paddingTinyPlates = 0;
int paddingClose = 0;
int paddingNombres = 0;
int paddingPrincipalPlates = 0;
// Valores Boton Agregar y dettalles producto
int posXaparecerDetalles = 250;
int posYaparecerDetalles = 500;
int posXdesaparecerDetalles = -200;
int posydesaparecerDetalles = 500;
int posXaparecerAgregar = 740;
int posYaparecerAgregar = 350;
int posXdesaparecerAgregar = 740;
//int posYBigPlatesDescription = ;

int spaceAmongBigPlates = 0;
//Nombres de archivos de imagenes

NSString *bigPlateDescription = @"descripcion.png";
NSString *btnClose = @"btn_cerrar.png";
NSString *fontTotal = @"Marker Felt";
NSString *fontNames = @"Marker Felt";
NSString *btnAddPlate = @"btn_agregar.png";
NSString *btnGoBack = @"btn_regresar.png";
NSString *sectionTinyPlates = @"barra_agregar.png";


CCSprite *plato_grande1, *descripcion, *cuadro_total;

CCLabelTTF *label, *label2;
CCLabelTTF *label_total, *label_descripcion;
CGPoint  initialPoint;
//CGFloat xVelocityA, xVelocityB;
float timei, timem, pos, resul_dif, time_efect;
int changedLevel;

int firstX, firstY, iactualPlate;


CGFloat finalX;
CGFloat finalY;
CGFloat animationDuration;

CCMenu *menu, *menu_nombres, *menu_atras, *menu_agregar, *menu_barra, *menu_pedidos, *menu_eliminar, *menu_platosgrandes, *menu_detalles;
CCMenu *menu_precios;
CGSize winSize;

CCMenu *menuprueba;
CCMenuItemImage *itemAux2;
BOOL bool_swipe = YES;


@implementation SushiLayer
@synthesize swipeLeftRecognizer = _swipeLeftRecognizer;
@synthesize swipeRightRecognizer = _swipeRightRecognizer;


-(void)changeValueNumPlates{
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    int tipoPlato = [[BrainMenu sharedInstance] tipoPlatoActual];
    if(tipoPlato == tipoSushi){
        numPlates = 39;
        
        posXBigPlatesMenu =posXBigPlatesMenuSushi;
        posYBigPlatesMenu=posYBigPlatesMenuSushi;
        
        posXprincipalMenu = posXprincipalMenuSushi;
        
        paddingBigPlatesMenu = paddingBigPlatesMenuSushi;
        paddingTinyPlates = 70;
        paddingClose = 100;
        paddingNombres = paddingNombresSushi;
        paddingPrincipalPlates = paddingPrincipalPlatesSushi;
        
        posXnombres = posXnombresSushi;
        posYnombres = posYnombresSushi;
     //   posYBigPlatesDescription = winSize.height/2;
        
        spaceAmongBigPlates = spaceAmongBigPlatesSushi;
        
        limitMoveLeft = limitMoveLeftSushi;
        limitMoveRight = limitMoveRightSushi;
    }
    else if (tipoPlato == tipoSopa){
        numPlates = 1;
        
        posXBigPlatesMenu =1200;
        posYBigPlatesMenu=400;
        
        paddingBigPlatesMenu = paddingBigPlatesMenuSopas;
        paddingTinyPlates = 50;
        paddingClose = 100;
        paddingNombres = paddingNombresSopas;
        
//        spaceAmongBigPlates = spaceAmongBigPlatesSushi; // SOLO HAY UN PLATO POR AHORA
        
        posXnombres = posXnombresSopas;
        posYnombres = posYnombresSopas;
        
    }
    else if (tipoPlato == tipoEntradas){
        numPlates = 8;
        
        posXBigPlatesMenu =posXBigPlatesMenuEntradas;
        posYBigPlatesMenu=posYBigPlatesMenuEntradas;
        paddingBigPlatesMenu = paddingBigPlatesMenuEntradas;
        
        paddingTinyPlates = 50;
        paddingClose = 100;
        paddingNombres = paddingNombresEntradas;
        paddingPrincipalPlates = paddingPrincipalPlatesEntradas;
        
        posXnombres = posXnombresSopas;
        posYnombres = posYnombresSopas;
     //   posYBigPlatesDescription =winSize.height/2;
        
        spaceAmongBigPlates = spaceAmongBigPlatesEntradas;
        
        limitMoveLeft = limitMoveLeftEntradas;
        limitMoveRight = limitMoveRightEntradas;
    }
}

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	// 'layer' is an autorelease object.
	SushiLayer *layer = [SushiLayer node];
	// add layer as a child to scene
	[scene addChild: layer];
	// return the scene
	return scene;
}

+(CCScene *) sceneWithVC:(RootViewController *)rootViewController
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	// 'layer' is an autorelease object.
    
    SushiLayer *layer = [[[SushiLayer alloc]
                               initWithVC:rootViewController] autorelease];
	// add layer as a child to scene
	[scene addChild: layer];
	// return the scene
	return scene;
}



-(id) initWithVC: (RootViewController *) rootViewController
{
    
    if( (self=[super init] )) {
        
        _rootViewController = rootViewController;
        
        [self changeValueNumPlates];
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        self.isTouchEnabled = YES;
        
        CCSprite *background0;
        background0 = [CCSprite spriteWithFile:@"fondo3.png" rect:CGRectMake(0, 0, 1024, 768)];
        background0.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background0];
        
        CCSprite *muro;
        muro = [CCSprite spriteWithFile:@"muro.jpg" rect:CGRectMake(0, 0, 1024, 270)];
        muro.position = ccp(winSize.width/2, 135);
        [self addChild:muro];
        
        CCSprite *piso;
        piso = [CCSprite spriteWithFile:@"piso.jpg" rect:CGRectMake(0, 0, 1024, 125)];
        piso.position = ccp(winSize.width/2, 249);
        [self addChild:piso];
        
        CCSprite *individual;
        individual = [CCSprite spriteWithFile:@"individual.png" rect:CGRectMake(0, 0, 448, 74)];
        individual.position = ccp(winSize.width/2, 249);
        [self addChild:individual];
        
      
        //Se agregan las imagenes de todos los platos al menu
        CCMenuItemImage *itemAux;
        menu = [[CCMenu alloc]init];
        for (int i = 1; i <= numPlates; i++) {
            itemAux = [CCMenuItemImage itemWithNormalImage:[_rootViewController demeFuenteImagenPlatoPorId:@(i)] selectedImage:[_rootViewController demeFuenteImagenPlatoPorId:@(i)] target:self selector:@selector(onPushSceneTran:)];
            itemAux.tag=i;
            [menu addChild:itemAux];
            
        }
        
        if (([[BrainMenu sharedInstance] tipoPlatoActual]) == tipoSushi)
            menu.position = CGPointMake(posXprincipalMenu, winSize.height/2);
        
        CCLOG(@"posx %i posy %i", menu.position.x, menu.position.y);
        [menu alignItemsHorizontallyWithPadding:paddingPrincipalPlates];
		[self addChild: menu];
        
        
        menu_nombres = [[CCMenu alloc]init];
        CCMenuItemLabel *itemPlato;
        CCLabelTTF *nombre_plato;
        NSString *strnombrePlato;
        for (int i = 1; i <= numPlates; i++) {
            nombre_plato = [[CCLabelTTF alloc]initWithString:@"nombre" fontName:fontNames fontSize:20];
            strnombrePlato = [_rootViewController demeNombrePlatoPorId:@(i)];
            [nombre_plato setString:strnombrePlato];
            itemPlato = [CCMenuItemLabel itemWithLabel:nombre_plato];
            [menu_nombres addChild:itemPlato];
        }
        menu_nombres.position = CGPointMake(posXnombres, posYnombres);
        [menu_nombres alignItemsHorizontallyWithPadding:paddingNombres];
        [self addChild:menu_nombres];
        
        menu_platosgrandes = [[CCMenu alloc]init];
        itemAux2 = [CCMenuItemImage itemWithNormalImage:@"anagomaki_big.png" selectedImage:@"anagomaki_big.png"];
        menu_platosgrandes.position = CGPointMake(posXBigPlatesMenu, winSize.height/2);
        [menu_platosgrandes addChild:itemAux2];
        
        [self addChild:menu_platosgrandes];

        menu_detalles = [[CCMenu alloc]init];
        itemAux =  [CCMenuItemImage itemWithNormalImage:bigPlateDescription selectedImage:bigPlateDescription target:self selector:@selector(onPushSceneTran:)];
        [menu_detalles addChild:itemAux];
        
        menu_detalles.position = CGPointMake(posXBigPlatesDescription, posYBigPlatesDescription);
        [menu_detalles alignItemsVerticallyWithPadding:paddingDescriptionPlatesMenu];
        [self addChild:menu_detalles];
                
        label_descripcion = [CCLabelTTF labelWithString:@"Total" fontName:fontNames fontSize:fontSizeDescription];
        label_descripcion.position =  ccp(posXBigPlatesDescription , posYBigPlatesDescription);
		[self addChild: label_descripcion];
        
        CCMenuItemImage *item_atras = [CCMenuItemImage itemWithNormalImage:btnGoBack selectedImage:btnGoBack target:self selector:@selector(onGoBack:)];
        
        //menu regresar oculto
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
        
       // [item_agregar setDisabledImage:@"p.png"];
       // item_agregar.opacity = [GLubyte alloc];
        
        CCMenuItemImage *item_barra = [CCMenuItemImage itemWithNormalImage:sectionTinyPlates selectedImage:sectionTinyPlates target:self selector:@selector(onUpDown:)];
        
        //menu agregar oculto
        menu_barra = [CCMenu menuWithItems:item_barra, nil];
        menu_barra.position = CGPointMake(winSize.width/2+10, -80);
        [menu_barra alignItemsVertically];
        [self addChild:menu_barra];
        
        menu_pedidos = [[CCMenu alloc]init];
        menu_pedidos.position = CGPointMake(350, -100);
       // [menu_pedidos alignItemsHorizontally];
        [self addChild:menu_pedidos];
        
        menu_eliminar = [[CCMenu alloc]init];
        menu_eliminar.position = CGPointMake(350, -100);
        [menu_eliminar alignItemsHorizontally];
        [self addChild:menu_eliminar];
        
        menu_precios = [[CCMenu alloc]init];
        menu_precios.position = CGPointMake(350, -100);
        [menu_precios alignItemsHorizontally];
        [self addChild:menu_precios];
        
        
        label_total = [CCLabelTTF labelWithString:@"Total" fontName:@"Marker Felt" fontSize:44];
		label_total.position =  ccp(900 , -100 );
		[self addChild: label_total];
    
        /*
         UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
         [panRecognizer setMinimumNumberOfTouches:1];
         [panRecognizer setMaximumNumberOfTouches:1];
         //[panRecognizer setDelegate:self];
         [[[CCDirector sharedDirector] openGLView] addGestureRecognizer:panRecognizer];
         [panRecognizer release];
         */
        self.swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveRight)];
        _swipeLeftRecognizer.numberOfTouchesRequired=1;
        _swipeLeftRecognizer.direction=UISwipeGestureRecognizerDirectionRight;
        [[[CCDirector sharedDirector] openGLView]  addGestureRecognizer:_swipeLeftRecognizer];
        [self.swipeLeftRecognizer release];
        
        self.swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveLeft)];
        _swipeRightRecognizer.numberOfTouchesRequired=1;
        _swipeRightRecognizer.direction=UISwipeGestureRecognizerDirectionLeft;
        [[[CCDirector sharedDirector] openGLView] addGestureRecognizer:_swipeRightRecognizer];
        [self.swipeRightRecognizer release];
        
        [self updateTotalBill];
        [self loadMenuResume];
    }
    
    return self;
}



/* FUNCION DE MOVIMIENTO USANDO EL PANUIGESTURE
-(void)move:(id)sender {
    
    [[[CCDirector sharedDirector] openGLView]bringSubviewToFront:[(UIPanGestureRecognizer*)sender view]];
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:[[CCDirector sharedDirector] openGLView]];
    
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        
        firstX = [[sender view] center].x;
        firstY = [[sender view] center].y;
    }
    
    translatedPoint = CGPointMake(firstX+translatedPoint.x, firstY);
    // Establece el centro de la imagen del fondo, para se movilizado
   // [[sender view] setCenter:translatedPoint];
    
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        
        CGFloat velocityX = [(UIPanGestureRecognizer*)sender velocityInView:[[CCDirector sharedDirector] openGLView]].x;
    
        CCLOG(@"--------------------------------------------");
        CCLOG(@"firstX x %f", firstX);
        CCLOG(@"translatedPoint, %f", translatedPoint.x);
        CCLOG(@"velocityX, %f", velocityX);
        float f = velocityX * 0.35;
        CCLOG(@"velocityX * 0.35, %f", f);
        float f2 = translatedPoint.x + f;
        CCLOG(@"final x %f", f2);
        finalX += translatedPoint.x + (velocityX * 0.35);
        finalY = firstY;
        
      //  CCLOG(@"VELOCODAD FinalX antes, %f", finalX);
        
        if(UIDeviceOrientationIsPortrait([[UIDevice currentDevice] orientation])) {
            if(finalX < 0) {
                //finalX = 0;
            }
            else if(finalX > 768) {
                //finalX = 768;
            }
            if(finalY < 0) {
                finalY = 0;
            }
            else if(finalY > 1024) {
                finalY = 1024;
            }
        }
        else {
            if(finalX < 0) {
                //finalX = 0;
            }
            else if(finalX > 1024) {
                //finalX = 768;
            }
            if(finalY < 0) {
                finalY = 0;
            }
            else if(finalY > 768) {
                finalY = 1024;
            }
        }
        
        animationDuration = (ABS(velocityX)*.0002)+.2;
        
        NSLog(@"the duration is: %f", animationDuration);
     //   CCLOG(@"VELOCODAD FinalX, %f", finalX);
         
         
        CCSprite *playertemp = [[CCSprite alloc]init];
        for(int i = 0; i < players.count; i++)
        {
            // CCLOG(@"Avanzar! %f", xVelocityB);
            id avanzar = [CCMoveTo actionWithDuration:animationDuration position:ccp(finalX+(200*i), finalY)];
            playertemp = [players objectAtIndex:i];
            [playertemp runAction:avanzar];
        }
      
         
        // Código para movilizar el fondo
         
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:animationDuration];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationDidFinish)];
        [[sender view] setCenter:CGPointMake(finalX, finalY)];
        [UIView commitAnimations];
       
    }
}
*/

-(void)moveRight{
 
    if(bool_swipe){
        winSize = [[CCDirector sharedDirector] winSize];
        if(resul_dif<kMoveFast){
            pos+=resul_dif*kFast;
            time_efect=tFast;
        }
        else if (resul_dif<kMoveMedium){
            pos+=resul_dif*kMedium;
            time_efect = tMedium;
        }
        else{
            pos+=resul_dif*kSlow;
            time_efect=tSlow;
        }
        if(pos > limitMoveRight ){
            pos = limitMoveRight;
        }
            [self delplazarMenu_withMenu: menu withXpox:pos withYpos:winSize.height/2 withTimeTransition:time_efect];
            [self delplazarMenu_withMenu: menu_nombres withXpox:pos withYpos:menu_nombres.position.y withTimeTransition:time_efect];
    }
}


-(void)moveLeft{
    if(bool_swipe){
        winSize = [[CCDirector sharedDirector] winSize];
        if(resul_dif<kMoveFast){
            pos-=resul_dif*kFast;
            time_efect=tFast;
        }
        else if (resul_dif<kMoveMedium){
            pos-=resul_dif*kMedium;
            time_efect = tMedium;
        }
        else{
            pos-=resul_dif*kSlow;
            time_efect=tFast;
        }
        if(pos < limitMoveLeft){
            pos =limitMoveLeft;
        }
        [self delplazarMenu_withMenu: menu withXpox:pos withYpos:winSize.height/2 withTimeTransition:time_efect];
        [self delplazarMenu_withMenu: menu_nombres withXpox:pos withYpos:menu_nombres.position.y withTimeTransition:time_efect];
    }
    
}


- (void)onExit {
  	//[self removeAllChildrenWithCleanup:YES];
    [[[CCDirector sharedDirector] openGLView] removeGestureRecognizer:_swipeLeftRecognizer];
    [[[CCDirector sharedDirector] openGLView] removeGestureRecognizer:_swipeRightRecognizer];
    
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
   
    UITouch *touch = [touches anyObject];
    timem = touch.timestamp;
    resul_dif = timem - timei;
    [self removeChild:label cleanup:TRUE];

}


- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
   
    UITouch *touch = [touches anyObject];
    timei = touch.timestamp;
  
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
}

- (void)handleLeftSwipe:(UISwipeGestureRecognizer *)swipeRecognizer {
    CCLOG(@"Swipe Left!");
    [self moveLeft];
    
}

- (void)handleRightSwipe:(UISwipeGestureRecognizer *)swipeRecognizer {
    CCLOG(@"Swipe Right!");
    [self moveRight];
    
}


-(void) onPushSceneTran: (CCMenuItemImage *) sender
{
    
    CCLOG(@" onPushSceneTran Tag sender: %i", [sender tag]);
    iactualPlate = [sender tag];
    [self desaparecerMenus];
    
   
    [label_descripcion setString:[_rootViewController demeDescripcionPlatoPorId:@(iactualPlate)]];
    [label_descripcion setString:@""];
    
    [itemAux2 setNormalImage:[CCMenuItemImage itemWithNormalImage:[_rootViewController demeFuenteImagenGrandePlatoPorId:@(iactualPlate)] selectedImage:[_rootViewController demeFuenteImagenGrandePlatoPorId:@(iactualPlate)]]];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(aparecerElementos:) userInfo:nil repeats:NO];
    
}

-(void)aparecerMenus:(id)arg{
    bool_swipe=YES;
    winSize = [[CCDirector sharedDirector] winSize];
    [self delplazarMenu_withMenu: menu withXpox:menu.position.x withYpos:winSize.height/2 withTimeTransition:1.0];
    [self delplazarMenu_withMenu: menu_nombres withXpox:menu_nombres.position.x withYpos:550 withTimeTransition:1.0];
}

-(void)desaparecerMenus{
    bool_swipe=NO;
    winSize = [[CCDirector sharedDirector] winSize];
    
    [self delplazarMenu_withMenu: menu withXpox:menu.position.x withYpos:winSize.height+200 withTimeTransition:1.0];
    [self delplazarMenu_withMenu: menu_nombres withXpox:menu_nombres.position.x withYpos:winSize.height+(550-184) withTimeTransition:1.0];
}

-(void)aparecerElementos:(id)arg{
    winSize = [[CCDirector sharedDirector] winSize];

    [self delplazarMenu_withMenu:menu_platosgrandes withXpox:winSize.width/2 withYpos:menu_platosgrandes.position.y withTimeTransition:1.0];
    
    [self delplazarMenu_withMenu:menu_detalles withXpox:posXShowBigPlatesDescription withYpos:posYBigPlatesDescription withTimeTransition:1.0];
    [self delplazarMenu_withMenu:menu_atras withXpox:940 withYpos:740 withTimeTransition:1.0];
    [self delplazarMenu_withMenu:menu_agregar withXpox:posXaparecerAgregar withYpos:posYaparecerAgregar withTimeTransition:1.0];
    
    [self moveLabel:label_descripcion with_pox:posXShowBigPlatesDescription with_posy:posYBigPlatesDescription withTimeTransition:1.0];
    
}

-(void)desaparecerElementos{
    winSize = [[CCDirector sharedDirector] winSize];
    
    [self delplazarMenu_withMenu:menu_platosgrandes withXpox:1200 withYpos:menu_platosgrandes.position.y withTimeTransition:1.0];
    [self delplazarMenu_withMenu:menu_detalles withXpox:posXdesaparecerDetalles withYpos:posYBigPlatesDescription withTimeTransition:1.0];
    [self delplazarMenu_withMenu:menu_atras withXpox:940 withYpos:winSize.height+100 withTimeTransition:1.0];
    [self delplazarMenu_withMenu:menu_agregar withXpox:posXdesaparecerAgregar withYpos:winSize.height+100 withTimeTransition:1.0];
    
    [self moveLabel:label_descripcion with_pox:posXdesaparecerDetalles with_posy:posYBigPlatesDescription withTimeTransition:1.0];

}

-(void)delplazarMenu_withMenu:(CCMenu *)_menu withXpox:(float) _posx withYpos:(float)_posyA withTimeTransition:(float)_time{
    CCLOG(@"Right %f", pos);
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

-(void) onGoBack:(id) sender
{
    [self desaparecerElementos];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(aparecerMenus:) userInfo:nil repeats:NO];
    
}

-(void) onAddPlate:(id) sender
{
    [_rootViewController agregarPlato:@(iactualPlate)];
    [self loadPlateWithIdPlate:iactualPlate withSourceImg:[_rootViewController demeFuenteImagenPequenoPlatoPorId:@(iactualPlate)] withSourceClose:btnClose withPrice:[_rootViewController demePrecioPlatoPorId:@(iactualPlate)]];
    [self updateTotalBill];
    
}



-(void) loadMenuResume{
    Plato *platoTemp = [[Plato alloc]init];
    int cantidadPlatos = [_rootViewController demeNumeroPlatosEnOrden];
    for (int n=0; n<cantidadPlatos; n++) {
        platoTemp = [_rootViewController demeDatosPlatoEnUbicacion:n];
        [self loadPlateWithIdPlate:platoTemp.id_plato withSourceImg:platoTemp.fuente_img_peq withSourceClose:btnClose withPrice:platoTemp.precio];
    }
}

-(void)loadPlateWithIdPlate:(int) _idPlate withSourceImg:(NSString *) _sourceImg withSourceClose:(NSString *) _sourceImgClose withPrice:(int) _price{
    CCMenuItemImage *itemImg, *itemCerrar;
    
    
    //Creo una imagen para agregar al menu
    itemImg = [CCMenuItemImage itemWithNormalImage:_sourceImg selectedImage:_sourceImg target:nil selector:nil];
    //asigno el id del plato actual en caso de necesitar eliminarlo
    // NSInteger num = [datosPlato objectAtIndex:0];
    itemImg.tag = _idPlate;
    //agrego la iamgen al menu de imagenes y organizo el menu
    [menu_pedidos addChild:itemImg];
    [menu_pedidos alignItemsHorizontallyWithPadding:paddingTinyPlates];
    
    //Creo una imagen para el btn cerrar
    itemCerrar = [CCMenuItemImage itemWithNormalImage:_sourceImgClose selectedImage:_sourceImgClose target:self selector:@selector(onDeletePlate:)];
    //asigno el mismo id que el de la imagen para cuando sea necesario eliminar la imagen
    itemCerrar.tag = _idPlate;
    //agrego la imagen a un menu que contiene los botones cerrar y lo organizo
    [menu_eliminar addChild:itemCerrar];
    [menu_eliminar alignItemsHorizontallyWithPadding:paddingClose];
    
    //Creo un label para mostrar el valor del plato
    CCLabelTTF *precio_plato = [[CCLabelTTF alloc]initWithString:@"precio" fontName:fontTotal fontSize:18];
    
    //rtaigo el precio del plato actual
    NSString *str_precio = [[NSString alloc]initWithFormat:@"$ %i", _price];
    CCLOG(@" Precio %@", str_precio);
    //agrego el precio al label creado
    [precio_plato setString:str_precio];
    
    CCMenuItemLabel *itemPrecio;
    //agrego el label a un menu y le asigno el mismo id que las imagenes anteriores
    itemPrecio = [CCMenuItemLabel itemWithLabel:precio_plato];
    itemPrecio.tag = _idPlate;
    [menu_precios addChild:itemPrecio];
    [menu_precios alignItemsHorizontallyWithPadding:paddingPrices];
}


-(void) updateTotalBill{
    NSString *str_total = [[NSString alloc]initWithFormat:@"$ %i", [_rootViewController demeTotalCuenta]];
    [label_total setString:str_total];
}

-(void) onDeletePlate:(id) sender
{
    NSInteger _tag = [sender tag];
    [_rootViewController eliminarPlato:@([sender tag])];
    [menu_pedidos removeChildByTag:_tag cleanup:YES];
    [menu_precios removeChildByTag:_tag cleanup:YES];
    [menu_eliminar removeChild:sender cleanup:YES];
    [menu_pedidos alignItemsHorizontallyWithPadding:paddingTinyPlates];
    [menu_eliminar alignItemsHorizontallyWithPadding:paddingClose];
    [menu_precios alignItemsHorizontallyWithPadding:paddingPrices];
    
    NSString *str_total = [[NSString alloc]initWithFormat:@"$ %i", [_rootViewController demeTotalCuenta]];
    [label_total setString:str_total];
    
}

-(void) onUpDown:(id) sender
{
    int posy = menu_barra.position.y;
    if(posy!=100) posy = 100;
    else posy = -80;
    
    [self delplazarMenu_withMenu:menu_barra withXpox:menu_barra.position.x withYpos:posy withTimeTransition:0.5];
    [self delplazarMenu_withMenu:menu_pedidos withXpox:menu_pedidos.position.x withYpos:posy withTimeTransition:0.5];
    [self delplazarMenu_withMenu:menu_eliminar withXpox:menu_eliminar.position.x withYpos:(posy + 40) withTimeTransition:0.5];
    [self delplazarMenu_withMenu:menu_precios withXpox:menu_precios.position.x withYpos:(posy- 55) withTimeTransition:0.5];
    [self moveSprite: cuadro_total with_pox:cuadro_total.position.x with_posy:posy withTimeTransition:0.5];
    [self moveLabel:label_total with_pox:label_total.position.x with_posy:posy-10 withTimeTransition:0.5];
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
