//
//  DataTableViewController.m
//  CalorieTracker
//
//  Created by Julia on 3/20/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//
#import "Navigation.h"
#import "DiningTableViewController.h"
#import "FoodTableViewController.h"

@import UIKit;
@import Foundation;

@interface DiningTableViewController ()

@end

@implementation DiningTableViewController

int idxPath;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Navigation *nav = [[Navigation alloc]initWithViewController: self];
    nav = [[[NSBundle mainBundle] loadNibNamed:@"CustomNav" owner:self options:nil] objectAtIndex:0];
    
//    [self.stackView addArrangedSubview:nav];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"LabelCell"forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LabelCell"];
    }

    // Static dining halls
    NSArray *diningHalls = @[@"Au Bon Pain", @"Burger 37", @"D2", @"Deets", @"DXpress", @"Hokie Grill", @"Owens", @"Turner", @"West End"];

    // Configure the cell...
    cell.textLabel.text = diningHalls[indexPath.row];
    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger) nameOfDiningHall {
    return @"Dining Halls";
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Running");
    if ([segue.identifier isEqualToString:@"DiningToFoods"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        FoodTableViewController *c = ((FoodTableViewController *) segue.destinationViewController);
        
        NSMutableArray *arr;
        
        switch (idxPath)
        {
            case 0:
                arr = [Parser parseFile:@"abp"];
                break;
            case 1:
                arr = [Parser parseFile:@"Burger_37"];
                break;
            case 2:
                arr = [Parser parseFile:@"D2"];
                break;
            case 3:
                arr = [Parser parseFile:@"Deets"];
                break;
            case 4:
                arr = [Parser parseFile:@"Dxpress"];
                break;
            case 5:
                arr = [Parser parseFile:@"hokieGrill"];
                break;
            case 6:
                arr = [Parser parseFile:@"Owens"];
                break;
            case 7:
                arr = [Parser parseFile:@"Turner"];
                break;
            case 8:
                arr = [Parser parseFile:@"westend"];
                break;
            default:
                NSLog(@"Bad index path");
                break;
        }
        
        [c setDishList:arr];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    idxPath = indexPath.row;
    [self performSegueWithIdentifier:@("DiningToFoods") sender:self];
}

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
