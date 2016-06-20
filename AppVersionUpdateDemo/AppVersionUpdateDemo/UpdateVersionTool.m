//
//  UpdateVersionTool.m
//  AppVersionUpdateDemo
//
//  Created by LiCheng on 16/6/20.
//  Copyright © 2016年 Li_Cheng. All rights reserved.
//

#import "UpdateVersionTool.h"
#import "AFNetworking.h"

@interface UpdateVersionTool()

@end

@implementation UpdateVersionTool

/**
 *      网址问题:
 
    在网上的博客里面都是 //:itunes.apple.com/lookup?id=你的appid
    这个 网址解析出来的东西是空的
            
    需要加上/cn
    //:itunes.apple.com/cn/lookup?id=你的appid
 */


+(void)updateVersionForAppID:(NSString *)appid
          isShowReleaseNotes:(BOOL)isShowReleaseNotes
              showController:(UIViewController *)controller{
    
    NSString *urlStr = [NSString stringWithFormat:@"http://itunes.apple.com/cn/lookup?id=%@", appid];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSMutableArray *arr = [responseObject objectForKey:@"results"];
        NSDictionary   *dic = arr[0];
        
        // 获取 appstore 信息
        NSString *newVersion   = [dic objectForKey:@"version"];      // 版本号
        NSString *newURL       = [dic objectForKey:@"trackViewUrl"]; // 程序地址
        NSString *releaseNotes = [dic objectForKey:@"releaseNotes"]; // 版本注释
        
        // 本地版本号
        NSString *localVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        
        // 版本号比较
        if (![newVersion isEqualToString:localVersion]) {// 有版本更新
            
            NSString *message = nil;
            
            if (isShowReleaseNotes == YES) {
                message = releaseNotes;
            }else{
                message = @"赶快更新吧，第一时间体验新功能！";
            }
            
            UIAlertController *alertV = [UIAlertController alertControllerWithTitle:@"有新版本了！" message:message preferredStyle:(UIAlertControllerStyleAlert)];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                // 跳转到url
                if (newURL != nil) {
                    NSURL *url=[NSURL URLWithString:newURL];
                    [[UIApplication sharedApplication] openURL:url];
                }
            }];
            //修改按钮颜色
            [cancelAction setValue:[UIColor brownColor] forKey:@"titleTextColor"];
            
            [alertV addAction:cancelAction];
            [alertV addAction:okAction];
            [controller presentViewController:alertV animated:YES completion:nil];
        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
    }];
    
}

@end
