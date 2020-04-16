//
//  ADDTableViewController.h
//  todoList
//
//  Created by Ahmed Ramzy on 12/14/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADDViewController.h"
#import "myProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ADDTableViewController : UITableViewController <myProtocol,UIAlertViewDelegate,UISearchBarDelegate>
{
    NSMutableArray *todoArr;
    NSMutableArray *arrTodo;
    
    int deletedIndex;
}
@end

NS_ASSUME_NONNULL_END
