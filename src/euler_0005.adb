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

procedure Euler_0005 is

  package CLI renames Ada.Command_Line;
  package TIO renames Ada.Text_IO;

  type Nat32 is range 0 .. 2 ** 32 - 1;
  for Nat32'Size use 32;

  type Nat32_Array is array (Nat32 range <>) of Nat32;

  procedure Put (Item: in Nat32_Array)
  is
  begin
    for K in Item'Range loop
      TIO.Put (Nat32'Image (Item (K)));
    end loop;
  end Put;

  function Smallest_Divisor (Arg: in Nat32) return Nat32
  is
  begin
    if Arg = 1 then
      return 1;
    elsif Arg mod 2 = 0 then
      return 2;
    else
      Trial_Division: declare
        I: Nat32 := 3;
      begin
        while Arg mod I /= 0 loop
          I := I + 2;
        end loop;
        return I;
      end Trial_Division;
    end if;
  end Smallest_Divisor;

  function Trial_Factorization (N: in Nat32) return Nat32_Array
  is
    Factors: Nat32_Array (2 .. N) := (others => 0);
    Number: Nat32 := N;
    Factor: Nat32 := 0;
  begin
    loop
      Factor := Smallest_Divisor (Number);
      if Factor = 1 then
        return Factors;
      else
        Factors (Factor) := Factors (Factor) + 1;
        Number := Number / Factor;
      end if;
    end loop;
  end Trial_Factorization;

  -- print LCM (1 .. N)
  procedure Solve (Arg: in Nat32; Print: Boolean := False)
  is
    Powers: Nat32_Array (2 .. Arg) := (others => 0);
  begin
    for K in Powers'Range loop
      Compare_Powers: declare
        Factors: constant Nat32_Array := Trial_Factorization (K);
      begin
        for L in Factors'Range loop
          if Factors (L) > Powers (L) then
            Powers (L) := Factors (L);
          end if;
        end loop;
      end Compare_Powers;
    end loop;

    Put (Powers);
    TIO.New_Line;

    if Print then
      declare
        Solution: Nat32 := 1;
      begin
        for K in Powers'Range loop
          Solution := Solution * (Nat32 (K) ** Natural (Powers (Nat32 (K))));
        end loop;
        TIO.Put_Line (Nat32'Image (Solution));
      end;
    end if;
  end Solve;

begin
  if CLI.Argument_Count = 0 then
    raise Program_Error with "Incorrect argument";
  else
    for I in 1 .. CLI.Argument_Count loop
      Solve (Nat32'Value (CLI.Argument (I)), True);
    end loop;
  end if;
end Euler_0005;
