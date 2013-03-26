//
//  TestViewController3.m
//  GLCFootBar
//
//  Created by guo luchuan on 13-3-26.
//  Copyright (c) 2013年 yours. All rights reserved.
//

#import "TestViewController3.h"

@interface TestViewController3 ()

@end

@implementation TestViewController3

- (id)init
{

    self = [super init];
    if (self) {
        // Custom initialization
        
//        self.navigationBarHidden = NO;
        
        
        
        self.view.frame = CGRectMake(0, 0, 320, 480 - 20 - 49);
        self.view.backgroundColor = [UIColor redColor];

    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = @"1111";
    
    self.navigationItem.title = @"22222";
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
