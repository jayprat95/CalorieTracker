//
//  AllergenTableViewController.m
//  CalorieTracker
//
//  Created by Amin Davoodi on 4/22/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import "AllergenTableViewController.h"

@interface AllergenTableViewController ()

@end

@implementation AllergenTableViewController

- (void)goToNextPage:(id)sender
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"mainStoryBoardID"];
    
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:vc animated:YES completion:nil];
    NSLog(@"Trying to go to home page");
//    [self performSegueWithIdentifier:@("PrefToAllergenSegue") sender:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"allergen view tried to load");
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] init];
//    [nextButton setTitle:@"Next"];
//    self.navigationItem.rightBarButtonItem = nextButton;
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(goToNextPage:)];
    
    [self.navigationController.navigationBar setHidden:NO];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = nextButton;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"NUM SECS CALLED");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"NUM ROWS CALLED");
    return [[[NSUserDefaults standardUserDefaults] dictionaryForKey:@"DictKey"] count];
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"CELLFORROW");
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"allergenslabel"forIndexPath:indexPath];
    
    if (cell == nil)
    {
        NSLog(@"Cell is null");
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"allergenslabel"];
    }
    
    NSLog(@"Making Dictionary");
//    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"DictKey"];
//    NSArray * values = [dict allValues];
//    cell.textLabel.text = values[indexPath.row];
    
    NSLog(@"something printed %ld", (long)indexPath.row);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"allergenslabel"forIndexPath:indexPath];
    
    if (cell.selected)
    {
        [self.allergens removeObject:cell];
    }
    else
    {
        [self.allergens addObject:cell];
    }
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
