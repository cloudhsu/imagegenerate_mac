//
//  CBDeviceManager.m
//  ImageGenerator
//
//  Created by Hsu Cloud on 2012/5/30.
//  Copyright (c) 2012年 Orz. All rights reserved.
//

#import "CBDeviceManager.h"

@implementation CBDeviceManager

+ (void) createAllDeviceDirectory:(NSString*)rootDirectory
{
    [self createiOSDir:rootDirectory];
    [self createAndroidDir:rootDirectory];
    [self createWP7Dir:rootDirectory];
}

+ (void) createiOSDir:(NSString*)rootDirectory
{
    NSString* newPath = [NSString stringWithFormat:@"%@/iOS",rootDirectory];
    [self createDir:newPath];
}
+ (void) createAndroidDir:(NSString*)rootDirectory
{
    NSString* newPath = [NSString stringWithFormat:@"%@/Android",rootDirectory];
    [self createDir:newPath];
    newPath = [NSString stringWithFormat:@"%@/Android/drawable-hdpi",rootDirectory];
    [self createDir:newPath];
    newPath = [NSString stringWithFormat:@"%@/Android/drawable-mdpi",rootDirectory];
    [self createDir:newPath];
    newPath = [NSString stringWithFormat:@"%@/Android/drawable-ldpi",rootDirectory];
    [self createDir:newPath];
}
+ (void) createWP7Dir:(NSString*)rootDirectory
{
    NSString* newPath = [NSString stringWithFormat:@"%@/WP7",rootDirectory];
    [self createDir:newPath];
}

+ (void) createDir:(NSString*)path
{
    BOOL isDir;
    NSFileManager *fileManager= [NSFileManager defaultManager]; 
    if(![fileManager fileExistsAtPath:path isDirectory:&isDir])
        if(![fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:NULL])
            NSLog(@"Error: Create folder failed %@", path);

}

@end
