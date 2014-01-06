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

procedure Euler_0006 is

  package CLI renames Ada.Command_Line;
  package TIO renames Ada.Text_IO;

  type Nat32 is range 0 .. 2 ** 32 - 1;
  for Nat32'Size use 32;

  procedure Solve (Arg: in Nat32)
  is
    Square_Of_Sum: constant Nat32 := (Arg * (Arg + 1) / 2) ** 2;
    Sum_Of_Squares: constant Nat32 := (Arg * (Arg + 1) * (2 * Arg + 1)) / 6;
  begin
    TIO.Put_Line (Nat32'Image (Square_Of_Sum - Sum_Of_Squares));
  end Solve;

begin
  if CLI.Argument_Count = 0 then
    raise Program_Error with "Incorrect argument";
  else
    for K in 1 .. CLI.Argument_Count loop
      Solve (Nat32'Value (CLI.Argument (K)));
    end loop;
  end if;
end Euler_0006;
