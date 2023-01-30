// const x = 124;
const print = @import("std").debug.print;

fn foo() void {
  // `const` assignment works at file scope as well as inide functios.
  const y = 5674;

  // Once assigned, an identifier cannot be changed.
  // y +=1 ; // Will fail at compile time. As const is not mutable.

  var x: i32 = 534;
  x += 1; // Allowed as var type is mutable.

  // var z: i32; // !!! Variables should be initialized.
  // z = 1;

  // `undefined` can be coerced to any type. Once this happens, it is no longer
  // possible to detect that the value is `undefined`. `undefined` means the value
  // could be anything, even something that is nonsense according to the type. Translated 
  // into English, `undefined` means "Not a meaningful value. Using this value
  // would be a bug. The value will be unused, or overwritten before being used."

  // !NOTE: In Debug mode, zig writes 0xaa bytes to undefined memory. This is to
  // catch bugs early, and to help detect use of undefined memory in debugger. However
  // this behaviour is only an implementation feature, not a language semantic,
  // so it is not guaranteed to be observable to code.
  var z: i32 = undefined;

  z = 1;

  print("x: {d} | y: {d} | z: {d}\n", .{x, y, z});
}

pub fn main() void {
  foo();
}
