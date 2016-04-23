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
#import "Dish.h"
#import "Parser.h"
#import "AppDelegate.h"
#import "NutritionViewController.h"

@interface RecommendViewController ()

@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@property (weak, nonatomic) IBOutlet UIButton *bOne;
@property (weak, nonatomic) IBOutlet UIButton *bTwo;
@property (weak, nonatomic) IBOutlet UIButton *bThree;

@property Dish *bOneDish;
@property Dish *bTwoDish;
@property Dish *bThreeDish;
@property Dish *dishClicked;

@property NSDictionary *response_object;

@property int idx;
@property AppDelegate *d;

@end

@implementation RecommendViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        NSLog(@"entered");
        self.idx = 3;
        self.d = [UIApplication sharedApplication].delegate;
    }
    
    return self;
}

- (IBAction)updateRec:(id)sender
{
    self.idx = 3;
    
    NSURL * urlStr = [NSURL URLWithString:@"http://45.55.212.193/api/food/"];
    NSDictionary* sendDict = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"DictKey"];
    NSData *data = [NSJSONSerialization dataWithJSONObject:sendDict
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:nil];
    NSString *jsonStr = [[NSString alloc] initWithData:data
                                              encoding:NSUTF8StringEncoding];
    NSArray *banList = [NSArray arrayWithObjects:[[NSUserDefaults standardUserDefaults] dictionaryForKey:@"ban_list"]];
    NSData * JSONData = [NSJSONSerialization dataWithJSONObject:banList
                                                        options:kNilOptions
                                                          error:nil];
    NSString *banJSONStr = [[NSString alloc] initWithData:JSONData
                                                 encoding:NSUTF8StringEncoding];
    NSLog(@"BAN URL: %@", banJSONStr);
    
    NSString *selectedValue = self.downPicker.text;

    int dinningHall = 2;
    
    if ([selectedValue isEqualToString:@"Burger 37"])
    {
        dinningHall = 2;
    }
    else if ([selectedValue isEqualToString:@"D2"])
    {
        dinningHall = 4;
    }
    else if ([selectedValue isEqualToString:@"Deets"])
    {
        dinningHall = 3;
    }
    else if ([selectedValue isEqualToString:@"Dxpress"])
    {
        dinningHall = 5;
    }
    else if ([selectedValue isEqualToString:@"Hokie Grill / Owens"])
    {
        dinningHall = 6;
    }
    else if ([selectedValue isEqualToString:@"Turner"])
    {
        dinningHall = 7;
    }
    else if ([selectedValue isEqualToString:@"Westend"])
    {
        dinningHall = 1;
    }
    
    NSDictionary *dictParameters = @{@"calories": [NSNumber numberWithInt:[self.calLabel.text integerValue]],@"dining":[NSNumber numberWithInt:dinningHall],@"tags":jsonStr,@"ban":banJSONStr};
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    [manager GET:urlStr.absoluteString parameters:dictParameters success:^(NSURLSessionTask *task, id responseObject)
    {
        self.response_object = (NSDictionary*) responseObject;
        
        NSLog(@"%@", responseObject);
        
        NSArray *actualIDS = [self.response_object objectForKey:@"id"];
        
        if ([actualIDS count] < 3)
        {
            return;
        }
        
        float x;
        int newX;
        NSString *newS;
        
        x = [actualIDS[0] floatValue];
        newX = x;
        newS = [NSString stringWithFormat:@"%d", newX];
        
        [self.bOne setTitle:((Dish*) [self.d.allFoods objectForKey:newS]).title forState:UIControlStateNormal];
        self.bOneDish = ((Dish*) [self.d.allFoods objectForKey:newS]);
        
        x = [actualIDS[1] floatValue];
        newX = x;
        newS = [NSString stringWithFormat:@"%d", newX];
        
        [self.bTwo setTitle:((Dish*) [self.d.allFoods objectForKey:newS]).title forState:UIControlStateNormal];
        self.bTwoDish = ((Dish*) [self.d.allFoods objectForKey:newS]);
        
        x = [actualIDS[2] floatValue];
        newX = x;
        newS = [NSString stringWithFormat:@"%d", newX];
        
        [self.bThree setTitle:((Dish*) [self.d.allFoods objectForKey:newS]).title forState:UIControlStateNormal];
        self.bThreeDish = ((Dish*) [self.d.allFoods objectForKey:newS]);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];
}

- (IBAction)refreshRec:(id)sender
{
    NSArray *actualIDS = [self.response_object objectForKey:@"id"];
    
    float x;
    int newX;
    NSString *newS;
    
    if ((3 + self.idx) < [actualIDS count])
    {
        x = [actualIDS[self.idx] floatValue];
        newX = x;
        newS = [NSString stringWithFormat:@"%d", newX];
        
        [self.bOne setTitle: ((Dish*) [self.d.allFoods objectForKey:newS]).title forState:UIControlStateNormal];
        self.bOneDish = ((Dish*) [self.d.allFoods objectForKey:newS]);
        
        self.idx++;
        x = [actualIDS[self.idx] floatValue];
        newX = x;
        newS = [NSString stringWithFormat:@"%d", newX];
        
        [self.bTwo setTitle: ((Dish*) [self.d.allFoods objectForKey:newS]).title forState:UIControlStateNormal];
        self.bTwoDish = ((Dish*) [self.d.allFoods objectForKey:newS]);
        
        self.idx++;
        x = [actualIDS[self.idx] floatValue];
        newX = x;
        newS = [NSString stringWithFormat:@"%d", newX];
        
        [self.bThree setTitle: ((Dish*) [self.d.allFoods objectForKey:newS]).title forState:UIControlStateNormal];
        self.bThreeDish = ((Dish*) [self.d.allFoods objectForKey:newS]);
        
        self.idx++;

    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Nav
    Navigation *nav = [[Navigation alloc] initWithViewController: self];
    nav = [[[NSBundle mainBundle] loadNibNamed:@"CustomNav" owner:self options:nil] objectAtIndex:0];
    
    [self.stackView addArrangedSubview:nav];
    
    NSMutableArray* bandArray = [[NSMutableArray alloc] init];
    
    // add some sample data
    [bandArray addObject:@"Burger 37"];
    [bandArray addObject:@"D2"];
    [bandArray addObject:@"Deets"];
    [bandArray addObject:@"Dxpress"];
    [bandArray addObject:@"Hokie Grill / Owens"];
    [bandArray addObject:@"Turner"];
    [bandArray addObject:@"Westend"];

    [self.bOne setBackgroundColor:[UIColor yellowColor]];
    
    // bind yourTextField to DownPicker
    self.downPicker = [[DownPicker alloc] initWithTextField:self.dpText withData:bandArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)bOneClicked:(id)sender
{
    self.dishClicked = self.bOneDish;
    [self performSegueWithIdentifier:@("RecToNut") sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NutritionViewController *c = ((NutritionViewController *) segue.destinationViewController);
    c.dish = self.dishClicked;
    
}

- (IBAction)bTwoClicked:(id)sender
{
    self.dishClicked = self.bTwoDish;
    [self performSegueWithIdentifier:@("RecToNut") sender:self];
}

- (IBAction)bThreeClicked:(id)sender
{
    self.dishClicked = self.bThreeDish;
    [self performSegueWithIdentifier:@("RecToNut") sender:self];
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
