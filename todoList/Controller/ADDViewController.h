//
//  ADDViewController.h
//  todoList
//
//  Created by Ahmed Ramzy on 12/14/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoItemClass.h"
#import "myProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface ADDViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSArray *arrPiriority;      //picker1
    NSArray *arrTodo;           //picker2
    
    TodoItemClass *todoObj;
}
@property id <myProtocol> p;
@end

NS_ASSUME_NONNULL_END
