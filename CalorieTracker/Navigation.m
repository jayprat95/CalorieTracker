//
//  Navigation.m
//  CalorieTracker
//
//  Created by Amin Davoodi on 4/14/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import "Navigation.h"

@implementation Navigation

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
UIViewController *viewCont;

-(id)initWithViewController:(UIViewController*)c {
    if (self = [super init])
    {
        NSLog(@"On init, controller is: %@", c);
        viewCont = c;
    }
    return self;
}


- (IBAction)homeClicked:(id)sender
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"mainStoryBoardID"];
    
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [viewCont presentViewController:vc animated:YES completion:nil];
}

- (IBAction)diningClicked:(id)sender
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Dining" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"diningViewController"];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self.superview presentViewController:vc animated:YES completion:NULL];
    [viewCont presentViewController:vc animated:YES completion:nil];
}

- (IBAction)recommendClicked:(id)sender
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Recommend" bundle:nil];
    
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"recommendStoryBoardID"];
    
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [viewCont presentViewController:vc animated:YES completion:nil];
}

- (IBAction)userClicked:(id)sender
{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"UserProfile" bundle:nil];
    
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"userProfileStoryBoardID"];
    
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [viewCont presentViewController:vc animated:YES completion:nil];
}

@end
