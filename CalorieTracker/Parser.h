//
//  Parser.h
//  CalorieTracker
//
//  Created by Amin Davoodi on 3/24/16.
//  Copyright © 2016 TouchTap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dish+CoreDataProperties.h"

@interface Parser : NSObject

+(NSMutableArray*) parseFile: (NSString*) file;

@end
