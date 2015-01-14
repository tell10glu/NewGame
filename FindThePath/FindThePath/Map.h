//
//  NSObject+Map.h
//  FindThePath
//
//  Created by tellioglu on 14/01/15.
//  Copyright (c) 2015 tellioglu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "SectionArray.h"
@interface Map:SKNode{
    int width;
    int height;
}
-(id) initWithMapName:(NSString* )str size:(CGSize) size;
@property (nonatomic,retain) NSMutableArray * myBlocks;
@end
