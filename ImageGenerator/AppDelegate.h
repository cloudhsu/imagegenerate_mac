//
//  AppDelegate.h
//  ImageGenerator
//
//  Created by Hsu Cloud on 2012/5/29.
//  Copyright (c) 2012年 Orz. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate,NSWindowDelegate>
{
    NSString* _iconRoot;
    NSString* _iconName;
    
    NSString* _imageRoot;
    
    NSString* _SingleImage;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *txtIconName;
@property (assign) IBOutlet NSTextField *txtDirectoryName;
@property (assign) IBOutlet NSButton *btnSelectIcon;
@property (assign) IBOutlet NSButton *btnGenerateIcon;
@property (assign) IBOutlet NSButton *btnSelectDirectory;
@property (assign) IBOutlet NSButton *btnGenerateImages;
@property (assign) IBOutlet NSButton *cbxCustomSize;
@property (assign) IBOutlet NSTextField *txtImageWidth;
@property (assign) IBOutlet NSTextField *txtImageHeight;
@property (assign) IBOutlet NSTextField *txtSingleDirectory;
@property (assign) IBOutlet NSTextField *txtSingleWidth;
@property (assign) IBOutlet NSTextField *txtSingleHeight;


- (IBAction)btnSingleSelectClick:(id)sender;
- (IBAction)btnSingleGenerateClick:(id)sender;

- (IBAction)btnSelectDirectoryClick:(id)sender;
- (IBAction)btnGenerateImagesClick:(id)sender;
- (IBAction)btnSelectIconClick:(id)sender;
- (IBAction)btnGenerateIconClick:(id)sender;

- (BOOL)windowShouldClose:(id)sender;
- (void)windowWillClose:(NSNotification *)aNotification;


@end
