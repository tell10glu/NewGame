#import "GameScene.h"
#import "Blocks.h"
@implementation GameScene


-(void)didMoveToView:(SKView *)view {
       NSLog(@"Size Width :%f Height :%f ",self.frame.size.width,self.frame.size.height);
   
    [self ReadFromMap];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}
-(void) ReadFromMap{
    SKNode * mapnode = [[SKNode alloc] init];
    int row,column;
    CGSize size = self.frame.size;
    NSString * str = @"Map";
    NSString * path = [[NSBundle mainBundle] pathForResource:str ofType:@"plist"];
    NSDictionary * dic  = [NSDictionary dictionaryWithContentsOfFile:path];
    row = [[dic objectForKey:@"Row"] intValue];
    column = [[dic objectForKey:@"Column"] intValue];
    self.myBlocks =[SectionArray sectionArrayWithSections:row rows:column];
    CGSize sizeofBlocks = CGSizeMake(size.width/column, size.height/row);
    NSLog(@"Device Width : %f Height : %f",size.width,size.height);
    NSLog(@"SizeOf Block --Width: %f Height:%f",sizeofBlocks.width,sizeofBlocks.height);
    NSArray * blockarray =[dic objectForKey:@"Blocks"];
    for(int i = 0;i<[blockarray count];i++){
        NSDictionary * dict = [blockarray objectAtIndex:i];
        BOOL up,left,right,top;
        up = [[dict objectForKey:@"Up"] boolValue];
        left = [[dict objectForKey:@"Left"] boolValue];
        right =[[dict objectForKey:@"Right"] boolValue];
        top = [[dict objectForKey:@"Top"] boolValue];
        NSArray * coorarray = [dict objectForKey:@"Coordinates"];
        for(int j =0;j<[coorarray count];j++){
            NSString * str = [coorarray objectAtIndex:j];
            CGPoint pnt = CGPointFromString([NSString stringWithFormat:@"%@",str]);
            // NSLog(@"Okunan Point : %f %f",pnt.x,pnt.y);
            Blocks * myBlock = [Blocks initWithValues:up left:left right:right top:top Size:sizeofBlocks];
            myBlock.position = CGPointMake(pnt.y*sizeofBlocks.width, pnt.x*sizeofBlocks.height);//Terslik Olabilir.
            NSLog(@"Position : %f %f \n",myBlock.position.x,myBlock.position.y);
            [self.myBlocks setObject:myBlock inSection:pnt.x row:pnt.y];//Terslik Olabilir.
            [mapnode addChild:myBlock];
        }
    }
    mapnode.position = CGPointMake(sizeofBlocks.width/2 ,sizeofBlocks.height/2);
    [self addChild:mapnode];
}

@end
