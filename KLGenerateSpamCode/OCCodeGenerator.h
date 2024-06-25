//
//  OCGenerator.h
//  KLGenerateSpamCode
//
//  Created by Li Jun on 2024-06-25.
//  Copyright © 2024 GAEA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RandomWordGenerator.h"

NS_ASSUME_NONNULL_BEGIN

@interface OCCodeGenerator : NSObject

- (instancetype)initWithWordGenerator:(RandomWordGenerator *)wordGenerator;

- (NSString *)generateFunction;

- (NSString *)generateExtension:(NSString *)className FuncNumber:(NSInteger)funcNumber;

@end

NS_ASSUME_NONNULL_END
