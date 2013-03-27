//
//  GLCFootbarController.m
//  GLCFootBar
//
//  Created by guo luchuan on 13-3-27.
//  Copyright (c) 2013年 yours. All rights reserved.
//

#import "GLCFootbarController.h"

#import "GLCFootBar.h"
#import "GLCFootBarItem.h"

#import "GLCBaseNavigationController.h"

#import <QuartzCore/QuartzCore.h>

@interface GLCFootbarController ()
{
    
    UIView *_mainView;
    GLCFootBar *_footBar;
    
}

@property (nonatomic, readwrite) NSMutableArray *footbarArray;

@end

@implementation GLCFootbarController

- (id)initWithFootBarArray:(NSMutableArray *)footbarArray
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        _footbarArray = footbarArray;
        
        self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20);
        _mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49)];
        _mainView.backgroundColor = [UIColor grayColor];
        _footBar = [GLCFootBar footBarWithType:FootBarTypeFlip];
        _footBar.frame = CGRectMake(0, _mainView.frame.origin.x + _mainView.frame.size.height, _footBar.frame.size.width, _footBar.frame.size.height);
        
        for (int i = 0; i < 4; i++) {
            [((GLCFootBarItem *)[_footBar.footBarItemList objectAtIndex:i]) addTarget:self action:@selector(footBarItemSelected:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        [self.view addSubview:_mainView];
        [self.view addSubview:_footBar];

    }
    return self;
}

- (void)changeViewForFootBarItemSelected:(int)index
{
    for (int i = 0; i < [_footbarArray count]; i++) {
        if (i == index) {
            if ([(GLCBaseNavigationController *)[_footbarArray objectAtIndex:i] isShown]) {
                [(GLCBaseNavigationController *)[_footbarArray objectAtIndex:i]  popToRootViewControllerAnimated:YES];
            }
            else
            {
                [(GLCBaseNavigationController *)[_footbarArray objectAtIndex:i]  showViewOn:_mainView];
            }
        }
        else
        {
            if ([(GLCBaseNavigationController *)[_footbarArray objectAtIndex:i]  isShown]) {
                [(GLCBaseNavigationController *)[_footbarArray objectAtIndex:i]  dismissViewOnSuperView];
            }
        }
    }
}

- (void)footBarItemSelected:(UIButton *)sender
{
    [self changeViewForFootBarItemSelected:sender.tag];
    
    CATransition *transition = [[CATransition alloc] init];
    transition.duration = .5;
    
    [_mainView.layer addAnimation:transition forKey:@"animationTest"];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
