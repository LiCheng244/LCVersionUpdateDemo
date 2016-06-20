//
//  ViewController.m
//  AppVersionUpdateDemo
//
//  Created by LiCheng on 16/6/20.
//  Copyright © 2016年 Li_Cheng. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "UpdateVersionTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UpdateVersionTool updateVersionForAppID:@"1068981536" isShowReleaseNotes:YES showController:self];
    
}

-(void)updateVersion{
    
}


@end
