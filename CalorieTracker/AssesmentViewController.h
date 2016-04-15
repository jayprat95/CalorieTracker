//
//  AssesmentViewController.h
//  CalorieTracker
//
//  Created by Amin Davoodi on 4/15/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIDownPicker.h"

@interface AssesmentViewController : UIViewController

@property (strong, nonatomic) DownPicker *downPicker;
@property (strong, nonatomic) IBOutlet UITextField *downPickerText;

@end
