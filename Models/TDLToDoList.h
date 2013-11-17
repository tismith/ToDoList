//
//  TDLToDoList.h
//  ToDoList
//
//  Created by Toby Smith on 17/11/2013.
//  Copyright (c) 2013 Toby Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TDLTodoItem.h"

@interface TDLToDoList : NSObject
@property NSMutableArray *toDoItems;
@property NSString *backupPath;

- (void)addItem:(TDLToDoItem *)item;
- (id) initWithContentsOfFile:(NSString *)path;
- (NSInteger) count;
- (TDLToDoItem *) objectAtIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)toggleItemAtIndex:(NSUInteger)index;

@end
