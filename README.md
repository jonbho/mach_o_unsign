mach_o_unsign -- Remove code signature from Mach-O executable
=============================================================

BUILDING
--------
* `git clone https://github.com/jonbho/mach_o_unsign.git`
* `cd mach_o_unsign`
* `make`

It just invokes `gcc` to build.

USAGE
-----
* Invoke as `unsign original_executable_filename [output_executable_filename [backup_executable_filename]]`,
   where `original_executable_filename` is the file you want to modify, `output_executable_filename`
   is the optional output file name (if not given, it defaults to writing the output with the same path
   and name of the original with `.unsigned` appended), and `backup_executable_filename` is an optional
   path where the tool will make a copy of the original before attempting any modification for backup purposes.
   If a file with the `backup_executable_filename` name already exists, no backup is generated.

DESCRIPTION
-----------
The code processes the input Mach-O executable load commands until it finds an LC_CODE_SIGNATURE one,
and removes it. It also zeroes out the signature in the __LINKEDIT section. It does this for all the
architectures included in a 'fat' (multi-architecture) binary. The executable should keep working
exactly the same after the modification.

NOTE
----
If you want to do this to a root-owned executable in an OS X environment (for example, most in the
application bundles in /Applications), you will need to grant it permissions. You can use either
`sudo` before invocation, or you can use the utility `run_authorized_osx` which will bring the OS X
standard admin password prompt (see
[https://github.com/jonbho/run_authorized_osx](https://github.com/jonbho/run_authorized_osx)).

ATTRIBUTION
-----------
Based on the ISC-licensed unsign code at
[http://www.woodmann.com/collaborative/tools/index.php/Unsign](http://www.woodmann.com/collaborative/tools/index.php/Unsign).
There were two other imports of this code into github
([https://github.com/daqiang430/unsign](https://github.com/daqiang430/unsign)
and [https://github.com/steakknife/unsign](https://github.com/steakknife/unsign)), but they did not
document the source or the changes made, and they mostly had some formatting changes, so I decided to
do a better documented import from the original without modifying the formatting.

LEGAL
-----
Portions (c) August 2016 Jon Beltran de Heredia ([jonbho](http://jonbho.net)). Licensed under the MIT license.
