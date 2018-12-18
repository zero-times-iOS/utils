//
//  WebViewManage.m
//  工具类
//
//  Created by 汤圆 on 2018/4/28.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "WebViewManage.h"

@implementation WebViewManage

+ (WebViewManage*)initJSHandle:(WebViewBlcok)message
{
    WebViewManage* js = [WebViewManage new];
    js.block = message;
    return js;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if (self.block) {
        self.block(message);
    }
}


@end
