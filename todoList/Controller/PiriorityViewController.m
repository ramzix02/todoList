//
//  PiriorityViewController.m
//  todoList
//
//  Created by Ahmed Ramzy on 12/24/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

#import "PiriorityViewController.h"
#import "TodoItemClass.h"
@interface PiriorityViewController ()
{
    NSUserDefaults *defaults;
    NSData *dataRepresentingSavedArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedController;

@end

@implementation PiriorityViewController
@synthesize segmentedController;
- (void)viewDidLoad {
    [super viewDidLoad];
    todoArr = [[NSMutableArray alloc] init];
    defaults = [NSUserDefaults standardUserDefaults];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
}
- (void)viewWillAppear:(BOOL)animated
{
    dataRepresentingSavedArray = [defaults objectForKey:@"savedArray"];
    
    if (dataRepresentingSavedArray != nil)
    {
        NSArray *savedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
        
        if (savedArray != nil)
            todoArr = [[NSMutableArray alloc] initWithArray:savedArray];
    }
    arrHigh= [[NSMutableArray alloc] init];
    arrMedium= [[NSMutableArray alloc] init];
    arrLow= [[NSMutableArray alloc] init];
    for(int i=0 ; i<todoArr.count ; i++)
    {
        if ([[[todoArr objectAtIndex:i] piriortyClass] isEqualToString:@"High"])
        {
            [arrHigh addObject:todoArr[i]];
        }
        else if ([[[todoArr objectAtIndex:i] piriortyClass] isEqualToString:@"Medium"])
        {
            [arrMedium addObject:todoArr[i]];
        }
        else
        {
            [arrLow addObject:todoArr[i]];
        }
    }
    [_tableView reloadData];
}
- (IBAction)btnSegmented:(id)sender {
    if(segmentedController.selectedSegmentIndex == 0)
    { [_tableView reloadData]; }
    if(segmentedController.selectedSegmentIndex == 1)
    { [_tableView reloadData];}
    if(segmentedController.selectedSegmentIndex == 2)
    { [_tableView reloadData]; }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {   //section
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {  //row
    if(segmentedController.selectedSegmentIndex == 2)
       return [arrLow count];
    else if(segmentedController.selectedSegmentIndex == 1)
       return [arrMedium count];
    else
       return [arrHigh count];
}

//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellA" forIndexPath:indexPath];
    
    if(segmentedController.selectedSegmentIndex == 2)
    {
            cell.textLabel.text=[[arrLow objectAtIndex:indexPath.row] nameTodo];
    }
    else if(segmentedController.selectedSegmentIndex == 1)
    {
            cell.textLabel.text=[[arrMedium objectAtIndex:indexPath.row] nameTodo];
    }
    else
    {
            cell.textLabel.text=[[arrHigh objectAtIndex:indexPath.row] nameTodo];
    }
    
    return cell;
}

@end
