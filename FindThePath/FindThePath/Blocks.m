//
//  SKSpriteNode+Blocks.m
//  FindThePath
//
//  Created by tellioglu on 14/01/15.
//  Copyright (c) 2015 tellioglu. All rights reserved.
//

#import "Blocks.h"
@implementation Blocks

+(id)initWithValues:(BOOL)up left:(BOOL)left right:(BOOL)right top:(BOOL)top Size:(CGSize) size{
    SKNode * mynode;
    SKTexture * texture;
    mynode = [[SKNode alloc] init];
    int counter = (int)(up+left+right+top);
    if(counter==3){
        texture = [SKTexture textureWithImageNamed:@"3In1Out.png"];
        
    }else if(counter==2){
        texture = [SKTexture textureWithImageNamed:@"2In2Out.png"];
    }else{
        texture = [SKTexture textureWithImageNamed:@"1In3Out.png"];
    }
    SKSpriteNode * background = [SKSpriteNode spriteNodeWithTexture:texture];
    background.size = size;
    [mynode addChild:background];
    return mynode;
}
@end
