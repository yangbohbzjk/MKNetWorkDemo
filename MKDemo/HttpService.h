//
//  HttpService.h
//  Merchant
//
//  Created by David on 13-5-22.
//  Copyright (c) 2013年 David. All rights reserved.
//

#import "MKNetworkEngine.h"

#import "StoreInfo.h"

@interface HttpService : MKNetworkEngine

#pragma mark ----------------------获取单例对象
+(HttpService*)shareEngine;

#pragma mark ----------------------登录认证
typedef void (^StoreInfoResponseBlock)(StoreInfo *storeInfos);
//block载体 -  所运送的数据类型

- (MKNetworkOperation*)getLogin:(StoreInfoResponseBlock)storeInfos
                        onError:(MKNKResponseErrorBlock) error;


typedef void (^SunNingResponseBlock)(MKNetworkOperation *suning);


- (MKNetworkOperation *)getSN:(SunNingResponseBlock)suning
                      onError:(MKNKResponseErrorBlock) error
                AndCatalogIds:(NSString*)aCatalogIds
                    AndToreId:(NSString *)aToreId;



                                      















@end
