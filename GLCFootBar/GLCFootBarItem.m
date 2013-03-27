//
//  GLCFootBarItem.m
//  GLCFootBar
//
//  Created by guo luchuan on 13-3-25.
//  Copyright (c) 2013年 yours. All rights reserved.
//

#import "GLCFootBarItem.h"

#import <QuartzCore/QuartzCore.h>

@interface GLCFootBarItem ()
{
//    UILabel *_titleLabel;
}
@end

@implementation GLCFootBarItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.layer.anchorPoint = CGPointMake(0.5, 0);
        self.center = CGPointMake(frame.size.width/2.0 + frame.origin.x, 0.0); //compensate for anchor offset
        
//        _titleLabel = [[UILabel alloc] initWithFrame:CGRectInset(self.bounds, 0, 10)];
//        _titleLabel.backgroundColor = [UIColor clearColor];
//        _titleLabel.textAlignment = UITextAlignmentCenter;
//        _titleLabel.textColor = [UIColor whiteColor];
//        [self addSubview:_titleLabel];
        
        _shadowImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _shadowImageView.opaque = NO;
        [self addSubview:_shadowImageView];
                
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
