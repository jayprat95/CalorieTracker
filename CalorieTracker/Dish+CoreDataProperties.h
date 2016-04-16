//
//  Dish+CoreDataProperties.h
//  CalorieTracker
//
//  Created by Jayanth Prathipati on 2/24/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Dish.h"

NS_ASSUME_NONNULL_BEGIN

@interface Dish (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *allergens;
@property (nonatomic) NSString *calcium;
@property (nonatomic) NSString *calories;
@property (nonatomic) NSString *carbs;
@property (nonatomic) NSString *cholesterol;
@property (nonatomic) NSString *fiber;
@property (nonatomic) NSString *iron;
@property (nonatomic) NSString *potassium;
@property (nonatomic) NSString *protein;
@property (nonatomic) NSString *sat_fat;
@property (nullable, nonatomic, retain) NSString *serving_size;
@property (nonatomic) NSString *sodium;
@property (nonatomic) NSString *sugar;
@property (nonatomic) NSDate* timeStamp;
@property (nullable, nonatomic, retain) NSString *title;
@property (nonatomic) NSString *total_fat;
@property (nonatomic) NSString *trans_fat;
@property (nonatomic) NSString *vitamin_a;
@property (nonatomic) NSString *vitamin_b;
@property (nonatomic) NSString *vitamin_c;
@property (nonatomic) NSString *id;
@property (nullable, nonatomic, retain) NSManagedObject *date;

@end

NS_ASSUME_NONNULL_END
