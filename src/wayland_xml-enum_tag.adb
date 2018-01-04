package body Wayland_XML.Enum_Tag is

   procedure Set_Name (This    : in out Enum_Tag_T;
                       Value   : Aida.String_T;
                       Subpool : Dynamic_Pools.Subpool_Handle)
   is
   begin
      This.My_Name := (Exists => True,
                       Value  => new (Subpool) Aida.String_T'(Value));
   end Set_Name;

end Wayland_XML.Enum_Tag;