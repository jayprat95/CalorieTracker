//
//  DateTest.m
//  CalorieTracker
//
//  Date should have a list of dishes that were eaten that day
//
//  Created by Julia on 2/25/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>
#import "Date.h"

@interface DateTest : XCTestCase
@property (nonatomic,retain) NSManagedObjectContext *moc;
@end

@implementation DateTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class
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



- (void)testCreateDate
{
    
    Date *newDate = [NSEntityDescription insertNewObjectForEntityForName:@"Date" inManagedObjectContext:self.moc];
    
    // Save the context.
    NSError *error = nil;
    
    if (![self.moc save:&error]) {
        
        // Replace this implementation with code to handle the error appropriately.
        
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        
        XCTFail(@"Error saving in \"%s\" : %@, %@", __PRETTY_FUNCTION__, error, [error userInfo]);
        
    }
    XCTAssertFalse(self.moc.hasChanges,"All the changes should be saved");
    
}

- (void)testAddDate
{
    
    Date *date = [NSEntityDescription insertNewObjectForEntityForName:@"Date" inManagedObjectContext:self.moc];
    
//    NSMutableArray *dishList = [[NSMutableArray alloc] init];
//    
//    Dish *newDish = [NSEntityDescription insertNewObjectForEntityForName:@"Dish" inManagedObjectContext:self.moc];
//    
//    [dishList addObject:newDish];
//    
//    date.dishes = dishList;
    
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
     [NSEntityDescription entityForName:@"Date" inManagedObjectContext:self.moc]];
    
    NSArray *dates = [self.moc executeFetchRequest:fetchRequest error:&error];
    Date *date2 = dates[0];
    
    Date *testDate = [[Date alloc] init]; // = [NSDate date];
    NSDate *actualDate = [[NSDate alloc] init];
    testDate.date = actualDate;
    XCTAssertNotEqual(testDate.date, date2.date, @"Dates should not be same");
    
}



- (void)testRemoveDate

{
    
    Date *date = [NSEntityDescription insertNewObjectForEntityForName:@"Date" inManagedObjectContext:self.moc];
    NSMutableArray *dishList = [[NSMutableArray alloc] init];
    Dish *newDish = [NSEntityDescription insertNewObjectForEntityForName:@"Dish" inManagedObjectContext:self.moc];
    [dishList addObject:newDish];
    date.dishes = dishList;
    
    // Save the context.
    NSError *error = nil;
    
    if (![self.moc save:&error]) {
        
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        XCTFail(@"Error saving in \"%s\" : %@, %@", __PRETTY_FUNCTION__, error, [error userInfo]);
        
    }
    
    XCTAssertFalse(self.moc.hasChanges,"All the changes should be saved");
    [self.moc deleteObject:date];
    error = nil;
    if (![self.moc save:&error]) {
        
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        
        XCTFail(@"Error saving in \"%s\" : %@, %@", __PRETTY_FUNCTION__, error, [error userInfo]);
        
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:
     [NSEntityDescription entityForName:@"Date" inManagedObjectContext:self.moc]];
    
    //fetch list of dates
    NSArray *dates = [self.moc executeFetchRequest:fetchRequest error:&error];
    
    //should be no dates
    XCTAssertEqual(0, [dates count], "Should be empty");
    
}



@end
