export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'check_divides' : IDL.Func([IDL.Nat, IDL.Nat], [IDL.Bool], []),
    'clear_counter' : IDL.Func([], [IDL.Nat], []),
    'day_to_second' : IDL.Func([IDL.Nat], [IDL.Nat], []),
    'increment_counter' : IDL.Func([IDL.Nat], [IDL.Nat], []),
    'is_even' : IDL.Func([IDL.Nat], [IDL.Bool], []),
    'maximum' : IDL.Func([IDL.Vec(IDL.Nat)], [IDL.Nat], []),
    'remove_from_array' : IDL.Func(
        [IDL.Vec(IDL.Nat), IDL.Nat],
        [IDL.Vec(IDL.Nat)],
        [],
      ),
    'selection_sort' : IDL.Func([IDL.Vec(IDL.Nat)], [IDL.Vec(IDL.Nat)], []),
    'square' : IDL.Func([IDL.Nat], [IDL.Nat], []),
    'sum' : IDL.Func([IDL.Nat, IDL.Nat], [IDL.Nat], []),
    'sum_of_array' : IDL.Func([IDL.Vec(IDL.Nat)], [IDL.Nat], []),
  });
};
export const init = ({ IDL }) => { return []; };
