//
//  LSM.h
//  Demo
//
//  Created by Ebuy EDITSUITE MAC on 2019/12/2.
//  Copyright © 2019 Lisisi. All rights reserved.
//
#import <Masonry/Masonry.h>
#import <Foundation/Foundation.h>
#import "LSMacro.h"

static inline id LS_MASBoxValue(const char *type, ...) {
    va_list v;
    va_start(v, type);
    id obj = nil;
    if (strcmp(type, @encode(id)) == 0) {
        id actual = va_arg(v, id);
        obj = actual;
    } else if (strcmp(type, @encode(CGPoint)) == 0) {
        CGPoint actual = (CGPoint)va_arg(v, CGPoint);
        actual.x = actual.x * SCREEN_SCALE;
        actual.y = actual.y * SCREEN_SCALE;
        obj = [NSValue value:&actual withObjCType:type];
    } else if (strcmp(type, @encode(CGSize)) == 0) {
        CGSize actual = (CGSize)va_arg(v, CGSize);
        actual.height = actual.height * SCREEN_SCALE;
        actual.width = actual.width * SCREEN_SCALE;
        obj = [NSValue value:&actual withObjCType:type];
    } else if (strcmp(type, @encode(MASEdgeInsets)) == 0) {
        MASEdgeInsets actual = (MASEdgeInsets)va_arg(v, MASEdgeInsets);
        actual.top = actual.top * SCREEN_SCALE;
        actual.bottom = actual.bottom * SCREEN_SCALE;
        actual.left = actual.left * SCREEN_SCALE;
        actual.right = actual.right * SCREEN_SCALE;
        obj = [NSValue value:&actual withObjCType:type];
    } else if (strcmp(type, @encode(double)) == 0) {
        double actual = (double)va_arg(v, double);
        obj = [NSNumber numberWithDouble:actual * SCREEN_SCALE];
    } else if (strcmp(type, @encode(float)) == 0) {
        float actual = (float)va_arg(v, double);
        obj = [NSNumber numberWithFloat:actual * SCREEN_SCALE];
    } else if (strcmp(type, @encode(int)) == 0) {
        int actual = (int)va_arg(v, int);
        obj = [NSNumber numberWithInt:actual * SCREEN_SCALE];
    } else if (strcmp(type, @encode(long)) == 0) {
        long actual = (long)va_arg(v, long);
        obj = [NSNumber numberWithLong:actual * SCREEN_SCALE];
    } else if (strcmp(type, @encode(long long)) == 0) {
        long long actual = (long long)va_arg(v, long long);
        obj = [NSNumber numberWithLongLong:actual * SCREEN_SCALE];
    } else if (strcmp(type, @encode(short)) == 0) {
        short actual = (short)va_arg(v, int);
        obj = [NSNumber numberWithShort:actual * SCREEN_SCALE];
    } else if (strcmp(type, @encode(char)) == 0) {
        char actual = (char)va_arg(v, int);
        obj = [NSNumber numberWithChar:actual];
    } else if (strcmp(type, @encode(bool)) == 0) {
        bool actual = (bool)va_arg(v, int);
        obj = [NSNumber numberWithBool:actual];
    } else if (strcmp(type, @encode(unsigned char)) == 0) {
        unsigned char actual = (unsigned char)va_arg(v, unsigned int);
        obj = [NSNumber numberWithUnsignedChar:actual];
    } else if (strcmp(type, @encode(unsigned int)) == 0) {
        unsigned int actual = (unsigned int)va_arg(v, unsigned int);
        obj = [NSNumber numberWithUnsignedInt:actual * SCREEN_SCALE];
    } else if (strcmp(type, @encode(unsigned long)) == 0) {
        unsigned long actual = (unsigned long)va_arg(v, unsigned long);
        obj = [NSNumber numberWithUnsignedLong:actual * SCREEN_SCALE];
    } else if (strcmp(type, @encode(unsigned long long)) == 0) {
        unsigned long long actual = (unsigned long long)va_arg(v, unsigned long long);
        obj = [NSNumber numberWithUnsignedLongLong:actual * SCREEN_SCALE];
    } else if (strcmp(type, @encode(unsigned short)) == 0) {
        unsigned short actual = (unsigned short)va_arg(v, unsigned int);
        obj = [NSNumber numberWithUnsignedShort:actual * SCREEN_SCALE];
    }
    va_end(v);
    return obj;
}

#define LS_MASBoxValue(value) LS_MASBoxValue(@encode(__typeof__((value))), (value))

#define lsmas_equalTo(...)            equalTo(LS_MASBoxValue((__VA_ARGS__)))

#define lsmas_greaterThanOrEqualTo(...)    greaterThanOrEqualTo(LS_MASBoxValue((__VA_ARGS__)))

#define lsmas_lessThanOrEqualTo(...)       lessThanOrEqualTo(LS_MASBoxValue((__VA_ARGS__)))

#define lsmas_offset(...)                  valueOffset(LS_MASBoxValue((__VA_ARGS__)))
