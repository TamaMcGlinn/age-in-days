with Ada.Strings.Bounded;    use Ada.Strings.Bounded;
with Ada.Strings.Unbounded;  use Ada.Strings.unbounded;
with Ada.Calendar;           use Ada.Calendar;
with GNAT.Regpat;            use GNAT.Regpat;
with AgeCalculator;          use AgeCalculator;
with StringUtil;             use StringUtil;

package DateInput is

  type InputStatus is (Good, Absurd);

  function GetDate(input : in String; day : out Day_Number; month : out Month_Number; 
                   year : out Year_Number) return InputStatus;

  function GetBirthDay(input : in String; day : out Day_Number; month : out Month_Number; 
                       year : out Year_Number; today_day : in Day_Number; today_month : in Month_Number;
                       today_year : in Year_Number) return InputStatus;

end DateInput;
