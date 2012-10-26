//
//  CoreDataManager.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 23/10/12.
//
//

#import <Foundation/Foundation.h>
#import "CoreData/CoreData.h"

@interface CoreDataManager : NSObject {
    
}

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

+ (CoreDataManager*) sharedInstance;

@end
