//
//  TDLToDoList.m
//  ToDoList
//
//  Created by Toby Smith on 17/11/2013.
//  Copyright (c) 2013 Toby Smith. All rights reserved.
//

#import "TDLToDoList.h"

#define kDataKey @"Data"

@implementation TDLToDoList


- (void)addItem:(TDLToDoItem *)item {
    [self.toDoItems addObject:item];
    [self backupToFile];
}

- (id) initWithContentsOfFile:(NSString *)path {
    self = [super init];
    if (self) {
        self.backupPath = path;
        self.toDoItems = [[NSMutableArray alloc] init];
        NSData *codedData = [[NSData alloc] initWithContentsOfFile:path];
        if (codedData == nil) return self;
        
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:codedData];
        if ([unarchiver containsValueForKey:kDataKey]) {
            self.toDoItems = [unarchiver decodeObjectForKey:kDataKey];
        }
        [unarchiver finishDecoding];
    }
    return self;
}

- (NSInteger) count {
    return [self.toDoItems count];
}

- (TDLToDoItem *) objectAtIndex:(NSUInteger)index {
    return [self.toDoItems objectAtIndex:index];
}

- (void) removeObjectAtIndex:(NSUInteger)index {
    [self.toDoItems removeObjectAtIndex:index];
    [self backupToFile];
}

- (void) toggleItemAtIndex:(NSUInteger)index {
    TDLToDoItem *tappedItem = [self.toDoItems objectAtIndex:index];
    tappedItem.completed = !tappedItem.completed;
    [self backupToFile];
}

- (BOOL)backupToFile {
    NSError *error;
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self.toDoItems forKey:kDataKey];
    [archiver finishEncoding];
    BOOL success = [[NSFileManager defaultManager] createFileAtPath:self.backupPath  contents:data attributes:nil ];
    if (!success) {
        NSLog(@"Error creating data file: %@", [error localizedDescription]);
    }
    return success;
}

@end
