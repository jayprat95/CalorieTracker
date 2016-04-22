//
//  Parser.m
//  CalorieTracker
//
//  Created by Amin Davoodi on 3/24/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import "Parser.h"
#import "AppDelegate.h"

@implementation Parser

static int shift = 0;

+(NSMutableArray*) parseFile: (NSString*) file
{
    NSString *pt = [[NSBundle mainBundle] pathForResource:file ofType:@"csv"];
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:pt encoding:NSUTF8StringEncoding error:&error];
    
    NSArray *lines = [fileContents componentsSeparatedByString:@"\n"];
    NSArray *foods;
    NSMutableArray *dishList = [[NSMutableArray alloc] init];
    
    for (NSString *line in lines)
    {
        shift = 0;
        
        foods = [line componentsSeparatedByString:@","];
        
        if ([foods count] < 2 || [foods[0] isEqual: @"food_id"])
        {
            continue;
        }
        
        NSManagedObjectContext *context =  ((AppDelegate*)[[UIApplication sharedApplication] delegate]).managedObjectContext;
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Dish" inManagedObjectContext:context];
        
        Dish *dish = [[Dish alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
        
        dish.food_id = (int) [foods[0] integerValue];
        dish.title = [Parser parseArrayWithQuotes:1 array:foods];
        dish.serving_size = foods[2 + shift];
        dish.calories = foods[3 + shift];
        dish.fat_type = foods[4 + shift];
        dish.total_fat = foods[5 + shift];
        dish.sat_fat = foods[6 + shift];
        dish.trans_fat = foods[7 + shift];
        dish.cholesterol = foods[8 + shift];
        dish.sodium = foods[9 + shift];
        dish.protein = foods[10 + shift];
        dish.carbon = foods[11 + shift];
        dish.fiber = foods[12 + shift];
        dish.sugar = foods[13 + shift];
        dish.calcium = foods[14 + shift];
        dish.iron = foods[15 + shift];
        dish.vaiu = foods[16 + shift];
        dish.vc = foods[17 + shift];
        dish.meal_time = [Parser parseArrayWithQuotes:(18 + shift) array:foods];
        dish.location = [Parser parseArrayWithQuotes:(19 + shift) array:foods];
        dish.allergens = [Parser parseArrayWithQuotes:(20 + shift) array:foods];
        dish.tags = [Parser parseArrayWithQuotes:(21 + shift) array:foods];
        dish.ingredients = [Parser parseArrayWithQuotes:(22 + shift) array:foods];
        
        [dishList addObject:dish];
    }
    
    return dishList;
}

+(NSString*)parseArrayWithQuotes:(int)count array:(NSArray*)foods
{
    NSString *return_value = @"";
    int shift_diff = count;
    
    if ([foods[shift_diff] containsString:@"\""])
    {
        do
        {
            shift_diff++;
        }
        while (![foods[shift_diff] containsString:@"\""]);
    }
    
    for (int i = count; i <= shift_diff; i++)
    {
        return_value = [NSString stringWithFormat:@"%@%@", return_value, foods[i]];
    }
    
    shift += shift_diff - count;
    
    return return_value;
}

@end
