with  Ada.Text_IO; use Ada.Text_IO;

with p_position; use p_position;


procedure Main is


   task  Direction;
   task body Direction is
      Latitude : T_Latitude :=0.0;
      Longitude : T_Longitude :=0.0;
   begin
      loop
         exit when Latitude=90.0;
         delay 0.01;
         Latitude:=Latitude+1.0;
         Put("Latitude : " &T_Latitude'Image(Latitude));
         Put_Line("       Longitude : " &T_Longitude'Image(Longitude));
      end loop;
      Put_Line("Arrived at North Pole");
   end Direction;

begin
null;
end Main;
