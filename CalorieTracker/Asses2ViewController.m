//
//  Asses2ViewController.m
//  CalorieTracker
//
//  Created by Amin Davoodi on 4/22/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import "Asses2ViewController.h"
#import "AllergensTableView.h"

@interface Asses2ViewController ()

@property (weak, nonatomic) IBOutlet AllergensTableView *allerginsTableView;

@property (weak, nonatomic) IBOutlet UITableView *preferenceTableView;

@end

@implementation Asses2ViewController

- (IBAction)addPrefs:(id)sender
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"mainStoryBoardID"];
    
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    
//    self.allerginsTableView.delegate = self;
//    self.allerginsTableView.dataSource = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    UITableViewCell *cell;
    NSLog(@"TEST");

    if (tableView == self.allerginsTableView)
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
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.allerginsTableView)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"allergenslabel"forIndexPath:indexPath];
        
        if (cell.selected)
        {
            [self.allerginsTableView.allergins removeObject:cell];
        }
        else
        {
            [self.allerginsTableView.allergins addObject:cell];
        }
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
