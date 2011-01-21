The TXL Student's Challenge
A sequence of problems designed to help you learn TXL.

J.R. Cordy
Queen's University
April 1992

The following is a sequence of four problems designed to
help you quickly understand TXL and how it is used.
To gain maximum learning from these challenges, you must
follow the rules.  The rules of the challenge are:

    (1) You must design and program your solutions yourself,
      without seeking out anyone else's solutions;

    (2) You may ask any number of questions, but only those
      with a yes/no answer;

    (3) You must swear to destroy your solutions and
      never to show them to anyone else.

Begin with the first challenge, and work through them in order.
As you come up with a solution for each one, email it to the
TXL oracle, oracle@txl.ca, for confirmation and advice
on how your solution could be improved.

You may email the oracle f you need answers to yes/no questions
while working on the problems.  Answers and evaluations of solutions
can also be provided by any experienced TXL programmer, all of
whom have been sworn to secrecy during their own initiation into
the mysteries of TXL.


TXL Challenge #1

You should go into the Turing language examples
directory, and get the Turing grammar.

You should then write a TXL program that does the following
thing: replace every if-then-elsif-then-elsif-then-else-end if
statement by an equivalent nested if-then-else-end if
statement (i.e, the equivalent to translating if statements
from Turing to standard Pascal or C).

Here's an example of what it should do:

Input (silly meaningless example):

  var x,y,z,m,n := 1

  if x = y then
    z :=1
  elsif x = m then
    put "hi"
    k := 3
  elsif m > n then
    if m = 5 then
      x := m * n
    elsif y = z then
      x := 4
    end if
    put x
  else
    put "that's it"
  end if
  put "done"

Output:
  var x,y,z,m,n := 1

  if x = y then
    z :=1
  else
    if x = m then
      put "hi"
      k := 3
    else
      if m > n then
        if m = 5 then
          x := m * n
        else
          if y = z then
            x := 4
          end if
        end if
        put x
      else
        put "that's it"
      end if
    end if
  end if
  put "done"

Your solution must work for any Turing program, no matter
how large or complex, and should fix every if statement in
the entire program in one run.

A really good solution to this in TXL is no more than 25 lines or so.
It is not necessary to change the Turing grammar in any way.
If you get over 40 lines you are probably barking up the wrong tree.

You can ask me any yes/no question about the problem or your
attempts at it.  I'll try to answer quickly.

Once you finish this one, I will give you three others that
will force you to understand better (and will go faster,
because this one forces you to get the basic ideas down).


TXL Challenge #2

Next is the reverse, more easily motivated problem:
given an arbitrary program full of nested if-then-else-endif's,
transform every one of them into minimal 'elsif' form
(i.e, the exact reverse transform of Challenge #1).

This is trickier in a couple of ways - you will have
to learn to use the language a bit more to do it.
In particular, you will need to use constructs, and probably
deconstructs and subrules.  A good solution may be up to
100 lines or so, but if you get over that you are barking up
the wrong tree.

You may assume that every if statement in the input contains
no elsif's, if you believe that will help.


TXL Challenge #3

Now we get down to something resembling what TXL is really used
for, and something that will demonstrate the power of the language.
In this challenge, you are to write a TXL program that will take
an arbitrary Turing program containing case statements, and
translate every case statement in the program into an equivalent
if-the-elsif-then-else-end if statement.

Here's an example of what it should do:

Input (silly meaningless example):

  var x,y,z,m,n := 1
  case x of
  label 2:
      z :=1
  label 1:
      put "hi"
      k := 3
  label 4:
      case m of
      label 5:
    x := m * n
      label 7:
    x := 4
      end case
      put x
  label:
      put "that's it"
  end case
  put "done"

Output:
  var x,y,z,m,n := 1
  if x = 2 then
      z :=1
  elsif x = 1 then
      put "hi"
      k := 3
  elsif x = 4 then
      if m = 5 then
    x := m * n
      elsif m = 7 then
    x := 4
      end if
      put x
  else
      put "that's it"
  end if
  put "done"

In this transform you will have to make use of almost
every feature of TXL (but not quite, some are reserved for
challenge #4!).  You will have to learn how to create something
out of nothing (since there are no if statements in the input
and you must make some in the output), and you will have to use
subrules to handle some of the transform (since it cannot all be
done in one rule).

You may find it helpful to introduce overrides (new definitions)
for some of the nonterminals of the Turing grammar to help
make the transform easier (but this isn't necessary).


TXL Challenge #4

You've reached the final challenge!  By now you can predict what
it will be.  Yup, you guessed it.  In this challenge, you are to
write a TXL program that recognizes if-then-elsif-then-else-end if
statements that can be converted to case statements (not all such
if statements can be!) and converts them to case statements.
As usual, your solution should find all such statements in any Turing
program and convert them all in one run.

Here's an example of what it should do:

Input (silly meaningless example):

  var x,y,z,m,n := 1
  if x = 2 then
      z :=1
  elsif x = 1 then
      if m = 5 then
    x := m * n
      elsif m < 7 then
    x := 4
      end if
      put "hi"
  elsif x = 4 then
      if m = 5 then
    x := m * n
      elsif k = 7 then
    x := 4
      end if
      put x
  else
      put "that's it"
  end if
  put "done"

Output:
  var x,y,z,m,n := 1
  case x of
  label 2:
      z :=1
  label 1:
      if m = 5 then
    x := m * n
      elsif m < 7 then
    x := 4
      end if
      put "hi"
  label 4:
      if m = 5 then
    x := m * n
      elsif k = 7 then
    x := 4
      end if
      put x
  label:
      put "that's it"
  end case
  put "done"

Notice that the two embedded if statements of this example were NOT
converted - because neither of them corresponds to a case statement.
(The first of them has an inequality in one of the if conditions,
and the second of them tests the value of two different variables.)

Checking that all of the conditions in the if statement are equality
conditions on the same variable is the tricky part of this last problem.
You will find that TXL "where" conditions, in conjunction with condition
rules, will help you to implement this kind of check.
