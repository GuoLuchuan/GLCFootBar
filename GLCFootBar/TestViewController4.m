//
//  TestViewController4.m
//  GLCFootBar
//
//  Created by guo luchuan on 13-3-26.
//  Copyright (c) 2013年 yours. All rights reserved.
//

#import "TestViewController4.h"
#import "TestViewController2.h"

@interface TestViewController4 ()

@end

@implementation TestViewController4

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        self.view.frame = CGRectMake(0, 0, 320, 480 - 20 - 49);
        self.view.backgroundColor = [UIColor yellowColor];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
        btn.backgroundColor = [UIColor blackColor];
        [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
    return self;
}

- (void)test
{
    NSAssert(self.navigationController, @" self.navigationController is nil , so you can not push in another controller ");
    
    [self.navigationController pushViewController:[[TestViewController2 alloc] init] animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
        
    self.title = @"test4";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
