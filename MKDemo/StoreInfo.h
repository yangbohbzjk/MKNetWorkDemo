//
//  StoreInfo.h
//  MKDemo
//
//  Created by David on 13-7-23.
//  Copyright (c) 2013年 jianxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoreInfo : NSObject

@property (nonatomic, assign) NSInteger slay;

@property (nonatomic, retain) NSDictionary *rs;

@property (nonatomic, retain) NSString *CardNum;

@property (nonatomic, retain) NSString *ProductName;

@property (nonatomic, retain) NSString *State;

@property (nonatomic, retain) NSString *Price;

@property (nonatomic, retain) NSString *Seller;

- (id)initStoreInfoWithDic:(NSDictionary *)dic;
@end
