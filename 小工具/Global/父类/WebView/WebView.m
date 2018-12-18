//
//  WebView.m
//  工具类
//
//  Created by 汤圆 on 2018/4/28.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "WebView.h"

@interface WebView ()  <WKNavigationDelegate,WKUIDelegate,UIScrollViewDelegate>
{
    NSMutableArray * jsArr;
}
@end

@implementation WebView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initUI];
    [self initNavButton];
    [self requestUrl];
}

// 设置UI
-(void)initUI
{
    self.navigationItem.hidesBackButton = YES;
    WKWebViewConfiguration * config = [WKWebViewConfiguration new];
    config.preferences.minimumFontSize = 0;//设置最小字体
    self.wkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, NavigaHeight, AppWidth, AppHeight - NavigaHeight) configuration:config];
    self.wkWebView.UIDelegate = self;
    self.wkWebView.navigationDelegate = self;
    self.wkWebView.scrollView.delegate = self;
    self.wkWebView.scrollView.bounces = NO;
    [self.view addSubview:self.wkWebView];
}





/************************************************
                UIBarButtonItem
 ************************************************/
-(void)initNavButton
{
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc] initWithCustomView:self.closeButton];
    self.navigationItem.leftBarButtonItems = @[item1,item2];
    [self.backButton addTarget:self action:@selector(backWeb) forControlEvents:UIControlEventTouchUpInside];
    [self.closeButton addTarget:self action:@selector(PopWeb) forControlEvents:UIControlEventTouchUpInside];
      
}
- (void)backWeb {
    if (self.wkWebView.canGoBack) {
        [self.wkWebView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)PopWeb
{
    [self.navigationController popViewControllerAnimated:YES];
}





/************************************************
                WKWebView代理方法
 ************************************************/
// 在发送请求之前，是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {

    decisionHandler(WKNavigationActionPolicyAllow);
    NSLog(@"在发送请求之前%@",navigationAction.request.URL.absoluteString);
}
// 知道返回内容之后，是否允许加载，允许加载
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {

    decisionHandler(WKNavigationResponsePolicyAllow);
}
// 跳转到其他的服务器
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation {

}
// 网页开始接收网页内容
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation {

}
// 使用消息运行JavaScript警告面板。
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    //    [APPTool normalAlertShowWith:message];
    completionHandler();
}
// 使用消息运行JavaScript确认面板。
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{
    completionHandler(YES);
}
// 使用提示符运行JavaScript文本输入面板。
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler{
    completionHandler(nil);
}

//开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

//加载失败
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error  {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    //    self.title = webView.title;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [webView evaluateJavaScript:@"document.title" completionHandler:^(id _Nullable ss, NSError * _Nullable error) {
        NSLog(@"----document.title:%@---webView title:%@",ss,webView.title);
    }];
    if (_ZoomBool == NO) {
        [self banZoominOn];
    }else{
        return;
    }
}





/************************************************
                    js交互
 ************************************************/
// JS调用OC代码
- (void)JSExchangeNameArr:(NSArray *)name handle:(WebViewBlcok)Body
{
    WebViewManage *js = [WebViewManage initJSHandle:^(WKScriptMessage *message) {
        Body(message);
    }];
    
    for (NSString * Str in name) {
        [self.wkWebView.configuration.userContentController addScriptMessageHandler:js name:Str];
    }
    [jsArr addObjectsFromArray:name];
}

// OC调用JS代码
-(void)OCExchangeOCString:(NSString *)Str
{
    [self.wkWebView evaluateJavaScript:Str completionHandler:^(id _Nullable idObj, NSError * _Nullable error) {
        NSLog(@"%@",idObj);
        NSLog(@"%@",error);
    }];
}




/************************************************
                    实例化
 ************************************************/
-(NSMutableArray *)jsArr
{
    if (!jsArr) {
        jsArr = [NSMutableArray new];
        [jsArr addObject:@"tokenInvalid"];
    }
    return jsArr;
}
- (UIButton *)closeButton {
    if (!_closeButton) {
        _closeButton = [[UIButton alloc] initWithFrame:CGRectMake(45, 4, 40, 36)];
        [_closeButton setTitle:@"关闭" forState:UIControlStateNormal];
        [_closeButton setTitleColor:RGBColor(26, 26, 26, 1) forState:UIControlStateNormal];
        _closeButton.hidden = YES;  // 如果不要这个关闭But可以隐藏
    }
    return _closeButton;
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton new];
        _backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 4, 40, 36)];
        [_backButton setTitle:@"返回" forState:UIControlStateNormal];
//        [_backButton setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
        _backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 10);
        [_backButton setTitleColor:RGBColor(26, 26, 26, 1) forState:UIControlStateNormal];
    }
    return _backButton;
}

- (void)dealloc
{
    for (NSString* name in jsArr) {
        [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:name];
    }
}
// 禁止放大缩小 
- (void)banZoominOn
{
    // 禁止放大缩小
    NSString *injectionJSString = @"var script = document.createElement('meta');"
    "script.name = 'viewport';"
    "script.content=\"width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0, user-scalable=no\";"
    "document.getElementsByTagName('head')[0].appendChild(script);";
    [self.wkWebView evaluateJavaScript:injectionJSString completionHandler:nil];
}

// 加载Url
-(void)requestUrl
{
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]]];
}

@end
