//
//  Date+CoreDataProperties.h
//  CalorieTracker
//
//  Created by Jayanth Prathipati on 2/24/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Date.h"

NS_ASSUME_NONNULL_BEGIN

@interface Date (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) Dish *dishes;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END
