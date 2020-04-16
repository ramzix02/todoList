//
//  ADDTableViewController.m
//  todoList
//
//  Created by Ahmed Ramzy on 12/14/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

#import "ADDTableViewController.h"
#import "PresentViewController.h"
#import "EditViewController.h"

@interface ADDTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;



@end

@implementation ADDTableViewController
{
    NSMutableArray *filter;
    bool isFiltered;
    
    ADDViewController *secView;
    PresentViewController *presView;
    
    NSUserDefaults *defaults;
    NSData *dataRepresentingSavedArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    isFiltered = false;
    self.searchBar.delegate=self;
    
    
    todoArr = [[NSMutableArray alloc] init];
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    dataRepresentingSavedArray = [defaults objectForKey:@"savedArray"];
    
    if (dataRepresentingSavedArray != nil)
    {
        NSArray *savedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
        
        if (savedArray != nil)
            todoArr = [[NSMutableArray alloc] initWithArray:savedArray];
    }

}

- (void)viewWillAppear:(BOOL)animated
{
    
    secView=[self.storyboard instantiateViewControllerWithIdentifier:@"sec"];
    presView=[self.storyboard instantiateViewControllerWithIdentifier:@"pres2"];
    [secView setP:self];
    [_table reloadData];
}

-(void)addTodoItemClass:(TodoItemClass *)todoItemClass
{
    [todoArr addObject:todoItemClass];
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:todoArr] forKey:@"savedArray"];
    [defaults synchronize];
    
    [_table reloadData];
}
-(void)editItemClass:(TodoItemClass *)todoItemClass:(int)myIndex
{
    todoArr[myIndex]=todoItemClass;
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:todoArr] forKey:@"savedArray"];
    [defaults synchronize];
    printf("bla bla");
    [_table reloadData];
}

#pragma mark - Table view data source

- (IBAction)btn:(id)sender {
    [self.navigationController pushViewController:secView animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {   //section
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {  //row
    if(isFiltered)
    {
        return [filter count];
    }
    return [todoArr count];
}

//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if(isFiltered)
    {
        cell.textLabel.text = [filter[indexPath.row] nameTodo];
        return cell;
    }
    
    cell.textLabel.text=[[todoArr objectAtIndex:indexPath.row] nameTodo];
    cell.accessoryType=UITableViewCellAccessoryDetailButton;
    
    if([[[todoArr objectAtIndex:indexPath.row] piriortyClass] isEqual:@"High"])
    {
        cell.imageView.image=[UIImage imageNamed:@"high.jpeg"];
    }
    else if ([[[todoArr objectAtIndex:indexPath.row] piriortyClass] isEqual:@"Medium"])
    {
        cell.imageView.image=[UIImage imageNamed:@"med.jpeg"];
    }
    else
    {
        cell.imageView.image=[UIImage imageNamed:@"low.jpeg"];
    }

    return cell;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length == 0)
    {
        isFiltered = false;
        [self.searchBar endEditing:YES];
    }
    else{
        isFiltered = true;
        filter = [[NSMutableArray alloc]init];
        for(TodoItemClass *obj in todoArr)
        {
            NSString *str = obj.nameTodo;
            NSRange range = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(range.location != NSNotFound)
            {
                [filter addObject:obj];
            }
        }
    }
    [self.table reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    EditViewController * p = [[self storyboard]instantiateViewControllerWithIdentifier:@"edit2"];
    p.todoObj = todoArr[indexPath.row];
    p.index = indexPath.row;
    p.p2=self;
    [self.navigationController pushViewController:p animated:YES];
    
}
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
    presView.name1 = [todoArr[indexPath.row] nameTodo];
    presView.desc = [todoArr[indexPath.row] descTodo];
    presView.piriority= [todoArr[indexPath.row] piriortyClass];
    presView.status= [todoArr[indexPath.row] TodoClass];
    presView.date = [todoArr[indexPath.row] date];
 
    [self.navigationController pushViewController:presView animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Warning!" message:@"Are you sure,you want to delete this" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    [alert show];
    deletedIndex = indexPath.row;
    
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)  //cancel
        {
            
        }
    if (buttonIndex == 1)  //ok
    {
        [todoArr removeObjectAtIndex:deletedIndex];
        [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:todoArr] forKey:@"savedArray"];
        [defaults synchronize];
        [_table reloadData];
    }
}

@end
