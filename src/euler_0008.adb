pragma License (GPL);
------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: GNU GPLv3 or any later as published by Free Software Foundation --
-- (see COPYING file)                                                       --
--                                                                          --
--                    Copyright © 2014 darkestkhan                          --
------------------------------------------------------------------------------
--  This Program is Free Software: You can redistribute it and/or modify    --
--  it under the terms of The GNU General Public License as published by    --
--    the Free Software Foundation, either version 3 of the license, or     --
--                (at Your option) any later version.                       --
--                                                                          --
--      This Program is distributed in the hope that it will be useful,     --
--      but WITHOUT ANY WARRANTY; without even the implied warranty of      --
--      MERCHANTABILITY or FITNESS for A PARTICULAR PURPOSE. See the        --
--              GNU General Public License for more details.                --
--                                                                          --
--    You should have received a copy of the GNU General Public License     --
--   along with this program. If not, see <http://www.gnu.org/licenses/>.   --
------------------------------------------------------------------------------
with Ada.Command_Line;
with Ada.Text_IO;

procedure Euler_0008 is

  package CLI renames Ada.Command_Line;
  package TIO renames Ada.Text_IO;

  type Nat32 is range 0 .. 2 ** 32 - 1;
  for Nat32'Size use 32;

  function Get_Number (From: in String) return String
  is
    FD: TIO.File_Type;
  begin
    TIO.Open (FD, TIO.In_File, From);
    declare
      S: constant String := TIO.Get_Line (FD);
    begin
      TIO.Close (FD);
      return S;
    end;
  end Get_Number;

  procedure Solve (This: in String)
  is
    function Mult (This: in String) return Nat32
    is
      Result: Nat32 := 1;
    begin
      for K in This'Range loop
        case This (K) is
          when '1' => Result := Result * 1;
          when '2' => Result := Result * 2;
          when '3' => Result := Result * 3;
          when '4' => Result := Result * 4;
          when '5' => Result := Result * 5;
          when '6' => Result := Result * 6;
          when '7' => Result := Result * 7;
          when '8' => Result := Result * 8;
          when '9' => Result := Result * 9;
          when '0' => Result := Result * 0;
          when others => raise Program_Error with "Not a number";
        end case;
      end loop;

      return Result;
    end Mult; 

    Max: Nat32 := 0;
  begin
    if This'Length < 5 then
      raise Program_Error with "Incorrect length of number.";
    end if;

    for K in This'First .. This'Last + This'First - 5 loop
      if Mult (This (K .. K + 4)) > Max then
        Max := Mult (This (K .. K + 4));
      end if;
    end loop;

    TIO.Put_Line (Nat32'Image (Max));
  end Solve;

begin
  if CLI.Argument_Count /= 1 then
    raise Program_Error with "Incorrect argument!";
  else
    Solve (Get_Number (CLI.Argument (1)));
  end if;
end Euler_0008;
