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

procedure Euler_0003 is

  package CLI renames Ada.Command_Line;
  package TIO renames Ada.Text_IO;

  type Nat64 is range 0 .. 2 ** 63 - 1;
  for Nat64'Size use 64;

  function Smallest_Divisor (Arg: in Nat64) return Nat64
  is
  begin
    if Arg mod 2 = 0 then
      return 2;
    else
      Trial_Division: declare
        I: Nat64 := 3;
      begin
        while Arg mod I /= 0 loop
          I := I + 2;
        end loop;
        return I;
      end Trial_Division;
    end if;
  end Smallest_Divisor;

  procedure Solve (This: in Nat64)
  is
    Greatest_Divisor: Nat64 := This;
    Least_Divisor: Nat64 := Smallest_Divisor (Greatest_Divisor);
  begin
    while Least_Divisor /= Greatest_Divisor loop
      Greatest_Divisor := Greatest_Divisor / Least_Divisor;
      Least_Divisor := Smallest_Divisor (Greatest_Divisor);
    end loop;

    TIO.Put_Line (Nat64'Image (Greatest_Divisor));
  end Solve;

begin
  if CLI.Argument_Count = 0 then
    raise Program_Error with "Incorrect argument.";
  else
    for I in 1 .. CLI.Argument_Count loop
      Solve (Nat64'Value (CLI.Argument (I)));
    end loop;
  end if;
end Euler_0003;
