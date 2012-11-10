//
//  CBImageInfo.m
//  ImageGenerator
//
//  Created by Hsu Cloud on 2012/5/30.
//  Copyright (c) 2012年 Orz. All rights reserved.
//

#import "CBImageInfo.h"

@implementation CBImageInfo

@synthesize deviceType = _deviceType;
@synthesize fileName = _fileName;
@synthesize width = _width;
@synthesize height = _height;

- (void)dealloc
{
    [super dealloc];
}

@end
