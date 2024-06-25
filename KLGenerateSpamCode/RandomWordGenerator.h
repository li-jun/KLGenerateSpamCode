//
//  RandomWordGenerator.h
//  KLGenerateSpamCode
//
//  Created by Li Jun on 2024-06-25.
//  Copyright © 2024 GAEA. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RandomWordGenerator : NSObject

- (instancetype)initWithWordsLibrary:(NSArray *)words;

- (NSString *)randomWord;

@end

NS_ASSUME_NONNULL_END
