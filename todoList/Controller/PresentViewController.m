//
//  PresentViewController.m
//  todoList
//
//  Created by Ahmed Ramzy on 12/22/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

#import "PresentViewController.h"

@interface PresentViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblDesc;
@property (weak, nonatomic) IBOutlet UILabel *lblPiriority;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;

@end

@implementation PresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    _lblName.text=_name1;
    _lblDesc.text=_desc;
    _lblPiriority.text=_piriority;
    _lblStatus.text=_status;
    _lblDate.text=_date;
}

@end
