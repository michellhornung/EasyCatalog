//
//  CatalogItem.h
//  EasyCatalog
//
//  Created by OZZE on 07/08/13.
//  Copyright (c) 2013 The Mob Project. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface CatalogItem : NSManagedObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;
@property (nonatomic, retain) NSString *item_description;
@property (nonatomic, retain) NSString *thumbnail;

@end
