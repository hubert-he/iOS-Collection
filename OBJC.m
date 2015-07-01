iOS��ʵ�ֶ��������... 
������ƽ������Ĺ��������Ǿ����õ�����NSArray���е�initWithObjects��������һ��������б���nil��Ϊ��β��Objective-C��ΪC/C++�����죬���õļ̳���C/C++�ɱ������һ�ص㡣������Apple Q&Aժ¼��Դ��

#import <Cocoa/Cocoa.h>

@interface NSMutableArray (variadicMethodExample)

- (void) appendObjects:(id) firstObject, ...; // This method takes a nil-terminated list of objects.

@end

@implementation NSMutableArray (variadicMethodExample)

- (void) appendObjects:(id) firstObject, ...
{
id eachObject;
va_list argumentList;
if (firstObject) // The first argument isn't part of the varargs list,
  {                                   // so we'll handle it separately.
  [self addObject: firstObject];
  va_start(argumentList, firstObject); // Start scanning for arguments after firstObject.
  while (eachObject = va_arg(argumentList, id)) // As many times as we can get an argument of type "id"
      [self addObject: eachObject]; // that isn't nil, add it to self's contents.
  va_end(argumentList);
  }
}

@end
