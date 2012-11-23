//
//  DAOTipoPlato.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 30/10/12.
//
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "AppDelegate.h"
#import "TipoPlato.h"


@interface DAOTipoPlato : NSObject{
    AppController *appControler;
    NSMutableDictionary *tipoPlatoDictionary;
}

@property (nonatomic, strong) NSMutableDictionary *tipoPlatoDictionary;

+ (DAOTipoPlato*) sharedInstance;

- (void)loadTipoDatosFromDB;
- (int) getNumberOfKindPlates;
- (TipoPlato*) getTipoPlatoById:(NSString*) _idTipoPlato;

-(void)addTipoPlato;

@end
