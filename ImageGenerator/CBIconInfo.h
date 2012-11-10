//
//  CBIconInfo.h
//  ImageGenerator
//
//  Created by Hsu Cloud on 2012/5/30.
//  Copyright (c) 2012年 Orz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBIconInfo : NSObject
{
    NSMutableArray* _iconInfos;
}

@property (assign) NSMutableArray* iconInfos;

+ (CBIconInfo*) defaultIconInfo;

@end
