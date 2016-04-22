//
//  RecommendViewController.m
//  CalorieTracker
//
//  Created by Amin Davoodi on 4/14/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import "RecommendViewController.h"
#import "Navigation.h"


@interface RecommendViewController ()
@property (weak, nonatomic) IBOutlet UIStackView *stackView;
@property (weak, nonatomic) IBOutlet UIButton *bOne;
@property (weak, nonatomic) IBOutlet UIButton *bTwo;
@property (weak, nonatomic) IBOutlet UIButton *bThree;

@end

@implementation RecommendViewController
- (IBAction)updateRec:(id)sender
{
    NSLog(@"Recing");
    
}
- (IBAction)refreshRec:(id)sender
{
    [self updateRec:sender];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Nav
    Navigation *nav = [[Navigation alloc] initWithViewController: self];
    nav = [[[NSBundle mainBundle] loadNibNamed:@"CustomNav" owner:self options:nil] objectAtIndex:0];
    
    [self.stackView addArrangedSubview:nav];
    
    // Set buttons
    [_bOne setTitle:@"Cheese Pizza" forState:UIControlStateNormal];
    [_bTwo setTitle:@"Chicken Salad" forState:UIControlStateNormal];
    [_bThree setTitle:@"General Tsos" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)bOneClicked:(id)sender
{

}

- (IBAction)bTwoClicked:(id)sender
{

}

- (IBAction)bThreeClicked:(id)sender
{

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
