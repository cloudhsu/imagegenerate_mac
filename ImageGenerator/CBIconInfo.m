//
//  CBIconInfo.m
//  ImageGenerator
//
//  Created by Hsu Cloud on 2012/5/30.
//  Copyright (c) 2012年 Orz. All rights reserved.
//

#import "CBIconInfo.h"
#import "CBImageInfo.h"

@implementation CBIconInfo

@synthesize iconInfos = _iconInfos;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        _iconInfos = [[NSMutableArray alloc]init];
    }
    
    return self;
}

- (void)dealloc
{
    [_iconInfos release];
    [super dealloc];
}

+ (CBIconInfo*) defaultIconInfo
{
    CBIconInfo* infos = [[CBIconInfo alloc]init];
    
    ////////////////////////////////////////////////////
    CBImageInfo* info  = [[CBImageInfo alloc]init];
    info.DeviceType = DeviceiOS;
    info.width = 57;
    info.height = 57;
    info.fileName = @"icon.png";
    [infos.iconInfos addObject:info];
    [info release];
    
    info  = [[CBImageInfo alloc]init];
    info.DeviceType = DeviceiOS;
    info.width = 114;
    info.height = 114;
    info.fileName = @"icon@2x.png";
    [infos.iconInfos addObject:info];
    [info release];
    
    info  = [[CBImageInfo alloc]init];
    info.DeviceType = DeviceiOS;
    info.width = 72;
    info.height = 72;
    info.fileName = @"icon-72.png";
    [infos.iconInfos addObject:info];
    [info release];
    
    info  = [[CBImageInfo alloc]init];
    info.DeviceType = DeviceiOS;
    info.width = 144;
    info.height = 144;
    info.fileName = @"icon-72@2x.png";
    [infos.iconInfos addObject:info];
    [info release];
    
    ////////////////////////////////////////////////////
    info  = [[CBImageInfo alloc]init];
    info.DeviceType = DeviceAndroid;
    info.width = 36;
    info.height = 36;
    info.fileName = @"drawable-ldpi/icon.png";
    [infos.iconInfos addObject:info];
    [info release];
    
    info  = [[CBImageInfo alloc]init];
    info.DeviceType = DeviceAndroid;
    info.width = 48;
    info.height = 48;
    info.fileName = @"drawable-mdpi/icon.png";
    [infos.iconInfos addObject:info];
    [info release];
    
    info  = [[CBImageInfo alloc]init];
    info.DeviceType = DeviceAndroid;
    info.width = 72;
    info.height = 72;
    info.fileName = @"drawable-hdpi/icon.png";
    [infos.iconInfos addObject:info];
    [info release];
    
    info  = [[CBImageInfo alloc]init];
    info.DeviceType = DeviceAndroid;
    info.width = 135;
    info.height = 135;
    info.fileName = @"SamsngMarket.png";
    [infos.iconInfos addObject:info];
    [info release];
    
    ////////////////////////////////////////////////////
    info  = [[CBImageInfo alloc]init];
    info.DeviceType = DeviceWP7;
    info.width = 62;
    info.height = 62;
    info.fileName = @"ApplicationIcon.png";
    [infos.iconInfos addObject:info];
    [info release];
    
    info  = [[CBImageInfo alloc]init];
    info.DeviceType = DeviceWP7;
    info.width = 173;
    info.height = 173;
    info.fileName = @"ApplicationTile.png";
    [infos.iconInfos addObject:info];
    [info release];
    
    info  = [[CBImageInfo alloc]init];
    info.DeviceType = DeviceWP7;
    info.width = 99;
    info.height = 99;
    info.fileName = @"Market99.png";
    [infos.iconInfos addObject:info];
    [info release];
    
    info  = [[CBImageInfo alloc]init];
    info.DeviceType = DeviceWP7;
    info.width = 200;
    info.height = 200;
    info.fileName = @"Market200.png";
    [infos.iconInfos addObject:info];
    [info release];
    
    return [infos autorelease];
}

@end
