//
//  MHViewController.m
//  BaseProject
//
//  Created by 1045908529 on 02/20/2017.
//  Copyright (c) 2017 1045908529. All rights reserved.
//

#import "MHViewController.h"
#import <BaseProject/UIView+HUD.h>

@interface MHViewController ()

@end

@implementation MHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view showHudWithActivity:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
