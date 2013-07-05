//
//  NSObject_EditCatalogsViewControlerDelegate.h
//  EasyCatalog
//
//  Created by OZZE on 04/07/13.
//  Copyright (c) 2013 The Mob Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Catalog.h"

@class EditCatalogViewController;

@protocol EditCatalogViewControllerDelegate <NSObject>

-(void) editCatalogViewController:(EditCatalogViewController *) viewController saveCatalog:(Catalog *)catalog;

-(void) editCatalogViewControllerCancel:(EditCatalogViewController *) viewController;

@end