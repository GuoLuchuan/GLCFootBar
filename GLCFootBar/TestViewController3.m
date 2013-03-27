//
//  TestViewController3.m
//  GLCFootBar
//
//  Created by guo luchuan on 13-3-26.
//  Copyright (c) 2013年 yours. All rights reserved.
//

#import "TestViewController3.h"
#import "TestViewController1.h"

@interface TestViewController3 ()

@end

@implementation TestViewController3

- (id)init
{

    self = [super init];
    if (self) {
        // Custom initialization

        self.view.frame = CGRectMake(0, 0, 320, 480 - 20 - 49);
        self.view.backgroundColor = [UIColor redColor];
        
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
    
    [self.navigationController pushViewController:[[TestViewController1 alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"test3";
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
