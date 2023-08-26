# dynutil

Various utilities for molecular dynamics simulations performed in [AMBER](http://ambermd.org). The pequi and precycle utilities require [ABS](https://github.com/kulhanek/abs) from Infinity.

## How to perform an equilibration:

* prepare the template files:

    $ module add dynutil
    $ pequi-prep  # review availbale protocols
    $ pequi-prep <protocol_name>

* review the protocol (relax?? directories) and adjust 'presubmit-hook' and 'pequiJob' files
* submit the 'pequiJob' into the batch system using the psubmit command from Infinity

## How to perform a production MD:

* prepare the template files:

    $ module add dynutil
    $ precycle-prep  # review availbale protocols
    $ precycle-prep <protocol_name>

* review the protocol (prod.in) and adjust 'presubmit-hook' and 'precycleJob' files
* submit the 'precycleJob' into the batch system using the psubmit command from Infinity

## Utilities:

### Preparation steps:
* pequi-prep
* precycle-prep

### Executive steps:
* pequi
* precycle

### Analysis:
* extract-minout
* extract-mdout

