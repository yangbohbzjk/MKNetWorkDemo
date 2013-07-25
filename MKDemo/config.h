//
//  config.h
//  Merchant
//
//  Created by David on 13-5-18.
//  Copyright (c) 2013年 David. All rights reserved.
//
//======================工具宏定义====================
#define APPDELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define IS_IPHONE5 [[UIScreen mainScreen]applicationFrame].size.height >480

#define Colour(R,G,B,A) [UIColor colorWithRed:(R/255.0) green:(G/255.0) blue:(B/255.0) alpha:A]
//========================END=======================





#pragma mark ====== HOST URL ======
//主机host
//#define HOST_URL @"121.199.36.244:8080"
#define HOST_URL @"ka.4008527527.com"

//#define HOST_URL @"www.suning.com"

#define SUNING_URL @"webapp/wcs/stores/servlet/SNmobileTopMenu"











