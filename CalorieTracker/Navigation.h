//
//  Navigation.h
//  CalorieTracker
//
//  Created by Amin Davoodi on 4/14/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Navigation : UIToolbar

-(id)initWithViewController:(UIViewController*)c;

@property (nonatomic, weak) IBOutlet UIBarButtonItem *HomeButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *DiningButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *RecButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *UserButton;

@end
