//
//  TDLToDoItem.h
//  ToDoList
//
//  Created by Toby Smith on 16/11/2013.
//  Copyright (c) 2013 Toby Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDLToDoItem : NSObject <NSCoding>

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

-(id) initWithCoder:(NSCoder *)aDecoder;

@end
