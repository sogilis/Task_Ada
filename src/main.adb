with  Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   task Hello;
   task body Hello is
      i : Integer :=0;
   begin
      loop
         exit when i=10;
         delay 1.0;
         i:=i+1;
         Put_Line("hello");
      end loop;

   end Hello;

begin
   --  Insert code here.
   null;
end Main;
