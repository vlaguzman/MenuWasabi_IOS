//
//  DAOPlatosJSON.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 19/11/12.
//
//

#import <Foundation/Foundation.h>
#import "Plato.h"

@interface DAOPlatosJSON : NSObject
{
    NSMutableArray *platesArray;
}

@property (nonatomic, strong) NSMutableArray *platesArray;

+ (DAOPlatosJSON*)sharedInstance;
- (void)loadPlatesFromServer;

-(int) getNumberOfPlates;
- (int) getNumberOfPlatesByKind:(NSString *) _kind;


- (Plato*) getPlateById:(NSString*) _idPlate;
- (NSMutableArray*) getPlatesByKind:(NSString *) _kind;

@end
