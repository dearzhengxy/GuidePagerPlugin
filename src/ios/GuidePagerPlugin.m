//
//  GuidePagerPlugin.m
//  小银袋
//
//  Created by MAC005 on 2018/8/1.
//

#import "GuidePagerPlugin.h"
#import "JBWelcomeGuideActivity.h"
@implementation GuidePagerPlugin
- (void)openGuidePager:(CDVInvokedUrlCommand *)command
{
    
    /*
     判断是否第一次使用这个版本
     */
    NSString *key=(NSString *)kCFBundleVersionKey;
    
    NSString *lastVersionCode=[[NSUserDefaults standardUserDefaults] objectForKey:key];
    NSString *currentVersonCode=[NSBundle mainBundle].infoDictionary[key];
    
    if (![lastVersionCode isEqual:currentVersonCode])
    {
        //第一次使用软件
        // 保存当前软件版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersonCode forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        JBWelcomeGuideActivity *vc = [[JBWelcomeGuideActivity alloc]init];
        [self.viewController presentViewController:vc animated:NO completion:nil];
    }
}
@end
