//
//  GLCFootBar.m
//  GLCFootBar
//
//  Created by guo luchuan on 13-3-25.
//  Copyright (c) 2013年 yours. All rights reserved.
//

#import "GLCFootBar.h"
#import <QuartzCore/QuartzCore.h>

#import "GLCFootBarItem.h"

#define ANIMATIONKEY_FADE           @"animateContentsFade"

#define ANIMATIONKEY_SHOW           @"animateContentsShow"

#define ROTATEANGLE                 -20 * M_PI/180


@interface GLCFootBar ()
{
    
    UIImage *_shadowImage;
    
}
@property (nonatomic , readwrite) NSMutableArray *footBarItemList;

@end



@implementation GLCFootBar

+ (GLCFootBar *)footBarWithType:(FootBarType)footBarType
{
    GLCFootBar *footBar = [[GLCFootBar alloc] initWithFrame:CGRectMake(0, 0, 320, 49)];
    switch (footBarType) {
        case FootBarTypeFlip:
            footBar.backgroundColor = [UIColor blackColor];
            
            for (int i = 0; i < [footBar.footBarItemList count]; i++) {
                [footBar addSubview:[footBar.footBarItemList objectAtIndex:i]];
            }
            
            break;
            
        default:
            break;
    }
    
    return footBar;
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _footBarItemList = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 4; i++) {
            
            GLCFootBarItem *footBarItem = [[GLCFootBarItem alloc] initWithFrame:CGRectMake(i * 80 + 0, 0, 80, 49)];
            
            footBarItem.frame  = CGRectMake(i * 80 + 0, 0, 80, 49);
            footBarItem.tag = i;
            [footBarItem addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [_footBarItemList addObject:footBarItem];
            
        }
        
        ((GLCFootBarItem *)[_footBarItemList objectAtIndex:0]).backgroundColor = [UIColor greenColor];
        
        ((GLCFootBarItem *)[_footBarItemList objectAtIndex:1]).backgroundColor = [UIColor blueColor];
        
        ((GLCFootBarItem *)[_footBarItemList objectAtIndex:2]).backgroundColor = [UIColor redColor];
        
        ((GLCFootBarItem *)[_footBarItemList objectAtIndex:3]).backgroundColor = [UIColor yellowColor];
        
        _shadowImage = [self shadowImage:CGSizeMake(80, 49)];
        
    }
    return self;
}

- (GLCFootBarItem *)itemAtIndex:(NSInteger)index
{
    return ((GLCFootBarItem *)[_footBarItemList objectAtIndex:index]);
}

- (void)buttonClickAnimation:(FootBarItemType)footBarItemType
{
    CATransform3D transformblank = CATransform3DIdentity;
    transformblank.m34 = -5 / 500.0;
    transformblank = CATransform3DRotate(transformblank, ROTATEANGLE, 1, 0, 0);
    
    int index = footBarItemType - 1;
    
    if (CATransform3DIsIdentity([self itemAtIndex:index].layer.transform)) {
        [UIView animateWithDuration:.5 animations:^{
            [self itemAtIndex:index].layer.transform = transformblank;
        }];
    }
    else
    {
        
        [self shakeAnimation:[self itemAtIndex:index]];
        
    }
    
    for (int i = FootBarItemTypeHot; i <= FootBarItemTypeSetting; i++) {
        
        index = i - 1;
        
        if (i != footBarItemType) {
            if (!CATransform3DIsIdentity([self itemAtIndex:index].layer.transform)) {
                [UIView animateWithDuration:.5 animations:^{
                    [self itemAtIndex:index].layer.transform = CATransform3DIdentity;
                }];
                
                break;
            }
        }
    }
    
    CATransition *transition = [[CATransition alloc] init];
    transition.duration = .5;
    
    for (int i = FootBarItemTypeHot; i <= FootBarItemTypeSetting; i++) {
        
        index = i - 1;
        
        if (i == footBarItemType) {
            [self itemAtIndex:index].shadowImageView.image = _shadowImage;
            [[self itemAtIndex:index].shadowImageView.layer addAnimation:transition forKey:ANIMATIONKEY_SHOW];
        }
        else
        {
            [self itemAtIndex:index].shadowImageView.image = nil;
            [[self itemAtIndex:index].shadowImageView.layer addAnimation:transition forKey:ANIMATIONKEY_FADE];
        }
    }
    
}

- (void)buttonClick:(UIButton *)sender
{
    
    [self buttonClickAnimation:(sender.tag + 1)];

}

- (void)shakeAnimation:(GLCFootBarItem *)footbarItem
{
    CATransform3D transform = footbarItem.layer.transform;
    [UIView animateWithDuration:.1 animations:^{
        footbarItem.layer.transform = CATransform3DRotate(footbarItem.layer.transform, -5*M_PI/180, 1, 0, 0);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:.2 animations:^{
            footbarItem.layer.transform = CATransform3DRotate(footbarItem.layer.transform, 15*M_PI/180, 1, 0, 0);
        } completion:^(BOOL finished1) {
            [UIView animateWithDuration:.1 animations:^{
                footbarItem.layer.transform = transform;
            } completion:^(BOOL finished) {
                
            }];
        }];
        
    }];
}


- (UIImage *)shadowImage:(CGSize)size
{
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    //    CGColorRef startColor = [UIColor colorWithWhite:.8 alpha:.6].CGColor;
//    CGColorRef startColor = [UIColor colorWithWhite:.1 alpha:.1].CGColor;
//    CGColorRef endColor = [UIColor colorWithWhite:.1 alpha:.6].CGColor;
    
//    //    CGColorRef startColor = [UIColor whiteColor].CGColor;
//    //    CGColorRef endColor = [UIColor blackColor].CGColor;
    
    
    CGColorRef startColor = [UIColor darkGrayColor].CGColor;
    CGColorRef endColor = [UIColor purpleColor].CGColor;
    
    NSArray *colors = [NSArray arrayWithObjects:(__bridge id)startColor, (__bridge id)endColor, nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace,
                                                        (__bridge CFArrayRef) colors, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext();
    
    return image;
    
}
@end