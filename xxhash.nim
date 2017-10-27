{.passC: "-DXXH_PRIVATE_API -Iprivate".}

proc XXH32(key: pointer, size: csize, seed: cuint): cuint
  {.importc, header: "xxhash.h".}

proc XXH64(key: pointer, size: csize, seed: culonglong): culonglong
  {.importc, header: "xxhash.h".}

proc XXH32*(input: string, seed: cuint = 0): uint32 {.inline.} =
  XXH32(input.cstring, input.len, seed)

proc XXH64*(input: string, seed: culonglong = 0): uint64 {.inline.} =
  XXH64(input.cstring, input.len, seed)