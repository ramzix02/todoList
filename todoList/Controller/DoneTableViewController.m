//
//  DoneTableViewController.m
//  todoList
//
//  Created by Ahmed Ramzy on 12/23/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

#import "DoneTableViewController.h"
#import "TodoItemClass.h"
@interface DoneTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *table;

@end

@implementation DoneTableViewController
{
    NSUserDefaults *defaults;
    NSData *dataRepresentingSavedArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    todoArr = [[NSMutableArray alloc] init];
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    
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
    arrDone = [[NSMutableArray alloc] init];
    for(int i=0 ; i<todoArr.count ; i++)
    {
        if ([[[todoArr objectAtIndex:i] TodoClass] isEqualToString:@"Done"])
        {
            [arrDone addObject:todoArr[i]];
        }
    }
    [_table reloadData];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrDone count];;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
    
    cell.textLabel.text=[[arrDone objectAtIndex:indexPath.row] nameTodo];
    cell.accessoryType=UITableViewCellAccessoryDetailButton;
    
    if([[[arrDone objectAtIndex:indexPath.row] piriortyClass] isEqual:@"High"])
    {
        cell.imageView.image=[UIImage imageNamed:@"high.jpeg"];
    }
    else if ([[[arrDone objectAtIndex:indexPath.row] piriortyClass] isEqual:@"Medium"])
    {
        cell.imageView.image=[UIImage imageNamed:@"med.jpeg"];
    }
    else
    {
        cell.imageView.image=[UIImage imageNamed:@"low.jpeg"];
    }
    
    
    
    return cell;
}


@end
