//
//  PreferenceTableView.m
//  CalorieTracker
//
//  Created by Amin Davoodi on 4/22/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import "PreferenceTableView.h"

@implementation PreferenceTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        self.prefs = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[NSUserDefaults standardUserDefaults] dictionaryForKey:@"dictKey"] count];
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"LabelCell"forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LabelCell"];
    }
    
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"dictKey"];
    NSArray * values = [dict allValues];
    cell.textLabel.text = values[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"LabelCell"forIndexPath:indexPath];
    
    if (cell.selected)
    {
        [self.prefs removeObject:cell];
    }
    else
    {
        [self.prefs addObject:cell];
    }
}

@end
