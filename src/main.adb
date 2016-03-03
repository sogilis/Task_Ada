with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Calendar;            use Ada.Calendar;
with Ada.Real_Time;           use Ada.Real_Time;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;

with P_Position; use P_Position;

procedure Main is

   task Direction;
   task body Direction is
      Latitude                                : T_Latitude  := 0.0;
      Longitude                               : T_Longitude := 0.0;
      Tps                                     : Duration    := 0.1;
      i : Integer :=1;
      start_time, current_time: Ada.Real_Time.Time;
      elapsed_time_computing, elapsed_time_cycle      : Float;

      type T_array is array (0..90) of Ada.Real_Time.Time;
      Time_array : T_array;
   begin

      loop

         exit when Latitude = 90.0;



         delay until (Clock + Tps);

         start_time := Ada.Real_Time.Clock;

         Time_array(i) := start_time;
         Latitude := Latitude + 1.0;

         Put ("Latitude : " & T_Latitude'Image (Latitude));

         Put ("       Longitude : " & T_Longitude'Image (Longitude));

         current_time     := Ada.Real_Time.Clock;

         elapsed_time_computing := Float (To_Duration (current_time - Time_array(i)));

         Put
           ("       Computing time : " & Float'Image (elapsed_time_computing) & " seconds");

         elapsed_time_cycle := Float (To_Duration (Time_array(i) - Time_array(i-1)));
         case i is
         when 1 =>
            New_Line;
         when others =>
         Put_Line
           ("       Cycle time : " & Float'Image (elapsed_time_cycle) & " seconds");
         end case;
        i:=i+1;

      end loop;

      Put_Line ("Arrived at North Pole");
   end Direction;

begin
   null;
end Main;
