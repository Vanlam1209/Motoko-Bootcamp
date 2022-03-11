import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Cycles "mo:base/ExperimentalCycles";
import Iter "mo:base/Iter";


actor day_5_challenge_9 {
// Challenge 9 :
    stable var entries : [(Principal, Nat)] = [];

    system func preupgrade() {
        entries := Iter.toArray(favoriteNumber.entries());
    };

    system func postupgrade() {
        favoriteNumber = HashMap.fromIter<Principal, Nat>(entries.vals(),entries.size(), Principal.equal, Principal.hash);
    };


// Challenge 2 : Upgrade
    let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

// Challenge 3 : Upgrade 
// add_favorite_number that takes n of type Nat and stores this value in the HashMap where the key is the principal of the caller. This function has no return value.    
    public shared({caller}) func add_favorite_number(n: Nat): async () {
        favoriteNumber.put(caller, n);
    };
// show_favorite_number that takes no argument and returns n of type ?Nat, n is the favorite number of the person as defined in the previous function or null if the person hasn't registered.
    public shared({caller}) func show_favorite_number(): async ?Nat {
        favoriteNumber.get(caller);
    };  

// Challenge 4 : Upgrade
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

// Challenge 5 : Upgrade
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


}