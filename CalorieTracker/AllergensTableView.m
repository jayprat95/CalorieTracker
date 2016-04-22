//
//  GenericTableView.m
//  CalorieTracker
//
//  Created by Amin Davoodi on 4/22/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import "AllergensTableView.h"

@implementation AllergensTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    //    [self.stackView addArrangedSubview:nav];
//    
//    // Uncomment the following line to preserve selection between presentations.
//    // self.clearsSelectionOnViewWillAppear = NO;
//    
//    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        self.allergins = [[NSMutableArray alloc] init];
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
    return [[[NSUserDefaults standardUserDefaults] dictionaryForKey:@"DictKey"] count];
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"TEST");
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"allergenslabel"forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"allergenslabel"];
    }
    
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"DictKey"];
    NSArray * values = [dict allValues];
    cell.textLabel.text = values[indexPath.row];
    
    NSLog(@"something printed %ld", (long)indexPath.row);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"allergenslabel"forIndexPath:indexPath];
    
    if (cell.selected)
    {
        [self.allergins removeObject:cell];
    }
    else
    {
        [self.allergins addObject:cell];
    }
}

@end
