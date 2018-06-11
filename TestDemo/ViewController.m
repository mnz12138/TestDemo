//
//  ViewController.m
//  TestDemo
//
//  Created by Apple on 2018/6/11.
//  Copyright © 2018年 王全金. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = [ViewController getParamsWithUrlString:@"rgj://package/list?a=1&b=2"];
    NSLog(@"%@",array);
}
//根据url取后面的参数
+ (NSArray*)getParamsWithUrlString:(NSString*)urlString {
    if(urlString.length==0) {
        NSLog(@"链接为空！");
        return @[@"",@{}];
    }
    //先截取问号
    NSArray*allElements = [urlString componentsSeparatedByString:@"?"];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];//待set的参数字典
    if(allElements.count==2) {
        //有参数或者?后面为空
        NSString*myUrlString = allElements[0];
        NSString*paramsString = allElements[1];
        //获取参数对
        NSArray*paramsArray = [paramsString componentsSeparatedByString:@"&"];
        if(paramsArray.count>=2) {
            for(NSInteger i =0; i < paramsArray.count; i++) {
                NSString*singleParamString = paramsArray[i];
                NSArray*singleParamSet = [singleParamString componentsSeparatedByString:@"="];
                if(singleParamSet.count==2) {
                    NSString*key = singleParamSet[0];
                    NSString*value = singleParamSet[1];
                    if(key.length>0|| value.length>0) {
                        [params setObject:value.length>0?value:@""forKey:key.length>0?key:@""];
                    }
                }
            }
        }else if(paramsArray.count==1) {
            //无 &。url只有?后一个参数
            NSString*singleParamString = paramsArray[0];
            NSArray*singleParamSet = [singleParamString componentsSeparatedByString:@"="];
            if(singleParamSet.count==2) {
                NSString*key = singleParamSet[0];
                NSString*value = singleParamSet[1];
                if(key.length>0|| value.length>0) {
                    [params setObject:value.length>0?value:@""forKey:key.length>0?key:@""];
                }
            }else{
                //问号后面啥也没有 xxxx?  无需处理
            }
        }
        //整合url及参数
        return@[myUrlString,params];
    }else if(allElements.count>2) {
        NSLog(@"链接不合法！链接包含多个\"?\"");
        return @[@"",@{}];
    }else{
        NSLog(@"链接不包含参数！");
        return@[urlString,@{}];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

@end
