//
//  AssesmentViewController.m
//  CalorieTracker
//
//  Created by Amin Davoodi on 4/15/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import "AssesmentViewController.h"

@interface AssesmentViewController ()

@property (weak, nonatomic) IBOutlet UITextField *height;
@property (weak, nonatomic) IBOutlet UITextField *weight;
@property (weak, nonatomic) IBOutlet UISwitch *female;
@property (weak, nonatomic) IBOutlet UITextField *age;

@end

@implementation AssesmentViewController

- (IBAction)assesmentDone:(id)sender
{
    // set height weight etc and calculate tdee
        
    float h = self.height.text.floatValue;
    float w = self.weight.text.floatValue;
    int age = self.age.text.intValue;
    
    float adder = (self.female.enabled) ? 655 : 66;
    float weightMult = (self.female.enabled) ? 9.6 : 13.7;
    float heightMult = (self.female.enabled) ? 1.8 : 5;
    float ageMult = (self.female.enabled) ? 4.7 : 6.8;
    
    float BMR = adder + (weightMult * w) + (heightMult * h) - (ageMult * age);
    
    NSString *selectedValue = self.downPicker.text;
    
    float activity_level;
    
    if ([selectedValue isEqualToString:@"Sedentary"])
    {
        activity_level = 1.2;
    }
    else if ([selectedValue isEqualToString:@"Lightly Active"])
    {
        activity_level = 1.375;
    }
    else if ([selectedValue isEqualToString:@"Moderately Active"])
    {
        activity_level = 1.55;
    }
    else if ([selectedValue isEqualToString:@"Very Active"])
    {
        activity_level = 1.725;
    }
    else if ([selectedValue isEqualToString:@"Extremely Active"])
    {
        activity_level = 1.9;
    }
    
    float tdee = activity_level * BMR;

    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"assesment"];
    [[NSUserDefaults standardUserDefaults] setFloat:h forKey:@"height"];
    [[NSUserDefaults standardUserDefaults] setFloat:w forKey:@"weight"];
    [[NSUserDefaults standardUserDefaults] setBool:self.female.enabled forKey:@"gender"];
    [[NSUserDefaults standardUserDefaults] setInteger:age forKey:@"age"];
    [[NSUserDefaults standardUserDefaults] setFloat:tdee forKey:@"tdee"];
    [[NSUserDefaults standardUserDefaults] setFloat:tdee forKey:@"caloriesRemaining"];
    
    //TODO go to the next assesment page.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // create the array of data
    NSMutableArray* bandArray = [[NSMutableArray alloc] init];
    
    // add some sample data
    [bandArray addObject:@"Sedentary"];
    [bandArray addObject:@"Lightly Active"];
    [bandArray addObject:@"Moderately Active"];
    [bandArray addObject:@"Very Active"];
    [bandArray addObject:@"Extremely Active"];
    
    // bind yourTextField to DownPicker
    self.downPicker = [[DownPicker alloc] initWithTextField:self.downPickerText withData:bandArray];
    
    // Do any additional setup after loading the view.
    
    // Create history list of dishes
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    //convert your array to `NSData` object using `NSKeyedArchiver`
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:arr];
    
    //store it to `NSUserDefaults`
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"history_list"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (void) viewWillAppear:(BOOL)animated  {
    [[self navigationController] setNavigationBarHidden:NO animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
