pragma License (GPL);
------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: GNU GPLv3 or any later as published by Free Software Foundation --
-- (see README file)                                                        --
--                    Copyright © 2013 darkestkhan                          --
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

procedure Euler_0001 is

  package CLI renames Ada.Command_Line;
  package TIO renames Ada.Text_IO;

  type Nat32 is range 0 .. 2 ** 32 - 1;
  for Nat32'Size use 32;

  -- O (n) solution
  procedure Lin_Solve (Arg: in Nat32)
  is
    I: Nat32 := 0;
    Solution: Nat32 := 0;
  begin
    while I < Arg + 1 loop
      Solution := Solution + I;
      I := I + 3;
    end loop;
    I := 0;

    while I < Arg + 1 loop
      Solution := Solution + I;
      I := I + 5;
    end loop;
    I := 0;

    while I < Arg + 1 loop
      Solution := Solution - I;
      I := I + 15;
    end loop;

    TIO.Put_Line (Nat32'Image (Solution));
  end Lin_Solve;

  -- O (1) solution
  procedure Solve_Problem (Arg: in Nat32)
  is
    function Sum (Arg: in Nat32; Increase: in Nat32) return Nat32
    is
    begin
      return (Arg / Increase) * (Increase + Arg) / 2;
    end Sum;

    -- Highest argument to arithemtic progression such that result is less than
    -- or equal to Arg for increases of 3, 5 and 15.
    An_Of_3 : constant Nat32 := Arg - (Arg mod 3);
    An_Of_5 : constant Nat32 := Arg - (Arg mod 5);
    An_Of_15: constant Nat32 := Arg - (Arg mod 15);
    Solution: constant Nat32 :=
      Sum (An_Of_3, 3) + Sum (An_Of_5, 5) - Sum (An_Of_15, 15);
  begin
    TIO.Put_Line (Nat32'Image (Solution));
  end Solve_Problem;

begin
  if CLI.Argument_Count = 0 then
    raise Program_Error with "Incorrect arguments.";
  else
    for I in 1 .. CLI.Argument_Count loop
      Solve_Problem (Nat32'Value (CLI.Argument (I)));
    end loop;
  end if;
end Euler_0001;
