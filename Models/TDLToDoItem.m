//
//  TDLToDoItem.m
//  ToDoList
//
//  Created by Toby Smith on 16/11/2013.
//  Copyright (c) 2013 Toby Smith. All rights reserved.
//

#import "TDLToDoItem.h"

#define kNameKey @"Name"
#define kCompletedKey @"Completed"

@implementation TDLToDoItem
- (void) encodeWithCoder:(NSCoder *) encoder {
    [encoder encodeObject:self.itemName forKey:kNameKey];
    [encoder encodeBool:self.completed forKey:kCompletedKey];
}

- (id) initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.itemName = [decoder decodeObjectForKey:kNameKey];
        self.completed = [decoder decodeBoolForKey:kCompletedKey];
    }
    return self;
}
@end
