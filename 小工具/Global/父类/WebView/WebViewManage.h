//
//  WebViewManage.h
//  工具类
//
//  Created by 汤圆 on 2018/4/28.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
							
typedef void(^WebViewBlcok)(WKScriptMessage *message);
@interface WebViewManage : NSObject <WKScriptMessageHandler>


@property (nonatomic,copy) WebViewBlcok block;



+ (WebViewManage*)initJSHandle:(WebViewBlcok)message;

@end
