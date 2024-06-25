//
//  RandomWordGenerator.m
//  KLGenerateSpamCode
//
//  Created by Li Jun on 2024-06-25.
//  Copyright © 2024 GAEA. All rights reserved.
//

#import "RandomWordGenerator.h"

@interface RandomWordGenerator ()

@property (nonatomic, strong) NSMutableArray *wordsLibrary;
@end

@implementation RandomWordGenerator

- (instancetype)initWithWordsLibrary:(NSArray *)words {
    self = [super init];
    if (self) {
        self.wordsLibrary = [NSMutableArray arrayWithArray:words];
    }
    
    return self;
}

- (NSString *)randomWord {
    NSString *result = nil;
    while (!result.length) {
        int index = arc4random_uniform((uint32_t)[self.wordsLibrary count]);
        result = self.wordsLibrary[index];
    }
    
    return result;
}

@end
