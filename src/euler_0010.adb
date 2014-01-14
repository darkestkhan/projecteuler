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

procedure Euler_0010 is

  package CLI renames Ada.Command_Line;
  package TIO renames Ada.Text_IO;

  type Nat64 is mod 2**64;
  for Nat64'Size use 64;

  type Bool_Arr is array (Natural range <>) of Boolean;

  procedure Solve (Arg: in Natural)
  is
    Sieve: Bool_Arr (2 .. Arg) := (others => True);
  begin
    if Arg < 2 then
      TIO.Put_Line ("0");
    else
      Compute_Sieve:
        for K in Sieve'Range loop
          declare
            N: Natural := 2 * K;
          begin
            while N <= Sieve'Last loop
              Sieve (N) := False;
              N := N + K;
            end loop;
          end;
        end loop Compute_Sieve;

      Sum: declare
        Sol: Nat64 := 0;
      begin
        for K in Sieve'Range loop
          if Sieve (K) then
            Sol := Sol + Nat64 (K);
          end if;
        end loop;
        TIO.Put_Line (Nat64'Image (Sol));
      end Sum;
    end if;
  end Solve;

begin
  if CLI.Argument_Count = 0 then
    raise Program_Error with "Incorrect argument!";
  else
    for K in 1 .. CLI.Argument_Count loop
      Solve (Natural'Value (CLI.Argument (K)));
    end loop;
  end if;
end Euler_0010;
