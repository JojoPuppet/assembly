
remainder: dc.b #12      | declare and assign 12 to the constant remainder

answer: dc.b #$0         | declare and assign 0 to the constant answer

d: DC.B #3               | declare and assign 3 to the constant d


move.b remainder,D0      | copy the value of remainder and store it in data register D0


move.b answer,D1         | copy the value of answer and store it in data register D1



loop : SUB d,D0          | declare loop to be the address of the SUB instruction
                         | subtract 3 from the content of D0 (remainder)
                         | Then store the final result in D0


BMI end                 | check if the content of D0 (remainder) is less than 0,
                        | if FALSE then proceed to the next statement
                        | else jump to statement with 'end' text


INC D1                  | if the value of D0 (remainder ) is greater than 0,
                        | increment the content of D1 (answer) by one


JMP loop                | jump to the statement with 'loop' text


end : ADD.W d,D0        | ADD 3 to the content of D0 (remainder)
