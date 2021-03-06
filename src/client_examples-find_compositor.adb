package body Client_Examples.Find_Compositor is

   procedure Global_Registry_Handler (Compositor : not null Wl.Compositor_Ptr;
                                      Registry   : Wl.Registry;
                                      Id         : Wl.Unsigned_32;
                                      Name       : String;
                                      Version    : Wl.Unsigned_32) is
   begin
      Put_Line ("Got a registry event for " & Name & " id" & Id'Image);

      if Name = "wl_compositor" then
         Compositor.Get_Proxy (Registry, Id, Version);
      end if;
   end Global_Registry_Handler;

   procedure Global_Registry_Remover (Data     : not null Wl.Compositor_Ptr;
                                      Registry : Wl.Registry;
                                      Id       : Wl.Unsigned_32) is
   begin
      Put_Line ("Got a registry losing event for" & Id'Image);
   end Global_Registry_Remover;

   package Registry_Events is new Wl.Registry_Events
     (Data_Type             => Wl.Compositor,
      Data_Ptr              => Wl.Compositor_Ptr,
      Global_Object_Added   => Global_Registry_Handler,
      Global_Object_Removed => Global_Registry_Remover);

   Display  : Wl.Display;
   Registry : Wl.Registry;

   Compositor : aliased Wl.Compositor;

   procedure Run is
   begin
      Display.Connect (Wl.Default_Display_Name);
      if not Display.Is_Connected then
         Put_Line ("Can't connect to display");
         return;
      end if;
      Put_Line ("Connected to display");

      Display.Get_Registry (Registry);
      if not Registry.Has_Proxy then
         Put_Line ("Can't get global registry object");
         return;
      end if;

      Registry_Events.Subscribe (Registry, Compositor'Access);
      Display.Dispatch;
      Display.Roundtrip;

      if Compositor.Has_Proxy then
         Put_Line ("Found compositor");
      else
         Put_Line ("Can't find compositor");
      end if;

      Registry.Destroy;
      Display.Disconnect;
      Put_Line ("Disconnected from display");
   end Run;

end Client_Examples.Find_Compositor;
