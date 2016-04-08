//
//  NTHttpResp.m
//  NTMokredit
//
//  Created by Guanyy on 14/9/9.
//  Copyright (c) 2014年 NT. All rights reserved.
//

#import "HttpResp.h"
#import "NSString+Kit.h"

@implementation HttpResp


- (NSString*)description {
    if(self.array != nil)
        return [NSString stringWithFormat:@"%@", self.array];
    return [NSString stringWithFormat:@"%@ resultcode = %d", self.dictionary == nil ? self.singleResult : self.dictionary, self.resultcode];
}

- (id)initWithData:(id)data {
    self = [super init];
    if(self) {
        //NSDictionary* dic = [NSDictionary dictionaryWithJSONData:data error:nil];
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        id result = [dic objectForKey:@"result"];
        
        if([[result class] isSubclassOfClass:[NSDictionary class]]) {
            self.dictionary = [NSDictionary dictionaryWithDictionary:result];
            
            if([self.dictionary count] == 1) {
                NSArray* keys = self.dictionary.allKeys;
                id value = [self.dictionary objectForKey:keys[0]];
                if(value != nil && [[value class] isSubclassOfClass:[NSArray class]]) {
                    self.array = value;
                }
            }
        }
        else if([[result class] isSubclassOfClass:[NSString class]])
            self.singleResult = result;
        else if([[result class] isSubclassOfClass:[NSArray class]])
            self.array = [[NSArray alloc] initWithArray:result];
        
        self.resultcode = [[dic objectForKey:@"resultcode"] intValue];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self) {
        //NSDictionary* dic = [NSDictionary dictionaryWithJSONData:data error:nil];
        NSDictionary* dic = dict;
        
        id result = [dic objectForKey:@"result"];
        
        if([[result class] isSubclassOfClass:[NSDictionary class]]) {
            self.dictionary = [NSDictionary dictionaryWithDictionary:result];
            
            self.dictionary = [NSDictionary dictionaryWithDictionary:result];
            
            if([self.dictionary count] == 1) {
                NSArray* keys = self.dictionary.allKeys;
                id value = [self.dictionary objectForKey:keys[0]];
                if(value != nil && [[value class] isSubclassOfClass:[NSArray class]]) {
                    self.array = value;
                }
            }
        }
        else if([[result class] isSubclassOfClass:[NSString class]])
            self.singleResult = result;
        else if([[result class] isSubclassOfClass:[NSArray class]])
            self.array = [[NSArray alloc] initWithArray:result];
        
        self.resultcode = [[dic objectForKey:@"resultcode"] intValue];
        self.resultMsg = [[dic objectForKey:@"resultmsg"] decodedString];
        
    }
    return self;
}

- (BOOL)hasError {
    
    BOOL code;
    
    if (self.resultcode == 1) {
        code = NO;
    }else{
        code = YES;
    }
    
    return code;
}

@end
