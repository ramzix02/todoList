//
//  TodoItemClass.h
//  todoList
//
//  Created by Ahmed Ramzy on 12/14/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TodoItemClass : NSObject <NSCoding>

@property NSString *nameTodo;
@property NSString *descTodo;
@property NSString *piriortyClass;
@property NSString *TodoClass;
@property NSString *date;
@end

NS_ASSUME_NONNULL_END
