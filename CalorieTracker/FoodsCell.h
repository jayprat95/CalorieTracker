//
//  CustomFoodTableViewCell.h
//  CalorieTracker
//
//  Created by Amin Davoodi on 3/24/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodsCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *FoodNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *CalLabel;

@end
