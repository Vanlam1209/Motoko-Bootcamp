module {
// Challenge 2 : Create a new file called animal.mo with at least 2 property (specie of type Text, energy of type Nat), import this type in your main.mo and create a variable that will store an animal.    
    public type Animal = {
        specie : Text;
        energy : Nat;
    };
    
// Challenge 3 : In animal.mo create a public function called animal_sleep that takes an Animal and returns the same Animal where the field energy has been increased by 10. Note : As this is a public function of a module, you don't need to make the return type Async !    
    public func animal_sleep (animal: Animal): Animal {
        let after_sleep: Animal = {
            specie = animal.specie;
            energy = animal.energy + 10;
        };
        return after_sleep;
    }
}