//
//  Grid.h
//  2048Tutorial
//
//  Created by Daniele Ciriello on 17/04/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNodeColor.h"

@interface Grid : CCNodeColor
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) NSNumber* highscore;
@end
