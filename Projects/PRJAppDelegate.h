//
//  PRJAppDelegate.h
//  Projects
//
//  Created by Sergey Gavrilyuk on 13-01-13.
//  Copyright (c) 2013 Sergey Gavrilyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PRJAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
