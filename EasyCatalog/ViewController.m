//
//  ViewController.m
//  EasyCatalog
//
//  Created by MichellHornung on 04/06/13.
//  Copyright (c) 2013 The Mob Project. All rights reserved.
//

#import "AppDelegate.h"
#import "CatalogViewController.h"
#import "EditCatalogViewController.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[EditCatalogViewController class]]) {
        
        NSLog(@"ViewController > prepareForSegue");
        
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
