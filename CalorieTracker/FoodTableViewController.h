//
//  FoodTableViewController.h
//  CalorieTracker
//
//  Created by Amin Davoodi on 3/23/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NutritionViewController.h"
#import "FoodsCell.h"
#import "Dish.h"
#import "Parser.h"

@interface FoodTableViewController : UITableViewController

@property NSMutableArray *dishList;
@property NSString *diningHallName;

@end
