//
//  CBDeviceManager.h
//  ImageGenerator
//
//  Created by Hsu Cloud on 2012/5/30.
//  Copyright (c) 2012年 Orz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBDeviceManager : NSObject

+ (void) createAllDeviceDirectory:(NSString*)rootDirectory;

+ (void) createiOSDir:(NSString*)rootDirectory;
+ (void) createAndroidDir:(NSString*)rootDirectory;
+ (void) createWP7Dir:(NSString*)rootDirectory;

+ (void) createDir:(NSString*)path;

@end
