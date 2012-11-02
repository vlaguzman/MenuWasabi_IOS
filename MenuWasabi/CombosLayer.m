//
//  CombosLayer.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 24/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CombosLayer.h"
#import "Plato.h"
#import "DAOPlatos.h"
#import "AppDelegate.h"


#define PADDING_TINY_PLATES 128

#define A_HALF_X_WIN_SIZE 384
#define A_HALF_Y_WIN_SIZE 512
#define X_WIN_SIZE 768
#define Y_WIN_SIZE 1024

#define X_POS_COMBOS_LEFT -250
#define Y_POS_COMBOS_UP 200
#define X_POS_COMBO_M 0
#define Y_POS_COMBO_M 50
#define X_POS_COMBOS_RIGHT 250
#define Y_POS_COMBOS_DOWN -100
#define DIFFERENCE_IMAGE_NAME 110
#define DIFFERENCE_IMAGE_PRICE 130
#define DIFFERENCE_IMAGE_SPACE_DESCRIPTION 120

static const ccColor3B cc_DARKRED={139,0,0};

int _fontSizeComboDescription = 16;
int _fontSizeTitleComboName = 16;
int _fontSizeTitleComboPrice = 14;
int _fontSizeOrderComboPrice = 14;
int _fontSizeOrderComboName = 13;
int _fontSizeTotalCombos = 34;

int actualCombo = 0;

NSString *backgroundImageCombos = @"background_vert.jpg";
NSString *fontCombos = @"Helvetica";
NSString *imageBtnGoBack = @"btn_regresar.png";
NSString *imageBtnAddPlate = @"btn_agregar.png";
NSString *imageBtnClose = @"btn_cerrar.png";
NSString *imageBtnMakeOrder = @"btn_hacerpedido.png";
NSString *imageBigPlateDescription = @"descripcion.png";
NSString *imageUpDown = @"flecha_total_up.png";
NSString *imageSectionTinyPlates = @"menu_pago.png";
NSString *imageSpaceNameDescription = @"nombres.png";

CCMenu *principalMenu, *bigPlateImage, *bigPlateDescription, *goBackMenu, *addPlateMenu, *orderMenu;
//BOOL bool_swipe_combos = YES;

CCMenuItemLabel *itemComboName1, *itemComboPrice1;
CCMenuItemImage *itemComboImage1, *itemNameSpace;
CCLabelTTF *comboName1,*comboPrice1, *labelTotal;
NSString *strComboName1;
NSString *strComboPrice1;

CCMenuItemLabel *itemComboDescription;
CCMenuItemImage *itemComboImage2, *itemImageDescriptionSpace;
CCLabelTTF *comboDescription;


@implementation CombosLayer

+(CCScene *) sceneWithVC:(RootViewController *)rootViewController
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	// 'layer' is an autorelease object.
    CombosLayer *layer = [[[CombosLayer alloc] initWithVC:rootViewController] autorelease];
	// add layer as a child to scene
	[scene addChild: layer];
	return scene;
}

-(id) initWithVC: (RootViewController *) rootViewController
{
    if( (self=[super init] )) {
        
        _rootViewController = rootViewController;
       // bool_swipe_combos=YES;
        self.isTouchEnabled = YES;
        
        CCSprite *background;
        background = [CCSprite spriteWithFile:backgroundImageCombos rect:CGRectMake(0, 0, X_WIN_SIZE, Y_WIN_SIZE)];
        background.position = ccp(A_HALF_X_WIN_SIZE, A_HALF_Y_WIN_SIZE);
        [self addChild:background];
 
        //
        //Principal menu items
        //
        
        principalMenu = [[CCMenu alloc]init];
    
        NSMutableArray *platos = [[NSMutableArray alloc]init];
        platos = [[DAOPlatos sharedInstance] getPlatesByKind:[_rootViewController demeTipoActual]];
        Plato *auxPlate = [[Plato alloc]init];
 
        for (int i=0; i<[platos count]; i++) {
            
            comboName1 = [[CCLabelTTF alloc]initWithString:@"" fontName:fontCombos fontSize:_fontSizeTitleComboName];
            comboPrice1 = [[CCLabelTTF alloc]initWithString:@"" fontName:fontCombos fontSize:_fontSizeTitleComboPrice];
 
            auxPlate = [platos objectAtIndex:i];
            //name
            strComboName1 = auxPlate.nombre;
            [comboName1 setString:strComboName1];
            itemComboName1 = [CCMenuItemLabel itemWithLabel:comboName1 target:self selector:@selector(nothingThere:)];
            //price
            strComboPrice1 = [[NSString alloc]initWithFormat:@"%i", auxPlate.precio];
            [comboPrice1 setString:strComboPrice1];
            itemComboPrice1 = [CCMenuItemLabel itemWithLabel:comboPrice1 target:self selector:@selector(nothingThere:)];
            //image
            itemComboImage1 = [CCMenuItemImage itemWithNormalImage:auxPlate.fuente_img selectedImage:auxPlate.fuente_img target:self selector:@selector(onPushSceneTranImage:)];
            itemComboImage1.tag = [auxPlate.id_plato intValue];
            itemNameSpace = [CCMenuItemImage itemWithNormalImage:imageSpaceNameDescription selectedImage:imageSpaceNameDescription];
            
            
            if (i==0) {
                itemComboImage1.position = CGPointMake(X_POS_COMBOS_LEFT, Y_POS_COMBOS_UP);
                itemComboName1.position = CGPointMake(X_POS_COMBOS_LEFT, Y_POS_COMBOS_UP-DIFFERENCE_IMAGE_NAME);
                itemComboPrice1.position = CGPointMake(X_POS_COMBOS_LEFT, Y_POS_COMBOS_UP-DIFFERENCE_IMAGE_PRICE);
                itemNameSpace.position = CGPointMake(X_POS_COMBOS_LEFT, Y_POS_COMBOS_UP-DIFFERENCE_IMAGE_SPACE_DESCRIPTION);
            }
            else if (i==1){
                itemComboImage1.position = CGPointMake(X_POS_COMBOS_RIGHT, Y_POS_COMBOS_UP);
                itemComboName1.position = CGPointMake(X_POS_COMBOS_RIGHT, Y_POS_COMBOS_UP-DIFFERENCE_IMAGE_NAME);
                itemComboPrice1.position = CGPointMake(X_POS_COMBOS_RIGHT, Y_POS_COMBOS_UP-DIFFERENCE_IMAGE_PRICE);
                itemNameSpace.position = CGPointMake(X_POS_COMBOS_RIGHT, Y_POS_COMBOS_UP-DIFFERENCE_IMAGE_SPACE_DESCRIPTION);
            }
            else if (i==2){
                itemComboImage1.position = CGPointMake(X_POS_COMBO_M, Y_POS_COMBO_M);
                itemComboName1.position = CGPointMake(X_POS_COMBO_M, Y_POS_COMBO_M-DIFFERENCE_IMAGE_NAME);
                itemComboPrice1.position = CGPointMake(X_POS_COMBO_M, Y_POS_COMBO_M-DIFFERENCE_IMAGE_PRICE);
                itemNameSpace.position =  CGPointMake(X_POS_COMBO_M, Y_POS_COMBO_M-DIFFERENCE_IMAGE_SPACE_DESCRIPTION);
            }
            else if (i==3){
                itemComboImage1.position = CGPointMake(X_POS_COMBOS_LEFT, Y_POS_COMBOS_DOWN);
                itemComboName1.position = CGPointMake(X_POS_COMBOS_LEFT, Y_POS_COMBOS_DOWN-DIFFERENCE_IMAGE_NAME);
                itemComboPrice1.position = CGPointMake(X_POS_COMBOS_LEFT, Y_POS_COMBOS_DOWN-DIFFERENCE_IMAGE_PRICE);
                itemNameSpace.position = CGPointMake(X_POS_COMBOS_LEFT, Y_POS_COMBOS_DOWN-DIFFERENCE_IMAGE_SPACE_DESCRIPTION);
            }
            else if (i==4){
                itemComboImage1.position = CGPointMake(X_POS_COMBOS_RIGHT, Y_POS_COMBOS_DOWN);
                itemComboName1.position = CGPointMake(X_POS_COMBOS_RIGHT, Y_POS_COMBOS_DOWN-DIFFERENCE_IMAGE_NAME);
                itemComboPrice1.position = CGPointMake(X_POS_COMBOS_RIGHT, Y_POS_COMBOS_DOWN-DIFFERENCE_IMAGE_PRICE);
                itemNameSpace.position =  CGPointMake(X_POS_COMBOS_RIGHT, Y_POS_COMBOS_DOWN-DIFFERENCE_IMAGE_SPACE_DESCRIPTION);
            }
        
            [principalMenu addChild:itemComboImage1];
            [principalMenu addChild:itemNameSpace];
            [principalMenu addChild:itemComboName1];
            [principalMenu addChild:itemComboPrice1];
       
        }
        
        principalMenu.position = CGPointMake(A_HALF_X_WIN_SIZE, A_HALF_Y_WIN_SIZE);
        [self addChild:principalMenu];
        

        //
        // Big plate image
        //
        bigPlateImage = [[CCMenu alloc]init];
        
        itemComboImage2 = [[CCMenuItemImage alloc]init];
        [bigPlateImage addChild:itemComboImage2];
        bigPlateImage.position = CGPointMake(X_WIN_SIZE+A_HALF_X_WIN_SIZE, A_HALF_Y_WIN_SIZE-50);
        
        [self addChild:bigPlateImage];
        
        //
        // Big plate description items
        //
        bigPlateDescription = [[CCMenu alloc]init];
        
        comboDescription = [CCLabelTTF  labelWithString:@"" dimensions:CGSizeMake(180, 100) hAlignment:UITextAlignmentCenter vAlignment:UITextAlignmentCenter fontName:fontCombos fontSize:_fontSizeComboDescription];
        itemImageDescriptionSpace = [CCMenuItemImage itemWithNormalImage:imageBigPlateDescription selectedImage:imageBigPlateDescription];
        itemComboDescription = [CCMenuItemLabel itemWithLabel:comboDescription];
        [bigPlateDescription addChild:itemImageDescriptionSpace];
        [bigPlateDescription addChild:itemComboDescription];
        bigPlateDescription.position = CGPointMake(-A_HALF_X_WIN_SIZE, A_HALF_Y_WIN_SIZE+150);
        
        [self addChild:bigPlateDescription];
        
        //
        // Go Back Menu
        //
        goBackMenu = [[CCMenu alloc]init];
        
        CCMenuItemImage *itemImageGoBack = [CCMenuItemImage itemWithNormalImage:imageBtnGoBack selectedImage:imageBtnGoBack target:self selector:@selector(onGoBack:)];
        
        goBackMenu = [CCMenu menuWithItems:itemImageGoBack, nil];
        goBackMenu.position = CGPointMake(X_WIN_SIZE-100, Y_WIN_SIZE+100);

        [self addChild:goBackMenu];
        
        //
        // Add Plate Menu
        //
        addPlateMenu = [[CCMenu alloc] init];
        
        CCMenuItemImage *itemImageAddPlate = [CCMenuItemImage itemWithNormalImage:imageBtnAddPlate selectedImage:imageBtnAddPlate target:self selector:@selector(onAddPlate:)];
        
        addPlateMenu = [CCMenu menuWithItems:itemImageAddPlate, nil];
        addPlateMenu.position = CGPointMake(A_HALF_X_WIN_SIZE+300, Y_WIN_SIZE+100);
        
        [self addChild:addPlateMenu];
        
        //
        // Menu actual order
        //
        
        orderMenu = [[CCMenu alloc] init];
        
        CCMenuItemImage *imgBtnTotal, *imgUpDown;
        CCMenuItemLabel *lblTotal;
        CCMenuItemImage *itemMenuOrder = [CCMenuItemImage itemWithNormalImage:imageSectionTinyPlates selectedImage:imageSectionTinyPlates];
        
        labelTotal = [CCLabelTTF labelWithString:@"" fontName:fontCombos fontSize:_fontSizeTotalCombos];
        [labelTotal setColor:cc_DARKRED];
        lblTotal = [CCMenuItemLabel itemWithLabel:labelTotal];
        
        imgBtnTotal = [CCMenuItemImage itemWithNormalImage:imageBtnMakeOrder selectedImage:imageBtnMakeOrder];
        imgUpDown =  [CCMenuItemImage itemWithNormalImage:imageUpDown selectedImage:imageUpDown target:self selector:@selector(onUpDown:)];
        
        imgBtnTotal.position = CGPointMake(X_POS_COMBOS_RIGHT, -140);
        lblTotal.position = CGPointMake(X_POS_COMBOS_RIGHT, -120);
        
        [orderMenu addChild:imgBtnTotal];
        [orderMenu addChild:lblTotal];
        [orderMenu addChild:imgUpDown];
        [orderMenu addChild:itemMenuOrder];
        orderMenu.position = CGPointMake(A_HALF_X_WIN_SIZE, -70);
        
        [self addChild:orderMenu];
        
   }

    return self;
}


-(void) nothingThere{

}

-(void) onPushSceneTranImage: (CCMenuItemImage *) sender
{
    CCLOG(@" onPushSceneTranImage Tag sender: %i", [sender tag]);
    actualCombo = [sender tag];
    [self hideMenus];
    Plato *combo = [[Plato alloc]init];
    combo = [[DAOPlatos sharedInstance] getPlateById:[[NSString alloc]initWithFormat:@"%i", actualCombo]];
    CCLOG(@" onPushSceneTranImage - Nombre combo  %@", combo.nombre);
    [itemComboDescription setString:combo.descripcion];    
    [itemComboImage2 setNormalImage:[CCMenuItemImage itemWithNormalImage:combo.fuente_img_grande selectedImage:combo.fuente_img_grande]];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showBigElements:) userInfo:nil repeats:NO];
    
}
-(void)showMenus:(id)arg{
       
    [self moveMenu_withMenu:principalMenu withXpox:principalMenu.position.x withYpos:A_HALF_Y_WIN_SIZE withTimeTransition:1.0];
    
}

-(void)hideMenus{
    [self moveMenu_withMenu:principalMenu withXpox:principalMenu.position.x withYpos:Y_WIN_SIZE+A_HALF_Y_WIN_SIZE withTimeTransition:1.0];
}

-(void)moveMenu_withMenu:(CCMenu *)_menu withXpox:(float) _posx withYpos:(float)_posyA withTimeTransition:(float)_time{
    id mover = [CCMoveTo actionWithDuration:_time position:ccp(_posx,_posyA)];
    [_menu runAction:mover];
}

-(void)showBigElements:(id)arg{
   
    [self moveMenu_withMenu:bigPlateImage withXpox:A_HALF_X_WIN_SIZE withYpos:bigPlateImage.position.y withTimeTransition:1.0];
    [self moveMenu_withMenu:bigPlateDescription withXpox:A_HALF_X_WIN_SIZE-200 withYpos:bigPlateDescription.position.y withTimeTransition:1.0];
    [self moveMenu_withMenu:goBackMenu withXpox:goBackMenu.position.x withYpos:Y_WIN_SIZE-50 withTimeTransition:1.0];
    [self moveMenu_withMenu:addPlateMenu withXpox:addPlateMenu.position.x withYpos:A_HALF_Y_WIN_SIZE-200 withTimeTransition:1.0];
    
}

-(void) onGoBack:(id) sender
{
    [self hideBigElements];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showMenus:) userInfo:nil repeats:NO];
    
}

-(void)hideBigElements{
      
    [self moveMenu_withMenu:bigPlateImage withXpox:X_WIN_SIZE+A_HALF_X_WIN_SIZE withYpos:bigPlateImage.position.y withTimeTransition:1.0];
    [self moveMenu_withMenu:bigPlateDescription withXpox:-A_HALF_X_WIN_SIZE withYpos:bigPlateDescription.position.y withTimeTransition:1.0];
    [self moveMenu_withMenu:goBackMenu withXpox:goBackMenu.position.x withYpos:Y_WIN_SIZE+100 withTimeTransition:1.0];
    [self moveMenu_withMenu:addPlateMenu withXpox:addPlateMenu.position.x withYpos:Y_WIN_SIZE+100 withTimeTransition:1.0];
        
    actualCombo = -1;
}
-(void) onAddPlate:(id) sender
{
    CCLOG(@"Click onAddPlate");
    if (![_rootViewController estaPlato:[[NSString alloc]initWithFormat:@"%i", actualCombo]]) {
        CCLOG(@"pasamos el if");
        Plato *combo = [[DAOPlatos sharedInstance] getPlateById:[[NSString alloc]initWithFormat:@"%i", actualCombo]];
        [_rootViewController agregarPlato:combo.id_plato];
        int numPlates = [_rootViewController demeNumeroPlatosEnOrden];
        [self loadPlateWithIdPlate:combo.id_plato withSourceImg:combo.fuente_img_peq withSourceClose:imageBtnClose withPrice:combo.precio withKindPlate:combo.tipo withName:combo.nombre withNum:numPlates];
        //[self updateTotalBill];
        //RETIRO EL BOTON DE AGREGAR
       // [self moveMenu_withMenu:addPlateMenu withXpox:posXdesaparecerAgregar withYpos:winSize.height+100 withTimeTransition:1.0];
        //if(menu_barra.position.y!=120){
          //  [self onUpDown:self];
        //}
        
    }
    
}

-(void)loadPlateWithIdPlate:(NSString *) _idPlate withSourceImg:(NSString *) _sourceImg withSourceClose:(NSString *) _sourceImgClose withPrice:(int) _price withKindPlate:(NSString *) _tipo withName:(NSString *)_name withNum:(int)_num{
    CCMenuItemImage *itemImg, *itemCerrar;
    CCMenuItemLabel *itemPrecio, *itemName;
    
    orderMenu = [[CCMenu alloc] init];
    
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
    CCLabelTTF *precio_plato = [[CCLabelTTF alloc]initWithString:@"precio" fontName:fontCombos fontSize:_fontSizeOrderComboPrice];
    
    //traigo el precio del plato actual
    NSString *str_precio = [[NSString alloc]initWithFormat:@"$ %i", _price];
    [precio_plato setString:str_precio];
    //agrego el label al menu y le asigno el mismo id que las imagenes anteriores
    itemPrecio = [CCMenuItemLabel itemWithLabel:precio_plato];
    itemPrecio.tag = [_idPlate intValue];
    
    CCLabelTTF *name_plate = [CCLabelTTF labelWithString:@"name" dimensions:CGSizeMake(120, 60) hAlignment:UITextAlignmentCenter vAlignment:UITextAlignmentCenter fontName:fontCombos fontSize:_fontSizeOrderComboName];
    
    [name_plate setString:_name];
    itemName = [CCMenuItemLabel itemWithLabel:name_plate];
    itemName.tag = [_idPlate intValue];
    
    itemImg.position = CGPointMake(itemImg.position.x +(_num*PADDING_TINY_PLATES), itemImg.position.y);
    itemName.position = CGPointMake(itemPrecio.position.x +(_num*PADDING_TINY_PLATES)+5, -45);
    itemPrecio.position = CGPointMake(itemPrecio.position.x +(_num*PADDING_TINY_PLATES), -70);
    itemCerrar.position = CGPointMake(itemCerrar.position.x +(_num*PADDING_TINY_PLATES)+50, 35);
    
    [orderMenu addChild:itemImg];
    [orderMenu addChild:itemName];
    [orderMenu addChild:itemPrecio];
    [orderMenu addChild:itemCerrar];
    
}


@end
