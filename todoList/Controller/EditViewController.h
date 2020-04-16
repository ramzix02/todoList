//
//  EditViewController.h
//  todoList
//
//  Created by Ahmed Ramzy on 12/22/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myProtocol.h"
#import "TodoItemClass.h"
NS_ASSUME_NONNULL_BEGIN

@interface EditViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSArray *arrPiriority;      //picker1
    NSArray *arrTodo;           //picker2
    
    //TodoItemClass *todoObj;
}
@property TodoItemClass *todoObj;
@property int index;
@property id <myProtocol> p2;
@end

NS_ASSUME_NONNULL_END

