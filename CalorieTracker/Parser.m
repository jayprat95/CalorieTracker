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

+(NSMutableArray*) parseFile: (NSString*) file
{
    NSString *pt = [[NSBundle mainBundle] pathForResource:file ofType:@"csv"];
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:pt encoding:NSUTF8StringEncoding error:&error];
    
    NSArray *lines = [fileContents componentsSeparatedByString:@"\n"];
    NSArray *foods;
    NSMutableArray *dishList = [[NSMutableArray alloc] init];
    
    // Dictionary --------------------
    
    NSManagedObjectContext *context =  ((AppDelegate*)[[UIApplication sharedApplication] delegate]).managedObjectContext;
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Dish" inManagedObjectContext:context];
    
    Dish *d = [[Dish alloc] initWithEntity:entity insertIntoManagedObjectContext:nil];
    
    NSMutableDictionary *allDishes = [NSMutableDictionary
                                dictionaryWithDictionary:@{
                                @"000000" : d,
                                }];
    
    [allDishes setObject:d forKey:@"000001"];
    
    // ----- End dictionary ------------
    
    int i = 0;
    
    for (NSString *line in lines)
    {
        i++;
        foods = [line componentsSeparatedByString:@","];
        
        if ([foods count] < 2 || [foods[1] isEqual: @"food_name"])
        {
            continue;
        }
        
        NSManagedObjectContext *context =  ((AppDelegate*)[[UIApplication sharedApplication] delegate]).managedObjectContext;
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Dish" inManagedObjectContext:context];
        
        Dish *dish = [[Dish alloc] initWithEntity:entity insertIntoManagedObjectContext:nil];
        
        int count = 1;
        
        dish.title = @"";
        
        if ([foods[count] containsString:@"\""])
        {
            do
            {
                count++;
            }
            while (![foods[count] containsString:@"\""]);
        }
        
        for (int i = 0; i < count; i++)
        {
            dish.title = [NSString stringWithFormat:@"%@%@", dish.title, foods[i + 1]];
        }
        
        int shift = count - 1;
        
        dish.serving_size = foods[2 + shift];
        dish.calories = foods[3 + shift];
        dish.total_fat = foods[5 + shift];
        dish.sat_fat = foods[5 + shift];
        dish.trans_fat = foods[6 + shift];
        dish.cholesterol = foods[7 + shift];
        dish.sodium = foods[8 + shift];
        dish.fiber = foods[10 + shift];
        dish.sugar = foods[11 + shift];
        dish.calcium = foods[12 + shift];
        dish.iron = foods[13 + shift];
        NSString *dishID = @"01010101";
        dish.id = dishID;
        
        if (i == 1)
        {
            NSLog(foods[2+shift]);
        }
        
        [dishList addObject:dish];
        [allDishes setObject:dish forKey:dishID];
        
    }
    
    return dishList;
}

@end
