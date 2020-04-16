//
//  TodoItemClass.m
//  todoList
//
//  Created by Ahmed Ramzy on 12/14/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

#import "TodoItemClass.h"

@implementation TodoItemClass

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.nameTodo forKey:@"strName"];
    [encoder encodeObject:self.descTodo forKey:@"strDesc"];
    [encoder encodeObject:self.piriortyClass forKey:@"strPiriorty"];
    [encoder encodeObject:self.TodoClass forKey:@"strTodo"];
    [encoder encodeObject:self.date forKey:@"strDate"];
}


 - (id)initWithCoder:(NSCoder *)decoder
{
    if((self =[super init]))
    {
        self.nameTodo = [decoder decodeObjectForKey:@"strName"];
        self.descTodo = [decoder decodeObjectForKey:@"strDesc"];
        self.piriortyClass = [decoder decodeObjectForKey:@"strPiriorty"];
        self.TodoClass = [decoder decodeObjectForKey:@"strTodo"];
        self.date = [decoder decodeObjectForKey:@"strDate"];
    }
    return self;
}


@end
