// Challenge 8
actor {
    type Result<Bool, Text> = {#ok: Bool; #announ : Text};
    let other_canister : actor { mint : () -> async Result<Bool, Text>} = actor("qoctq-giaaa-aaaaa-aaaea-cai");
    public shared ({caller}) func mint() : async Result<Bool, Text> {
        return(await other_canister.mint())
    };
}