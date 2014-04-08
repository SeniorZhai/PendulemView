//
//  ViewController.m
//  PendulemView
//
//  Created by 翟涛 on 14-4-8.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import "ViewController.h"
#import "PendulumView.h"

@interface ViewController ()
@property(nonatomic,strong) PendulumView *pendulum;
@end

@implementation ViewController
@synthesize pendulum;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIColor *ballColor = [UIColor colorWithRed:0.47 green:0.60 blue:0.89 alpha:1];
    pendulum = [[PendulumView alloc] initWithFrame:self.view.bounds ballColor:ballColor ballDiameter:35];
    pendulum.hidesWhenStopped = NO;
    [self.view addSubview:pendulum];
    
    UIButton *bn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bn.frame = CGRectMake(size.width/4, size.height - 200, size.width/2, 20);
    bn.backgroundColor = [UIColor colorWithRed:0.47 green:0.60 blue:0.89 alpha:1];
    bn.tintColor = [UIColor blackColor];
    [bn setTitle:@"Start" forState:UIControlStateNormal];
    [bn setTitle:@"Stop" forState:UIControlStateHighlighted];
    [bn addTarget:self action:@selector(down:) forControlEvents:UIControlEventTouchDown];
    [bn addTarget:self action:@selector(up:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bn];
}
- (void)up:(id)sender
{
    [pendulum startAnimating];
}
- (void)down:(id)sender
{
    [pendulum stopAnimating];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
