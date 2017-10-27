import nimbench, os
import md5, securehash, metrohash, xxhash

var
  test_string: string = "012345678901234567890123456789012345678901234567890123456789012012"

if paramCount() > 0:
  if fileExists(paramStr(1)):
    test_string = readFile(paramStr(1))
  else:
    test_string = paramStr(1)

bench(securehash, m):
  var 
    h: SecureHash

  for i in 1..m:
    h = secureHash(test_string)

  doNotOptimizeAway(h)

benchRelative(md5, m):
  var 
    h: MD5Digest

  for i in 1..m:
    h = toMD5(test_string)

  doNotOptimizeAway(h)

benchRelative(metrohashContext, m):
  var 
    c: MetroHashContext 
    d: MetroHash64Digest

  for i in 1..m:
    metroHash64Init(c)
    metroHash64Update(c, test_string)
    metroHash64Final(c, d)

  doNotOptimizeAway(d)

benchRelative(metrohash64, m):
  var 
    h: MetroHash64Digest

  for i in 1..m:
    h = metroHash64(test_string)

  doNotOptimizeAway(h)

benchRelative(metrohash128Context, m):
  var 
    c: MetroHashContext 
    d: MetroHash128Digest

  for i in 1..m:
    metroHash128Init(c)
    metroHash128Update(c, test_string)
    metroHash128Final(c, d)

  doNotOptimizeAway(d)

benchRelative(metrohash128, m):
  var 
    h: MetroHash128Digest

  for i in 1..m:
    h = metrohash128(test_string)

  doNotOptimizeAway(h)

benchRelative(xxhash32, m):
  var 
    h: uint32

  for i in 1..m:
    h = XXH32(test_string)

  doNotOptimizeAway(h)

benchRelative(xxhash64, m):
  var 
    h: uint64

  for i in 1..m:
    h = XXH64(test_string)

  doNotOptimizeAway(h)

runBenchmarks()