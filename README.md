Puppet module for installing the Go from the official PPA noted
on in the [Golang docs](https://code.google.com/p/go-wiki/wiki/Ubuntu).
This module is also available on the [Puppet
Forge](https://forge.puppetlabs.com/garethr/golang)

[![Build
Status](https://secure.travis-ci.org/garethr/garethr-golang.png)](http://travis-ci.org/garethr/garethr-golang)

## Usage

The module includes a single class:

    include 'golang'

By default this sets up the PPA and installs the golang-stable package.
See the code for ways to get golang-weekly or golang-tip.
