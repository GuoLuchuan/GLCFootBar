//
//  TestViewController4.m
//  GLCFootBar
//
//  Created by guo luchuan on 13-3-26.
//  Copyright (c) 2013年 yours. All rights reserved.
//

#import "TestViewController4.h"

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
    }
    return self;
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
