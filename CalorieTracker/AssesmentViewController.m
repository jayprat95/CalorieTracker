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

    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"assesment"];
    [[NSUserDefaults standardUserDefaults] setFloat:h forKey:@"height"];
    [[NSUserDefaults standardUserDefaults] setFloat:w forKey:@"weight"];
    [[NSUserDefaults standardUserDefaults] setBool:self.female.enabled forKey:@"gender"];
    [[NSUserDefaults standardUserDefaults] setInteger:age forKey:@"age"];
    
    [[NSUserDefaults standardUserDefaults] setObject:self.height.text forKey:@"tdee"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // create the array of data
    NSMutableArray* bandArray = [[NSMutableArray alloc] init];
    
    // add some sample data
    [bandArray addObject:@"Offsprings"];
    [bandArray addObject:@"Radiohead"];
    [bandArray addObject:@"Muse"];
    [bandArray addObject:@"R.E.M."];
    [bandArray addObject:@"The Killers"];
    [bandArray addObject:@"Social Distortion"];
    
    // bind yourTextField to DownPicker
    self.downPicker = [[DownPicker alloc] initWithTextField:self.downPickerText withData:bandArray];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
