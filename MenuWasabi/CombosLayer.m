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

#define AHalfWinSizeX 384
#define AHalfWinSizeY 512
#define WinSizeX 768
#define WinSizeY 1024

#define X_POS_COMBOS_LEFT -250
#define Y_POS_COMBOS_UP 200
#define X_POS_COMBO_M 0
#define Y_POS_COMBO_M 50
#define X_POS_COMBOS_RIGHT 250
#define Y_POS_COMBOS_DOWN -100

int numCombos = 5;
int _fontSizeTitleComboName = 16;
int _fontSizeTitleComboPrice = 14;

NSString *backgroundImageCombos = @"background_vert.jpg";
NSString *fontCombos = @"Helvetica";

CCMenu *principalMenu;
BOOL bool_swipe_combos = YES;

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
        bool_swipe_combos=YES;
        self.isTouchEnabled = YES;
        
        CCSprite *background;
        background = [CCSprite spriteWithFile:backgroundImageCombos rect:CGRectMake(0, 0, WinSizeX, WinSizeY)];
        background.position = ccp(AHalfWinSizeX, AHalfWinSizeY);
        [self addChild:background];
 
        CCMenuItemLabel *itemComboName1, *itemComboPrice1;
        CCMenuItemImage *itemComboImage1, *itemDescriptionSpace;
        CCLabelTTF *comboName1;
        CCLabelTTF *comboPrice1;
        NSString *strComboName1;
        NSString *strComboPrice1;
    
        principalMenu = [[CCMenu alloc]init];
    
        NSMutableArray *platos = [[NSMutableArray alloc]init];
        platos = [[DAOPlatos sharedInstance] getPlatesByKind:[_rootViewController demeTipoActual]];
        Plato *auxPlate = [[Plato alloc]init];
 
        for (int i=0; i<[platos count]; i++) {
            
            comboName1 = [[CCLabelTTF alloc]initWithString:@"" fontName:fontCombos fontSize:_fontSizeTitleComboName];
            comboPrice1 = [[CCLabelTTF alloc]initWithString:@"" fontName:fontCombos fontSize:_fontSizeTitleComboPrice];
 
            auxPlate = [platos objectAtIndex:i];
            //nombre
            strComboName1 = auxPlate.nombre;
            [comboName1 setString:strComboName1];
            itemComboName1 = [CCMenuItemLabel itemWithLabel:comboName1 target:self selector:@selector(nothingThere:)];
            //precio
            strComboPrice1 = [[NSString alloc]initWithFormat:@"%i", auxPlate.precio];
            [comboPrice1 setString:strComboPrice1];
            itemComboPrice1 = [CCMenuItemLabel itemWithLabel:comboPrice1 target:self selector:@selector(nothingThere:)];
            //imagen
            itemComboImage1 = [CCMenuItemImage itemWithNormalImage:auxPlate.fuente_img selectedImage:auxPlate.fuente_img target:self selector:@selector(onPushSceneTranLabel:)];
            itemComboImage1.tag = [auxPlate.id_plato intValue];
          //  itemDescriptionSpace = [CCMenuItemImage itemWithNormalImage:<#(NSString *)#> selectedImage:<#(NSString *)#>];
        
            if (i==0) {
                itemComboImage1.position = CGPointMake(X_POS_COMBOS_LEFT, Y_POS_COMBOS_UP);
                itemComboName1.position = CGPointMake(X_POS_COMBOS_LEFT, Y_POS_COMBOS_UP-100);
                itemComboPrice1.position = CGPointMake(X_POS_COMBOS_LEFT, Y_POS_COMBOS_UP-120);
            }
            else if (i==1){
                itemComboImage1.position = CGPointMake(X_POS_COMBOS_RIGHT, Y_POS_COMBOS_UP);
                itemComboName1.position = CGPointMake(X_POS_COMBOS_RIGHT, Y_POS_COMBOS_UP-100);
                itemComboPrice1.position = CGPointMake(X_POS_COMBOS_RIGHT, Y_POS_COMBOS_UP-120);
            }
            else if (i==2){
                itemComboImage1.position = CGPointMake(X_POS_COMBO_M, Y_POS_COMBO_M);
                itemComboName1.position = CGPointMake(X_POS_COMBO_M, Y_POS_COMBO_M-100);
                itemComboPrice1.position = CGPointMake(X_POS_COMBO_M, Y_POS_COMBO_M-120);
            
            }
            else if (i==3){
                itemComboImage1.position = CGPointMake(X_POS_COMBOS_LEFT, Y_POS_COMBOS_DOWN);
                itemComboName1.position = CGPointMake(X_POS_COMBOS_LEFT, Y_POS_COMBOS_DOWN-100);
                itemComboPrice1.position = CGPointMake(X_POS_COMBOS_LEFT, Y_POS_COMBOS_DOWN-120);
            }
            else if (i==4){
                itemComboImage1.position = CGPointMake(X_POS_COMBOS_RIGHT, Y_POS_COMBOS_DOWN);
                itemComboName1.position = CGPointMake(X_POS_COMBOS_RIGHT, Y_POS_COMBOS_DOWN-100);
                itemComboPrice1.position = CGPointMake(X_POS_COMBOS_RIGHT, Y_POS_COMBOS_DOWN-120);
            }
        
            [principalMenu addChild:itemComboImage1];
            [principalMenu addChild:itemComboName1];
            [principalMenu addChild:itemComboPrice1];
       
        }
        
        principalMenu.position = CGPointMake(AHalfWinSizeX, AHalfWinSizeY);
        [self addChild:principalMenu];

        
        
        
   }

    
    
    
    
    
    
    
    
    
    
    return self;
}


-(void) nothingThere{


}

-(void) onPushSceneTranImage: (CCMenuItemImage *) sender
{
    /*
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
    
    */
}


@end
