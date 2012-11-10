//
//  CBImageFile.h
//  ImageGenerator
//
//  Created by Hsu Cloud on 2012/5/30.
//  Copyright (c) 2012年 Orz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBImageFile : NSObject
{
    NSString* _directoryName;
    NSString* _fileName;
    NSString* _fullName;
    
    NSImage* _sourceImage;
}

@property (assign) NSString* directoryName;
@property (assign) NSString* fileName;
@property (assign) NSString* fullName;
@property (assign) NSImage* sourceImage;

+ (CBImageFile*)initWithFilePath:(NSString*)path andFileName:(NSString*)fileName;
+ (CBImageFile*)initWithFileName:(NSString*)fileName;

@end
