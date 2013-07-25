//
//  StoreInfo.m
//  MKDemo
//
//  Created by David on 13-7-23.
//  Copyright (c) 2013年 jianxin. All rights reserved.
//

#import "StoreInfo.h"

@implementation StoreInfo

-(id)initStoreInfoWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.slay = [[dic objectForKey:@"slay"]intValue];
        self.rs = [dic objectForKey:@"rs"];
        
        if (self.rs) {
            self.CardNum = [self.rs objectForKey:@"CardNum"];
            self.ProductName = [self.rs objectForKey:@"ProductName"];
            self.State = [self.rs objectForKey:@"State"];
            self.Price = [self.rs objectForKey:@"Price"];
            self.Seller = [self.rs objectForKey:@"Seller"];
        }
    }
    return self;
}
@end
