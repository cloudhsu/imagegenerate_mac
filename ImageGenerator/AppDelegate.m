//
//  AppDelegate.m
//  ImageGenerator
//
//  Created by Hsu Cloud on 2012/5/29.
//  Copyright (c) 2012年 Orz. All rights reserved.
//

#import "AppDelegate.h"
#import "CBGenerator.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize txtIconName = _txtIconName;
@synthesize txtDirectoryName = _txtDirectoryName;
@synthesize btnSelectIcon = _btnSelectIcon;
@synthesize btnGenerateIcon = _btnGenerateIcon;
@synthesize btnSelectDirectory = _btnSelectDirectory;
@synthesize btnGenerateImages = _btnGenerateImages;
@synthesize cbxCustomSize = _cbxCustomSize;
@synthesize txtImageWidth = _txtImageWidth;
@synthesize txtImageHeight = _txtImageHeight;
@synthesize txtSingleDirectory = _txtSingleDirectory;
@synthesize txtSingleWidth = _txtSingleWidth;
@synthesize txtSingleHeight = _txtSingleHeight;

- (void)dealloc
{
    [super dealloc];
}

- (void)awakeFromNib {
    NSLog(@"load nib\n");
    [_window setDelegate:self];
}
	
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSLog(@"exit\n");
}

- (void)windowWillClose:(NSNotification *)aNotification {
    NSLog(@"windowWillClose\n");
    [NSApp terminate:self];
}

- (BOOL)windowShouldClose:(id)sender
{
    NSLog(@"windowShouldClose\n");
    return YES;
}

- (IBAction)btnSingleSelectClick:(id)sender
{
    NSLog(@"btnSingleSelectClick\n");
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    
    // Enable the selection of files in the dialog.
    [openDlg setCanChooseFiles:YES];
    
    // Multiple files not allowed
    [openDlg setAllowsMultipleSelection:NO];
    
    // Can't select a directory
    [openDlg setCanChooseDirectories:NO];
    
    NSArray* fileTypes = [[NSArray alloc] initWithObjects:@"png", nil];
    [openDlg setAllowedFileTypes:fileTypes];
    
    // Display the dialog. If the OK button was pressed,
    // process the files.
    if ( [openDlg runModalForTypes:fileTypes] == NSOKButton )
    {
        [self.txtSingleDirectory setStringValue:openDlg.filename];
        _SingleImage = [openDlg.filename copy];
    }
    [fileTypes release];
}

- (IBAction)btnSingleGenerateClick:(id)sender
{
    float width = self.txtSingleWidth.floatValue;
    float height = self.txtSingleHeight.floatValue;
    [CBGenerator generateImagesWithFile:_SingleImage newWidth:width newHeight:height];
}

- (IBAction)btnSelectDirectoryClick:(id)sender
{
    //[self.txtDirectoryName setStringValue:@"Click Select"];
    NSLog(@"btnSelectDirectoryClick\n");
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    
    // Enable the selection of files in the dialog.
    [openDlg setCanChooseFiles:NO];
    
    // Multiple files not allowed
    [openDlg setAllowsMultipleSelection:NO];
    
    // Can't select a directory
    [openDlg setCanChooseDirectories:YES];
    
    // Display the dialog. If the OK button was pressed,
    // process the files.
    if ( [openDlg runModalForDirectory:nil file:nil] == NSOKButton )
    {
        NSLog(@"%@\n",openDlg.filename);
        _imageRoot = [openDlg.filename copy];
        [self.txtDirectoryName setStringValue:openDlg.filename];
    }
}

- (IBAction)btnGenerateImagesClick:(id)sender
{
    //[self.txtDirectoryName setStringValue:@"Click Generate"];
    NSLog(@"btnGenerateImagesClick\n");
    float width = self.txtImageWidth.floatValue;
    float height = self.txtImageHeight.floatValue;
    
    
    if(NSOnState == self.cbxCustomSize.state)
    {
        [CBGenerator generateImagesWithRootPath:_imageRoot newWidth:width newHeight:height];
    }
    else
    {
        [CBGenerator generateImagesWithRootPath:_imageRoot];
    }
}

- (IBAction)btnSelectIconClick:(id)sender
{
    NSLog(@"btnSelectIconClick\n");
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    
    // Enable the selection of files in the dialog.
    [openDlg setCanChooseFiles:YES];
    
    // Multiple files not allowed
    [openDlg setAllowsMultipleSelection:NO];
    
    // Can't select a directory
    [openDlg setCanChooseDirectories:NO];
    
    NSArray* fileTypes = [[NSArray alloc] initWithObjects:@"png", nil];
    [openDlg setAllowedFileTypes:fileTypes];
    
    // Display the dialog. If the OK button was pressed,
    // process the files.
    if ( [openDlg runModalForTypes:fileTypes] == NSOKButton )
    {
        NSArray *parts = [openDlg.filename componentsSeparatedByString:@"/"];
        NSString *filename = [parts objectAtIndex:[parts count]-1];
        NSString* dir = [openDlg.filename stringByReplacingOccurrencesOfString:filename withString:@""];
        [self.txtIconName setStringValue:openDlg.filename];
        _iconRoot = [dir copy];
        _iconName = [filename copy];
    }
    [fileTypes release];
}

- (IBAction)btnGenerateIconClick:(id)sender
{
    [CBGenerator generateIconsWithRootPath:_iconRoot andFileName:_iconName];
    NSLog(@"btnGenerateIconClick\n");
}
@end
