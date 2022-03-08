import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Iter "mo:base/Iter";
import Bool "mo:base/Bool";
import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Char "mo:base/Char";
import Prim "mo:prim";
import Text "mo:base/Text";
import Blob "mo:base/Blob";

actor {
// Challenge 1 : Write a function nat_to_nat8 that converts a Nat n to a Nat8. Make sure that your function never trap.
// Call example: dfx canister call day_2 nat_to_nat8 '(200)'
// Call example: dfx canister call day_2 nat_to_nat8 '(290)'
public func nat_to_nat8(n : Nat) : async ?Nat8 {
if(n < 256) {
    return (?Nat8.fromNat(n));
}
else {
    return null;
};
};

// Challenge 2 : Write a function max_number_with_n_bits that takes a Nat n and returns the maximum number than can be represented with only n-bits.
// Call example: dfx canister call day_2 max_number_with_n_bits '(8)'
public func max_number_with_n_bits(n : Nat) : async Nat {
    var max_number : Nat = 0;
    for (i in Iter.range(0, n-1))
      max_number += Nat.pow(2,i);
    return max_number;
};

// Challenge 3 : Write a function decimal_to_bits that takes a Nat n and returns a Text corresponding to the binary representation of this number.
// Call example: fx canister call day_2 decimal_to_bits '(255)'
public func decimal_to_bits(n : Nat) : async Text {
    var bit : Text = "";
    var x : Nat = 0;
    x :=n;
    while (x > 0) {
    bit := Nat.toText (x%2) # bit;
    x := x/2;
    };
    return bit;
};

// Challenge 4 : Write a function capitalize_character that takes a Char c and returns the capitalized version of it.
// Call example: 
public func capitalize_character(c : Char) : async Char {
  return Prim.charToUpper(c);
};

// Challenge 5 : Write a function capitalize_text that takes a Text t and returns the capitalized version of it.
// Call example: dfx canister call day_2 capitalize_text '("motoko")'
public func capitalize_text (t : Text) : async Text {
  return Text.map(t, Prim.charToUpper);
};

// Challenge 6 : Write a function is_inside that takes two arguments : a Text t and a Char c and returns a Bool indicating if c is inside t .
// Call example: 
public func is_inside (t : Text, c : Char) : async Bool {
  return Text.contains(t, #char c);
};

// Challenge 7 : Write a function trim_whitespace that takes a text t and returns the trimmed version of t. Note : Trim means removing any leading and trailing spaces from the text : trim_whitespace(" Hello ") -> "Hello".
// Call example: dfx canister call day_2 trim_whitespace '(" M o t o k o ")'
public func trim_whitespace(t : Text) : async Text {
  return Text.replace(t, #char ' ', "");
};

// Challenge 8 : Write a function duplicated_character that takes a Text t and returns the first duplicated character in t converted to Text. Note : The function should return the whole Text if there is no duplicate character : duplicated_character("Hello") -> "l" & duplicated_character("World") -> "World".
// Call example:
public func duplicated_character(t : Text) : async Text {
  var temp : Char = ' ';
  for(char in t.chars()){
    if (char == temp){
      return Char.toText(char);
    };
    temp := char;
  };
  return t;
};

// Challenge 9 : Write a function size_in_bytes that takes Text t and returns the number of bytes this text takes when encoded as UTF-8.
// Call example: dfx canister call day_2 size_in_bytes '("motoko")'
public func size_in_bytes(t: Text) : async Nat {
   var encoded : Blob = Text.encodeUtf8(t);
   return encoded.size();
};

// Challenge 10 : Bubble_sort
// Call example: dfx canister call day_2 bubble_sort '(vec {2; 9; 3; 8; 6; 1})'
public func bubble_sort(array : [Nat]) : async [Nat] {
    let lenght : Nat = array.size();
    var srted_array : [var Nat] = Array.thaw(array);
    for (i in Iter.range(1, lenght-1)) {
      for (j in Iter.range(0, lenght-2)) {
        let first_num : Nat = srted_array[j];
        let second_num : Nat = srted_array[j+1];
        if (first_num > second_num) {
          srted_array[j] := second_num;
          srted_array[j+1] := first_num;
        }; 
      };
    };
    
    return Array.freeze(srted_array);
};

};