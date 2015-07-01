iOS中实现多参数传递... 
可能在平常编码的过程中我们经常用到类似NSArray类中的initWithObjects，它接收一个多参数列表并以nil作为结尾，Objective-C作为C/C++的延伸，良好的继承了C/C++可变参数这一特点。下面是Apple Q&A摘录的源码

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
