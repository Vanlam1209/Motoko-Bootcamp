import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Cycles "mo:base/ExperimentalCycles";


actor day_5 {

    public shared({caller}) func whoami() : async Principal {
    return(caller);
    };
// Challenge 1 : Write a function is_anonymous that takes no arguments but returns true is the caller is anonymous and false otherwise.
    public shared({caller}) func is_anonymous() : async Bool {
        return Principal.isAnonymous(caller);
    };

// Challenge 2 : Create an HashMap called favoriteNumber where the keys are Principal and the value are Nat.
    let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

// Challenge 3 : Write two functions 
// add_favorite_number that takes n of type Nat and stores this value in the HashMap where the key is the principal of the caller. This function has no return value.    
    public shared({caller}) func add_favorite_number(n: Nat): async () {
        favoriteNumber.put(caller, n);
    };
// show_favorite_number that takes no argument and returns n of type ?Nat, n is the favorite number of the person as defined in the previous function or null if the person hasn't registered.
    public shared({caller}) func show_favorite_number(): async ?Nat {
        favoriteNumber.get(caller);
    };  

// Challenge 4 : Rewrite your function add_favorite_number so that if the caller has already registered his favorite number, the value in memory isn't modified.
    public shared({caller}) func new_add_favorite_number(n: Nat): async Text {
        let number: ?Nat = favoriteNumber.get(caller);

        switch(number){
            case(null){
                favoriteNumber.put(caller, n);
                return "You have successfully registered your number";
            }; 
            case(?number){
                return "You have already registered your number";
            };
        };
    };

// Challenge 5 : Write two functions
// update_favorite_number
    public shared({caller}) func update_favorite_number(n: Nat): async Text {
        favoriteNumber.put(caller, n);
        return "You have successfully updated your number";
    };
// delete_favorite_number
    public shared({caller}) func delete_favorite_number(n: Nat): async Text {
        let number: ?Nat = favoriteNumber.get(caller);

        switch(number){
            case(null){
                return "Your number hasn't been registered yet";
            }; 
            case(?number){
                favoriteNumber.delete(caller);
                return "You have already deleted your number";
            };
        };
    };

// Challenge 6 : Write a function deposit_cycles that allow anyone to deposit cycles into the canister. This function takes no parameter but returns n of type Nat corresponding to the amount of cycles deposited by the call.
    public func deposit_cycles(): async Nat {
        let AMOUNT_TO_DEPOSIT : Nat = 100_000;
        let received = Cycles.accept(AMOUNT_TO_DEPOSIT);
        return AMOUNT_TO_DEPOSIT;
    }; 

// Challenge 7 : Write a function withdraw_cycles that takes a parameter n of type Nat corresponding to the number of cycles you want to withdraw from the canister and send it to caller asumming the caller has a callback called deposit_cycles()
    public shared func withdraw_cycles(amount : Nat): async () {
        Cycles.add(amount);        
    };

// Challenge 8 : Rewrite the counter (of day 1) but this time the counter will be kept accross ugprades.
// Rewrite the counter (of day 1)
    stable var Counter : Nat = 0;
  
    public func increment_counter(n : Nat) : async Nat {
        Counter += n;
        return Counter;
    };
    public func clear_counter() : async Nat {
        Counter := 0;
        return Counter;
    };
// version_number that will keep track of how many times your canister has been upgraded.
    stable var version_number : Nat = 0;

    system func postupgrade() {
        version_number += 1;
    };
    public func get_current_version() : async Nat {
        return version_number; 
    };
}