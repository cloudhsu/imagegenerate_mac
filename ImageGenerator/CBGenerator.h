//
//  CBGenerator.h
//  ImageGenerator
//
//  Created by Hsu Cloud on 2012/5/30.
//  Copyright (c) 2012年 Orz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBGenerator : NSObject

+ (void)generateIconsWithRootPath:(NSString*)rootPath andFileName:(NSString*)fileName;
+ (void)generateImagesWithRootPath:(NSString*)rootPath;

+ (void)generateImagesWithRootPath:(NSString*)rootPath newWidth:(float)width newHeight:(float)height;

+ (void)generateImagesWithFile:(NSString*)fileName newWidth:(float)width newHeight:(float)height;

@end
