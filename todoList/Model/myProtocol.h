//
//  myProtocol.h
//  todoList
//
//  Created by Ahmed Ramzy on 12/14/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodoItemClass.h"
NS_ASSUME_NONNULL_BEGIN

@protocol myProtocol <NSObject>
-(void)addTodoItemClass:(TodoItemClass *)todoItemClass;
-(void)editItemClass:(TodoItemClass *)todoItemClass:(int)myIndex;
@end

NS_ASSUME_NONNULL_END
