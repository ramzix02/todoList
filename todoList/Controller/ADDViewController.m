//
//  ADDViewController.m
//  todoList
//
//  Created by Ahmed Ramzy on 12/14/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

#import "ADDViewController.h"

@interface ADDViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *piriority;
@property (weak, nonatomic) IBOutlet UIPickerView *todoCheck;
@property (weak, nonatomic) IBOutlet UITextField *taskName;
@property (weak, nonatomic) IBOutlet UITextField *taskDesc;


@end

@implementation ADDViewController
{
    NSString *dateTime;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.piriority.dataSource=self;
    self.piriority.delegate=self;
    arrPiriority=@[@"High",@"Medium",@"Low"];
    
    self.todoCheck.dataSource=self;
    self.todoCheck.delegate=self;
    arrTodo=@[@"Todo",@"Progress",@"Done"];
    
    
    
    NSDateFormatter *dateFormater=[[NSDateFormatter alloc]init];
    [dateFormater setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    dateTime=[dateFormater stringFromDate:[NSDate date]];
}
- (void)viewWillAppear:(BOOL)animated
{
    todoObj=[[TodoItemClass alloc]init];
    todoObj.piriortyClass=arrPiriority[0];
    todoObj.TodoClass=arrTodo[0];
}
//DataSource Methods
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView.tag ==1)
    {
        return arrPiriority.count;
    }
    else return arrTodo.count;
    
}

//Delegate Methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(pickerView.tag ==1)
    {
        return arrPiriority[row];
    }else return arrTodo[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView.tag == 1)
    {
        todoObj.piriortyClass=arrPiriority[row];
    }else
    {
        todoObj.TodoClass=arrTodo[row];
    }
}

- (IBAction)btnSave:(id)sender {
    if([_taskName.text isEqual:@""])
    {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Empty task name!" message:@"Please add task name" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
    todoObj.nameTodo=_taskName.text;
    todoObj.descTodo=_taskDesc.text;
    todoObj.date=dateTime;
    
    [_p addTodoItemClass:todoObj];
    [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
