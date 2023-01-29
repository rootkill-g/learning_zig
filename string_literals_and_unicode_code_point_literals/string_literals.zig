// String literals are constant single-item Pointers to
// null-terminated byte array. The type of string literals
// encodes both the length, and the fact that they are
// null-terminated, and thus they can be coerced to both Slices
// and Null-Terminated Pointers. Dereferencing string literals
// converts them to Arrays.

// Strings are UTF-8 encoded | Zig source code is UTF-8 encoded
// To embed non-UTF-8 bytes into a string literal use: \xNN notation

// Unicode code point literals have type comptime_init, the
// same as Integer Literals. All escape sequences are valid
// in both string literals and Unicode code point literals.

// In other languages Unicode code point literals are called 
// "character literals".

const print = @import("std").debug.print;
const mem = @import("std").mem; // Will be used to compare bytes

pub fn main() void {
  const bytes = "hello";
  print("{}\n", .{@TypeOf(bytes)}); // *const [5:0]u8
  print("{d}\n", .{bytes.len}); // 5
  print("{c}\n", .{bytes[1]}); // 'e'
  print("{d}\n", .{bytes[5]}); // 0
  print("{}\n", .{'e' == '\x65'}); // true
  print("{d}\n", .{'\u{1f4a9}'}); // 1289169
  print("{d}\n", .{'💯'}); // 128175
  print("{}\n", .{mem.eql(u8, "hello", "h\x65llo")}); // true
  print("0x{x}\n", .{"\xff"[0]}); // non-UTF-8 strings are possible with \xNN notation.
  print("{u}\n", .{'⚡'});

  print("\n{s}\n", .{hello_world_in_c});
}

// Escape sequences
// `\n` -> Newline
// `\r` -> Carriage Return
// `\t` -> Tab
// `\\` -> Backslash
// `\'` -> Single Quote
// `\"` -> Double Quote
// `\xNN` -> hexadecimal 8-bit byte value (2 digits)
// `\u{NNNNNN}` -> hexadecimal Unicode code point UTF-8 encoded (1 or more digits)

// NOTE: The maximum valid Unicode point is 0x10ffff.

// Multiline string literal

const hello_world_in_c =
  \\#include <stdio.h>
  \\
  \\int main(int argc, char **argv) {
  \\  printf("hello world\n");
  \\  return 0;
  \\}
;
