//
//  UpdateVersionTool.h
//  AppVersionUpdateDemo
//
//  Created by LiCheng on 16/6/20.
//  Copyright © 2016年 Li_Cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UpdateVersionTool : NSObject

/**
 *  版本更新
 *
 *  @param appid              该app的id (在itunes connect中获取)
 *  @param isShowReleaseNotes 是否显示版本注释
 *  @param controller         要显示的controller
 */
+(void)updateVersionForAppID:(NSString *)appid
          isShowReleaseNotes:(BOOL)isShowReleaseNotes
              showController:(UIViewController *)controller;


@end
