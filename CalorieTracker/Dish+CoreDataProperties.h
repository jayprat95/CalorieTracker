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

@property (nullable, nonatomic, retain) NSData *allergens;
@property (nonatomic) int16_t calcium;
@property (nonatomic) int16_t calories;
@property (nonatomic) int16_t carbs;
@property (nonatomic) int16_t cholesterol;
@property (nonatomic) int16_t fiber;
@property (nonatomic) int16_t iron;
@property (nonatomic) int16_t potassium;
@property (nonatomic) int16_t protein;
@property (nonatomic) int16_t sat_fat;
@property (nullable, nonatomic, retain) NSString *serving_size;
@property (nonatomic) int16_t sodium;
@property (nonatomic) int16_t sugar;
@property (nonatomic) NSDate* timeStamp;
@property (nullable, nonatomic, retain) NSString *title;
@property (nonatomic) int16_t total_fat;
@property (nonatomic) int16_t trans_fat;
@property (nonatomic) int16_t vitamin_a;
@property (nonatomic) int16_t vitamin_b;
@property (nonatomic) int16_t vitamin_c;
@property (nullable, nonatomic, retain) NSManagedObject *date;

@end

NS_ASSUME_NONNULL_END
