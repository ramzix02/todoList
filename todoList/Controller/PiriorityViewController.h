//
//  PiriorityViewController.h
//  todoList
//
//  Created by Ahmed Ramzy on 12/24/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PiriorityViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *todoArr;
    NSMutableArray *arrHigh;
    NSMutableArray *arrMedium;
    NSMutableArray *arrLow;
}
@end

NS_ASSUME_NONNULL_END
