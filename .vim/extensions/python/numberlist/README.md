numberlist usage:
program takes all available lines from stdin stream and numbers non empty lines (line with white spaces only is treated as a blank line).
Program can take two optional parameters:
numberlines [count] [step]
where:
- *count* is start value for internal counter - default value is 1.
- *step* is value which is used for incrementing counter after each line - if is negative number then counter is decremented - default value is 1.
Program print modified lines to stdout stream.

Inside VIM it is used conveniently via *filter* functionality:
- mark desired lines with visual mode and press ! key on keyboard. Command line is propagated with :`<.`>!`
- now input name of the script: *numberlist* with optional arguments and press *Enter* key.
