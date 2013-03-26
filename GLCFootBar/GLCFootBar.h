//
//  GLCFootBar.h
//  GLCFootBar
//
//  Created by guo luchuan on 13-3-25.
//  Copyright (c) 2013年 yours. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    FootBarTypeFlip = 0x01,
    
} FootBarType;

typedef enum {
    FootBarItemTypeHot = 0x01,
    FootBarItemTypeBookShelf,
    FootBarItemTypeRanking,
    FootBarItemTypeSetting,
    
} FootBarItemType;

@interface GLCFootBar : UIView

@property (nonatomic , readonly) NSMutableArray *footBarItemList;

+ (GLCFootBar *)footBarWithType:(FootBarType)footBarType;


@end
