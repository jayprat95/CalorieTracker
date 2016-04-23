//
//  HomeViewController.m
//  CalorieTracker
//
//  Created by Amin Davoodi on 4/14/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UIStackView *stackView;
@property (weak, nonatomic) IBOutlet UIScrollView *breakfastView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Navigation *nav = [[Navigation alloc] initWithViewController: self];
    nav = [[[NSBundle mainBundle] loadNibNamed:@"CustomNav" owner:self options:nil] objectAtIndex:0];
    
    self.calorieGoal = [[NSUserDefaults standardUserDefaults] floatForKey:@"tdee"];
    self.calorieRem = [[NSUserDefaults standardUserDefaults] floatForKey:@"caloriesRemaining"];
    
    [self.stackView addArrangedSubview:nav];
    // Do any additional setup after loading the view.
    
    // change text labels
    self.calorieGoalLabel.text = [NSString stringWithFormat:@"%.0f", self.calorieGoal];
    self.calorieRemainLabel.text = [NSString stringWithFormat:@"%.0f", self.calorieRem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addFood:(Dish *)dish
{
    [self viewDidLoad];
//    NSLog(@"rem: %f, dish cal: %f", self.calorieRem, [dish.calories floatValue]);
    self.calorieRem = self.calorieRem - [dish.calories floatValue];
    [[NSUserDefaults standardUserDefaults] setFloat:self.calorieRem forKey:@"caloriesRemaining"];
    
    self.calorieRemainLabel.text = [NSString stringWithFormat:@"%f", self.calorieRem];
    
    // save remaining calories to phone,
    
    // Add dish eaten to history of day
    
//    //convert your stored Object back to `NSData` using `NSKeyedUnarchiver`
//    NSData *storedData = [[NSUserDefaults standardUserDefaults] objectForKey:@"history_list"];
//    NSArray *storedArr = [NSArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:storedData]];
//
//    NSMutableArray *history = [storedArr mutableCopy];
//    [history addObject:dish];
////    [[NSUserDefaults standardUserDefaults] setObject:history forKey:@"history_list"];
//    
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:history];
//    
//    //store it to `NSUserDefaults`
//    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"history_list"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    
//    // Display to screen for breakfast, lunch, dinner
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 70, 300, 100)];
//    label.numberOfLines = 1;
//    label.text = dish.title;
////    [self.view addSubview:label];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
