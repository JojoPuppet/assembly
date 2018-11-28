num: DC.B #23                | declare and assign 23 to the constant num

answer: DC.B #0              | declare and assign 0 to the constant answer

result: DS.B 1               | declare one byte of storage in the main memory for the result


MOVE.B #1 ,D2                | the value in D2 will represent the divisor

MOVE.B result, D3            | Copy the value of result and store it in D3


| *The loop will begin here

returnTop : INC D2           | Increment the divisor (D2) by 1


MOVE.B num,D0                | copy the value of num and store it in data register D0


MOVE.B answer,D1             | copy the value of answer and store it in data register D1

SUB.B D2, D0                 | check if the divisor is equal to  num

BEQ isPrime                  | if the divisor is equal to num, jump to the statement 'isPrime'


ADD.B D2, D0



loop : SUB D2,D0             | Subtract the divisor from (num)
                             | Then store the final result in D0


BMI prime                    | check if (num - divisor) is less than 0,
                             | if FALSE then proceed to the next statement
                             | else jump to statement 'prime'

BEQ notPrime                 | check if the value of D0 (num-divisor) is equal to 0
                             | if FALSE then execute the next statement
                             | if TRUE  then jump to the statement with 'notPrime'

INC D1                       | if the value of D0 (num - divisor) is greater than 0,
                             | increment (answer) by one


JMP loop                     | jump to the statement with 'loop' text


prime : ADD.W D2,D0          | Add the divisor to the (num)


JMP returnTop                | return to the top

notPrime :MOVE.B #0,D3       | Store 0 into result

INC D1                       | Increment the content in D1 by 1

JMP end                      | Jump to the statement end

isPrime : MOVE.B #1,D3       | Store the value 1 into D3

end : MOVE D0,D0
