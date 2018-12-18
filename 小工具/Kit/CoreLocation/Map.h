//
//
//
//  Created by Beyond on 16/9/9.
//  Copyright © 2016年 Beyond. All rights reserved.

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>


typedef void(^MapCode)(NSDictionary *dic);
typedef void(^CodeMap)(NSString *name);
typedef void(^Successfrl)(NSArray *Locations);
typedef void(^Failurs)(NSString *str);

@interface Map : NSObject <CLLocationManagerDelegate>

//地理编码
@property (nonatomic ,strong)CLGeocoder *geoC;
@property (nonatomic ,strong)CLLocationManager *lm;



+(Map *)shared;



/** 地理编码
 *  正向地理编码，是将地址或地名描述转换为地球表面上相应位置的过程。正向地理编码提供地址定位引擎、行政区划引擎、街道引擎。
 *  name:地理位置
 *  返回两个地址坐标（NSString类型的）
 */
-(void)MapCode:(NSString*)name succeed:(MapCode)mapcode;

/** 反地理编码
 *  把经度和纬度换成地址
 *  latitude:纬度
 *  longitude:经度
 */
-(void)CodeMap:(NSString *)latitude Longitude:(NSString *)longitude succeed:(CodeMap)mapcode;

/**
 *  获取位置（移动就会更新位置）
 *  注意：使用定位功能plist必须同时包含
         NSLocationAlwaysAndWhenInUseUsageDescription
         NSLocationWhenInUseUsageDescription
         键和字符串值，向用户解释应用程序如何使用这些数据
 */
-(void)getLocationSuccessfrl:(Successfrl )location Failurs:(Failurs)failure;

/**
 *  停止更新
 */
-(void)stopUpdateLocation;




/*   使用方法
 [[Map shared] MapCode:@"长沙市" succeed:^(NSDictionary *dic) {
 
    NSLog(@"%@",dic);
 }];
 
 [[Map shared] CodeMap:@"28.19409" Longitude:@"112.982279" succeed:^(NSString *name) {
 
    NSLog(@"%@",name);
 }];
 
 */









@end
