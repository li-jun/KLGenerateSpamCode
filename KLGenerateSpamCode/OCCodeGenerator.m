//
//  OCGenerator.m
//  KLGenerateSpamCode
//
//  Created by Li Jun on 2024-06-25.
//  Copyright © 2024 GAEA. All rights reserved.
//

#import "OCCodeGenerator.h"

@interface OCCodeGenerator ()

@property (nonatomic, strong) RandomWordGenerator *wordGenerator;

@end

@implementation OCCodeGenerator

- (nonnull instancetype)initWithWordGenerator:(nonnull RandomWordGenerator *)wordGenerator {
    self = [super init];
    if (self) {
        self.wordGenerator = wordGenerator;
    }
    
    return self;
}

- (NSString *)stringTypeFunction:(NSString *)funcName {
    NSMutableString *result = [NSMutableString string];
    NSString *paramName = [self.wordGenerator randomWord];
    [result appendFormat:@"- (NSString *)%@:(NSString *)%@ {\n", funcName, paramName];
    [result appendFormat:@"debugPrint(%@)\n", paramName];
    NSString *varName = [self.wordGenerator randomWord];
    [result appendFormat:@"    NSString *%@ = %@;\n\n", varName, paramName];
    [result appendFormat:@"    return %@;\n", varName];
    [result appendString:@"}\n"];
    
    return result;
}

- (NSString *)arrayTypeFunction:(NSString *)funcName {
    NSMutableString *result = [NSMutableString string];
    NSString *paramName = [self.wordGenerator randomWord];
    [result appendFormat:@"- (NSArray *)%@:(NSString *)%@ {\n", funcName, paramName];
    [result appendFormat:@"print(%@)\n", paramName];
    NSString *varName = [self.wordGenerator randomWord];
    [result appendFormat:@"    NSString *%@ = %@;\n\n", varName, paramName];
    [result appendFormat:@"    return %@;\n", varName];
    [result appendString:@"}\n"];
    
    return result;
}

- (nonnull NSString *)generateFunction {
    NSString *result = nil;
    int index = arc4random_uniform(5);
    NSString *word1 = [self.wordGenerator randomWord].lowercaseString;
    NSString *word2 = [self.wordGenerator randomWord];
    NSString *word3 = [self.wordGenerator randomWord];
    NSString *funcName = [NSString stringWithFormat:@"%@%@_%@", word1, word2, word3];
    
    switch (index) {
        case 0:
            result = [self stringTypeFunction:funcName];
            break;
        case 1:
            result = [self arrayTypeFunction:funcName];
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        default:
            result = [self stringTypeFunction:funcName];
            break;
    }
    
    return result;
}

- (nonnull NSString *)generateExtension:(nonnull NSString *)className FuncNumber:(NSInteger)funcNumber {
    NSMutableString *result = [NSMutableString string];
    [result appendString:@"import UIKit\n\n"];
    [result appendString:[NSString stringWithFormat:@"extension %@ {\n", className]];
    for (int i = 0; i < funcNumber; i++) {
        NSString *funcCode = [self generateFunction];
        [result appendString:[NSString stringWithFormat:@"%@\n", funcCode]];
    }
    [result appendString:@"}"];
    
    return result;
}

@end
