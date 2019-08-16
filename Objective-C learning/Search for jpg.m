//
//  main.m
//  Objective-C learning
//
//  Created by cmb on 2019/8/14.
//  Copyright © 2019 cmb. All rights reserved.
//

#import <Foundation/Foundation.h>
int main (int argc, const char *argv[])
{

    
    NSFileManager *manager;
    manager = [NSFileManager defaultManager];
    
    //每调用一次，都会返回文件目录的一个路径
    NSString *home;
    home = [@"~" stringByExpandingTildeInPath];
    
    //参数传递给文件管理器
    NSDirectoryEnumerator *direnum;
    direnum = [manager enumeratorAtPath: home];
    
    //分配容量
    NSMutableArray *files;
    files = [NSMutableArray arrayWithCapacity: 42];
    
    //搜索jpg，并加入数组
    NSString *filename;
    while (filename = [direnum nextObject]) {
        if ([[filename pathExtension] isEqualTo:@"jpg"]) {
            [files addObject: filename];
            
        }
    }
    NSEnumerator *fileenum;
    fileenum = [files objectEnumerator];
    
    while (filename = [fileenum nextObject]) {
        NSLog(@"%@", filename);
    }
    

    return 0;
}
