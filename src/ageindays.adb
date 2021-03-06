pragma Ada_2012;

with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Calendar;           use Ada.Calendar;
with StringUtil;             use StringUtil;
with AgeCalculator;          use AgeCalculator;
with DateInput;              use DateInput;

procedure Ageindays is
  Today_Day : Day_Number;
  Today_Month : Month_Number;
  Today_Year : Year_Number;
begin
  declare
    TodayTime : constant Time := Clock;
    Today_Seconds : Day_Duration;
  begin
    Split(TodayTime, Today_Year, Today_Month, Today_Day, Today_Seconds);
  end;
  Put_Line("Today is " & IntegerToString(Integer(Today_Day)) & '/' 
                       & IntegerToString(Today_Month) & '/' & IntegerToString(Today_Year));

  Put_Line("What is your birthday?");
  Put_Line("Supported formats by example:");
  Put_Line("-24th of September 1992");
  Put_Line("-24 of September 1992");
  Put_Line("-24 September 1992");
  Put_Line("-September 24th, 1992");
  Put_Line("-September 24th 1992");
  Put_Line("-September 24, 1992");
  Put_Line("-September 24 1992");
  loop
    Put("> ");
    declare
      Input : constant String := Get_Line;
      BirthDay : Day_Number;
      BirthMonth : Month_Number;
      BirthYear : Year_Number;
      Result : InputStatus;
    begin
      exit when Input = "";
      Result := GetBirthDay(Input, BirthDay, BirthMonth, BirthYear, 
                                   Today_Day, Today_Month, Today_Year);
      if Result = Absurd then
        Put_Line("Don't be absurd. Tell me your real birthday");
      else
        Put_Line("Birthday: " & IntegerToString(BirthDay) & '/' 
                              & IntegerToString(BirthMonth) & '/' & IntegerToString(BirthYear));
        declare
          YearsOld : DifferenceYears;
          MonthsOld : DifferenceMonths;
          DaysOld : DifferenceDays;
          TotalDaysOld : NumberOfDaysOld;

          function GetNounSuffix(num : Integer) return string is
          begin
            if num = 1 then 
              return "";
            end if;
            return "s";
          end GetNounSuffix;
        begin
          GetAgeDifference(BirthDay, BirthMonth, BirthYear, Today_Day, Today_Month, Today_Year,
                           DaysOld, MonthsOld, YearsOld, TotalDaysOld);
          declare
            yearString : string := YearsOld'Image & " year" & GetNounSuffix(Integer(YearsOld));
            monthString : string := MonthsOld'Image & " month" & GetNounSuffix(Integer(MonthsOld));
            dayString : string := DaysOld'Image & " day" & GetNounSuffix(Integer(DaysOld));

            function GetYearMonthDayString return string is
            begin
              if MonthsOld = 0 then
                if DaysOld = 0 then
                  return "You are" & yearString & " old today. Happy birthday!";
                end if;
                if YearsOld = 0 then
                  return "You are" & dayString & " old.";
                end if;
                return "You are" & yearString & " and" & dayString & " old.";
              end if;
              if YearsOld = 0 then
                if DaysOld = 0 then
                  return "You are" & monthString & " old.";
                end if;
                return "You are" & monthString & " and" & dayString & " old.";
              end if;
              return "You are" & yearString & "," & monthString & " and" & dayString & " old.";
            end GetYearMonthDayString;
          begin
            Put_Line(GetYearMonthDayString);
            Put_Line("Total age in days:" & TotalDaysOld'Image);
          end;
        end;
      end if;
    end;
  end loop;
end Ageindays;
