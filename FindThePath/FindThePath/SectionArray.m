//
//  NSObject+SectionArray.m
//  TowerDefence
//
//  Created by tellioglu on 21/12/14.
//  Copyright (c) 2014 tellioglu. All rights reserved.
//

#import "SectionArray.h"
@implementation SectionArray : NSObject

- initWithSections:(NSUInteger)s rows:(NSUInteger)r {
    if ((self = [self init])) {
        sections = [[NSMutableArray alloc] initWithCapacity:s];
        NSUInteger i,j;
        for (i=0; i<s; i++) {
            NSMutableArray *a = [NSMutableArray arrayWithCapacity:r];
            for (j=0; j<r; j++) {
                [a setObject:[NSNull null] atIndexedSubscript:j];
            }
            [sections addObject:a];
        }
    }
    return self;
}
+ sectionArrayWithSections:(NSUInteger)s rows:(NSUInteger)r {
    return [[self alloc] initWithSections:s rows:r] ;
}
- objectInSection:(NSUInteger)s row:(NSUInteger)r {
    return [[sections objectAtIndex:s] objectAtIndex:r];
}
- (void)setObject:o inSection:(NSUInteger)s row:(NSUInteger)r {
    [[sections objectAtIndex:s] replaceObjectAtIndex:r withObject:o];
}

@end
