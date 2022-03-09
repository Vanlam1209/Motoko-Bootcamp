import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Iter "mo:base/Iter";
import Bool "mo:base/Bool";
import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Char "mo:base/Char";
import Prim "mo:prim";
import Text "mo:base/Text";

actor day_3 {
// Challenge 1 : Write a private function swap that takes 3 parameters : a mutable array , an index j and an index i and returns the same array but where value at index i and index j have been swapped.
// Call example: dfx canister call day_3 swap '(vec {1; 2; 3; 4; 5}, 0, 4)'
 private func swap(array: [var Nat], i: Nat, j: Nat) : [var Nat] {
    let tmp_i: Nat = array[i];
    let tmp_j: Nat = array[j];
    array[i] := tmp_j;
    array[j] := tmp_i;
    return array;
  };

// Challenge 2 : Write a function init_count that takes a Nat n and returns an array [Nat] where value is equal to it's corresponding index.\
// Call example: dfx canister call day_3 init_count '(5)'
  public func init_count(n: Nat) : async [Nat] {
       let arr: [var Nat] = Array.init(n, 0);
        for(i in Iter.range(0, n - 1)){
            arr[i] := i;
        };
       return Array.freeze(arr);
    };

// Challenge 3 : Write a function seven that takes an array [Nat] and returns "Seven is found" if one digit of ANY number is 7. Otherwise this function will return "Seven not found".
// Call example: dfx canister call day_3 seven '(vec {1; 2; 5; 7; 9})'
// Call example: dfx canister call day_3 seven '(vec {1; 2; 5; 6; 9})'
  public func seven(array : [Nat]) : async Text {
    let lenght : Nat = array.size();
    for(i in Iter.range(0, lenght-1)) {
      if(array[i]==7) {
        return "Seven is found";
      };
    };
    return "Seven is not found";
  };
  
// Challenge 4 : Write a function nat_opt_to_nat that takes two parameters : n of type ?Nat and m of type Nat . This function will return the value of n if n is not null and if n is null it will default to the value of m.
// Call example: dfx canister call day_3 nat_opt_to_nat '(null, 3)'
  public func nat_opt_to_nat(n : ?Nat, m : Nat) : async Text {
    switch(n){
      // Case where n is null
      case(null) {
        return Nat.toText(m);
      };
      // Case where n is a nat
      case(?something) {
        return Nat.toText(something);
      };
  };
};

// Challenge 5 : Write a function day_of_the_week that takes a Nat n and returns a Text value corresponding to the day. If n doesn't correspond to any day it will return null .
// Call example: dfx canister call day_3 day_of_the_week '(5)'
// Call example: dfx canister call day_3 day_of_the_week '(9)'
  public func day_of_the_week(n : Nat) : async ?Text {
    switch(n){
      case(1){return ?"Monday";};
      case(2){return ?"Tuesday";};
      case(3){return ?"Wednesday";};
      case(4){return ?"Thursday";};
      case(5){return ?"Friday";};
      case(6){return ?"Saturday";};
      case(7){return ?"Sunday";};
      case(_){return null;};      
    };
  };

// Challenge 6 : Write a function populate_array that takes an array [?Nat] and returns an array [Nat] where all null values have been replaced by 0.
  public func populate_array(array: [?Nat]): async [Nat] {
        return Array.tabulate<Nat>(array.size(), func(n: Nat){
            switch(array[n]){
                case (null) {return 0;};
                case (?something){return something;};              
            };
        });
  };

// Challenge 7 : Write a function sum_of_array that takes an array [Nat] and returns the sum of a values in the array.
// Call example: dfx canister call day_3 sum_of_array '(vec {1; 2; 3; 4; 5})'
  public func sum_of_array(array: [Nat]): async Nat {
    return Array.foldLeft<Nat, Nat>(array, 0 , func(i: Nat, j: Nat){i+j});
  };

// Challenge 8 : Write a function squared_array that takes an array [Nat] and returns a new array where each value has been squared.
// Call example: dfx canister call day_3 squared_array '(vec {1; 2; 3; 4; 5})'
  public func squared_array(array: [Nat]): async [Nat] {
    return Array.map<Nat, Nat>(array, func(i: Nat){Nat.pow(i, 2)});
  };

// Challenge 9 : Write a function increase_by_index that takes an array [Nat] and returns a new array where each number has been increased by it's corresponding index.
// Call example: dfx canister call day_3 increase_by_index '(vec {1; 2; 3; 4; 5})'
  public func increase_by_index(array: [Nat]): async [Nat] {
    return Array.mapEntries<Nat, Nat>(array, func(i :Nat, j:Nat){i+j});
  };

// Challenge 10 : Write a higher order function contains<A> that takes 3 parameters : an array [A] , a of type A and a function f that takes a tuple of type (A,A) and returns a boolean.
// Call example: dfx canister call day_3 check_contains '(vec {1; 5; 7; 9}, 1)'
// Call example: dfx canister call day_3 check_contains '(vec {1; 5; 7; 9}, 6)'
  func contains<A>(array: [A], a: A, f: (A,A) -> Bool): Bool {
    let lenght :Nat = array.size();
    for(i in Iter.range(0, lenght-1)) {
    if(f(array[i], a))
    return true;
    };
    return false;
  };
  // Function: f: (A,A) -> Bool
  let _equal = func(x : Nat, y : Nat): Bool{
        if (x == y)
          return true;
        return false;
      };
  
  public func check_contains(array : [Nat], a : Nat) : async Bool {
            return (contains<Nat>(array, a, _equal));
      };
}