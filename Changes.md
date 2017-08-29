* Unreleased
  - Bump time upper bound from <1.7 to <1.9
* 1.1.2.0
  - Fixes issue where exceptions were not handled properly with many threads (https://github.com/markhibberd/riak-haskell-client/pull/76)
  - Add / delete indexes
* 1.1.1.0
  - Fixes for 2 connection leaks on errors.
  - Bump upper bound on aeson to <1.1
* 1.1.0.0
  - Adds bucket type as argument to many functions.
  - Bugfix for exceptions being ignored (https://github.com/markhibberd/riak-haskell-client/pull/46)
* 1.0
  - No longer expected to work with riak <= 2
  - CRDT functionality, including high-level interface
	and quickCheck tests
  - Basic yokozuna search functionality
  - CRDT benchmarking suite
  - Bugfixes
  - Tested on both 2.0.x and 2.1.x
