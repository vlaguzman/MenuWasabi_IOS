//
//  DAOPlatos.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 30/10/12.
//
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "AppDelegate.h"
#import "Plato.h"

@interface DAOPlatos : NSObject{
    AppController *appControler;
  //  NSMutableDictionary *platesDictionary;
    NSMutableArray *platesArray;
}

//@property (nonatomic, strong) NSMutableDictionary *platesDictionary;
@property (nonatomic, strong) NSMutableArray *platesArray;

+ (DAOPlatos*)sharedInstance;
- (void)loadPlatesFromDB;

-(int) getNumberOfPlates;
- (int) getNumberOfPlatesByKind:(NSString *) _kind;


- (Plato*) getPlateById:(NSString*) _idPlate;
- (NSMutableArray*) getPlatesByKind:(NSString *) _kind;

@end
