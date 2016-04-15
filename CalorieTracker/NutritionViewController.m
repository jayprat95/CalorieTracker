//
//  NutritionViewController.m
//  CalorieTracker
//
//  Created by Amin Davoodi on 3/23/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import "Navigation.h"
#import "NutritionViewController.h"

@interface NutritionViewController ()
@property (weak, nonatomic) IBOutlet UILabel *calorieLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *satFatLabel;
@property (weak, nonatomic) IBOutlet UILabel *servingSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *transFatLabel;
@property (weak, nonatomic) IBOutlet UILabel *cholesteralLabel;
@property (weak, nonatomic) IBOutlet UILabel *sodiumLabel;
@property (weak, nonatomic) IBOutlet UILabel *fiberLabel;
@property (weak, nonatomic) IBOutlet UILabel *sugarLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalFatLabel;
@property (weak, nonatomic) IBOutlet UILabel *calciumLabel;
@property (weak, nonatomic) IBOutlet UILabel *ironLabel;
@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@end

@implementation NutritionViewController

-(instancetype)init
{
    self = [super init];
    
    if (self)
    {
        //
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", self.dish.title);
    
    // Set values
    self.nameLabel.text = self.dish.title;
    self.calorieLabel.text = self.dish.calories;
    self.satFatLabel.text = self.dish.sat_fat;
    self.servingSizeLabel.text = self.dish.serving_size;
    self.transFatLabel.text = self.dish.trans_fat;
    self.cholesteralLabel.text = self.dish.cholesterol;
    self.sodiumLabel.text = self.dish.sodium;
    self.fiberLabel.text = self.dish.fiber;
    self.sugarLabel.text = self.dish.sugar;
    self.totalFatLabel.text = self.dish.total_fat;
    self.calciumLabel.text = self.dish.calcium;
    self.ironLabel.text = self.dish.iron;
    
    // Nav
    Navigation *nav = [[Navigation alloc] initWithViewController: self];
    nav = [[[NSBundle mainBundle] loadNibNamed:@"CustomNav" owner:self options:nil] objectAtIndex:0];
    
    [self.stackView addArrangedSubview:nav];
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
