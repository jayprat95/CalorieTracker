//
//  HomeViewController.h
//  CalorieTracker
//
//  Created by Amin Davoodi on 4/14/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import "ViewController.h"
#import "Navigation.h"
#import "Dish+CoreDataProperties.h"

@interface HomeViewController : UIViewController

@property float calorieGoal;
@property float calorieRem;

@property (weak, nonatomic) IBOutlet UILabel *calorieRemainLabel;

@property (weak, nonatomic) IBOutlet UILabel *calorieGoalLabel;

@property Dish *dishToOpen;

-(void) addFood:(Dish*)dish;

@end
