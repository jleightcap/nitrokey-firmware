#!/usr/bin/env nix-shell
#!nix-shell -i nu -p nushell

# Gets the versions from the lockfile into a table for querying later
# +------------+----------------+
# | NAME       | VERSION        | 
# +------------+----------------+
# | foobar     | 1.0            |
# +------------+----------------+
let versions = open Cargo.lock
  | from toml
  | get package
  | select name version source?
  
# Build a table with name and hash columns for each dependency and queries
# the table `versions`. An example element would be
# +------------+----------------+
# | NAME       | HASH           | 
# +------------+----------------+
# | foobar-1.0 | sha256-AAAA... |
# +------------+----------------+
let hashes = open Cargo.toml
  | get patch.crates-io
  | transpose name value
  | flatten
  | filter {|dep| "git" in ($dep | columns)}
  | par-each {|dep|
    let lock_info = $versions
        | where name == $dep.name
        | get 0
    let version = $lock_info | get version
    let source = $lock_info | get source | str replace "git+" ""

    let name = $dep.name + "-" + $version

    let hash = (nix-prefetch --unpack --name $name $source | xargs nix hash to-sri --type sha256) 

   {name: $name, hash: $hash}
  }
  | transpose --ignore-titles -r -d

$hashes | to json | save -f hashes.json
