//
//  EditCatalogsViewController.m
//  EasyCatalog
//
//  Created by OZZE on 04/07/13.
//  Copyright (c) 2013 The Mob Project. All rights reserved.
//

#import "EditCatalogViewController.h"

@interface EditCatalogViewController () <EditCatalogViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *subtitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *keywordTextField;

@end

@implementation EditCatalogViewController

- (IBAction)save:(id)sender {
    
    NSLog(@"EditCatalogViewController > sender");
    
    self.catalog.title = self.titleTextField.text;
    self.catalog.subtitle = self.subtitleTextField.text;
    self.catalog.keyword = self.keywordTextField.text;
    
    NSLog(@"Título: %@", self.catalog.title);
    NSLog(@"Subtitulo: %@", self.catalog.subtitle);
    NSLog(@"Palavra chave %@", self.catalog.keyword);
    
    [self.delegate editCatalogViewController:self saveCatalog:self.catalog];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    
    NSLog(@"EditCatalogViewController > viewWillAppear");
    
    self.titleTextField.text = self.catalog.title;
    self.subtitleTextField.text = self.catalog.subtitle;
    self.keywordTextField.text = self.catalog.keyword;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
