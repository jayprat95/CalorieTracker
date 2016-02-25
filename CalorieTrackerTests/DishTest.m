//
//  DishTest.m
//  CalorieTracker
//
//  Created by Jayanth Prathipati on 2/24/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>
#import "Dish.h"

@interface DishTest : XCTestCase
@property (nonatomic,retain) NSManagedObjectContext *moc;
@end

@implementation DishTest



- (void)setUp {
    [super setUp];
    
    //get the calorie tracker core data model as an NSManagedObjectContext
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CalorieTracker" withExtension:@"momd"];
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    XCTAssertTrue([psc addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL] ? YES : NO, @"Should be able to add in-memory store");
    self.moc = [[NSManagedObjectContext alloc] init];
    self.moc.persistentStoreCoordinator = psc;
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.moc = nil;
    [super tearDown];
}

- (void)testCreatingNewDish {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    Dish *newDish = [NSEntityDescription insertNewObjectForEntityForName:@"Dish" inManagedObjectContext:self.moc];
    newDish.title = @"Potato";
    newDish.timeStamp = [NSDate date];
    
    // Save the context.
    NSError *error = nil;
    if (![self.moc save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        XCTFail(@"Error saving in \"%s\" : %@, %@", __PRETTY_FUNCTION__, error, [error userInfo]);
    }
    
    XCTAssertFalse(self.moc.hasChanges,"All the changes should be saved");
}

- (void)testAccessingCoreDataDB {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    Dish *newDish = [NSEntityDescription insertNewObjectForEntityForName:@"Dish" inManagedObjectContext:self.moc];
    newDish.title = @"Tomato";
    newDish.timeStamp = [NSDate date];
    newDish.calories = 200;
    
    // Save the context.
    NSError *error = nil;
    if (![self.moc save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        XCTFail(@"Error saving in \"%s\" : %@, %@", __PRETTY_FUNCTION__, error, [error userInfo]);
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:
     [NSEntityDescription entityForName:@"Dish" inManagedObjectContext:self.moc]];
    
    NSArray *dishes = [self.moc executeFetchRequest:fetchRequest error:&error];
    Dish *dish2 = dishes[0];
    XCTAssertEqual(@"Tomato", dish2.title, @"Should be the same title");
    XCTAssertEqual(200, dish2.calories, @"Should be the same amount of calories");
    
    
}

- (void)testDeletingCoreDataObject {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    Dish *newDish = [NSEntityDescription insertNewObjectForEntityForName:@"Dish" inManagedObjectContext:self.moc];
    newDish.title = @"Tomato";
    newDish.timeStamp = [NSDate date];
    newDish.calories = 200;
    
    // Save the context.
    NSError *error = nil;
    if (![self.moc save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        XCTFail(@"Error saving in \"%s\" : %@, %@", __PRETTY_FUNCTION__, error, [error userInfo]);
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:
     [NSEntityDescription entityForName:@"Dish" inManagedObjectContext:self.moc]];
    
    NSArray *dishes = [self.moc executeFetchRequest:fetchRequest error:&error];
    Dish *dish2 = dishes[0];
    XCTAssertEqual(@"Tomato", dish2.title, @"Should be the same title");
    XCTAssertEqual(200, dish2.calories, @"Should be the same amount of calories");
    XCTAssertEqual(1, [dishes count], "Should only have one dish");
    
    
    //delete the object from the managedobjectcontext
    [self.moc deleteObject:newDish];
    error = nil;
    if (![self.moc save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        XCTFail(@"Error saving in \"%s\" : %@, %@", __PRETTY_FUNCTION__, error, [error userInfo]);
    }
    
    //fetch list of dishes
    dishes = [self.moc executeFetchRequest:fetchRequest error:&error];
    
    //should be no dishes
    XCTAssertEqual(0, [dishes count], "Should be empty");
    
    
}


//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
