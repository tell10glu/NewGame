//
//  NSObject+SectionArray.h
//  TowerDefence
//
//  Created by tellioglu on 21/12/14.
//  Copyright (c) 2014 tellioglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SectionArray: NSObject{
    NSMutableArray * sections;
}
- initWithSections:(NSUInteger)s rows:(NSUInteger)r;
+ sectionArrayWithSections:(NSUInteger)s rows:(NSUInteger)r;
- objectInSection:(NSUInteger)s row:(NSUInteger)r;
- (void)setObject:o inSection:(NSUInteger)s row:(NSUInteger)r;
@end
