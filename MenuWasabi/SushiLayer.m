//
//  SushiLayer.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 21/09/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SushiLayer.h"
#import "Plato.h"
#import "AppDelegate.h"
#import "CCTouchDispatcher.h"
#import "CCActionInterval.h"



#define kMoveMedium 0.2
#define kMoveFast 0.05
#define kSlow     200
#define kMedium   3000
#define kFast     20000
#define tSlow     2
#define tMedium   1
#define tFast     0.5
#define espacio 120
#define posInicial 100
//Padding asignado a los labels que contienen los precios
#define paddingPrices 30
//Cada tipo de plato tiene un identificador para efecto de carag de imagenes
#define tipoSushi 1

CCSprite *plato_grande1, *descripcion, *cuadro_total;

CCLabelTTF *label, *label2;
CCLabelTTF *label_total;
CGPoint  initialPoint;
//CGFloat xVelocityA, xVelocityB;
float timei, timem, pos, resul_dif, time_efect;
int changedLevel;

int firstX, firstY, iactualPlate;


CGFloat finalX;
CGFloat finalY;
CGFloat animationDuration;

CCMenu *menu, *menu2, *menu_atras, *menu_agregar, *menu_barra, *menu_pedidos, *menu_eliminar;
CCMenu *menu_precios;
CGSize winSize;

BOOL bool_swipe = YES;


@implementation SushiLayer
@synthesize swipeLeftRecognizer = _swipeLeftRecognizer;
@synthesize swipeRightRecognizer = _swipeRightRecognizer;

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
        for (int i = 1; i <= 39; i++) {
            itemAux = [CCMenuItemImage itemWithNormalImage:[_rootViewController demeFuenteImagenPlatoPorId:@(i)] selectedImage:[_rootViewController demeFuenteImagenPlatoPorId:@(i)] target:self selector:@selector(onPushSceneTran:)];
            //itemAux.userObject=@(i);
            itemAux.tag=i;
            [menu addChild:itemAux];
            
        }
        
        [menu alignItemsHorizontallyWithPadding:espacio];
		[self addChild: menu];
        
        //Se genera un segundo menu para gregar los lugares dónde se pondrán los títulos de los platos
        menu2 = [[CCMenu alloc]init];
        for (int i = 1; i <= 39; i++) {
            itemAux = [CCMenuItemImage itemWithNormalImage:@"nombres.png" selectedImage:@"nombres.png" target:self selector:@selector(onPushSceneTran:)];
            [menu2 addChild:itemAux];
        }
            
        menu2.position = CGPointMake(500, 550);
		[menu2 alignItemsHorizontallyWithPadding:90];
		[self addChild: menu2];
        
        
        //Imagen del plato grande oculta
        plato_grande1 = [CCSprite spriteWithFile:@"plato_grande3.png" rect:CGRectMake(0, 0, 357, 275)];
        plato_grande1.position = ccp(-200, winSize.height/2);
        
        [self addChild:plato_grande1];
        
        //Descripción del plato grande oculta
        descripcion = [CCSprite spriteWithFile:@"plato_descripcion.png" rect:CGRectMake(0, 0, 204, 115)];
        descripcion.position = ccp(300, winSize.height+100);
        
        [self addChild:descripcion];
        
        CCMenuItemImage *item_atras = [CCMenuItemImage itemWithNormalImage:@"btn_regresar.png" selectedImage:@"btn_regresar.png" target:self selector:@selector(onGoBack:)];
        
        //menu regresar oculto
        menu_atras = [CCMenu menuWithItems:item_atras, nil];
        menu_atras.position = CGPointMake(940, winSize.height+100);
        [menu_atras alignItemsVertically];
        [self addChild:menu_atras];
        
        CCMenuItemImage *item_agregar = [CCMenuItemImage itemWithNormalImage:@"btn_agregar.png" selectedImage:@"btn_agregar.png" target:self selector:@selector(onAddPlate:)];
        
        //menu agregar oculto
        menu_agregar = [CCMenu menuWithItems:item_agregar, nil];
        menu_agregar.position = CGPointMake(640, winSize.height+100);
        [menu_agregar alignItemsVertically];
        [self addChild:menu_agregar];
        
        
        CCMenuItemImage *item_barra = [CCMenuItemImage itemWithNormalImage:@"barra_agregar.png" selectedImage:@"barra_agregar.png" target:self selector:@selector(onUpDown:)];
        
        //menu agregar oculto
        menu_barra = [CCMenu menuWithItems:item_barra, nil];
        menu_barra.position = CGPointMake(winSize.width/2+10, -100);
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
        
        cuadro_total = [CCSprite spriteWithFile:@"nombres.png" rect:CGRectMake(0, 0, 188, 64)];
        cuadro_total.position = ccp(840, -100);
        [self addChild:cuadro_total];
        
        label_total = [CCLabelTTF labelWithString:@"Total" fontName:@"Marker Felt" fontSize:44];
		label_total.position =  ccp(840 , -100 );
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
        if(pos > 5400 ){
            pos = 5400;
        }
            [self delplazarMenu_withMenu: menu withXpox:pos withYpos:winSize.height/2 withTimeTransition:time_efect];
            [self delplazarMenu_withMenu: menu2 withXpox:pos withYpos:550 withTimeTransition:time_efect];
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
        if(pos < -4355){
            pos =-4355;
        }
        [self delplazarMenu_withMenu: menu withXpox:pos withYpos:winSize.height/2 withTimeTransition:time_efect];
        [self delplazarMenu_withMenu: menu2 withXpox:pos withYpos:550 withTimeTransition:time_efect];
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
    CCLOG(@" TITLE %@", [sender userObject]);
    iactualPlate = [sender tag];
    [self desaparecerMenus];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(aparecerElementos:) userInfo:nil repeats:NO];
    
}

-(void)aparecerMenus:(id)arg{
    bool_swipe=YES;
    winSize = [[CCDirector sharedDirector] winSize];
    [self delplazarMenu_withMenu: menu withXpox:menu.position.x withYpos:winSize.height/2 withTimeTransition:1.0];
    [self delplazarMenu_withMenu: menu2 withXpox:menu2.position.x withYpos:550 withTimeTransition:1.0];
}

-(void)desaparecerMenus{
    bool_swipe=NO;
    winSize = [[CCDirector sharedDirector] winSize];
    
    [self delplazarMenu_withMenu: menu withXpox:menu.position.x withYpos:winSize.height+200 withTimeTransition:1.0];
    [self delplazarMenu_withMenu: menu2 withXpox:menu2.position.x withYpos:winSize.height+(550-184) withTimeTransition:1.0];
}

-(void)aparecerElementos:(id)arg{
    winSize = [[CCDirector sharedDirector] winSize];
    [self moveSprite: plato_grande1 with_pox:winSize.width/2 with_posy:winSize.height/2 withTimeTransition:1.0];
    [self moveSprite: descripcion with_pox:300 with_posy:500 withTimeTransition:1.0];
    [self delplazarMenu_withMenu:menu_atras withXpox:940 withYpos:740 withTimeTransition:1.0];
    [self delplazarMenu_withMenu:menu_agregar withXpox:640 withYpos:350 withTimeTransition:1.0];
}

-(void)desaparecerElementos{
    winSize = [[CCDirector sharedDirector] winSize];
    [self moveSprite: plato_grande1 with_pox:-200 with_posy:winSize.height/2 withTimeTransition:1.0];
    [self moveSprite: descripcion with_pox:300 with_posy:winSize.height+100 withTimeTransition:1.0];
    [self delplazarMenu_withMenu:menu_atras withXpox:940 withYpos:winSize.height+100 withTimeTransition:1.0];
    [self delplazarMenu_withMenu:menu_agregar withXpox:640 withYpos:winSize.height+100 withTimeTransition:1.0];

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
    CCMenuItemImage *itemImg, *itemCerrar;
    CCMenuItemLabel *itemPrecio;
    
    
    itemImg = [CCMenuItemImage itemWithNormalImage:@"btn_sushi.png" selectedImage:@"btn_sushi.png" target:nil selector:nil];
    itemImg.tag = iactualPlate;
    [menu_pedidos addChild:itemImg];
    [menu_pedidos alignItemsHorizontally];
    
    itemCerrar = [CCMenuItemImage itemWithNormalImage:@"btn_cerrar.png" selectedImage:@"btn_cerrar.png" target:self selector:@selector(onDeletePlate:)];
    itemCerrar.tag = iactualPlate;
    [menu_eliminar addChild:itemCerrar];
    [menu_eliminar alignItemsHorizontally];
    
    CCLabelTTF *precio_plato = [[CCLabelTTF alloc]initWithString:@"precio" fontName:@"Marker Felt" fontSize:18];
    
    NSString *str_precio = [[NSString alloc]initWithFormat:@"$ %i", [_rootViewController demePrecioPlatoPorId:@(iactualPlate)]];
    CCLOG(@" Precio %@", str_precio);
    [precio_plato setString:str_precio];
    
    itemPrecio = [CCMenuItemLabel itemWithLabel:precio_plato];
    itemPrecio.tag = iactualPlate;
    [menu_precios addChild:itemPrecio];
    [menu_precios alignItemsHorizontallyWithPadding:paddingPrices];
    [self updateTotalBill];
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
    [menu_pedidos alignItemsHorizontally];
    [menu_eliminar alignItemsHorizontally];
    [menu_precios alignItemsHorizontallyWithPadding:paddingPrices];
    
    NSString *str_total = [[NSString alloc]initWithFormat:@"$ %i", [_rootViewController demeTotalCuenta]];
    [label_total setString:str_total];
    
}

-(void) onUpDown:(id) sender
{
    int posy = menu_barra.position.y;
    if(posy!=80) posy = 80;
    else posy = -100;
    
    [self delplazarMenu_withMenu:menu_barra withXpox:menu_barra.position.x withYpos:posy withTimeTransition:0.5];
    [self delplazarMenu_withMenu:menu_pedidos withXpox:menu_pedidos.position.x withYpos:posy withTimeTransition:0.5];
    [self delplazarMenu_withMenu:menu_eliminar withXpox:menu_eliminar.position.x withYpos:(posy + 80) withTimeTransition:0.5];
    [self delplazarMenu_withMenu:menu_precios withXpox:menu_precios.position.x withYpos:(posy- 55) withTimeTransition:0.5];
    [self moveSprite: cuadro_total with_pox:cuadro_total.position.x with_posy:posy withTimeTransition:0.5];
    [self moveLabel:label_total with_pox:label_total.position.x with_posy:posy withTimeTransition:0.5];
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
