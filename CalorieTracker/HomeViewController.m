//
//  HomeViewController.m
//  CalorieTracker
//
//  Created by Amin Davoodi on 4/14/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import "HomeViewController.h"
#import "NutritionViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UIStackView *stackView;
@property (weak, nonatomic) IBOutlet UIScrollView *breakfastScrollView;

@end

@implementation HomeViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        
    }
    
    return self;
}

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
    NSMutableArray *eatenDishes = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"Eaten_Dishes"] mutableCopy];
    [eatenDishes addObject:dish.title];
    [[NSUserDefaults standardUserDefaults] setObject:eatenDishes forKey:@"Eaten_Dishes"];
    
    int y = 150;
    for(id t in eatenDishes)
    {
        if ([t isKindOfClass:[NSString class]])
        {
            NSString *titlee = t;
            UILabel *labb = [[UILabel alloc] init];
            labb.text = titlee;
            // CGRect CGRectMake ( CGFloat x, CGFloat y, CGFloat width, CGFloat height );
            labb.frame = CGRectMake(30, y, 500, 20.0);
            y += 40;
            [self.view addSubview:labb];
        }
    }
    
    
    
    /**
    // Add eaten dish to dishes list
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(openFoodNutrition:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:dish.title forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
//    button.backgroundColor = [UIColor grayColor];
    [self.eatenDishes addObject:button];
    
    
    
//    [self.breakfastScrollView addSubview:button];
//    [self.stackView addSubview:button];
    [self.view addSubview:button];
    
    int y = 80;
    NSLog(@"Num dishes eaten today: %lu", (unsigned long)[self.eatenDishes count]);
    for(id btn in self.eatenDishes)
    {
        if ([btn isKindOfClass:[UIButton class]])
        {
            UIButton *butn = btn;
            butn.frame = CGRectMake(30, y, 200, 40.0);
            y += 100;
        }
    }
    
    NSLog(@"%@", button);
     */
    
    // Adding labels of foods eaten
    
}

-(IBAction)openFoodNutrition: (id)sender
{
    NSLog(@"Clicked a button");
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
