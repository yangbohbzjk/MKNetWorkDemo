//
//  HttpService.m
//  Merchant
//
//  Created by David on 13-5-22.
//  Copyright (c) 2013年 David. All rights reserved.
//

#import "HttpService.h"

@implementation HttpService

//获取单例
static HttpService *engine = nil;
+(HttpService *)shareEngine{
    @synchronized(self)
    {
        if (engine == nil)
        {
            engine = [[self alloc] initWithHostName:HOST_URL];
            /*
             HostName就是主机名:121.199.36.244:8080类似的东西，8080是主机的端口号，一般默认就是8080
             MKNetWorkKit库，默认添加http:// 头，不需要自己添加，否则不能测通
             */
        }
    }
    return engine;
}

-(MKNetworkOperation *)getLogin:(StoreInfoResponseBlock)storeInfos
                        onError:(MKNKResponseErrorBlock)error

{
    NSString *url = [NSString stringWithFormat:@"DeliveryService.aspx"];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    [dic setObject:@"CheckCard" forKey:@"action"];
    [dic setObject:@"ZG1004"    forKey:@"CardNum"];
    [dic setObject:@"111111" forKey:@"CardCode"];
    MKNetworkOperation *op = [self operationWithPath:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] params:dic httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSString *string = [completedOperation responseString];
//        //这是解析后的数据
        NSDictionary *d = [string objectFromJSONString];
//        //如果真的数据解析出来后进行这里
//        
        StoreInfo *storeInfo = [[StoreInfo alloc]initStoreInfoWithDic:d];
//
//        //这里回调对象
        storeInfos(storeInfo);
      
//        
        
        NSLog(@"%@",string);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *_error) {
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"errorMessage" object:@"网络连接错误!"];
//        error(completedOperation,_error);
    }];
    [self enqueueOperation:op];
    return op;
}


-(MKNetworkOperation *)getSN:(SunNingResponseBlock)suning
                     onError:(MKNKResponseErrorBlock)error
               AndCatalogIds:(NSString *)aCatalogIds
                   AndToreId:(NSString *)aToreId
{
    //传入接口
    NSString *url = [NSString stringWithFormat:@"%@",SUNING_URL ];
    //因为请求的是post，所以用字典
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    
    //传入参数列表
    [dict setObject:aCatalogIds forKey:@"catalogIds"];
    [dict setObject:aToreId forKey:@"storeId"];
    
    MKNetworkOperation *op = [self operationWithPath:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] params:dict httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        //这是是请求成功后返回的地方
        NSString *string = [completedOperation responseString];
        NSLog(@"string:%@",string);
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        //这里是请求失败后进入的地方
        
        
        
    }];
    [self enqueueOperation:op];
    return op;
}

@end