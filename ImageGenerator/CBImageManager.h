//
//  CBImageManager.h
//  ImageGenerator
//
//  Created by Hsu Cloud on 2012/5/30.
//  Copyright (c) 2012年 Orz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CBImageFile;
@class CBImageInfo;

@interface CBImageManager : NSObject

+ (NSImage*) resizeImage:(NSImage*)srcImage newWidth:(int)newWidth newHeight:(int)newHeight;

+ (NSImage*) loadImage:(NSString*)fileName;
+ (void)saveIcon:(CBImageFile*) image andInfo:(CBImageInfo*) info;
+ (NSString*) getIconName:(CBImageFile*) image andInfo:(CBImageInfo*) info;
+ (void) saveImage:(NSImage*)image andName:(NSString*)fileName;

+ (void) saveiOSImage:(CBImageFile*)image newWidth:(float)width newHeight:(float)height;
+ (void) saveAndroidImage:(CBImageFile*)image newWidth:(float)width newHeight:(float)height;
+ (void) saveWP7Image:(CBImageFile*)image newWidth:(float)width newHeight:(float)height;

@end
