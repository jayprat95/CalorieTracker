//
//  AppDelegate.h
//  CalorieTracker
//
//  Created by Jayanth Prathipati on 2/5/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property HomeViewController *home_vc;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

