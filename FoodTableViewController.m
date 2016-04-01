//
//  FoodTableViewController.m
//  CalorieTracker
//
//  Created by Amin Davoodi on 3/23/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import "FoodTableViewController.h"
#import "NutritionViewController.h"

@interface FoodTableViewController ()

@end

@implementation FoodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[FoodsCell class] forCellReuseIdentifier:@"FoodCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomFoodCell" bundle:nil] forCellReuseIdentifier:@"FoodCell"];
    self.dishList = [Parser parseFile:@"westend"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FoodsCell *cell = (FoodsCell *) [tableView dequeueReusableCellWithIdentifier: @"FoodCell"forIndexPath:indexPath];
    
    // Check null
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CustomFoodCell" owner:self options:nil]objectAtIndex:0];
    }
    
    // Configure the cell...
    cell.FoodNameLabel.text = ((Dish *) self.dishList[indexPath.row]).title;
    cell.CalLabel.text = ((Dish *) self.dishList[indexPath.row]).calories;
    
    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger) nameOfDiningHall {
    return @"Turners";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dishList count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@("FoodsToNutrition") sender:self];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Running");
    if ([segue.identifier isEqualToString:@"FoodsToNutrition"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NutritionViewController *c = ((NutritionViewController *) segue.destinationViewController);
        c.dish = self.dishList[indexPath.row];
        // TODO c.dishList = arr;
    }
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoodLabelCell" forIndexPath:indexPath];
//    
//    return cell;
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
