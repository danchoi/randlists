# randlists

Outputs random combinations of multiple lists.  

Example: 

    $ randlists <(seq 0 10) /usr/share/dict/words /usr/share/dict/words
    4 orthospermous untransmutable
    6 subintroductory monogynist
    5 protohemipteran unzealousness
    2 extemporizer uninterdicted
    2 croupal plantlet
    3 wehrlite scruplesomeness
    8 Ascalabota briolette
    7 Jaalin winer
    4 uncaressed supertranscendently
    0 antimonarchical sulphoricinic
    3 renocutaneous skimpily


## Usage

    randlists
    
    Usage: randlists [-n ROWS] [-F DELIMITER] FILE [FILE]
      Generates random lists
    
    Available options:
      -h,--help                Show this help text
      -n ROWS                  Output n rows. Default is to output the number of
                               rows in the shortest file.
      -F DELIMITER             Output field delimiter. Default: one space character
      FILE                     File or process substitution with content to
                               randomize. Can give 1 or more inputs.
    
    https://github.com/danchoi/randlists

If no limit is given with `-n`, `randlists` will output a number of lines equal to that of
the shortest file (or process substitution).

## Author

Daniel Choi https://github.com/danchoi
