import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'check_divides' : (arg_0: bigint, arg_1: bigint) => Promise<boolean>,
  'clear_counter' : () => Promise<bigint>,
  'day_to_second' : (arg_0: bigint) => Promise<bigint>,
  'increment_counter' : (arg_0: bigint) => Promise<bigint>,
  'is_even' : (arg_0: bigint) => Promise<boolean>,
  'maximum' : (arg_0: Array<bigint>) => Promise<bigint>,
  'remove_from_array' : (arg_0: Array<bigint>, arg_1: bigint) => Promise<
      Array<bigint>
    >,
  'selection_sort' : (arg_0: Array<bigint>) => Promise<Array<bigint>>,
  'square' : (arg_0: bigint) => Promise<bigint>,
  'sum' : (arg_0: bigint, arg_1: bigint) => Promise<bigint>,
  'sum_of_array' : (arg_0: Array<bigint>) => Promise<bigint>,
}
