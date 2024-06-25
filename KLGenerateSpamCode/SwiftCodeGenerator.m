//
//  SwiftCodeGenerator.m
//  KLGenerateSpamCode
//
//  Created by Li Jun on 2024-06-25.
//  Copyright © 2024 GAEA. All rights reserved.
//

#import "SwiftCodeGenerator.h"

@interface SwiftCodeGenerator ()

@property (nonatomic, strong) RandomWordGenerator *wordGenerator;

@end

@implementation SwiftCodeGenerator

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
    [result appendFormat:@"func %@(_ %@: String) -> String {\n", funcName, paramName];
    [result appendFormat:@"    print(%@)\n", paramName];
    NSString *varName = [self.wordGenerator randomWord];
    [result appendFormat:@"    let %@ = %@ + \"_\" + \"%@\"\n\n", varName, paramName, [self.wordGenerator randomWord]];
    [result appendFormat:@"    return %@\n", varName];
    [result appendString:@"}\n\n"];
    
    return result;
}

- (NSString *)arrayTypeFunction:(NSString *)funcName {
    NSMutableString *result = [NSMutableString string];
    NSString *paramName = [self.wordGenerator randomWord];
    [result appendFormat:@"func %@(_ %@: String) -> [String] {\n", funcName, paramName];
    [result appendFormat:@"    print(%@)\n", paramName];
    NSString *varName = [self.wordGenerator randomWord];
    [result appendFormat:@"    var %@: [String] = []\n", varName];
    [result appendFormat:@"    %@.append(%@)\n", varName, paramName];
    for (int i = 0; i < 5; i++) {
        [result appendFormat:@"    %@.append(\"%@\")\n", varName, [self.wordGenerator randomWord]];
    }
    [result appendFormat:@"    return %@\n", varName];
    [result appendString:@"}\n\n"];
    
    return result;
}

- (NSString *)dictionaryTypeFunction:(NSString *)funcName {
    NSMutableString *result = [NSMutableString string];
    NSString *paramName = [self.wordGenerator randomWord];
    [result appendFormat:@"func %@(_ %@: String) -> [String: String] {\n", funcName, paramName];
    [result appendFormat:@"    print(%@)\n", paramName];
    NSString *varName = [self.wordGenerator randomWord];
    [result appendFormat:@"    var %@: [String: String] = [:]\n", varName];
    [result appendFormat:@"    %@[%@] = \"%@\"\n", varName, paramName, [self.wordGenerator randomWord]];
    for (int i = 0; i < 5; i++) {
        [result appendFormat:@"    %@[\"%@\"] = \"%@\"\n", varName, [self.wordGenerator randomWord], [self.wordGenerator randomWord]];
    }
    [result appendFormat:@"    return %@\n", varName];
    [result appendString:@"}\n\n"];
    
    return result;
}

- (NSString *)dataTypeFunction:(NSString *)funcName {
    NSMutableString *result = [NSMutableString string];
    NSString *paramName = [self.wordGenerator randomWord];
    [result appendFormat:@"func %@(_ %@: String) -> Data {\n", funcName, paramName];
    [result appendFormat:@"    print(%@)\n", paramName];
    NSString *varName = [self.wordGenerator randomWord];
    [result appendFormat:@"    let %@ = %@.data(using: String.Encoding.utf8)!\n\n", varName, paramName];
    [result appendFormat:@"    return %@\n", varName];
    [result appendString:@"}\n\n"];
    
    return result;
}

- (NSString *)viewTypeFunction:(NSString *)funcName {
    NSMutableString *result = [NSMutableString string];
    NSString *paramName = [self.wordGenerator randomWord];
    [result appendFormat:@"func %@(_ %@: String) -> UIView {\n", funcName, paramName];
    [result appendFormat:@"    print(%@)\n", paramName];
    NSString *varName = [self.wordGenerator randomWord];
    [result appendFormat:@"    let %@ = UIView(frame: .zero)\n", varName];
    [result appendFormat:@"    %@.backgroundColor = .clear\n\n", varName];
    NSString *lblVarName = [self.wordGenerator randomWord];
    [result appendFormat:@"    let %@ = UILabel(frame: .zero)\n", lblVarName];
    [result appendFormat:@"    %@.text = \"%@\"\n", lblVarName, [self.wordGenerator randomWord]];
    [result appendFormat:@"    %@.textColor = .black\n", lblVarName];
    [result appendFormat:@"    %@.addSubview(%@)\n\n", varName, lblVarName];
    [result appendFormat:@"    return %@\n", varName];
    [result appendString:@"}\n\n"];
    
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
            result = [self dictionaryTypeFunction:funcName];
            break;
        case 3:
            result = [self dataTypeFunction:funcName];
            break;
        case 4:
            result = [self viewTypeFunction:funcName];
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
