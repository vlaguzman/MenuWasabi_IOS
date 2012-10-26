//
//  CombosLayer.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 24/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CombosLayer.h"
#define AHalfWinSizeX 384
#define AHalfWinSizeY 512
#define WinSizeX 768
#define WinSizeY 1024

int numCombos = 5;
int _fontSizeTitleComboName = 16;
int _fontSizeTitleComboPrice = 14;

NSString *backgroundImageCombos = @"menu_combos.jpeg";
NSString *fontCombos = @"Helvetica";

CCMenu *principalMenu;

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
        self.isTouchEnabled = YES;
        
        CCSprite *background;
        background = [CCSprite spriteWithFile:backgroundImageCombos rect:CGRectMake(0, 0, WinSizeX, WinSizeY)];
        background.position = ccp(AHalfWinSizeX, AHalfWinSizeY);
        [self addChild:background];
 
    }
    
    //
    // IBA A ARMAR EL MENÚ DE COMBOS PERO PARA HACER EJEMPLOS NECESITO TENER LA BASE DE DATOS HECHA
    //
    
    CCMenuItemLabel *itemComboName1,*itemComboName2,*itemComboName3,*itemComboName4,*itemComboName5, *itemComboPrice1, *itemComboPrice2, *itemComboPrice3, *itemComboPrice4, *itemComboPrice5;
    CCMenuItemImage *itemComboImage1, *itemComboImage2, *itemComboImage3, *itemComboImage4, *itemComboImage5;
    CCLabelTTF *comboName1, *comboName2, *comboName3, *comboName4, *comboName5;
    CCLabelTTF *comboPrice1, *comboPrice2, *comboPrice3, *comboPrice4, *comboPrice5;
    NSString *strComboName1, *strComboName2, *strComboName3, *strComboName4, *strComboName5;
    NSString *strComboPrice1, *strComboPrice2, *strComboPrice3, *strComboPrice4, *strComboPrice5;
    
    principalMenu = [[CCMenu alloc]init];
    
  //  for (int n=1; n<=numCombos; n++) {
 
        comboName1 = [[CCLabelTTF alloc]initWithString:@"" fontName:fontCombos fontSize:_fontSizeTitleComboName];
        comboPrice1 = [[CCLabelTTF alloc]initWithString:@"" fontName:fontCombos fontSize:_fontSizeTitleComboPrice];
        comboName2 = [[CCLabelTTF alloc]initWithString:@"" fontName:fontCombos fontSize:_fontSizeTitleComboName];
        comboPrice2 = [[CCLabelTTF alloc]initWithString:@"" fontName:fontCombos fontSize:_fontSizeTitleComboPrice];
        comboName3 = [[CCLabelTTF alloc]initWithString:@"" fontName:fontCombos fontSize:_fontSizeTitleComboName];
        comboPrice3 = [[CCLabelTTF alloc]initWithString:@"" fontName:fontCombos fontSize:_fontSizeTitleComboPrice];
        comboName4 = [[CCLabelTTF alloc]initWithString:@"" fontName:fontCombos fontSize:_fontSizeTitleComboName];
        comboPrice4 = [[CCLabelTTF alloc]initWithString:@"" fontName:fontCombos fontSize:_fontSizeTitleComboPrice];
        comboName5 = [[CCLabelTTF alloc]initWithString:@"" fontName:fontCombos fontSize:_fontSizeTitleComboName];
        comboPrice5 = [[CCLabelTTF alloc]initWithString:@"" fontName:fontCombos fontSize:_fontSizeTitleComboPrice];
 /*
        strnombrePlato = [_rootViewController demeNombrePlatoPorId:@(i+KindFactor)];
        [nombre_plato setString:strnombrePlato];
        
        
        
   
            strprecioPlato = [[NSString alloc] initWithFormat:@"$ %i", [_rootViewController demePrecioPlatoPorId:@(i+KindFactor)]];
            [precio_plato setString:strprecioPlato];
        
        itemNombrePlato = [CCMenuItemLabel itemWithLabel:nombre_plato target:self selector:@selector(onPushSceneTranLabel:)];
        itemPrecio = [CCMenuItemLabel itemWithLabel:precio_plato target:self selector:@selector(onPushSceneTranLabel:)];
        itemAux = [CCMenuItemImage itemWithNormalImage:[_rootViewController demeFuenteImagenPlatoPorId:@(i+KindFactor)] selectedImage:[_rootViewController demeFuenteImagenPlatoPorId:@(i+KindFactor)] target:self selector:@selector(onPushSceneTranImage:)];
        itemAux.tag=i+KindFactor;
        
        itemAux.position = CGPointMake(itemAux.position.x +(i*paddingPrincipalPlates), itemAux.position.y);
        itemNombrePlato.position = CGPointMake(itemNombrePlato.position.x +(i*paddingPrincipalPlates), 165);
        itemPrecio.position = CGPointMake(itemPrecio.position.x +(i*paddingPrincipalPlates)+5, 148);
        
        [menu addChild:itemAux];
        [menu addChild:itemNombrePlato];
        [menu addChild:itemPrecio];
  */ 
  // }
    //
    //
    //
    return self;
}



@end
