//
//  EditViewController.m
//  todoList
//
//  Created by Ahmed Ramzy on 12/22/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtDesc;
@property (weak, nonatomic) IBOutlet UIPickerView *pickPiriority;
@property (weak, nonatomic) IBOutlet UIPickerView *pickStatus;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //_todoObj=[[TodoItemClass alloc]init];
    self.pickPiriority.dataSource=self;
    self.pickPiriority.delegate=self;
    arrPiriority=@[@"High",@"Medium",@"Low"];
    
    self.pickStatus.dataSource=self;
    self.pickStatus.delegate=self;
    //arrTodo=@[@"Todo",@"Progress",@"Done"];
}

- (void)viewWillAppear:(BOOL)animated
{
    
    if([_todoObj.TodoClass  isEqual: @"Todo"])
    {
        arrTodo=@[@"Todo",@"Progress",@"Done"];
    }
    else if([_todoObj.TodoClass  isEqual: @"Progress"])
    {
        arrTodo=@[@"Progress",@"Done"];
    }else {
        arrTodo=@[@"Done"];
    }
    _txtName.text=_todoObj.nameTodo;
    _txtDesc.text=_todoObj.descTodo;

    if ([_todoObj.piriortyClass isEqualToString:@"Medium"])
    {
        [_pickPiriority  selectRow:1 inComponent:0 animated:true];
    }else if ([_todoObj.piriortyClass isEqualToString:@"Low"])
    {
        
        [_pickPiriority  selectRow:2 inComponent:0 animated:true];
    }else
    {
        [_pickPiriority  selectRow:0 inComponent:0 animated:true];
        
    }
    
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
        _todoObj.piriortyClass=arrPiriority[row];
    }else
    {
        _todoObj.TodoClass=arrTodo[row];
    }
}

- (IBAction)btnEdit:(id)sender {
    
    _todoObj.nameTodo=_txtName.text;
    _todoObj.descTodo=_txtDesc.text;
    
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Editing!" message:@"Are you sure,you want to edit this" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    [alert show];
    
    
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)  //cancel
    {
        
    }
    if (buttonIndex == 1)  //ok
    {
        [_p2 editItemClass:_todoObj :_index];
        [self.navigationController popViewControllerAnimated:YES];
    }
}


@end
