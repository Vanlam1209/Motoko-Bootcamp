import Custom "custom";
import Animal "animal";
import MyList "list";
import Nat "mo:base/Nat";
import List "mo:base/List";
actor {
 
// Challenge 1 : Create two files called custom.mo and main.mo, create your own type inside custon.mo and import it in your main.mo file. In main, create a public function fun that takes no argument but return a value of your custom type.
    type NFT_Project = Custom.NFT_Project;

    let nft_project: NFT_Project = {
        name = "Motoko";
        entrepot = true;
        listed = 933;
    };

    public func fun() : async Text {
        if (nft_project.entrepot) {
        return "There're " # Nat.toText(nft_project.listed) # " " # nft_project.name # " listed on entrepot";
        } 
        else { 
        return "The project " # nft_project.name # " is not listed on entrepot";
        };
    };

// Challenge 2 : Create a new file called animal.mo with at least 2 property (specie of type Text, energy of type Nat), import this type in your main.mo and create a variable that will store an animal.
    type Animal = Animal.Animal;

    var tiger: Animal = {
        specie = "Tiger";
        energy = 100;
    };

// Challenge 4 : In main.mo create a public function called create_animal_then_takes_a_break that takes two parameter : a specie of type Text, an number of energy point of type Nat and returns an animal.
// Call example: dfx canister call day_4 create_animal_then_takes_a_break '("Wolf", 85)'
    public func create_animal_then_takes_a_break(specie: Text, energy: Nat): async Animal {
        let new_animal = {
            specie = specie;
            energy = energy;
        };
        return Animal.animal_sleep(new_animal);
    };

// Challenge 5 : In main.mo, import the type List from the base Library and create a list that stores animal.
    var animal_list = List.nil<Animal>();

// Challenge 6 : In main.mo : create a function called push_animal that takes an animal as parameter and returns nothing this function should add this animal to your list created in challenge 5. Then create a second functionc called get_animals that takes no parameter but returns an Array that contains all animals stored in the list.
    public func push_animal(animal : Animal) {
        animal_list := List.push<Animal>(animal, animal_list);
    };
    public func get_animals() : async [Animal] {
        return(List.toArray<Animal>(animal_list));
    };

// Challenge 7 : TEST CODE
    public func test_is_null() : async Bool {
        return MyList.is_null(animal_list);
    };

// Challenge 8 : TEST CODE
    public func test_last() : async ?Animal {
        return MyList.last(animal_list);
    };

// Challenge 9 : TEST CODE
    public func test_size() : async Nat {
        return MyList.size(animal_list);
    };

// Challenge 10 : TEST CODE
    public func test_get(n : Nat) : async ?Animal {
        return MyList.get(animal_list, n);
    };

// Challenge 10 : TEST CODE
    public func test_reverse() : async [Animal] {
        return List.toArray<Animal>(MyList.reverse(animal_list));
    };

// Call example for Challenge 6 to 11 (Call in order to see result)
// dfx canister call day_4 push_animal '(record {specie = "Tiger"; energy = 95})'
// dfx canister call day_4 get_animals
// dfx canister call day_4 push_animal '(record {specie = "Wolf"; energy = 75})'
// dfx canister call day_4 get_animals
// dfx canister call day_4 test_is_null
// dfx canister call day_4 test_last
// dfx canister call day_4 test_size
// dfx canister call day_4 test_get '(0)'
// dfx canister call day_4 test_get '(1)'
// dfx canister call day_4 test_reverse

}
