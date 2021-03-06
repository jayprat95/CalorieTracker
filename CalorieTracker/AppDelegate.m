//
//  AppDelegate.m
//  CalorieTracker
//
//  Created by Jayanth Prathipati on 2/5/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworking/AFHTTPSessionManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    // check if completed the assesment, so save assesment boolean to ios device and load it
    
    NSURL * urlStr = [NSURL URLWithString:@"http://45.55.212.193/api/food/"];
    
     NSDictionary* sendDict = @{@"milk":@(0), @"wheat":@(0), @"soy":@(0), @"cheese":@(0), @"egg":@(0), @"beef":@(0), @"turkey":@(0), @"chicken":@(0), @"pork":@(0), @"peanuts":@(0), @"veggie":@(0), @"pizza":@(0), @"lamb":@(0), @"onion":@(0), @"tomato":@(0), @"cream":@(0), @"pepper":@(0), @"shellfish":@(0), @"gluten":@(0)};
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:sendDict
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:nil];
    
    
    NSString *jsonStr = [[NSString alloc] initWithData:data
                                              encoding:NSUTF8StringEncoding];
    
    NSArray *banList = [NSArray arrayWithObjects: nil];
    
    NSLog(@"TAG URL: %@", jsonStr);
    
    NSData * JSONData = [NSJSONSerialization dataWithJSONObject:banList
                                                        options:kNilOptions
                                                          error:nil];
    
    NSString *banJSONStr = [[NSString alloc] initWithData:JSONData
                                              encoding:NSUTF8StringEncoding];
    
    NSLog(@"BAN URL: %@", banJSONStr);
    
    NSDictionary *dictParameters = @{@"calories": @500,@"dining": @1,@"tags":jsonStr,@"ban":banJSONStr};
    
    
    
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    
    [manager GET:urlStr.absoluteString parameters:dictParameters success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"PLIST: %@", responseObject);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];
    

    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if ([prefs boolForKey:@"HMIsCreated"] == NO) {
        
        NSDictionary* dict = @{@"milk":@(0), @"milk":@(0), @"wheat":@(0), @"soy":@(0), @"cheese":@(0), @"egg":@(0), @"beef":@(0), @"turkey":@(0), @"chicken":@(0), @"pork":@(0), @"peanuts":@(0), @"veggie":@(0), @"pizza":@(0), @"lamb":@(0), @"onion":@(0), @"tomato":@(0), @"cream":@(0), @"pepper":@(0), @"shellfish":@(0), @"gluten":@(0)};
        [prefs setObject:dict forKey:@"Tags"];
        [prefs setBool:YES forKey:@"HMIsCreated"];
        
        
    }
    BOOL assesment = [prefs boolForKey:@"assesment"];
    
    NSString *storyboardId = assesment ? @"mainStoryBoardID" : @"assesmentID";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *initViewController = [storyboard instantiateViewControllerWithIdentifier:storyboardId];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = initViewController;
    [self.window makeKeyAndVisible];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.TT.CalorieTracker" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CalorieTracker" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CalorieTracker.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
