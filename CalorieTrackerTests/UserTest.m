//
//  UserTest.m
//  CalorieTracker
//
//  Created by Admin on 2/25/16
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>
#import "Date.h"
#import "User.h"

@interface UserTest : XCTestCase
@property (nonatomic,retain) NSManagedObjectContext *moc;
@end

@implementation UserTest

- (void)setUp
{
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    //get the calorie tracker core data model as an NSManagedObjectContext
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CalorieTracker" withExtension:@"momd"];
    
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    
    XCTAssertTrue([psc addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL] ? YES : NO, @"Should be able to add in-memory store");
    
    self.moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    self.moc.persistentStoreCoordinator = psc;
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    self.moc = nil;
    [super tearDown];
    
}

- (void)testCreateUser

{
    
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.moc];
    
    // Save the context.
    NSError *error = nil;
    if (![self.moc save:&error]) {
        
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        
        XCTFail(@"Error saving in \"%s\" : %@, %@", __PRETTY_FUNCTION__, error, [error userInfo]);
        
    }
    XCTAssertFalse(self.moc.hasChanges,"All the changes should be saved");
    
}

- (void)testAddUser
{
    
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.moc];
    
    NSMutableArray *dateList = [[NSArray alloc] init];
    
    Date *newDate = [NSEntityDescription insertNewObjectForEntityForName:@"Date" inManagedObjectContext:self.moc];
    
    [dateList addObject:newDate];
    
    user.dates = dateList;
    
    // Save the context.
    
    NSError *error = nil;
    
    if (![self.moc save:&error]) {
        
        // Replace this implementation with code to handle the error appropriately.
        
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        
        XCTFail(@"Error saving in \"%s\" : %@, %@", __PRETTY_FUNCTION__, error, [error userInfo]);
        
    }
    
    XCTAssertFalse(self.moc.hasChanges,"All the changes should be saved");
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:
     [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.moc]];
    
    NSArray *users = [self.moc executeFetchRequest:fetchRequest error:&error];
    User *user2 = users[0];
    
    XCTAssertEqual(user, user2, @"Users should be same");
    
}

- (void)testRemoveUser
{
    
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.moc];
    
    NSMutableArray *dateList = [[NSArray alloc] init];
    
    Date *newDate = [NSEntityDescription insertNewObjectForEntityForName:@"Date" inManagedObjectContext:self.moc];
    
    [dateList addObject:newDate];
    
    user.dates = dateList;
    
    // Save the context.
    NSError *error = nil;
    
    if (![self.moc save:&error])
    {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        
        XCTFail(@"Error saving in \"%s\" : %@, %@", __PRETTY_FUNCTION__, error, [error userInfo]);
        
    }
    
    XCTAssertFalse(self.moc.hasChanges,"All the changes should be saved");
    
    [self.moc deleteObject:user];
    error = nil;
    if (![self.moc save:&error]) {
        
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        
        XCTFail(@"Error saving in \"%s\" : %@, %@", __PRETTY_FUNCTION__, error, [error userInfo]);
        
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:
     [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.moc]];
    
    //fetch list of users
    NSArray *users = [self.moc executeFetchRequest:fetchRequest error:&error];
    
    //should be no dishes
    XCTAssertEqual(0, [users count], "Should be empty");
    
}



@end
