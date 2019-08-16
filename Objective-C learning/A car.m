
//
//  Interface.m
//  Objective-C learning
//
//  Created by cmb on 2019/8/14.
//  Copyright © 2019 cmb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tire : NSObject
@end // Tire

@implementation Tire
- (NSString *) description {
    return (@"I am a tire. I last a while");
}
@end //Tire



@interface Engine : NSObject
@end //Engine

@implementation Engine
- (NSString *) description {
    return (@"I am an engine. Vroom!");
}
@end  //Engine


//一辆车四个轮和一个引擎
@interface Car : NSObject
{
    Engine *engine;
    Tire *tires[4];
}

- (void) print;
//get和set方法应用
- (Engine *) engine;
- (void) setEngine: (Engine *) newEngine;
- (Tire *) tireAtIndex: (int) Index;
- (void) setTire: (Tire *) tire atIndex: (int) index;
@end //car

@implementation Car
//- (id) init
//{
//    if (self = [super init]) {
//        engine = [Engine new];
//
//        tires[0] = [Tire new];
//        tires[1] = [Tire new];
//        tires[2] = [Tire new];
//        tires[3] = [Tire new];
//    }
//    return (self);
//}
- (void) print
{
    NSLog (@"%@", engine);
    
    NSLog (@"%@", tires[0]);
    NSLog (@"%@", tires[1]);
    NSLog (@"%@", tires[2]);
    NSLog (@"%@", tires[3]);
}

- (Engine *) engine
{
    return engine;
}//  engine

- (void) setEngine:(Engine *)newEngine
{
    engine = newEngine;
} //setEngine

- (void) setTire:(Tire *)tire atIndex:(int)index
{
    //c语言没有范围检查，需要自己编程设置防止溢出
    if (index < 0 || index > 3) {
        NSLog (@"bad index (%d) in setTire:atIndex:", index);
        exit(1);
    }
    
    tires[index] = tire;
} // setTire:atIndex:
- (Tire *) tireAtIndex:(int)index
{
    if (index < 0 || index > 3) {
        NSLog (@"bad index (%d) in setTire:atIndex:", index);
        exit(1);
    }
    
    return tires[index];
}
@end


//int main(int argc, const char * argv[]) {
//
//    Car *car;
//
//    car = [Car new];
//    [car print];
//
//    return 0;
//}

int main (int argc, const char * argv[]) {
    Car *car = [Car new];
    
    Engine *engine = [Engine new];
    [car setEngine: engine];
    
    int i;
    for (i = 0; i < 4; i++) {
        Tire *tire = [Tire new];
        
        [car setTire: tire atIndex: i];
    }
    [car print];
    return 0;
}
