//
//  RecommendViewController.m
//  CalorieTracker
//
//  Created by Amin Davoodi on 4/14/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import "RecommendViewController.h"
#import "Navigation.h"
#import "AFNetworking.h"

@interface RecommendViewController ()
@property (weak, nonatomic) IBOutlet UIStackView *stackView;
@property (weak, nonatomic) IBOutlet UIButton *bOne;
@property (weak, nonatomic) IBOutlet UIButton *bTwo;
@property (weak, nonatomic) IBOutlet UIButton *bThree;

@end

@implementation RecommendViewController
- (IBAction)updateRec:(id)sender
{
    NSURL * urlStr = [NSURL URLWithString:@"http://45.55.212.193/api/food/"];
    
    NSDictionary* sendDict = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"DictKey"];
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:sendDict
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:nil];
    
    
    NSString *jsonStr = [[NSString alloc] initWithData:data
                                              encoding:NSUTF8StringEncoding];
    
    NSArray *banList = [NSArray arrayWithObjects:[[NSUserDefaults standardUserDefaults] dictionaryForKey:@"ban_list"]];
    
    NSLog(@"TAG URL: %@", jsonStr);
    
    NSData * JSONData = [NSJSONSerialization dataWithJSONObject:banList
                                                        options:kNilOptions
                                                          error:nil];
    
    NSString *banJSONStr = [[NSString alloc] initWithData:JSONData
                                                 encoding:NSUTF8StringEncoding];
    
    NSLog(@"BAN URL: %@", banJSONStr);
    
    NSDictionary *dictParameters = @{@"calories": @500,@"dining": @1,@"tags":jsonStr,@"ban":banJSONStr};
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    [manager GET:urlStr.absoluteString parameters:dictParameters success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"ACTUAL: %@", responseObject);
        NSDictionary *recommended_foods = (NSDictionary*) responseObject;
        
        NSArray *actualIDS = [recommended_foods objectForKey:@"id"];
        
        for (NSString *s in actualIDS) {
            NSLog(@"FOOD: %@", s);
        }
//        for (int i = 0; i < [recommended_foods count]; i++)
//        {
//            NSLog(@"%@", recommended)
//        }
//        
//        NSLog(@"floats %@", recFloats);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];
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
