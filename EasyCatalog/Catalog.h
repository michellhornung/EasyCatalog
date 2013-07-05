//
//  Catalog.h
//  EasyCatalog
//
//  Created by OZZE on 04/07/13.
//  Copyright (c) 2013 The Mob Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Catalog : NSManagedObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;
@property (nonatomic, retain) NSString *keyword;

@end