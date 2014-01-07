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

procedure Euler_0007 is

  package CLI renames Ada.Command_Line;
  package TIO renames Ada.Text_IO;

  type Nat32 is range 0 .. (2 ** 32) - 1;
  for Nat32'Size use 32;

  function Is_Prime (N: in Nat32) return Boolean
  is
  begin
    if N mod 2 = 0 then
      return False;
    else
      declare
        K: Nat32 := 3;
      begin
        while K < N loop
          if N mod K = 0 then
            return False;
          else
            K := K + 2;
          end if;
        end loop;
        return True;
      end;
    end if;
  end Is_Prime;

  procedure Solve (Arg: in Nat32)
  is
    -- Start from second prime which is 3
    Number: Nat32 := 3;
    Nth   : Nat32 := 2;
  begin
    loop
      if Is_Prime (Number) then
        Nth     := Nth + 1;
      end if;
      exit when Nth > Arg;
      Number  := Number + 2;
    end loop;
    TIO.Put_Line (Nat32'Image (Number)); 
  end Solve;

begin
  if CLI.Argument_Count = 0 then
    raise Program_Error with "Incorrect argument!";
  else
    for K in 1 .. CLI.Argument_Count loop
      Solve (Nat32'Value (CLI.Argument (K)));
    end loop;
  end if;
end Euler_0007;
