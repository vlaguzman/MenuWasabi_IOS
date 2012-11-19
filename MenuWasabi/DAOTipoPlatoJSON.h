//
//  DAOTipoPlatoJSON.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 19/11/12.
//
//

#import <Foundation/Foundation.h>
#import "TipoPlato.h"

@interface DAOTipoPlatoJSON : NSObject
{
    NSMutableDictionary *tipoPlatoDictionary;
}

@property (nonatomic, strong) NSMutableDictionary *tipoPlatoDictionary;

+ (DAOTipoPlatoJSON*) sharedInstance;

- (void)loadTipoDatosFromServer;
- (int) getNumberOfKindPlates;
- (TipoPlato*) getTipoPlatoById:(NSString*) _idTipoPlato;

@end
