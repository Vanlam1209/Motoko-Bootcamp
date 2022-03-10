module {
// Challenge 7 : Write a function is_null that takes l of type List<T> and returns a boolean indicating if the list is null . Tips : Try using a switch/case.
    public type List<T> = ?(T, List<T>);

    public func is_null<T>(list : List<T>) : Bool {
        switch(list){
            case(null) 
                return true;
            case(?list)
                return false;
        };
    };

// Challenge 8 : Write a function last that takes l of type List<T> and returns the optional last element of this list.

    public func last<T>(list : List<T>) : ?T {
        switch(list){
            case(null)
                return null;
            case (?(x, null))
                return ?x; 
            case (?(_, t))
                return last<T>(t);
        };
    };

// Challenge 9 : Write a function size that takes l of type List<T> and returns a Nat indicating the size of this list.
    public func size<T>(list : List<T>) : Nat {
    
        func rec(list : List<T>, n : Nat) : Nat {
            switch(list) {
                case null 
                    return n; 
                case (?(_, t))
                    return rec(t, n + 1); 
            };
        };
    rec(list,0);
    };

// Challenge 10 : Write a function get that takes two arguments : l of type List<T> and n of type Nat this function should return the optional value at rank n in the list.
    public func get<T>(list : List<T>, n : Nat) : ?T {
        switch (n, list) {
            case (_, null) 
                return null;
            case (0, (?(h, t))) 
                return ?h;
            case (_, (?(_, t))) 
                return get<T>(t, n - 1);
        };
    };

// Challenge 11 : Write a function reverse that takes l of type List and returns the reversed list.
    public func reverse<T>(list : List<T>) : List<T> {
        func rec(list : List<T>, r : List<T>) : List<T> {
            switch (list) {
                case null 
                    return r;
                case (?(h, t)) 
                    return rec(t, ?(h, r));
            };
        };
    rec(list, null);
    };

};