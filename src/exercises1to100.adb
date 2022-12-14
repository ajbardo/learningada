with Ada.Text_IO; use Ada.Text_IO;
with ADA.Strings.Fixed; use ADA.Strings.Fixed;

with Ada.Strings;         use Ada.Strings;
with Ada.Strings.Bounded;
with Ada.Text_IO;         use Ada.Text_IO;

with Ada.Strings;       use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Maps;  use Ada.Strings.Maps;
with Ada.Text_IO;       use Ada.Text_IO;

with Ada.Numerics.Elementary_Functions;
use  Ada.Numerics.Elementary_Functions;
with Ada.Numerics; use Ada.Numerics;
with Ada.Real_Time; use Ada.Real_Time;

with linkedstructure; use linkedstructure;

package body exercises1to100 is
    procedure oneTo100(Self : in out My_Class) is
    -- exercises1to100
    -- 1.0-1.1 twoSum
    -- 1.0-1.0 palindrome
    -- 1.1-1.1 romantointeger
    -- 1.0-1.0 longestcommonprefix
    -- 1.0-1.0 validparentheses
    -- 1.0-1.0 mergetwosortedlists
    -- 1.0-1.0 removeduplicatesfromsortedarray
    -- 1.0-1.0 removeelement
    -- 1.0-1.0 lengthoflastword
    -- 1.0-1.0 plusOne
    -- 1.0-1.0 addbinary
    -- 1.0-1.0 SqrtX
    -- 2.0-1.0 climbingstairs
    -- +1.0-1.0 binarytreeinordertraversal
    -- ____ notes ____
    -- 1.0 - Nomenclature : versionOfProcedureOrFunction-versionOfTest
    -- * First digit for functionalities already completed an closed (1.0,2.0,3.0)
    -- * Second digit for functionalities under development (0.1,0.11,0.23,1.35,2.56)
    -- * Possible third digit to track minor changes that do not affect functionality (0.0.3,0.1.7)
    -- * Comments with the resume of the content with * character
    -- _______________
    -- 0.2-0.0 Global variables
    -- Global use arrays
    -- maxIndex10 : Integer
    -- type arrayOf10 is array(0 .. 9) of Integer
    -- array10 : arrayOf10
    --
    -- type arrayOf2 is array(0 .. 1) of Integer
    -- array2 : arrayOf2;
    --
    -- package B_Str
    -- type StringBounArray
    -- StrBounString
    --
    -- input variables for the functions
    -- integerInputA : Integer;
    -- integerInputB : Integer;
    -- integerInputC : Integer;
    -- stringInputA : String := "         ";
    -- bounStringInputB : Bounded_String;
    --
    -- output variables for the functions
    -- integerResultA : Integer;
    -- bounStringResultA : Bounded_String;
    -- bounStringResultB : Bounded_String;
    --
    -- variables for the test stadistics
    -- testPass : Integer;
    -- testPassed : Integer;
    -- testTotal : Integer;
    -- _______________
    -- 1.0-1.1 procedure twoSum(target : Integer:=0)
    -- * Calculate positions of two numbers in an array such that they add matches the target
    -- * Static test with 10 position array
    -- * New static test for the negative conditional
    -- 1.0-1.0 procedure palindrome(number : Integer)
    -- * Check if number is palindrome
    -- * Static test with input integer
    -- * Static test with input integer for the negative conditional
    -- 1.1-1.1 procedure romantointeger(romanNum : String)
    -- 1.0 procedure auxromantointeger(romanNum : String)
    -- * Transform from roman number to integer
    -- * Static positive test for the method
    -- 1.0-1.0 longestcommonprefix
    -- Procedure working with array of 3 Bounded string of length = 10
    -- 4 static tests, 2 with partial positive cases, 1 with total positive case and 1 with negative case
    -- 1.0-1.0 validparentheses
    -- Procedure working with Bounded string of length = 10
    -- 8 static test cases, 4 positives and 4 negatives
    -- 1.0-1.0 mergetwosortedlists
    -- working with 2 arrays of length 3
    -- outputt: array of 6 integers
    -- 6 static test cases
    -- 1.0-1.0 removeduplicatesfromsortedarray
    -- Solved with complexity O(n), using two arrays of numbers (dataComplexity O(2n))
    -- 6 static test cases defined
    -- 1.0-1.0 removeelement
    -- Solved Complexity O(n)
    -- 5 static test cases to verify behaviour
    -- 1.0-1.0 searchinsertposition
    -- Solved expected complexity O(logN)
    -- 5 static test cases to verify behaviour
    -- 1.0-1.0 lengthoflastword
    -- solved using https://learn.adacore.com/courses/intro-to-ada/chapters/standard_library_strings.html
    -- 3 static test to verify behaviour
    -- 1.0-1.0 plusOne
    -- Solved with complexity O(n)
    -- 6 static test cases to verify behaviour
    -- 1.0-1.0 addbinary
    -- Solved with complexity O(n)
    -- 5 static test cases to verify behaviour
    -- 1.0-1.0 SqrtX
    -- Solved with complexity O(n) in the not ^2 space, O(lgn) expected for the ^2 space
    -- 3 static test cases to verify behaviour
    -- 2.0-1.0 climbingstairs
    -- Solved with complexity O(n) - climbingstairsFibo
    -- Solved with complexity O(1) - climbingstairsFiboExtra
    -- 1 static test case with two checks to verify behaviour
    -- climbingstairsFibo is correct
    -- climbingstairsFiboExtra presents a divergence due to differences between the equation and the actual series
    -- 1.0-1.0 binarytreeinordertraversal
    -- Getting the tree with help of auxiliary array
    -- 3 static test cases to verify behaviour(1 failing when used a list instead of tree)



        --timers from https://learn.adacore.com/courses/intro-to-ada/chapters/standard_library_dates_times.html#benchmarking
        Start_Time, Stop_Time : Time;
        Elapsed_Time          : Time_Span;

        -- Global use arrays
        maxIndex10 : Integer := 10;
        type arrayOf10 is array(0 .. 9) of Integer;
        array10 : arrayOf10;

        type arrayOf2 is array(0 .. 1) of Integer;
        array2 : arrayOf2;

        type arrayOf100 is array(0 .. 99) of Integer;
        array100A : arrayOf100;

        -- linked arrays
        inputTree : linkedArrayData;

        -- from https://learn.adacore.com/courses/intro-to-ada/chapters/standard_library_strings.html#bounded-strings
        package B_Str is new
            Ada.Strings.Bounded.Generic_Bounded_Length (Max => 10);
        use B_Str;
        type StringBounArray is array (0 .. 2) of B_Str.Bounded_String;
        StrBounString : StringBounArray;



        -- input variables for the functions
        integerInputA : Integer;
        integerInputB : Integer;
        integerInputC : Integer;
        stringInputA : String := "         ";
        stringInputB : String := 20*" ";
        bounStringInputB : Bounded_String;
        array10AInput : arrayOf10;

        --type arrayOf3Index is range 1 .. 3; --removed until discover how to work with index out of fors
        type arrayOf3 is array(1 .. 3) of Integer;
        array3A : arrayOf3;
        array3B : arrayOf3;


        -- output variables for the functions
        integerResultA : Integer;
        bounStringResultA : Bounded_String;
        bounStringResultB : Bounded_String;
        array10AOutput : arrayOf10;

        --type arrayOf6Index is range 1 .. 6;--removed until discover how to work with index out of fors
        type arrayOf6 is array(1 .. 6) of Integer;
        array6A : arrayOf6;

        --variables for the test stadistics
        testPass : Integer;
        testPassed : Integer;
        testTotal : Integer;

        procedure twoSum(target : Integer:=0) is
            rest : integer := 0;
            pos1 : integer := 0;
            pos2 : integer := 0;
        begin
            array2 := (100, 100);
            while pos1 < maxIndex10 loop
                rest := target - array10(pos1);
                pos2 := pos1 + 1;
                while pos2 < maxIndex10 loop
                    if array2(0) < 100 then
                        -- Skiping the rest of the cycle
                        pos1 := maxIndex10 + 1;
                        pos2 := maxIndex10 + 1;
                    else
                        -- saving result position
                        if array10(pos2) = rest then
                            array2 := (pos1,pos2);
                        end if;
                    end if;
                    pos2 := pos2 + 1;
                end loop;
                pos1 := pos1 + 1;
            end loop;
        end twoSum;

        procedure palindrome(number : Integer) is
            tempNum : Integer;
            auxNum : Integer;
            rest : Integer;
            inverseNum : Integer := 0;
        begin
            tempNum := number;
            while tempNum > 0 loop
                auxNum := Integer(Float(tempNum) / 10.0);
                rest := Integer(tempNum - auxNum * 10);
                inverseNum := inverseNum * 10 + rest;
                tempNum := auxNum;
            end loop;
            integerResultA := 0;
            if inverseNum = number then
                integerResultA := 1;
            end if;
        end Palindrome;

        procedure auxromantointeger(romanNum : String) is
            romanone                : String := "I";
            romanfive               : String := "V";
            romanten                : String := "X";
            romanfifty              : String := "L";
            romanonehundred         : String := "C";
            romanfivehundred        : String := "D";
            romanthousand           : String := "M";
            count                   : Integer      ;
        begin
            integerResultA:=0;
            count := Ada.Strings.Fixed.Count(Source => romanNum,Pattern => romanone);
            integerResultA := Integer(count*1);
            if count = 0 then
                count := Ada.Strings.Fixed.Count(Source => romanNum,Pattern => romanfive);
                integerResultA := Integer(count*5);
            end if;
            if count = 0 then
                count := Ada.Strings.Fixed.Count(Source => romanNum,Pattern => romanten);
                integerResultA := Integer(count*10);
            end if;
            if count = 0 then
                count := Ada.Strings.Fixed.Count(Source => romanNum,Pattern => romanfifty);
                integerResultA := Integer(count*50);
            end if;
            if count = 0 then
                count := Ada.Strings.Fixed.Count(Source => romanNum,Pattern => romanonehundred);
                integerResultA := Integer(count*100);
            end if;
            if count = 0 then
                count := Ada.Strings.Fixed.Count(Source => romanNum,Pattern => romanfivehundred);
                integerResultA := Integer(count*500);
            end if;
            if count = 0 then
                count := Ada.Strings.Fixed.Count(Source => romanNum,Pattern => romanthousand);
                integerResultA := Integer(count*1000);
            end if;
        end auxromantointeger;

        procedure romantointeger(romanNum : String) is
            auxString : String := "   ";
        begin
            integerInputC := 0;
            for pos in 1 .. romanNum'Length-1 loop
                -- getting a string with the char stringExample = "'I'"
                auxString := romanNum(pos)'Image;
                auxromantointeger(auxString);
                -- Saving the old result
                integerInputB := integerResultA;
                auxString := romanNum(pos+1)'Image;
                auxromantointeger(auxString);
                -- roman calculus of the number
                if integerInputB < integerResultA then
                    integerInputC := integerInputC - integerInputB;
                else
                    integerInputC := integerInputC + integerInputB;
                end if;
            end loop;

            -- adding the last number always
            auxString := romanNum(romanNum'Last)'Image;
            auxromantointeger(auxString);
            integerInputC := integerInputC + integerResultA;
            -- saving the result in the integer that will eb checked
            integerResultA:=integerInputC;

        end romantointeger;

        procedure longestcommonprefix is
            letterPos : Integer := 0;
            lastCommonPos : Integer := 1;
            wordPos : Integer := 1;
        begin
            while letterPos < 10 loop
                if letterPos < 10 then
                    letterPos := letterPos + 1;
                    bounStringResultA := To_Bounded_String(To_String(StrBounString(0))(1..letterPos));
                    wordPos := 1;
                    while wordPos < StrBounString'Length loop
                        bounStringResultB := To_Bounded_String(To_String(StrBounString(wordPos))(1..letterPos));
                        lastCommonPos := letterPos;
                        if bounStringResultA /= bounStringResultB then
                            lastCommonPos := letterPos - 1;
                            letterPos := 20;
                            wordPos := 20;
                        end if;

                        wordPos := wordPos + 1;
                    end loop;
                end if;
            end loop;
            bounStringResultA := To_Bounded_String(To_String(StrBounString(1))(1..lastCommonPos));
        end longestcommonprefix;

        procedure validparentheses  is
            letterPos : Integer := 1;
            openbracktypeI : Integer := 0;
            closebracktypeI : Integer := 0;
            openbracktypeII : Integer := 0;
            closebracktypeII : Integer := 0;
            openbracktypeIII : Integer := 0;
            closebracktypeIII : Integer := 0;
            prevParentesis : Integer := 0;
        begin
            while letterPos < To_String(bounStringInputB)'Length+1 loop
                case To_String(bounStringInputB)(letterPos) is
                    when '(' =>
                        openbracktypeI := openbracktypeI + 1;
                        prevParentesis := 1;
                    when ')' =>
                        closebracktypeI := closebracktypeI + 1;
                        if openbracktypeI = 0 then -- breaking case when you close a parentesis without opening it first
                            exit;
                        end if;
                        if prevParentesis /= 1 then-- condition in case one type of parentesis is closing another type
                            if prevParentesis /= 0 then
                                exit;
                            end if;
                        end if;
                        prevParentesis := 0;

                    when '[' =>
                        openbracktypeII := openbracktypeII + 1;
                        prevParentesis := 2;
                    when ']' =>
                        closebracktypeII := closebracktypeII + 1;
                        if openbracktypeII = 0 then -- breaking case when you close a parentesis without opening it first
                            exit;
                        end if;
                        if prevParentesis /= 2 then-- condition in case one type of parentesis is closing another type
                            if prevParentesis /= 0 then
                                exit;
                            end if;
                        end if;
                        prevParentesis := 0;

                    when '{' =>
                        openbracktypeIII := openbracktypeIII + 1;
                        prevParentesis := 3;
                    when '}' =>
                        closebracktypeIII := closebracktypeIII + 1;
                        if openbracktypeIII = 0 then -- breaking case when you close a parentesis without opening it first
                            exit;
                        end if;
                        if prevParentesis /= 3 then-- condition in case one type of parentesis is closing another type
                            if prevParentesis /= 0 then
                                exit;
                            end if;
                        end if;
                        prevParentesis := 0;
                    when others =>
                        exit;
                end case;
               letterPos := letterPos + 1;
            end loop;
            integerResultA := 1;
            if openbracktypeI /= closebracktypeI then
                integerResultA := 0;
            end if;
            if openbracktypeII /= closebracktypeII then
                integerResultA := 0;
            end if;
            if openbracktypeIII /= closebracktypeIII then
                integerResultA := 0;
            end if;
        end validparentheses;

        procedure mergetwosortedlists  is
            -- indexes temporally removed
            --indexA : arrayOf3Index := 1;
            --indexB : arrayOf3Index := 1;
            --pos : arrayOf6Index := 1;
            indexA : Integer := 1;
            indexB : Integer := 1;
            pos : Integer := 1;
            tempMax : Integer := 0;
        begin

            while pos < array6A'Length+1 loop
                if indexA < array3A'Length+1 then
                    if indexB < array3B'Length+1 then
                        if array3A(indexA) < array3B(indexB) then
                            array6A(pos) := array3A(indexA);
                            indexA := indexA + 1;
                        elsif array3B(indexB) < array3A(indexA) then
                            array6A(pos) := array3B(indexB);
                            indexB := indexB + 1;
                        else
                            array6A(pos) := array3A(indexA);
                            pos := pos + 1;
                            array6A(pos) := array3B(indexB);
                            indexA := indexA + 1;
                            indexB := indexB + 1;
                        end if;
                    else
                        array6A(pos) := array3A(indexA);
                        indexA := indexA + 1;
                    end if;
                else
                    if indexB < array3B'Length+1 then
                        array6A(pos) := array3B(indexB);
                        indexB := indexB + 1;
                    end if;
                end if;
                pos := pos + 1;
            end loop;
        end mergetwosortedlists;

        procedure removeduplicatesfromsortedarray is
            pos : Integer := array10AInput'First;
            newValPos : Integer := array10AOutput'First;
        begin
            array10AOutput(newValPos) := array10AInput(pos);
            while pos < array10AInput'Length loop
                if array10AOutput(newValPos) /= array10AInput(pos) then
                    newValPos := newValPos + 1;
                    array10AOutput(newValPos) := array10AInput(pos);
                end if;
                pos := pos + 1;
            end loop;
       end removeduplicatesfromsortedarray;

        procedure removeelement is
            pos : Integer := array10AInput'First;
            newValPos : Integer := array10AOutput'First;
        begin
            while pos < array10AInput'Length loop
                if array10AInput(pos) /= integerInputA then
                    array10AOutput(newValPos) := array10AInput(pos);
                    newValPos := newValPos + 1;
                end if;
                pos := pos + 1;
            end loop;
        end removeelement;


       -- array10AInput := (1,4,7,8,12,27,51,65,72,100); -- array input,
        --integerInputA := 7; -- element to be found
        --integerResultA := 0;
        procedure searchinsertposition is
            lowPos : Integer := array10AInput'First;
            highPos : Integer := array10AInput'Last;
            newPos : Integer := 0;
        begin
            integerResultA := -1;
            if integerInputA <= array10AInput(array10AInput'First) then
                integerResultA := array10AInput'First;
            elsif integerInputA > array10AInput(array10AInput'Last) then
                integerResultA := array10AInput'Last+1;
            elsif integerInputA = array10AInput(array10AInput'Last) then
                integerResultA := array10AInput'Last;
            else
                while integerResultA = -1 loop
                    newPos := lowPos + Integer((highPos-lowPos)/2);
                    if array10AInput(newPos) < integerInputA then
                        if newPos = lowPos then
                            integerResultA := newPos;
                        end if;
                        lowPos := newPos;
                    elsif array10AInput(newPos) > integerInputA then
                        highPos := newPos;
                    else
                        integerResultA := newPos;
                    end if;
                end loop;
            end if;
        end searchinsertposition;

        procedure lengthoflastword is
            -- from https://learn.adacore.com/courses/intro-to-ada/chapters/standard_library_strings.html
            token : constant String := " ";
            I   : Natural := 1;
            F   : Positive;
            L   : Natural;
            Fold   : Positive;
            Lold   : Natural;
            Whitespace : constant Character_Set :=To_Set (' ');
        begin
            while I in stringInputB'Range loop
                Find_Token(
                    Source => stringInputB,
                    Set => Whitespace,
                    From => I,
                    Test => Outside,
                    First => F,
                    Last => L);
                exit when L = 0;
                Fold := F;
                Lold := L;
                I := L + 1;
            end loop;
            integerResultA := Integer(Lold-Fold)+1;
        end lengthoflastword;

        procedure plusOne is
            pos : Integer := array10'Last;
            extra : Integer := 0;
        begin
            while pos > array10'First-1 loop
                if pos = array10'Last then
                    array10(pos) := array10(pos) + 1;
                else
                    array10(pos) := array10(pos)  + extra;
                end if;

                if array10(pos) > 9 then
                    array10(pos) := 0;
                    extra := 1;
                else
                    extra := 0;
                end if;
                pos := pos - 1;
            end loop;
        end plusOne;


        procedure addbinary is
            letterPos : Integer := To_String(bounStringInputB)'Last+1;
            haulage : Integer := 1;
            result : String := To_String(bounStringInputB)'Length*" ";
        begin
            letterPos := letterPos - 1;
            result := To_String(bounStringInputB);
            while haulage = 1 and then letterPos > To_String(bounStringInputB)'First-1 loop
                if To_String(bounStringInputB)(letterPos) = '1' then
                    result(letterPos) := '0';
                    haulage := 1;
                else
                    result(letterPos) := '1';
                    haulage := 0;
                end if;
                letterPos := letterPos - 1;
            end loop;
            bounStringResultA := To_Bounded_String(result);
        end addbinary;

        procedure SqrtX is
            pos : Integer := 0;
            aux : Integer := 0;
            oldpos : Integer := 0;
            oldaux : Integer := 0;
            control : Integer := 1;
        begin
            integerResultA := 0;
            while control = 1 and then integerResultA=0 loop
                aux := pos * pos;
                if aux > integerInputA then
                    if (aux-integerInputA) > (integerInputA-oldaux) then
                        integerResultA := oldpos;
                    else
                        integerResultA := pos;
                    end if;
                end if;

                if pos > integerInputA then
                    control := 0;
                end if;

                oldpos := pos;
                oldaux := aux;
                pos := pos + 1;
            end loop;
        end SqrtX;


        procedure climbingstairsFibo is
            actual : Integer := 1;
            old : Integer := 0;
            pos : integer := 0;
        begin
            integerResultA := 0;
            if integerInputA > 2 then
                while pos < integerInputA loop
                    integerResultA := actual + old;
                    old := actual;
                    actual := integerResultA;
                    pos := pos + 1;
                end loop;
            else
                integerResultA := 1;
            end if;
        end climbingstairsFibo;

        procedure climbingstairsFiboExtra is
            GR : float := 1.618034;
        begin
            integerResultA := 0;
            integerResultA := Integer((GR**(integerInputA+1) - (1.0-GR)**(integerInputA+1))/Sqrt(5.0));
        end climbingstairsFiboExtra;

        procedure binarytreeinordertraversal is--ex94
            pos : integer := 0;--considering the root of the tree index = 0
            arrayResultpos : Integer := array100A'First;

            elemsCount : Integer := 0;
            type arrayOf100 is array(0 .. 99) of Integer;
            visitedElems : arrayOf100;
            arrayposvisitedElems : Integer := 0;

        begin
            visitedElems(arrayposvisitedElems) := 0;
            arrayposvisitedElems := arrayposvisitedElems + 1;
            while elemsCount < inputTree.getlength(0) loop
                --Put_Line ("/0>"&Integer'Image(inputTree.getElementValue(pos))&integer'image(pos));
                if inputTree.getFirstLink(pos) = 0 and inputTree.getSecondLink(pos) = 0 then --leaf

                    array100A(arrayResultpos) := inputTree.getElementValue(pos);--saved value
                    arrayResultpos := arrayResultpos + 1 ;

                    --point to the leaf
                    visitedElems(arrayposvisitedElems) := pos;
                    -- pos of the branch
                    pos := visitedElems(arrayposvisitedElems-1);

                    elemsCount := elemsCount + 1;
                    Put_Line ("/1>"&Integer'Image(inputTree.getElementValue(pos))&integer'image(pos)&integer'image(visitedElems(arrayposvisitedElems)));

                else --branch
                    if inputTree.getSecondLink(pos) /= 0 and inputTree.getSecondLink(pos) = visitedElems(arrayposvisitedElems) then -- pop the branch
                        arrayposvisitedElems := arrayposvisitedElems - 1;
                        if arrayposvisitedElems > 0 then
                            pos := visitedElems(arrayposvisitedElems-1);
                        end if;
                        elemsCount := elemsCount + 1;
                        Put_Line ("/2-0>"&Integer'Image(inputTree.getElementValue(pos))&integer'image(pos));

                    elsif inputTree.getFirstLink(pos) /= 0 and inputTree.getFirstLink(pos) /= visitedElems(arrayposvisitedElems) then
                        visitedElems(arrayposvisitedElems) := pos;
                        arrayposvisitedElems := arrayposvisitedElems + 1;
                        pos := inputTree.getFirstLink(pos);
                        Put_Line ("/2-1>"&Integer'Image(inputTree.getElementValue(pos))&integer'image(pos));

                    elsif inputTree.getSecondLink(pos) /= 0 and inputTree.getSecondLink(pos) /= visitedElems(arrayposvisitedElems) then
                        array100A(arrayResultpos) := inputTree.getElementValue(pos);--saved value of the branch
                        arrayResultpos := arrayResultpos + 1 ;

                        pos := inputTree.getSecondLink(pos);-- new branch
                        Put_Line ("/2-2>"&Integer'Image(inputTree.getElementValue(pos))&integer'image(pos));
                    elsif inputTree.getFirstLink(pos) = visitedElems(arrayposvisitedElems) then -- when there is no second link
                        array100A(arrayResultpos) := inputTree.getElementValue(pos);--saved value of the branch
                        arrayResultpos := arrayResultpos + 1 ;
                        arrayposvisitedElems := arrayposvisitedElems - 1;
                        if arrayposvisitedElems > 0 then
                            pos := visitedElems(arrayposvisitedElems-1);
                        end if;
                        elemsCount := elemsCount + 1;
                        Put_Line ("/2-3>"&Integer'Image(inputTree.getElementValue(pos))&integer'image(pos));
                    end if;

                end if;
            end loop;
            --for pos in 0 .. array100A'Length-1 loop
            --    Put_Line ("->"&Integer'Image(array100A(pos) ));
            --end loop;

        end binarytreeinordertraversal;

    begin

        Start_Time := Clock;
        Put_Line ("Starting main execution");
        testPass := 0;
        testPassed := 0;
        testTotal := 0;
        --------------------------------------------------------------------------------------------
        testTotal := testTotal + 1;
        integerInputA := 7;
        array10 := (9, 5, 5, 6, 2, 3, 4, 7, 6, 9);
        twoSum(integerInputA);
        if array2(0) = 1 and array2(1) = 4 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for twoSum with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        testPass := 0;
        integerInputA := 12;
        array10 := (9, 5, 5, 6, 2, 3, 4, 7, 6, 9);
        twoSum(integerInputA);
        if array2(0) = 0 and array2(1) = 5 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for twoSum with status: "&Integer'Image(testPass));
        --------------------------------------------------------------------------------------------
        testTotal := testTotal + 1;
        testPass := 0;
        integerResultA := 0;
        integerInputA := 12344321;
        palindrome(integerInputA);
        if integerResultA = 1 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for palindrome with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        testPass := 0;
        integerResultA := 1;
        integerInputA := 12345321;
        palindrome(integerInputA);
        if integerResultA = 0 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for palindrome with status: "&Integer'Image(testPass));
        --------------------------------------------------------------------------------------------
        stringInputA := "   XLVIII";
        romantointeger(stringInputA);
        testPass := 0;
        testTotal := testTotal + 1;
        if integerResultA = 48 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for romantointeger with status: "&Integer'Image(testPass));

        stringInputA := "     VIII";
        romantointeger(stringInputA);
        testPass := 0;
        testTotal := testTotal + 1;
        if integerResultA = 8 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for romantointeger with status: "&Integer'Image(testPass));
        --------------------------------------------------------------------------------------------
        StrBounString(0) := To_Bounded_String("asdfghjklo");
        StrBounString(1) := To_Bounded_String("asdfghtree");
        StrBounString(2) := To_Bounded_String("asdfgmnbvc");
        longestcommonprefix;
        testPass := 0;
        testTotal := testTotal + 1;
        if bounStringResultA = To_Bounded_String("asdfg") then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for longestcommonprefix with status: "&Integer'Image(testPass));

        StrBounString(0) := To_Bounded_String("eraseunave");
        StrBounString(1) := To_Bounded_String("eraseunave");
        StrBounString(2) := To_Bounded_String("eraseunave");
        longestcommonprefix;
        testPass := 0;
        testTotal := testTotal + 1;
        if bounStringResultA = To_Bounded_String("eraseunave") then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for longestcommonprefix with status: "&Integer'Image(testPass));

        StrBounString(0) := To_Bounded_String("eraseunave");
        StrBounString(1) := To_Bounded_String("eraseunave");
        StrBounString(2) := To_Bounded_String("erasenaves");
        longestcommonprefix;
        testPass := 0;
        testTotal := testTotal + 1;
        if bounStringResultA = To_Bounded_String("erase") then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for longestcommonprefix with status: "&Integer'Image(testPass));

        StrBounString(0) := To_Bounded_String("asdfsafasd");
        StrBounString(1) := To_Bounded_String("eraseunave");
        StrBounString(2) := To_Bounded_String("zxczxcccxz");
        longestcommonprefix;
        testPass := 0;
        testTotal := testTotal + 1;
        if bounStringResultA = To_Bounded_String("") then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for longestcommonprefix with status: "&Integer'Image(testPass));
        --------------------------------------------------------------------------------------------
        bounStringInputB := To_Bounded_String("()()()()()");--Output: true
        validparentheses;
        testPass := 0;
        testTotal := testTotal + 1;
        if integerResultA = 1 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for validparentheses with status: "&Integer'Image(testPass));

        bounStringInputB := To_Bounded_String("[][][][][]");--Output: true
        validparentheses;
        testPass := 0;
        testTotal := testTotal + 1;
        if integerResultA = 1 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for validparentheses with status: "&Integer'Image(testPass));

        bounStringInputB := To_Bounded_String("{}{}{}{}{}");--Output: true
        validparentheses;
        testPass := 0;
        testTotal := testTotal + 1;
        if integerResultA = 1 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for validparentheses with status: "&Integer'Image(testPass));

        bounStringInputB := To_Bounded_String("([{}]([]))");--Output: true
        validparentheses;
        testPass := 0;
        testTotal := testTotal + 1;
        if integerResultA = 1 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for validparentheses with status: "&Integer'Image(testPass));

        bounStringInputB := To_Bounded_String("([{}](]]))");--Output: false
        validparentheses;
        testPass := 0;
        testTotal := testTotal + 1;
        if integerResultA = 0 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for validparentheses with status: "&Integer'Image(testPass));

        bounStringInputB := To_Bounded_String("([{{{([]))");--Output: false
        validparentheses;
        testPass := 0;
        testTotal := testTotal + 1;
        if integerResultA = 0 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for validparentheses with status: "&Integer'Image(testPass));

        bounStringInputB := To_Bounded_String("([{}]([]])");--Output: false
        validparentheses;
        testPass := 0;
        testTotal := testTotal + 1;
        if integerResultA = 0 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for validparentheses with status: "&Integer'Image(testPass));

        bounStringInputB := To_Bounded_String("([{}]([])]");--Output: false
        validparentheses;
        testPass := 0;
        testTotal := testTotal + 1;
        if integerResultA = 0 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for validparentheses with status: "&Integer'Image(testPass));
        --------------------------------------------------------------------------------------------

        testPass := 0;
        testTotal := testTotal + 1;
        array3A := (1, 2, 4);
        array3B := (1, 3, 4);
        array6A := (0,0,0,0,0,0);
        mergetwosortedlists;
        testPass := 0;
        if array6A = (1,1,2,3,4,4) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for mergetwosortedlists with status: "&Integer'Image(testPass));

        testPass := 0;
        testTotal := testTotal + 1;
        array3A := (1, 4, 4);
        array3B := (1, 3, 4);
        mergetwosortedlists;
        testPass := 0;
        if array6A = (1,1,3,4,4,4) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for mergetwosortedlists with status: "&Integer'Image(testPass));

        testPass := 0;
        testTotal := testTotal + 1;
        array3A := (1, 4, 4);
        array3B := (1, 3, 5);
        mergetwosortedlists;
        testPass := 0;
        if array6A = (1,1,3,4,4,5) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for mergetwosortedlists with status: "&Integer'Image(testPass));

        testPass := 0;
        testTotal := testTotal + 1;
        array3A := (0, 0, 0);
        array3B := (0, 0, 0);
        mergetwosortedlists;
        testPass := 0;
        if array6A = (0,0,0,0,0,0) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for mergetwosortedlists with status: "&Integer'Image(testPass));

        testPass := 0;
        testTotal := testTotal + 1;
        array3A := (1, 1, 1);
        array3B := (2, 2, 2);
        mergetwosortedlists;
        testPass := 0;
        if array6A = (1,1,1,2,2,2) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for mergetwosortedlists with status: "&Integer'Image(testPass));

        testPass := 0;
        testTotal := testTotal + 1;
        array3A := (1, 1, 1);
        array3B := (1, 1, 1);
        mergetwosortedlists;
        testPass := 0;
        if array6A = (1,1,1,1,1,1) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for mergetwosortedlists with status: "&Integer'Image(testPass));
        --------------------------------------------------------------------------------------------

        testTotal := testTotal + 1;
        array10AInput := (1,1,1,2,2,3,4,8,8,8);
        array10AOutput := (0,0,0,0,0,0,0,0,0,0);
        removeduplicatesfromsortedarray;
        testPass := 0;
        if array10AOutput = (1,2,3,4,8,0,0,0,0,0) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for removeduplicatesfromsortedarray with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10AInput := (1,1,1,2,2,3,4,5,8,8);
        array10AOutput := (0,0,0,0,0,0,0,0,0,0);
        removeduplicatesfromsortedarray;
        testPass := 0;
        if array10AOutput = (1,2,3,4,5,8,0,0,0,0) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for removeduplicatesfromsortedarray with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10AInput := (1,2,3,3,3,3,3,3,8,0);
        array10AOutput := (0,0,0,0,0,0,0,0,0,0);
        removeduplicatesfromsortedarray;
        testPass := 0;
        if array10AOutput = (1,2,3,8,0,0,0,0,0,0) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for removeduplicatesfromsortedarray with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10AInput := (1,1,1,1,1,1,1,1,1,1);
        array10AOutput := (0,0,0,0,0,0,0,0,0,0);
        removeduplicatesfromsortedarray;
        testPass := 0;
        if array10AOutput = (1,0,0,0,0,0,0,0,0,0) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for removeduplicatesfromsortedarray with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10AInput := (0,0,0,0,0,0,0,0,0,0);
        array10AOutput := (0,0,0,0,0,0,0,0,0,0);
        removeduplicatesfromsortedarray;
        testPass := 0;
        if array10AOutput = (0,0,0,0,0,0,0,0,0,0) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for removeduplicatesfromsortedarray with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10AInput := (1,0,0,0,0,0,0,0,0,0);
        array10AOutput := (0,0,0,0,0,0,0,0,0,0);
        removeduplicatesfromsortedarray;
        testPass := 0;
        if array10AOutput = (1,0,0,0,0,0,0,0,0,0) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for removeduplicatesfromsortedarray with status: "&Integer'Image(testPass));

        --------------------------------------------------------------------------------------------

        testTotal := testTotal + 1;
        array10AInput := (4,3,2,5,4,6,2,3,3,1); -- array input
        array10AOutput := (0,0,0,0,0,0,0,0,0,0); -- array output
        integerInputA := 3; -- element to be removed
        removeelement;
        testPass := 0;
        if array10AOutput = (4,2,5,4,6,2,1,0,0,0) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for removeelement with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10AInput := (1,1,1,1,1,1,1,1,1,1); -- array input
        array10AOutput := (0,0,0,0,0,0,0,0,0,0); -- array output
        integerInputA := 1; -- element to be removed
        removeelement;
        testPass := 0;
        if array10AOutput = (0,0,0,0,0,0,0,0,0,0) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for removeelement with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10AInput := (1,1,1,2,2,2,1,1,1,2); -- array input
        array10AOutput := (0,0,0,0,0,0,0,0,0,0); -- array output
        integerInputA := 1; -- element to be removed
        removeelement;
        testPass := 0;
        if array10AOutput = (2,2,2,2,0,0,0,0,0,0) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for removeelement with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10AInput := (4,3,2,5,4,6,2,3,3,1); -- array input
        array10AOutput := (0,0,0,0,0,0,0,0,0,0); -- array output
        integerInputA := 7; -- element to be removed
        removeelement;
        testPass := 0;
        if array10AOutput = (4,3,2,5,4,6,2,3,3,1) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for removeelement with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10AInput := (7,3,2,5,4,6,2,3,3,1); -- array input
        array10AOutput := (0,0,0,0,0,0,0,0,0,0); -- array output
        integerInputA := 7; -- element to be removed
        removeelement;
        testPass := 0;
        if array10AOutput = (3,2,5,4,6,2,3,3,1,0) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for removeelement with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10AInput := (4,3,2,5,4,6,2,3,3,1); -- array input
        array10AOutput := (0,0,0,0,0,0,0,0,0,0); -- array output
        integerInputA := 1; -- element to be removed
        removeelement;
        testPass := 0;
        if array10AOutput = (4,3,2,5,4,6,2,3,3,0) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for removeelement with status: "&Integer'Image(testPass));
        --------------------------------------------------------------------------------------------


        testTotal := testTotal + 1;
        array10AInput := (1,4,7,8,12,27,51,65,72,100); -- array input,
        integerInputA := 9; -- element to be found
        integerResultA := 0;
        searchinsertposition;
        testPass := 0;
        if integerResultA = 3 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for searchinsertposition with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10AInput := (1,4,7,8,12,27,51,65,72,100); -- array input,
        integerInputA := 1; -- element to be found
        integerResultA := 0;
        searchinsertposition;
        testPass := 0;
        if integerResultA = 0 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for searchinsertposition with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10AInput := (1,4,7,8,12,27,51,65,72,100); -- array input,
        integerInputA := 100; -- element to be found
        integerResultA := 0;
        searchinsertposition;
        testPass := 0;
        if integerResultA = 9 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for searchinsertposition with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10AInput := (1,4,7,8,12,27,51,65,72,100); -- array input,
        integerInputA := 101; -- element to be found
        integerResultA := 0;
        searchinsertposition;
        testPass := 0;
        if integerResultA = 10 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for searchinsertposition with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10AInput := (1,4,7,8,12,27,51,65,72,100); -- array input,
        integerInputA := 40; -- element to be found
        integerResultA := 0;
        searchinsertposition;
        testPass := 0;
        if integerResultA = 5 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for searchinsertposition with status: "&Integer'Image(testPass));


        --------------------------------------------------------------------------------------------

        testTotal := testTotal + 1;
        stringInputB := "aaa aaa aaa " & 8 * " ";
        integerResultA := 0;
        lengthoflastword;
        testPass := 0;
        if integerResultA = 3 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for lengthoflastword with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        stringInputB := "aaa" & 17 * " ";
        integerResultA := 0;
        lengthoflastword;
        testPass := 0;
        if integerResultA = 3 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for lengthoflastword with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        stringInputB := 17 * " " & "aaa";
        integerResultA := 0;
        lengthoflastword;
        testPass := 0;
        if integerResultA = 3 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for lengthoflastword with status: "&Integer'Image(testPass));

        --------------------------------------------------------------------------------------------

        testTotal := testTotal + 1;
        array10 := (0,0,0,0,0,0,0,0,0,0);
        plusOne;
        testPass := 0;
        if array10 = (0,0,0,0,0,0,0,0,0,1) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for plusOne with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10 := (0,0,0,0,0,0,0,0,0,9);
        plusOne;
        testPass := 0;
        if array10 = (0,0,0,0,0,0,0,0,1,0) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for plusOne with status: "&Integer'Image(testPass));


        testTotal := testTotal + 1;
        array10 := (0,0,0,0,0,0,0,0,0,2);
        plusOne;
        testPass := 0;
        if array10 = (0,0,0,0,0,0,0,0,0,3) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for plusOne with status: "&Integer'Image(testPass));


        testTotal := testTotal + 1;
        array10 := (0,0,0,0,0,0,0,0,9,0);
        plusOne;
        testPass := 0;
        if array10 = (0,0,0,0,0,0,0,0,9,1) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for plusOne with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10 := (9,0,0,0,0,0,0,0,2,0);
        plusOne;
        testPass := 0;
        if array10 = (9,0,0,0,0,0,0,0,2,1) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for plusOne with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        array10 := (9,9,9,9,9,9,9,9,9,9);
        plusOne;
        testPass := 0;
        if array10 = (0,0,0,0,0,0,0,0,0,0) then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for plusOne with status: "&Integer'Image(testPass));


        --------------------------------------------------------------------------------------------


        testTotal := testTotal + 1;
        bounStringInputB := To_Bounded_String("0010100110");
        addbinary;
        testPass := 0;
        if bounStringResultA = To_Bounded_String("0010100111") then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for addbinary with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        bounStringInputB := To_Bounded_String("0010100111");
        addbinary;
        testPass := 0;
        if bounStringResultA = To_Bounded_String("0010101000") then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for addbinary with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        bounStringInputB := To_Bounded_String("1000000000");
        addbinary;
        testPass := 0;
        if bounStringResultA = To_Bounded_String("1000000001") then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for addbinary with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        bounStringInputB := To_Bounded_String("0000000000");
        addbinary;
        testPass := 0;
        if bounStringResultA = To_Bounded_String("0000000001") then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for addbinary with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        bounStringInputB := To_Bounded_String("1111111111");
        addbinary;
        testPass := 0;
        if bounStringResultA = To_Bounded_String("0000000000") then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for addbinary with status: "&Integer'Image(testPass));
        --------------------------------------------------------------------------------------------

        testTotal := testTotal + 1;
        integerInputA := 411;
        SqrtX;
        testPass := 0;
        if integerResultA = 20 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for SqrtX with status: "&Integer'Image(testPass));


        testTotal := testTotal + 1;
        integerInputA := 155542;
        SqrtX;
        testPass := 0;
        if integerResultA = 394 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for SqrtX with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        integerInputA := 32;
        SqrtX;
        testPass := 0;
        if integerResultA = 6 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for SqrtX with status: "&Integer'Image(testPass));


        --------------------------------------------------------------------------------------------
        testTotal := testTotal + 1;
        integerInputA := 40;
        testPass := 0;
        climbingstairsFibo;
        if integerResultA = 165580141 then
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for climbingstairsFibo with status: "&Integer'Image(testPass));

        testTotal := testTotal + 1;
        testPass := 0;
        climbingstairsFiboExtra;
        if integerResultA = 165580141 then -- expected to fail due to diference between ecuation results and the actual series
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        Put_Line ("Test for climbingstairsFiboExtra with status: "&Integer'Image(testPass));




        --------------------------------------------------------------------------------------------

        testTotal := testTotal + 1;
        testPass := 0;
        integerInputA := inputTree.cleanData(0);
        integerInputA := inputTree.updateelement(0,0,1,2);
        integerInputA := inputTree.updateelement(1,1,3,4);
        integerInputA := inputTree.updateelement(2,2,5,6);
        integerInputA := inputTree.updateelement(3,3,7,8);
        integerInputA := inputTree.updateelement(4,4,9,0);
        integerInputA := inputTree.updateelement(5,5,0,0);
        integerInputA := inputTree.updateelement(6,6,0,0);
        integerInputA := inputTree.updateelement(7,7,0,0);
        integerInputA := inputTree.updateelement(8,8,0,0);
        integerInputA := inputTree.updateelement(9,9,0,0);
        binarytreeinordertraversal;
        if array100A(0..9) = (7,3,8,1,9,4,0,5,2,6) then -- expected to fail due to diference between ecuation results and the actual series
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        integerInputA := inputTree.cleanData(0);
        Put_Line ("Test for binarytreeinordertraversal with status: "&Integer'Image(testPass));


        testTotal := testTotal + 1;
        testPass := 0;
        integerInputA := inputTree.cleanData(0);
        integerInputA := inputTree.updateelement(0,3,1,2);
        integerInputA := inputTree.updateelement(1,4,3,0);
        integerInputA := inputTree.updateelement(2,6,4,5);
        integerInputA := inputTree.updateelement(3,5,0,0);
        integerInputA := inputTree.updateelement(4,7,0,0);
        integerInputA := inputTree.updateelement(5,8,6,0);
        integerInputA := inputTree.updateelement(6,9,7,8);
        integerInputA := inputTree.updateelement(7,10,0,0);
        integerInputA := inputTree.updateelement(8,11,9,0);
        integerInputA := inputTree.updateelement(9,12,0,0);
        binarytreeinordertraversal;
        if array100A(0..9) = (5,4,3,7,6,10,9,12,11,8) then -- expected to fail due to diference between ecuation results and the actual series
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        integerInputA := inputTree.cleanData(0);
        Put_Line ("Test for binarytreeinordertraversal with status: "&Integer'Image(testPass));


        testTotal := testTotal + 1;
        testPass := 0;
        integerInputA := inputTree.cleanData(0);
        integerInputA := inputTree.updateelement(0,0,1,0);
        integerInputA := inputTree.updateelement(1,1,2,0);
        integerInputA := inputTree.updateelement(2,2,3,0);
        integerInputA := inputTree.updateelement(3,3,4,0);
        integerInputA := inputTree.updateelement(4,4,5,0);
        integerInputA := inputTree.updateelement(5,5,6,0);
        integerInputA := inputTree.updateelement(6,6,7,0);
        integerInputA := inputTree.updateelement(7,7,8,0);
        integerInputA := inputTree.updateelement(8,8,9,0);
        integerInputA := inputTree.updateelement(9,9,0,0);
        binarytreeinordertraversal;
        if array100A(0..9) = (9,8,7,6,5,4,3,2,1,0) then -- expected to fail due to diference between ecuation results and the actual series
            testPass := 1;
            testPassed := testPassed + 1;
        end if;
        integerInputA := inputTree.cleanData(0);
        Put_Line ("Test for binarytreeinordertraversal with status: "&Integer'Image(testPass));

        --------------------------------------------------------------------------------------------
        Put_Line ("Total test passed :"&Integer'Image(testPassed)&" from: "&Integer'Image(testTotal));


        Stop_Time    := Clock;
        Elapsed_Time := Stop_Time - Start_Time;
        Put_Line ("Ending exercises1to100 execution - Elapsed time for all executions: "
                 & Duration'Image (To_Duration (Elapsed_Time))
                 & " seconds");

    end oneTo100;
end exercises1to100;