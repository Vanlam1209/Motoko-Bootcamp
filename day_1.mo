import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Bool "mo:base/Bool";
import Array "mo:base/Array";
import Debug "mo:base/Debug";

actor {
  // Challenge 1 : Write a function add that takes two natural numbers n and m and returns the sum.
  // Call example: dfx canister call day_1 sum '(5, 10)'
  var Sum : Nat = 0;
    public func sum(m : Nat, n : Nat) : async Nat {
    Sum := m + n;
    return Sum;
  };

// Challenge 2 : Write a function square that takes a natural number n and returns the area of a square of length n.
// Call example: dfx canister call day_1 square '(9)'
  var Square : Nat = 0;
  
    public func square(n : Nat) : async Nat {
    Square := n*n;
    return Square;
  };

// Challenge 3 : Write a function days_to_second that takes a number of days n and returns the number of seconds.
// Call example: dfx canister call day_1 day_to_second '(2)'
  var Day_to_seconds : Nat = 0;
  
    public func day_to_second(n : Nat) : async Nat {
    Day_to_seconds := n*24*3600;
    return Day_to_seconds;
  };

// Challenge 4 : Write two functions increment_counter & clear_counter .
//               increment_counter returns the incremented value of counter by n.
//               clear_counter sets the value of counter to 0.
// Call example: dfx canister call day_1 increment_counter '(2)'
// Call example: dfx canister call day_1 clear_counter
  var Counter : Nat = 0;
  
    public func increment_counter(n : Nat) : async Nat {
    Counter += n;
    return Counter;
  };
    public func clear_counter() : async Nat {
    Counter := 0;
    return Counter;
  };

// Challenge 5 : Write a function divide that takes two natural numbers n and m and returns a boolean indicating if n divides m.
// Call example: dfx canister call day_1 check_divides '(2, 1)'
// Call example: dfx canister call day_1 check_divides '(2, 0)'
    public func check_divides(n : Nat, m : Nat) : async Bool {
    if(m != 0) {
    return (true);
    } else {
    return (false);
    };

  };

// Challenge 6 : Write a function is_even that takes a natural number n and returns a boolean indicating if n is even.
// Call example: dfx canister call day_1 is_even '(21)'
// Call example: dfx canister call day_1 is_even '(20)'
  var remainder : Nat = 0;
    public func is_even(n : Nat) : async Bool {
    remainder := n % 2;
    if(remainder == 0) {
    return (true);
    } else {
    return (false);
    };
    };

// Challenge 7 : Write a function sum_of_array that takes an array of natural numbers and returns the sum. This function will returns 0 if the array is empty.
// Call example: dfx canister call day_1 sum_of_array '(vec {1; 2; 3; 4})'
// Call example: dfx canister call day_1 sum_of_array '(vec {})'
  var Sum_of_array : Nat = 0;
  var Size : Nat = 0;

    public func sum_of_array(array : [Nat]) : async Nat {
      Size := array.size();
      if(Size == 0) {
        Sum_of_array := 0;
        return Sum_of_array;
    } else {
        for (value in array.vals()) {
          Sum_of_array += value;
        };
        return Sum_of_array;

    };
     
    };
 
// Challenge 8 : Write a function maximum that takes an array of natural numbers and returns the maximum value in the array. This function will returns 0 if the array is empty.
// Call example: dfx canister call day_1 maximum '(vec {1; 2; 3; 4})'
// Call example: dfx canister call day_1 maximum '(vec {})'
var Max : Nat = 0;
  
    public func maximum(array : [Nat]) : async Nat {
      Size := array.size();
      if(Size == 0) {
        Max := 0;
        return Max;
    } else {
        Max := array[0];
        for (value in array.vals()) {
          if(value > Max) {
          Max := value;
          };
        };
        return Max;

     };
    };

// Challenge 9 : Write a function remove_from_array that takes 2 parameters : an array of natural numbers and a natural number n and returns a new array where all occurences of n have been removed (order should remain unchanged).
// Call example: dfx canister call day_1 remove_from_array '(vec {1; 2; 3; 1; 4; 1; 5}, 1)'
var new_array : [Nat] =[];
    public func remove_from_array(array : [Nat], n : Nat) : async [Nat] {
    new_array := Array.filter(array, func(value: Nat) : Bool { value != n });
    return new_array;
    };

// Challenge 10 : Implement a function selection_sort that takes an array of natural numbers and returns the sorted array .
// Call example: dfx canister call day_1 selection_sort '(vec {2; 9; 3; 8; 6; 1})'
var Sorted_array : [Nat] =[];
    public func selection_sort(array : [Nat]) : async [Nat] {
    Sorted_array := Array.sort(array, Nat.compare);
    return Sorted_array;
    };

};


