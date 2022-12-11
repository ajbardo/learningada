with Ada.Text_IO; use Ada.Text_IO;
with ADA.Strings.Fixed; use ADA.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure main is
-- main 
-- 1.0-1.1 twoSum
-- 1.0-1.0 palindrome
-- 1.1-1.1 romantointeger
-- 0.1-0.0 longestcommonprefix
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
-- type arrayOf2 is array(0 .. 1) of Integer
-- array2 : arrayOf2;
-- input variables for the functions
-- integerInputA : Integer;
-- output variables for the functions
-- integerResultA : Integer;
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
-- 0.1-0.0 procedure longestcommonprefix()
-- newly created

	-- Global use arrays
	maxIndex10 : Integer := 10;
	type arrayOf10 is array(0 .. 9) of Integer;
	array10 : arrayOf10;
	
	type arrayOf2 is array(0 .. 1) of Integer;
	array2 : arrayOf2;

    type typearrayfUnboString is array (0 .. 2) of Unbounded_String;
    arrayUnboString : typearrayfUnboString;

	-- input variables for the functions
    integerInputA : Integer;
    integerInputB : Integer;
    integerInputC : Integer;
    stringInputA : String := "         ";

	-- output variables for the functions
	integerResultA : Integer;
    unboStringA : Unbounded_String;

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
    begin
        Put_Line ("-->"&Ada.Strings.Unbounded.To_String(arrayUnboString(0)));
        Put_Line ("-->"&Ada.Strings.Unbounded.To_String(arrayUnboString(1)));
        Put_Line ("-->"&Ada.Strings.Unbounded.To_String(arrayUnboString(2)));
        unboStringA := To_Unbounded_String(
                Ada.Strings.Unbounded.Trim(
                    
                )
            );
    end longestcommonprefix;

begin
	Put_Line ("Starting main execution");
	testPass := 0;
	testPassed := 0;
	testTotal := 0;

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
    arrayUnboString(0) := To_Unbounded_String("abcfbca");
    arrayUnboString(1) := To_Unbounded_String("abcfjht");
    arrayUnboString(2) := To_Unbounded_String("abfjt");

    longestcommonprefix;

	Put_Line ("Total test passed :"&Integer'Image(testPassed)&" from: "&Integer'Image(testTotal));
	Put_Line ("Ending main execution");
end main;