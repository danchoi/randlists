# randlists

Outputs random combinations of multiple lists.  

Example: 

    $ randlists <(seq 0 10) /usr/share/dict/words
    7 verticillus
    1 Thule
    5 proenzym
    7 topass
    2 unshieldable
    4 spheterize
    4 unengendered
    7 capitaled
    6 alinasal
    5 profaculty
    8 inenarrable

## Usage

    randlists

    Usage: randlists [-n ROWS] FILEPATH [FILEPATH]
      Generates random lists

    Available options:
      -h,--help                Show this help text
      -n ROWS                  Output n rows. Default is to output the number of
                               rows in the shortest file.
      FILEPATH                 File with content to randomize
      FILEPATH                 File with content to randomize

    https://github.com/danchoi/randlists


If no limit is given with `-n`, `randlists` will output a number of lines equal to that of
the shortest file (or process substitution).

## Author

Daniel Choi https://github.com/danchoi
