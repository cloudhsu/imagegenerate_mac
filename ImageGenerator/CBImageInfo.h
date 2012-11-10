//
//  CBImageInfo.h
//  ImageGenerator
//
//  Created by Hsu Cloud on 2012/5/30.
//  Copyright (c) 2012年 Orz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum  {
    DeviceiOS,
    DeviceAndroid,
    DeviceWP7
} DeviceType;


@interface CBImageInfo : NSObject
{
    DeviceType _deviceType;
    NSString* _fileName;
    float _width;
    float _height;
}

@property (assign) DeviceType deviceType;
@property (assign) NSString* fileName;
@property (assign) float width;
@property (assign) float height;

@end
