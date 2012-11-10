//
//  CBGenerator.m
//  ImageGenerator
//
//  Created by Hsu Cloud on 2012/5/30.
//  Copyright (c) 2012年 Orz. All rights reserved.
//

#import "CBGenerator.h"
#import "CBDeviceManager.h"
#import "CBImageFile.h"
#import "CBIconInfo.h"
#import "CBImageInfo.h"
#import "CBImageManager.h"

@implementation CBGenerator

+ (void)generateIconsWithRootPath:(NSString*)rootPath andFileName:(NSString*)fileName;
{
    NSLog(@"%@:%ld\n",rootPath, [rootPath retainCount]);
    NSLog(@"%@:%ld\n",fileName, [fileName retainCount]);
    [CBDeviceManager createAllDeviceDirectory:rootPath];
    CBImageFile* image = [CBImageFile initWithFilePath:rootPath andFileName:fileName];
    CBIconInfo* icons = [CBIconInfo defaultIconInfo];
    for (CBImageInfo* info in icons.iconInfos)
    {
        [CBImageManager saveIcon:image andInfo:info];
    }
}

+ (void)generateImagesWithRootPath:(NSString*)rootPath;
{
    [CBDeviceManager createAllDeviceDirectory:rootPath];
    NSArray *extensions = [NSArray arrayWithObjects:@"psd", @"png", @"jpg", @"bmp", nil];
    NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:rootPath error:nil];
    NSArray *files = [dirContents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"pathExtension IN %@", extensions]];
//    NSArray *dirContents = [[NSFileManager defaultManager] 
//                            contentsOfDirectoryAtPath:rootPath error:nil];
    for (NSString* name in files) {
        NSLog(@"%@\n",name);
        NSRange range = [name rangeOfString:@"."];
        if(range.length > 0)
        {
            CBImageFile* image = [CBImageFile initWithFilePath:rootPath andFileName:name];
            // retina display
            //float width = (image.sourceImage.size.width - ((int)image.sourceImage.size.width % 2))/2;
            //float height = (image.sourceImage.size.height - ((int)image.sourceImage.size.height % 2))/2;
            // normal
            float width = (image.sourceImage.size.width - ((int)image.sourceImage.size.width % 2)) / 2;
            float height = (image.sourceImage.size.height - ((int)image.sourceImage.size.height % 2)) / 2;
            [CBImageManager saveiOSImage:image newWidth:width newHeight:height];
            [CBImageManager saveAndroidImage:image newWidth:width newHeight:height];
            [CBImageManager saveWP7Image:image newWidth:width newHeight:height];
        }
    }
}

+ (void)generateImagesWithRootPath:(NSString*)rootPath newWidth:(float)width newHeight:(float)height
{
    [CBDeviceManager createAllDeviceDirectory:rootPath];
    NSArray *extensions = [NSArray arrayWithObjects:@"psd", @"png", @"jpg", @"bmp", nil];
    NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:rootPath error:nil];
    NSArray *files = [dirContents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"pathExtension IN %@", extensions]];
    // retina display
    //width = (width - ((int)width % 2))/2;
    //height = (height - ((int)height % 2))/2;
    // normal
    width = (width - ((int)width % 2));
    height = (height - ((int)height % 2));
    //height = (((int)(height/2) - ((int)(height/2)%2)));
    for (NSString* name in files) {
        NSLog(@"%@\n",name);
        NSRange range = [name rangeOfString:@"."];
        if(range.length > 0)
        {
            CBImageFile* image = [CBImageFile initWithFilePath:rootPath andFileName:name];
            [CBImageManager saveiOSImage:image newWidth:width newHeight:height];
            [CBImageManager saveAndroidImage:image newWidth:width newHeight:height];
            [CBImageManager saveWP7Image:image newWidth:width newHeight:height];
        }
    }

}

+ (void)generateImagesWithFile:(NSString*)fileName newWidth:(float)width newHeight:(float)height
{
    CBImageFile* image = [CBImageFile initWithFileName:fileName];
    [CBDeviceManager createAllDeviceDirectory:image.directoryName];
    [CBImageManager saveiOSImage:image newWidth:width newHeight:height];
    [CBImageManager saveAndroidImage:image newWidth:width newHeight:height];
    [CBImageManager saveWP7Image:image newWidth:width newHeight:height];
}

@end
