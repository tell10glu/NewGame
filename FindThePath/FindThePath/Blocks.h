//
//  SKSpriteNode+Blocks.h
//  FindThePath
//
//  Created by tellioglu on 14/01/15.
//  Copyright (c) 2015 tellioglu. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Blocks:SKNode
@property (nonatomic) int X;
@property (nonatomic) int Y;
+(id) initWithValues:(BOOL)up  left:(BOOL)left  right:(BOOL)right top:(BOOL)top Size:(CGSize) size;
@end
