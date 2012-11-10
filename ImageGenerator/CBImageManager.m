//
//  CBImageManager.m
//  ImageGenerator
//
//  Created by Hsu Cloud on 2012/5/30.
//  Copyright (c) 2012年 Orz. All rights reserved.
//

#import "CBImageManager.h"
#import "CBImageInfo.h"
#import "CBImageFile.h"

@implementation CBImageManager

+ (NSImage*) resizeImage:(NSImage*)srcImage newWidth:(int)newWidth newHeight:(int)newHeight
{
    NSSize oldSize = srcImage.size;
    NSSize size = NSZeroSize;      
    size.width = newWidth;
    size.height = newHeight;
    NSLog(@"image size width:%f height:%f\n",oldSize.width,oldSize.height);
    
    NSImage *newImage = [[NSImage alloc] initWithSize:size];
    [newImage lockFocus];
//    [srcImage drawInRect: NSMakeRect(0, 0, newWidth, newHeight) fromRect: NSMakeRect(0, 0, oldSize.width, oldSize.height) operation: NSCompositeSourceOver fraction: 1.0];
//    [srcImage drawInRect: NSMakeRect(0, 0, newWidth, newHeight) fromRect: NSMakeRect(0, 0, oldSize.width, oldSize.height) operation: NSCompositeDestinationOver fraction: 1.0];
    [srcImage drawInRect: NSMakeRect(0, 0, newWidth, newHeight) fromRect: NSZeroRect operation: NSCompositeSourceOver fraction: 1.0];
    [newImage unlockFocus];

    return [newImage autorelease];
}

+ (NSImage*) loadImage:(NSString*)fileName
{
    NSImage * picture =  [[NSImage alloc] initWithContentsOfFile:fileName];
    return picture;
}

+ (void)saveIcon:(CBImageFile*) image andInfo:(CBImageInfo*) info
{
    NSString* fullName = [self getIconName:image andInfo:info];
    NSImage* newImage = [self resizeImage:image.sourceImage newWidth:info.width newHeight:info.height];
    [self saveImage:newImage andName:fullName];
}

+ (void) saveiOSImage:(CBImageFile*)image newWidth:(float)width newHeight:(float)height
{
    // normal image
    NSString* fullName = [NSString stringWithFormat:@"%@/iOS/%@",image.directoryName,image.fileName];
    NSImage* newImage = [self resizeImage:image.sourceImage newWidth:width/2 newHeight:height/2];
    [self saveImage:newImage andName:fullName];
    
    // retina image
    fullName = [fullName stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
    newImage = [self resizeImage:image.sourceImage newWidth:width newHeight:height];
    [self saveImage:newImage andName:fullName];
}
+ (void) saveAndroidImage:(CBImageFile*)image newWidth:(float)width newHeight:(float)height
{
    NSString* fullName = [NSString stringWithFormat:@"%@/Android/%@",image.directoryName,image.fileName];
    NSImage* newImage = [self resizeImage:image.sourceImage newWidth:width newHeight:height];
    [self saveImage:newImage andName:fullName];
}
+ (void) saveWP7Image:(CBImageFile*)image newWidth:(float)width newHeight:(float)height
{
    NSString* fullName = [NSString stringWithFormat:@"%@/WP7/%@",image.directoryName,image.fileName];
    NSImage* newImage = [self resizeImage:image.sourceImage newWidth:width newHeight:height];
    [self saveImage:newImage andName:fullName];
}

+ (void) saveImage:(NSImage*)image andName:(NSString*)fileName
{
    //NSData *imageData = [image  TIFFRepresentation];
    //NSBitmapImageRep *imageRep = [NSBitmapImageRep imageRepWithData:imageData];
    NSData *imageData = nil;
    NSBitmapImageRep *imageRep = nil;
    NSSize pointsSize = image.size;
    [image lockFocus];
    NSRect imageRect = NSMakeRect(0, 0, pointsSize.width, pointsSize.height);
    imageRep = [[[NSBitmapImageRep alloc] initWithFocusedViewRect:imageRect] autorelease];
    [image unlockFocus];
    NSSize pixelSize = NSMakeSize(imageRep.pixelsWide, imageRep.pixelsHigh);
    
//    CGFloat dpiValue = 72.0f;
//    
//    CGFloat currentDPI = ceilf((72.0f * pixelSize.width)/pointsSize.width);
//    NSLog(@"current DPI %f", currentDPI);
//    
//    NSSize updatedPointsSize = pointsSize;
//    
//    updatedPointsSize.width = ceilf((72.0f * pixelSize.width)/dpiValue);
//    updatedPointsSize.height = ceilf((72.0f * pixelSize.height)/dpiValue);
////    updatedPointsSize.width = ceilf((dpiValue * pixelSize.width)/currentDPI);
////    updatedPointsSize.height = ceilf((dpiValue * pixelSize.height)/currentDPI);
//    
//    [imageRep setSize:updatedPointsSize];

    NSDictionary* properties = [NSDictionary dictionaryWithObjectsAndKeys:
                                [NSNumber numberWithFloat:1.0], kCGImageDestinationLossyCompressionQuality,
                                [NSNumber numberWithInteger:72], kCGImagePropertyDPIHeight,
                                [NSNumber numberWithInteger:72], kCGImagePropertyDPIWidth,
                                nil];
    imageData = [imageRep representationUsingType:NSPNGFileType properties:properties];
    [imageData writeToFile:fileName atomically:NO];
}

+ (NSString*) getIconName:(CBImageFile*) image andInfo:(CBImageInfo*) info
{
    NSString* device = nil;
    if(info.deviceType == DeviceiOS)
    {
        device = @"iOS";
    }
    else if(info.deviceType == DeviceAndroid)
    {
        device = @"Android";
    }
    else if(info.deviceType == DeviceWP7)
    {
        device = @"WP7";
    }
    NSString* fullName = [NSString stringWithFormat:@"%@/%@/%@",image.directoryName,device,info.fileName];
    NSLog(@"Full icon name:%@\n",fullName);
    return fullName;
}

@end
