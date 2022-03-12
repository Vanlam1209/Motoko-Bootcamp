import Hash "mo:base/Hash";
import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Result "mo:base/Result";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import List "mo:base/List";
import HTTP "http";
import Text "mo:base/Text";
import Option "mo:base/Option";

actor day_6 {
// Challenge 1 : Create an actor in main.mo and declare the following types.
// TokenIndex of type Nat.
// Error which is a variant type with multiples tags :
    type TokenIndex = Nat;
    type Error = {
        #Syntax_Error;
        #Runtime_Error;
        #Logic_Error;
    };

// Challenge 2 : Declare an HashMap called registry with Key of type TokenIndex and value of type Principal. This will keeep track of which principal owns which TokenIndex.
    var registry : HashMap.HashMap<TokenIndex, Principal> = HashMap.HashMap<TokenIndex, Principal>(0, Nat.equal, Hash.hash);

// Challenge 3 : Declare a variable of type Nat called nextTokenIndex, initialized at 0 that will keep track of the number of minted NFTs.
// Write a function called mint.
    stable var nextTokenIndex : Nat = 0;
    type Result<Ok, Err> = Result.Result<Ok, Err>;
    public shared ({caller}) func mint() : async Result<(), Text> {
        if(Principal.isAnonymous(caller)){
            return #err("The user is not authenticated!");
        } else {
            registry.put(nextTokenIndex, caller);
            nextTokenIndex += 1;
            return #ok;
        };
    };

// Challenge 4 : Write a function called transfer 
    public shared({caller}) func transfer(to: Principal, tokenIndex: TokenIndex): async Result<(), Text>{
        if(Principal.isAnonymous(caller)){
            return #err("The user is not authenticated!")
        } else {
            registry.put(tokenIndex, caller);
            return #ok;
        };
    };

// Challenge 5 : Write a function called balance that takes no arguments but returns a list of tokenIndex owned by the called.
    type Iter<K, V> = Iter.Iter<(K, V)>;
    public shared({caller}) func balance(): async [TokenIndex]{
        var token_list : List.List<TokenIndex> = List.nil();

        for((index, _principal) in registry.entries()){
            if(Principal.equal(caller, _principal)) 
            token_list := List.push(index, token_list);
        };

        return List.toArray(token_list);
    };

// Challenge 6 : Write a function called http_request that should return a message indicating the number of nft minted so far and the principal of the latest minter. 
    
    public query func http_request(request : HTTP.Request) : async HTTP.Response {
    
        let lastToken = registry.size(); 
        let lastPrID = registry.get(lastToken - 1); 
        let lastPrID1 = Option.get(lastPrID, Principal.fromText("2vxsx-fae"));

        let response = {
        body = Text.encodeUtf8("NFT minted: " # Nat.toText(lastToken - 1) # ", Last minter principal: " # Principal.toText(lastPrID1));
        headers = [("Content-Type", "text/html; charset=UTF-8")];
        status_code = 200 : Nat16;
        streaming_strategy = null;
        };
        return(response);
    };

// Challenge 7
    stable var entries : [(TokenIndex, Principal)] = [];

    system func preupgrade() {
        entries := Iter.toArray(registry.entries());
    };

    system func postupgrade() {
        registry := HashMap.fromIter<TokenIndex, Principal>(entries.vals(), entries.size(), Nat.equal, Hash.hash);
    };
}