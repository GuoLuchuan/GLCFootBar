//
//  BaseNavigationController.h
//  GLCFootBar
//
//  Created by guo luchuan on 13-3-27.
//  Copyright (c) 2013年 yours. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationController : UINavigationController

@property (nonatomic, readonly) BOOL isShown;

- (void)showViewOn:(UIView *)superView;
- (void)dismissViewOnSuperView;


@end
