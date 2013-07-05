//
//  EditCatalogsViewController.h
//  EasyCatalog
//
//  Created by OZZE on 04/07/13.
//  Copyright (c) 2013 The Mob Project. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditCatalogViewControllerDelegate.h"

@interface EditCatalogViewController : UITableViewController

@property (nonatomic, weak) id<EditCatalogViewControllerDelegate> delegate;

@property (nonatomic, strong) Catalog *catalog;

@end
