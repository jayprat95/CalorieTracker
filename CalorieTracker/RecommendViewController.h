//
//  RecommendViewController.h
//  CalorieTracker
//
//  Created by Amin Davoodi on 4/14/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownPicker.h"

@interface RecommendViewController : UIViewController

@property (strong, nonatomic) DownPicker *downPicker;
@property (weak, nonatomic) IBOutlet UITextField *dpText;
@property (weak, nonatomic) IBOutlet UITextField *calLabel;

@end
