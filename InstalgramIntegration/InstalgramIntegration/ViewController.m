//
//  ViewController.m
//  InstalgramIntegration
//
//  Created by satish yadav on 6/4/12.
//  Copyright (c) 2012 IndiaNIC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    NSURL *instagramURL = [NSURL URLWithString:@"instagram://camera"];
//   // if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) 
//    {
//        [[UIApplication sharedApplication] openURL:instagramURL];
//    }/
    
    
    
  /*  NSString *fileToOpen = [[NSBundle mainBundle] pathForResource:@"5111"  ofType:@"jpg"];
    fileToOpen = [fileToOpen substringToIndex:[fileToOpen length] - 3];
    fileToOpen=[NSString stringWithFormat:@"%@ig",fileToOpen];
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://app"];
    NSLog(@"%@",fileToOpen);
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) 
    {
        //imageToUpload is a file path with .ig file extension
        /*UIAlertView *alert = [[UIAlertView alloc] 
         initWithTitle:@"" 
         message:@"Can open app!" 
         delegate:self  
         cancelButtonTitle:@"OK" 
         otherButtonTitles:nil];
         [alert show];
         
        
        
        
      documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:fileToOpen]];
        documentInteractionController.UTI = @"com.instagram.photo";
       documentInteractionController.annotation = [NSDictionary dictionaryWithObject:@"Its a testing" forKey:@"InstagramCaption"];
        
        [[UIApplication sharedApplication] openURL:instagramURL];
    }*/
    
    
    UIImage *image = [UIImage imageNamed:@"5496.jpg"]; 
    
    NSString *documentsDirectory = [NSHomeDirectory() 
                                    stringByAppendingPathComponent:@"Documents"]; 
    
    NSString *savedImagePath = [documentsDirectory 
                                stringByAppendingPathComponent:@"Image.ig"]; 
    
    NSData *imageData = UIImagePNGRepresentation(image); 
    
    [imageData writeToFile:savedImagePath atomically:YES]; 
    
    NSURL *imageUrl = [NSURL fileURLWithPath:savedImagePath]; 
    
    UIDocumentInteractionController * docController = [[ 
                                                        UIDocumentInteractionController alloc] init]; 
    
    docController.delegate = (id)self; 
    
    [docController retain]; 
    
    docController.UTI = @"com.instagram.photo"; 
    
    [docController setURL:imageUrl]; 
    
    [docController presentOpenInMenuFromRect:CGRectZero inView:self.view 
                                    animated:YES]; 
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
