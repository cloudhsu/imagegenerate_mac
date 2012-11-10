//
//  CBImageFile.m
//  ImageGenerator
//
//  Created by Hsu Cloud on 2012/5/30.
//  Copyright (c) 2012年 Orz. All rights reserved.
//

#import "CBImageFile.h"
#import "CBImageManager.h"

@implementation CBImageFile

@synthesize directoryName = _directoryName;
@synthesize fileName = _fileName;
@synthesize fullName = _fullName;
@synthesize sourceImage = _sourceImage;

- (void)dealloc
{
    [_sourceImage release];
    [super dealloc];
}

+ (CBImageFile*)initWithFilePath:(NSString*)path andFileName:(NSString*)fileName
{
    CBImageFile* image = [[CBImageFile alloc]init];
    image.fullName = [NSString stringWithFormat:@"%@/%@",path,fileName];
    image.directoryName = path;
    image.fileName = fileName;
    image.sourceImage = [CBImageManager loadImage:image.fullName];
    return [image autorelease];
}

+ (CBImageFile*)initWithFileName:(NSString*)fileName
{
    CBImageFile* image = [[CBImageFile alloc]init];
    NSArray *parts = [fileName componentsSeparatedByString:@"/"];
    NSString *file = [parts objectAtIndex:[parts count]-1];
    NSLog(@"%@\n",file);
    NSString* dir = [fileName stringByReplacingOccurrencesOfString:file withString:@""];
    image.fullName = fileName;
    image.directoryName = dir;
    image.fileName = file;
    image.sourceImage = [CBImageManager loadImage:image.fullName];
    return [image autorelease];
}

@end
