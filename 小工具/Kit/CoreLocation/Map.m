//
//  Map.m
//  工具类
//
//  Created by 汤圆 on 2018/5/14.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "Map.h"

static Map *map = nil;
static id SuccessfrlKey;
static id FailursKey;
@implementation Map


// 写成单例，便于全句获取
+(Map *)shared
{
    static dispatch_once_t touch;
    dispatch_once(&touch,^{
        map = [[Map alloc]init];
    });
    return map;
}


// 地理编码
-(void)MapCode:(NSString*)name succeed:(MapCode)mapcode;
{
    if (name.length != 0)
    {
        [self.geoC geocodeAddressString:name completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            if (error == nil)
            {
                [placemarks enumerateObjectsUsingBlock:^(CLPlacemark * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    
                    NSString *latitude = @(obj.location.coordinate.latitude).stringValue;
                    NSString *longitude = @(obj.location.coordinate.longitude).stringValue;
                    NSDictionary *dic = @{@"latitude":latitude,
                                          @"longitude":longitude};
                    if (mapcode) {
                        mapcode(dic);
                    }
                }];
            }
        }];
    }
}

// 反地理编码
-(void)CodeMap:(NSString *)latitude Longitude:(NSString *)longitude succeed:(CodeMap)mapcode
{
    double lati = [latitude doubleValue];
    double longi = [longitude doubleValue];
    
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:lati longitude:longi];
    [self.geoC reverseGeocodeLocation:loc completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (placemarks)
        {
            [placemarks enumerateObjectsUsingBlock:^(CLPlacemark * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
//                NSString *latitude = @(obj.location.coordinate.latitude).stringValue;
//                NSString *longitude = @(obj.location.coordinate.longitude).stringValue;
                if (mapcode) {
                    mapcode(obj.name);
                }
            }];
        }
    }];
}


-(void)getLocationSuccessfrl:(Successfrl )location Failurs:(Failurs)failure
{

	objc_setAssociatedObject(self, &SuccessfrlKey, location, OBJC_ASSOCIATION_COPY);
	objc_setAssociatedObject(self, &FailursKey, failure, OBJC_ASSOCIATION_COPY);
	// 请求权限  (如果在版本不同的情况下，可能会出现闪退现象，所以在这里要加一个系统版本的判断)
	if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
	{
		//如果在 8.0之前的版本，就不可运行
		[self.lm requestAlwaysAuthorization];
		// 允许后台获取位置（只适用于大于9.0版本）
		self.lm.allowsBackgroundLocationUpdates = YES;


		// 请求定位
		// [self.lm requestLocation];

	}

	// 这里还有一个方法
	// 如果这个对象可以响应这个方法，就去执行
	//    if ([_lm respondsToSelector:@selector(requestAlwaysAuthorization)])
	//    {
	//        [self.lm requestAlwaysAuthorization];
	//    }

	// 开始更新位置
	[self.lm startUpdatingLocation];
}


-(void)stopUpdateLocation
{
	[self.lm stopUpdatingLocation];
}


#pragma mark ---------  反回用户位置 ----------
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{

	Successfrl block = (Successfrl)objc_getAssociatedObject(self, &SuccessfrlKey);

	CLGeocoder *geocoder = [[CLGeocoder alloc]init];
	[geocoder reverseGeocodeLocation:[locations lastObject] completionHandler:^(NSArray *placemarks, NSError *error){


		if (block) {
			block(placemarks);
		}

	}];
}

#pragma mark ---------- 授权壮态发生改变时 ---------------
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{

	/*
	 kCLAuthorizationStatusNotDetermined            用户还没有决定
	 kCLAuthorizationStatusRestricted,              访问受限
	 kCLAuthorizationStatusDenied,                  被拒
	 kCLAuthorizationStatusAuthorizedAlways NS_ENUM_AVAILABLE(NA, 8_0),   获取前后台定位失败
	 kCLAuthorizationStatusAuthorizedWhenInUse NS_ENUM_AVAILABLE(NA, 8_0),
	 kCLAuthorizationStatusAuthorized
	 */

	Failurs block = (Failurs)objc_getAssociatedObject(self, &FailursKey);


	switch (status) {
		case kCLAuthorizationStatusDenied:
		{
			if (block) {
				block(@"授权状态被拒绝");
			}
		}
			break;
		case kCLAuthorizationStatusNotDetermined:
		{
			if (block) {
				block(@"用户还没有授权");
			}
		}
			break;
		case kCLAuthorizationStatusRestricted:
		{
			if (block) {
				block(@"授权状态受限");
			}
		}
			break;

		default:
			break;
	}


}

#pragma mark --------定位失败代理方法 ----------
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	Failurs block = (Failurs)objc_getAssociatedObject(self, &FailursKey);
	if (block) {
		block(@"定位失败");
	}
	NSLog(@"定位失败：%@",error);
}













-(CLGeocoder *)geoC
{
    if (!_geoC)
    {
        _geoC = [[CLGeocoder alloc]init];
    }
    return _geoC;
}

-(CLLocationManager *)lm
{
	if (!_lm) {
		_lm = [[CLLocationManager alloc]init];
		//设置代理
		_lm.delegate = self;
		//设置每隔多远就定一次位 （单位千米） 位置过虑
		_lm.distanceFilter = 50;
		//定位精确度
		_lm.desiredAccuracy = kCLLocationAccuracyBest;
		/*
		 kCLLocationAccuracyBestForNavigation      // 最适合导航
		 kCLLocationAccuracyBest;                  // 最好的
		 kCLLocationAccuracyNearestTenMeters;      // 10米  （以现在位置为中心，半经为10米的一个范围定位）
		 kCLLocationAccuracyHundredMeters;         // 100米
		 kCLLocationAccuracyKilometer;             // 1000米
		 kCLLocationAccuracyThreeKilometers;       // 3000米

		 要记住这点，精确度越高，越消耗电量，定位时间越长

		 */
	}
	return _lm;
}

@end
