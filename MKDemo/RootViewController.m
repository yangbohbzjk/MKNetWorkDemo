//
//  RootViewController.m
//  MKDemo
//
//  Created by David on 13-7-23.
//  Copyright (c) 2013年 jianxin. All rights reserved.
//

#import "RootViewController.h"
#import "StoreInfo.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [[HttpService shareEngine]getLogin:^(StoreInfo *storeInfos) {
        NSLog(@"请求成功");
        NSLog(@"%@",storeInfos.Price);
        //这里处理请求成功后的操作
    } onError:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"请求失败");
    }];

    
//    [[HttpService shareEngine]getSN:^(MKNetworkOperation *suning) {
//        //这里是请求成功后的回调
//        
//        NSLog(@"请求成功");
//        
//        
//    } onError:^(MKNetworkOperation *completedOperation, NSError *error) {
//        //请求失败后的回调
//        NSLog(@"请求失败");
//        
//    } AndCatalogIds:@"22001-10051" AndToreId:[NSString stringWithFormat:@"%@",@"10052"]];
//    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
