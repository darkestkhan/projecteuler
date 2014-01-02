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
with Ada.Text_IO;

procedure Euler_0004 is

  package TIO renames Ada.Text_IO;

  type Nat32 is range 0 .. 2 ** 32 - 1;
  for Nat32'Size use 32;

  function Trim_Leading_Space (This: in String) return String
  is
  begin
    if This'Last < 2 then
      raise Program_Error with
        "Incorrect argument to Trim_Leading_Space :" & This;
    else 
      return This (This'First + 1 .. This'Last);
    end if;
  end Trim_Leading_Space;

  function Is_Palindrome (This: in Nat32) return Boolean
  is
    Input : constant String := Trim_Leading_Space (Nat32'Image (This));
    Rev   : String (Input'Range);
  begin
    for K in Rev'Range loop
      Rev (K) := Input (Input'Last - K + Input'First);
    end loop;
    return Input = Rev;
  end Is_Palindrome;

  procedure Solve
  is
    Sol: Nat32 := 0;
  begin
    for I in reverse 100 .. 999 loop
      for J in reverse 100 .. I loop
        if Is_Palindrome (Nat32 (I * J)) and Sol < Nat32 (I * J) then
          Sol := Nat32 (I * J);
        end if;
      end loop;
    end loop;

    TIO.Put_Line (Nat32'Image (Sol));
  end Solve;

begin
  Solve;
end Euler_0004;
