//
//  ViewController.m
//  scrollLabel
//
//  Created by Nishimoto Wataru on 2012/11/26.
//  Copyright (c) 2012年 Nishimoto Wataru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSString* text= @"Merry Christmas, Mr. Lawrence";
    CGSize size = [self generateCGSize:text];
    _label1.frame = CGRectMake(0,
                               0,
                               size.width,
                               size.height);
    
    [_label2 setFrame:CGRectMake(size.width,
                                 0,
                                 size.width,
                                 size.height)];
    
    _label1.text = _label2.text = text;
    
    [NSTimer scheduledTimerWithTimeInterval:0.1f
                                     target:self
                                   selector:@selector(scrollLabel:)
                                   userInfo:nil
                                    repeats:YES
     ];
}

-(void)scrollLabel:(id)sender{
    CGSize size = [self generateCGSize:_label1.text];
    if (_label1.frame.origin.x < -1* (size.width+10)) {
        _label1.frame = CGRectMake(size.width,
                                   0,
                                   size.width,
                                   size.height);
    }
    if (_label2.frame.origin.x < -1* (size.width+10)) {
        _label2.frame = CGRectMake(size.width,
                                   0,
                                   size.width,
                                   size.height);
    }
    
    
    _label1.frame = CGRectMake(_label1.frame.origin.x-3,
                               0,
                               size.width,
                               size.height);
    [_label2 setFrame:CGRectMake(_label2.frame.origin.x-3,
                                 0,
                                 size.width,
                                 size.height)];
}

- (CGSize)generateCGSize:(NSString *)str
{
    CGSize maxSize = CGSizeMake(10000, 100);
    NSLineBreakMode breakMode = NSLineBreakByCharWrapping;
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    return [str sizeWithFont:font constrainedToSize:maxSize lineBreakMode:breakMode];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
