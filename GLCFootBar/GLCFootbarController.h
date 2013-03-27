//
//  GLCFootbarController.h
//  GLCFootBar
//
//  Created by guo luchuan on 13-3-27.
//  Copyright (c) 2013年 yours. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLCFootbarController : UIViewController

@property (nonatomic, readonly) NSMutableArray *footbarArray;

- (id)initWithFootBarArray:(NSMutableArray *)footbarArray;

@end
