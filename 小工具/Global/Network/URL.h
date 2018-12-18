//
//  URL.h
//  工具类
//
//  Created by Beyond on 2018/4/22.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URL : NSObject

#define env 1

#if (env == 1)
#define SERVICE    @"http://loye.kxloye.com/index.php/Mobile"   // 开发环境

#elif (env == 2)
#define SERVICE    @"http://api.ydt138.com"      // 测试环境

#elif (env == 3)
#define SERVICE    @"http://api.ydt138.com"      // 正试环境
#endif


/*==================================
                首页
 ===================================*/
#define KP_URL                  @""SERVICE"/User/do_login"// 科普首页
#define KPXQPL_URL              @""SERVICE"/api/sp/getSpCommentList.json"// 科普详情收藏
#define KPXQFB_URL              @""SERVICE"/api/sp/saveSpComment.json"// 科普详情发表评论
#define ZJSC_URL                @""SERVICE"/api/saveExCollection.json"// 专家收藏






/*==================================
                发现
 ===================================*/
#define LBT_URL                 @""SERVICE"/api/banner/getBannerForIndexList.json"//首页-轮播图
#define ZJTJ_URL                @""SERVICE"/api/member/getMemberExpertForIndexList.json"//首页-专家推荐






#define HOST                    @"http://loye.kxloye.com"
#define YanZheng                @""HOST"/index.php/Home/Api/send_pflmsm_code"
#define ZhuCeng                 @""HOST"/index.php/Mobile/User/reg"

















































@end
