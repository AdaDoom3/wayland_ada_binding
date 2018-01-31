-- Auto generated from Wayland.xml
package body Wl_Thin is

   procedure wl_proxy_destroy (Registry : Proxy_Ptr) with
      Convention    => C,
      Import        => True,
      External_Name => "wl_proxy_destroy";

   function Display_Connect (Name : Interfaces.C.Strings.char_array_access) return Display_Ptr is

      function wl_display_connect (Name : in Interfaces.C.Strings.chars_ptr) return Display_Ptr with
         Convention    => C,
         Import        => True,
         External_Name => "wl_display_connect";

   begin
      return wl_display_connect (Interfaces.C.Strings.To_Chars_Ptr (Name));
   end Display_Connect;

   procedure Display_Disconnect (This : in out Display_Ptr) is

      procedure wl_display_disconnect (Display : in Display_Ptr) with
         Convention => C,
         Import     => True;

   begin
      if This /= null then
         wl_display_disconnect (This);
         This := null;
      end if;
   end Display_Disconnect;

   function wl_proxy_add_listener (arg1 : Proxy_Ptr; arg2 : Void_Ptr; arg3 : Void_Ptr) return Interfaces.C.int with
      Import        => True,
      Convention    => C,
      External_Name => "wl_proxy_add_listener";

   procedure wl_proxy_set_user_data (arg1 : Proxy_Ptr; arg3 : Void_Ptr) with
      Import        => True,
      Convention    => C,
      External_Name => "wl_proxy_set_user_data";

   function wl_proxy_get_user_data (arg1 : Proxy_Ptr) return Void_Ptr with
      Import        => True,
      Convention    => C,
      External_Name => "wl_proxy_get_user_data";

   function wl_proxy_get_version (arg1 : Proxy_Ptr) return Interfaces.Unsigned_32 with
      Import        => True,
      Convention    => C,
      External_Name => "wl_proxy_get_version";

   function Display_Add_Listener
     (Display  : Display_Ptr;
      Listener : Display_Listener_Ptr;
      Data     : Void_Ptr) return Interfaces.C.int
   is
   begin
      return wl_proxy_add_listener (Display.all'Access, Listener.all'Address, Data);
   end Display_Add_Listener;

   procedure Display_Set_User_Data (Display : Display_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Display.all'Access, Data);
   end Display_Set_User_Data;

   function Display_Get_User_Data (Display : Display_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Display.all'Access);
   end Display_Get_User_Data;

   function Display_Get_Version (Display : Display_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Display.all'Access);
   end Display_Get_Version;

   procedure Display_Destroy (Display : Display_Ptr) is
   begin
      wl_proxy_destroy (Display.all'Access);
   end Display_Destroy;

   function Display_Sync (Display : Display_Ptr) return Callback_Ptr is
      P : Proxy_Ptr := Proxy_Marshal_Constructor (Display.all'Access, WL_DISPLAY_SYNC, Callback_Interface'Access, 0);
   begin
      return (if P /= null then P.all'Access else null);
   end Display_Sync;

   function Display_Get_Registry (Display : Display_Ptr) return Registry_Ptr is
      P : Proxy_Ptr :=
        Proxy_Marshal_Constructor (Display.all'Access, WL_DISPLAY_GET_REGISTRY, Registry_Interface'Access, 0);
   begin
      return (if P /= null then P.all'Access else null);
   end Display_Get_Registry;

   function Registry_Add_Listener
     (Registry : Registry_Ptr;
      Listener : Registry_Listener_Ptr;
      Data     : Void_Ptr) return Interfaces.C.int
   is
   begin
      return wl_proxy_add_listener (Registry.all'Access, Listener.all'Address, Data);
   end Registry_Add_Listener;

   procedure Registry_Set_User_Data (Registry : Registry_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Registry.all'Access, Data);
   end Registry_Set_User_Data;

   function Registry_Get_User_Data (Registry : Registry_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Registry.all'Access);
   end Registry_Get_User_Data;

   function Registry_Get_Version (Registry : Registry_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Registry.all'Access);
   end Registry_Get_Version;

   procedure Registry_Destroy (Registry : Registry_Ptr) is
   begin
      wl_proxy_destroy (Registry.all'Access);
   end Registry_Destroy;

   function Registry_Bind
     (Registry    : Registry_Ptr;
      Name        : Interfaces.Unsigned_32;
      Interface_V : Interface_Ptr;
      New_Id      : Interfaces.Unsigned_32) return Proxy_Ptr
   is
   begin
      return Proxy_Marshal_Constructor_Versioned
          (Registry.all'Access,
           WL_REGISTRY_BIND,
           Interface_V,
           New_Id,
           Name,
           Interface_V.Name,
           New_Id,
           0);
   end Registry_Bind;

   function Callback_Add_Listener
     (Callback : Callback_Ptr;
      Listener : Callback_Listener_Ptr;
      Data     : Void_Ptr) return Interfaces.C.int
   is
   begin
      return wl_proxy_add_listener (Callback.all'Access, Listener.all'Address, Data);
   end Callback_Add_Listener;

   procedure Callback_Set_User_Data (Callback : Callback_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Callback.all'Access, Data);
   end Callback_Set_User_Data;

   function Callback_Get_User_Data (Callback : Callback_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Callback.all'Access);
   end Callback_Get_User_Data;

   function Callback_Get_Version (Callback : Callback_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Callback.all'Access);
   end Callback_Get_Version;

   procedure Callback_Destroy (Callback : Callback_Ptr) is
   begin
      wl_proxy_destroy (Callback.all'Access);
   end Callback_Destroy;

   procedure Compositor_Set_User_Data (Compositor : Compositor_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Compositor.all'Access, Data);
   end Compositor_Set_User_Data;

   function Compositor_Get_User_Data (Compositor : Compositor_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Compositor.all'Access);
   end Compositor_Get_User_Data;

   function Compositor_Get_Version (Compositor : Compositor_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Compositor.all'Access);
   end Compositor_Get_Version;

   procedure Compositor_Destroy (Compositor : Compositor_Ptr) is
   begin
      wl_proxy_destroy (Compositor.all'Access);
   end Compositor_Destroy;

   function Compositor_Create_Surface (Compositor : Compositor_Ptr) return Surface_Ptr is
      P : Proxy_Ptr :=
        Proxy_Marshal_Constructor (Compositor.all'Access, WL_COMPOSITOR_CREATE_SURFACE, Surface_Interface'Access, 0);
   begin
      return (if P /= null then P.all'Access else null);
   end Compositor_Create_Surface;

   function Compositor_Create_Region (Compositor : Compositor_Ptr) return Region_Ptr is
      P : Proxy_Ptr :=
        Proxy_Marshal_Constructor (Compositor.all'Access, WL_COMPOSITOR_CREATE_REGION, Region_Interface'Access, 0);
   begin
      return (if P /= null then P.all'Access else null);
   end Compositor_Create_Region;

   procedure Shm_Pool_Set_User_Data (Shm_Pool : Shm_Pool_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Shm_Pool.all'Access, Data);
   end Shm_Pool_Set_User_Data;

   function Shm_Pool_Get_User_Data (Shm_Pool : Shm_Pool_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Shm_Pool.all'Access);
   end Shm_Pool_Get_User_Data;

   function Shm_Pool_Get_Version (Shm_Pool : Shm_Pool_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Shm_Pool.all'Access);
   end Shm_Pool_Get_Version;

   procedure Shm_Pool_Destroy (Shm_Pool : Shm_Pool_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Shm_Pool.all'Access), WL_SHM_POOL_DESTROY);

      wl_proxy_destroy (Shm_Pool.all'Access);
   end Shm_Pool_Destroy;

   function Shm_Pool_Create_Buffer
     (Shm_Pool : Shm_Pool_Ptr;
      Offset   : Integer;
      Width    : Integer;
      Height   : Integer;
      Stride   : Integer;
      Format   : Interfaces.Unsigned_32) return Buffer_Ptr
   is
      P : Proxy_Ptr :=
        Proxy_Marshal_Constructor
          (Shm_Pool.all'Access,
           WL_SHM_POOL_CREATE_BUFFER,
           Buffer_Interface'Access,
           0,
           Offset,
           Width,
           Height,
           Stride,
           Format);
   begin
      return (if P /= null then P.all'Access else null);
   end Shm_Pool_Create_Buffer;

   procedure Shm_Pool_Resize (Shm_Pool : Shm_Pool_Ptr; Size : Integer) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Shm_Pool.all'Access), WL_SHM_POOL_RESIZE, Size);
   end Shm_Pool_Resize;

   function Shm_Add_Listener (Shm : Shm_Ptr; Listener : Shm_Listener_Ptr; Data : Void_Ptr) return Interfaces.C.int is
   begin
      return wl_proxy_add_listener (Shm.all'Access, Listener.all'Address, Data);
   end Shm_Add_Listener;

   procedure Shm_Set_User_Data (Shm : Shm_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Shm.all'Access, Data);
   end Shm_Set_User_Data;

   function Shm_Get_User_Data (Shm : Shm_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Shm.all'Access);
   end Shm_Get_User_Data;

   function Shm_Get_Version (Shm : Shm_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Shm.all'Access);
   end Shm_Get_Version;

   procedure Shm_Destroy (Shm : Shm_Ptr) is
   begin
      wl_proxy_destroy (Shm.all'Access);
   end Shm_Destroy;

   function Shm_Create_Pool (Shm : Shm_Ptr; Fd : Integer; Size : Integer) return Shm_Pool_Ptr is
      P : Proxy_Ptr :=
        Proxy_Marshal_Constructor (Shm.all'Access, WL_SHM_CREATE_POOL, Shm_Pool_Interface'Access, 0, Fd, Size);
   begin
      return (if P /= null then P.all'Access else null);
   end Shm_Create_Pool;

   function Buffer_Add_Listener
     (Buffer   : Buffer_Ptr;
      Listener : Buffer_Listener_Ptr;
      Data     : Void_Ptr) return Interfaces.C.int
   is
   begin
      return wl_proxy_add_listener (Buffer.all'Access, Listener.all'Address, Data);
   end Buffer_Add_Listener;

   procedure Buffer_Set_User_Data (Buffer : Buffer_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Buffer.all'Access, Data);
   end Buffer_Set_User_Data;

   function Buffer_Get_User_Data (Buffer : Buffer_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Buffer.all'Access);
   end Buffer_Get_User_Data;

   function Buffer_Get_Version (Buffer : Buffer_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Buffer.all'Access);
   end Buffer_Get_Version;

   procedure Buffer_Destroy (Buffer : Buffer_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Buffer.all'Access), WL_BUFFER_DESTROY);

      wl_proxy_destroy (Buffer.all'Access);
   end Buffer_Destroy;

   function Data_Offer_Add_Listener
     (Data_Offer : Data_Offer_Ptr;
      Listener   : Data_Offer_Listener_Ptr;
      Data       : Void_Ptr) return Interfaces.C.int
   is
   begin
      return wl_proxy_add_listener (Data_Offer.all'Access, Listener.all'Address, Data);
   end Data_Offer_Add_Listener;

   procedure Data_Offer_Set_User_Data (Data_Offer : Data_Offer_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Data_Offer.all'Access, Data);
   end Data_Offer_Set_User_Data;

   function Data_Offer_Get_User_Data (Data_Offer : Data_Offer_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Data_Offer.all'Access);
   end Data_Offer_Get_User_Data;

   function Data_Offer_Get_Version (Data_Offer : Data_Offer_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Data_Offer.all'Access);
   end Data_Offer_Get_Version;

   procedure Data_Offer_Destroy (Data_Offer : Data_Offer_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Data_Offer.all'Access), WL_DATA_OFFER_DESTROY);

      wl_proxy_destroy (Data_Offer.all'Access);
   end Data_Offer_Destroy;

   procedure Data_Offer_Accept
     (Data_Offer : Data_Offer_Ptr;
      Serial     : Interfaces.Unsigned_32;
      Mime_Type  : Interfaces.C.Strings.chars_ptr)
   is
   begin
      Proxy_Marshal (Proxy_Ptr'(Data_Offer.all'Access), WL_DATA_OFFER_ACCEPT, Serial, Mime_Type);
   end Data_Offer_Accept;

   procedure Data_Offer_Receive
     (Data_Offer : Data_Offer_Ptr;
      Mime_Type  : Interfaces.C.Strings.chars_ptr;
      Fd         : Integer)
   is
   begin
      Proxy_Marshal (Proxy_Ptr'(Data_Offer.all'Access), WL_DATA_OFFER_RECEIVE, Mime_Type, Fd);
   end Data_Offer_Receive;

   procedure Data_Offer_Finish (Data_Offer : Data_Offer_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Data_Offer.all'Access), WL_DATA_OFFER_FINISH);
   end Data_Offer_Finish;

   procedure Data_Offer_Set_Actions
     (Data_Offer       : Data_Offer_Ptr;
      Dnd_Actions      : Interfaces.Unsigned_32;
      Preferred_Action : Interfaces.Unsigned_32)
   is
   begin
      Proxy_Marshal (Proxy_Ptr'(Data_Offer.all'Access), WL_DATA_OFFER_SET_ACTIONS, Dnd_Actions, Preferred_Action);
   end Data_Offer_Set_Actions;

   function Data_Source_Add_Listener
     (Data_Source : Data_Source_Ptr;
      Listener    : Data_Source_Listener_Ptr;
      Data        : Void_Ptr) return Interfaces.C.int
   is
   begin
      return wl_proxy_add_listener (Data_Source.all'Access, Listener.all'Address, Data);
   end Data_Source_Add_Listener;

   procedure Data_Source_Set_User_Data (Data_Source : Data_Source_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Data_Source.all'Access, Data);
   end Data_Source_Set_User_Data;

   function Data_Source_Get_User_Data (Data_Source : Data_Source_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Data_Source.all'Access);
   end Data_Source_Get_User_Data;

   function Data_Source_Get_Version (Data_Source : Data_Source_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Data_Source.all'Access);
   end Data_Source_Get_Version;

   procedure Data_Source_Destroy (Data_Source : Data_Source_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Data_Source.all'Access), WL_DATA_SOURCE_DESTROY);

      wl_proxy_destroy (Data_Source.all'Access);
   end Data_Source_Destroy;

   procedure Data_Source_Offer (Data_Source : Data_Source_Ptr; Mime_Type : Interfaces.C.Strings.chars_ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Data_Source.all'Access), WL_DATA_SOURCE_OFFER, Mime_Type);
   end Data_Source_Offer;

   procedure Data_Source_Set_Actions (Data_Source : Data_Source_Ptr; Dnd_Actions : Interfaces.Unsigned_32) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Data_Source.all'Access), WL_DATA_SOURCE_SET_ACTIONS, Dnd_Actions);
   end Data_Source_Set_Actions;

   function Data_Device_Add_Listener
     (Data_Device : Data_Device_Ptr;
      Listener    : Data_Device_Listener_Ptr;
      Data        : Void_Ptr) return Interfaces.C.int
   is
   begin
      return wl_proxy_add_listener (Data_Device.all'Access, Listener.all'Address, Data);
   end Data_Device_Add_Listener;

   procedure Data_Device_Set_User_Data (Data_Device : Data_Device_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Data_Device.all'Access, Data);
   end Data_Device_Set_User_Data;

   function Data_Device_Get_User_Data (Data_Device : Data_Device_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Data_Device.all'Access);
   end Data_Device_Get_User_Data;

   function Data_Device_Get_Version (Data_Device : Data_Device_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Data_Device.all'Access);
   end Data_Device_Get_Version;

   procedure Data_Device_Destroy (Data_Device : Data_Device_Ptr) is
   begin
      wl_proxy_destroy (Data_Device.all'Access);
   end Data_Device_Destroy;

   procedure Data_Device_Start_Drag
     (Data_Device : Data_Device_Ptr;
      Source      : Data_Source_Ptr;
      Origin      : Surface_Ptr;
      Icon        : Surface_Ptr;
      Serial      : Interfaces.Unsigned_32)
   is
   begin
      Proxy_Marshal
        (Proxy_Ptr'(Data_Device.all'Access),
         WL_DATA_DEVICE_START_DRAG,
         Source.all'Address,
         Origin.all'Address,
         Icon.all'Address,
         Serial);
   end Data_Device_Start_Drag;

   procedure Data_Device_Set_Selection
     (Data_Device : Data_Device_Ptr;
      Source      : Data_Source_Ptr;
      Serial      : Interfaces.Unsigned_32)
   is
   begin
      Proxy_Marshal (Proxy_Ptr'(Data_Device.all'Access), WL_DATA_DEVICE_SET_SELECTION, Source.all'Address, Serial);
   end Data_Device_Set_Selection;

   procedure Data_Device_Release (Data_Device : Data_Device_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Data_Device.all'Access), WL_DATA_DEVICE_RELEASE);
   end Data_Device_Release;

   procedure Data_Device_Manager_Set_User_Data (Data_Device_Manager : Data_Device_Manager_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Data_Device_Manager.all'Access, Data);
   end Data_Device_Manager_Set_User_Data;

   function Data_Device_Manager_Get_User_Data (Data_Device_Manager : Data_Device_Manager_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Data_Device_Manager.all'Access);
   end Data_Device_Manager_Get_User_Data;

   function Data_Device_Manager_Get_Version
     (Data_Device_Manager : Data_Device_Manager_Ptr) return Interfaces.Unsigned_32
   is
   begin
      return wl_proxy_get_version (Data_Device_Manager.all'Access);
   end Data_Device_Manager_Get_Version;

   procedure Data_Device_Manager_Destroy (Data_Device_Manager : Data_Device_Manager_Ptr) is
   begin
      wl_proxy_destroy (Data_Device_Manager.all'Access);
   end Data_Device_Manager_Destroy;

   function Data_Device_Manager_Create_Data_Source
     (Data_Device_Manager : Data_Device_Manager_Ptr) return Data_Source_Ptr
   is
      P : Proxy_Ptr :=
        Proxy_Marshal_Constructor
          (Data_Device_Manager.all'Access,
           WL_DATA_DEVICE_MANAGER_CREATE_DATA_SOURCE,
           Data_Source_Interface'Access,
           0);
   begin
      return (if P /= null then P.all'Access else null);
   end Data_Device_Manager_Create_Data_Source;

   function Data_Device_Manager_Get_Data_Device
     (Data_Device_Manager : Data_Device_Manager_Ptr;
      Seat                : Seat_Ptr) return Data_Device_Ptr
   is
      P : Proxy_Ptr :=
        Proxy_Marshal_Constructor
          (Data_Device_Manager.all'Access,
           WL_DATA_DEVICE_MANAGER_GET_DATA_DEVICE,
           Data_Device_Interface'Access,
           0,
           Seat.all'Address);
   begin
      return (if P /= null then P.all'Access else null);
   end Data_Device_Manager_Get_Data_Device;

   procedure Shell_Set_User_Data (Shell : Shell_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Shell.all'Access, Data);
   end Shell_Set_User_Data;

   function Shell_Get_User_Data (Shell : Shell_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Shell.all'Access);
   end Shell_Get_User_Data;

   function Shell_Get_Version (Shell : Shell_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Shell.all'Access);
   end Shell_Get_Version;

   procedure Shell_Destroy (Shell : Shell_Ptr) is
   begin
      wl_proxy_destroy (Shell.all'Access);
   end Shell_Destroy;

   function Shell_Get_Shell_Surface (Shell : Shell_Ptr; Surface : Surface_Ptr) return Shell_Surface_Ptr is
      P : Proxy_Ptr :=
        Proxy_Marshal_Constructor
          (Shell.all'Access,
           WL_SHELL_GET_SHELL_SURFACE,
           Shell_Surface_Interface'Access,
           0,
           Surface.all'Address);
   begin
      return (if P /= null then P.all'Access else null);
   end Shell_Get_Shell_Surface;

   function Shell_Surface_Add_Listener
     (Shell_Surface : Shell_Surface_Ptr;
      Listener      : Shell_Surface_Listener_Ptr;
      Data          : Void_Ptr) return Interfaces.C.int
   is
   begin
      return wl_proxy_add_listener (Shell_Surface.all'Access, Listener.all'Address, Data);
   end Shell_Surface_Add_Listener;

   procedure Shell_Surface_Set_User_Data (Shell_Surface : Shell_Surface_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Shell_Surface.all'Access, Data);
   end Shell_Surface_Set_User_Data;

   function Shell_Surface_Get_User_Data (Shell_Surface : Shell_Surface_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Shell_Surface.all'Access);
   end Shell_Surface_Get_User_Data;

   function Shell_Surface_Get_Version (Shell_Surface : Shell_Surface_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Shell_Surface.all'Access);
   end Shell_Surface_Get_Version;

   procedure Shell_Surface_Destroy (Shell_Surface : Shell_Surface_Ptr) is
   begin
      wl_proxy_destroy (Shell_Surface.all'Access);
   end Shell_Surface_Destroy;

   procedure Shell_Surface_Pong (Shell_Surface : Shell_Surface_Ptr; Serial : Interfaces.Unsigned_32) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access), WL_SHELL_SURFACE_PONG, Serial);
   end Shell_Surface_Pong;

   procedure Shell_Surface_Move (Shell_Surface : Shell_Surface_Ptr; Seat : Seat_Ptr; Serial : Interfaces.Unsigned_32) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access), WL_SHELL_SURFACE_MOVE, Seat.all'Address, Serial);
   end Shell_Surface_Move;

   procedure Shell_Surface_Resize
     (Shell_Surface : Shell_Surface_Ptr;
      Seat          : Seat_Ptr;
      Serial        : Interfaces.Unsigned_32;
      Edges         : Interfaces.Unsigned_32)
   is
   begin
      Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access), WL_SHELL_SURFACE_RESIZE, Seat.all'Address, Serial, Edges);
   end Shell_Surface_Resize;

   procedure Shell_Surface_Set_Toplevel (Shell_Surface : Shell_Surface_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access), WL_SHELL_SURFACE_SET_TOPLEVEL);
   end Shell_Surface_Set_Toplevel;

   procedure Shell_Surface_Set_Transient
     (Shell_Surface : Shell_Surface_Ptr;
      Parent        : Surface_Ptr;
      X             : Integer;
      Y             : Integer;
      Flags         : Interfaces.Unsigned_32)
   is
   begin
      Proxy_Marshal
        (Proxy_Ptr'(Shell_Surface.all'Access),
         WL_SHELL_SURFACE_SET_TRANSIENT,
         Parent.all'Address,
         X,
         Y,
         Flags);
   end Shell_Surface_Set_Transient;

   procedure Shell_Surface_Set_Fullscreen
     (Shell_Surface : Shell_Surface_Ptr;
      Method        : Interfaces.Unsigned_32;
      Framerate     : Interfaces.Unsigned_32;
      Output        : Output_Ptr)
   is
   begin
      Proxy_Marshal
        (Proxy_Ptr'(Shell_Surface.all'Access),
         WL_SHELL_SURFACE_SET_FULLSCREEN,
         Method,
         Framerate,
         Output.all'Address);
   end Shell_Surface_Set_Fullscreen;

   procedure Shell_Surface_Set_Popup
     (Shell_Surface : Shell_Surface_Ptr;
      Seat          : Seat_Ptr;
      Serial        : Interfaces.Unsigned_32;
      Parent        : Surface_Ptr;
      X             : Integer;
      Y             : Integer;
      Flags         : Interfaces.Unsigned_32)
   is
   begin
      Proxy_Marshal
        (Proxy_Ptr'(Shell_Surface.all'Access),
         WL_SHELL_SURFACE_SET_POPUP,
         Seat.all'Address,
         Serial,
         Parent.all'Address,
         X,
         Y,
         Flags);
   end Shell_Surface_Set_Popup;

   procedure Shell_Surface_Set_Maximized (Shell_Surface : Shell_Surface_Ptr; Output : Output_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access), WL_SHELL_SURFACE_SET_MAXIMIZED, Output.all'Address);
   end Shell_Surface_Set_Maximized;

   procedure Shell_Surface_Set_Title (Shell_Surface : Shell_Surface_Ptr; Title : Interfaces.C.Strings.chars_ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access), WL_SHELL_SURFACE_SET_TITLE, Title);
   end Shell_Surface_Set_Title;

   procedure Shell_Surface_Set_Class (Shell_Surface : Shell_Surface_Ptr; Class_V : Interfaces.C.Strings.chars_ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access), WL_SHELL_SURFACE_SET_CLASS, Class_V);
   end Shell_Surface_Set_Class;

   function Surface_Add_Listener
     (Surface  : Surface_Ptr;
      Listener : Surface_Listener_Ptr;
      Data     : Void_Ptr) return Interfaces.C.int
   is
   begin
      return wl_proxy_add_listener (Surface.all'Access, Listener.all'Address, Data);
   end Surface_Add_Listener;

   procedure Surface_Set_User_Data (Surface : Surface_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Surface.all'Access, Data);
   end Surface_Set_User_Data;

   function Surface_Get_User_Data (Surface : Surface_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Surface.all'Access);
   end Surface_Get_User_Data;

   function Surface_Get_Version (Surface : Surface_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Surface.all'Access);
   end Surface_Get_Version;

   procedure Surface_Destroy (Surface : Surface_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Surface.all'Access), WL_SURFACE_DESTROY);

      wl_proxy_destroy (Surface.all'Access);
   end Surface_Destroy;

   procedure Surface_Attach (Surface : Surface_Ptr; Buffer : Buffer_Ptr; X : Integer; Y : Integer) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Surface.all'Access), WL_SURFACE_ATTACH, Buffer.all'Address, X, Y);
   end Surface_Attach;

   procedure Surface_Damage (Surface : Surface_Ptr; X : Integer; Y : Integer; Width : Integer; Height : Integer) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Surface.all'Access), WL_SURFACE_DAMAGE, X, Y, Width, Height);
   end Surface_Damage;

   function Surface_Frame (Surface : Surface_Ptr) return Callback_Ptr is
      P : Proxy_Ptr := Proxy_Marshal_Constructor (Surface.all'Access, WL_SURFACE_FRAME, Callback_Interface'Access, 0);
   begin
      return (if P /= null then P.all'Access else null);
   end Surface_Frame;

   procedure Surface_Set_Opaque_Region (Surface : Surface_Ptr; Region : Region_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Surface.all'Access), WL_SURFACE_SET_OPAQUE_REGION, Region.all'Address);
   end Surface_Set_Opaque_Region;

   procedure Surface_Set_Input_Region (Surface : Surface_Ptr; Region : Region_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Surface.all'Access), WL_SURFACE_SET_INPUT_REGION, Region.all'Address);
   end Surface_Set_Input_Region;

   procedure Surface_Commit (Surface : Surface_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Surface.all'Access), WL_SURFACE_COMMIT);
   end Surface_Commit;

   procedure Surface_Set_Buffer_Transform (Surface : Surface_Ptr; Transform : Integer) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Surface.all'Access), WL_SURFACE_SET_BUFFER_TRANSFORM, Transform);
   end Surface_Set_Buffer_Transform;

   procedure Surface_Set_Buffer_Scale (Surface : Surface_Ptr; Scale : Integer) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Surface.all'Access), WL_SURFACE_SET_BUFFER_SCALE, Scale);
   end Surface_Set_Buffer_Scale;

   procedure Surface_Damage_Buffer
     (Surface : Surface_Ptr;
      X       : Integer;
      Y       : Integer;
      Width   : Integer;
      Height  : Integer)
   is
   begin
      Proxy_Marshal (Proxy_Ptr'(Surface.all'Access), WL_SURFACE_DAMAGE_BUFFER, X, Y, Width, Height);
   end Surface_Damage_Buffer;

   function Seat_Add_Listener
     (Seat     : Seat_Ptr;
      Listener : Seat_Listener_Ptr;
      Data     : Void_Ptr) return Interfaces.C.int
   is
   begin
      return wl_proxy_add_listener (Seat.all'Access, Listener.all'Address, Data);
   end Seat_Add_Listener;

   procedure Seat_Set_User_Data (Seat : Seat_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Seat.all'Access, Data);
   end Seat_Set_User_Data;

   function Seat_Get_User_Data (Seat : Seat_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Seat.all'Access);
   end Seat_Get_User_Data;

   function Seat_Get_Version (Seat : Seat_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Seat.all'Access);
   end Seat_Get_Version;

   procedure Seat_Destroy (Seat : Seat_Ptr) is
   begin
      wl_proxy_destroy (Seat.all'Access);
   end Seat_Destroy;

   function Seat_Get_Pointer (Seat : Seat_Ptr) return Pointer_Ptr is
      P : Proxy_Ptr := Proxy_Marshal_Constructor (Seat.all'Access, WL_SEAT_GET_POINTER, Pointer_Interface'Access, 0);
   begin
      return (if P /= null then P.all'Access else null);
   end Seat_Get_Pointer;

   function Seat_Get_Keyboard (Seat : Seat_Ptr) return Keyboard_Ptr is
      P : Proxy_Ptr := Proxy_Marshal_Constructor (Seat.all'Access, WL_SEAT_GET_KEYBOARD, Keyboard_Interface'Access, 0);
   begin
      return (if P /= null then P.all'Access else null);
   end Seat_Get_Keyboard;

   function Seat_Get_Touch (Seat : Seat_Ptr) return Touch_Ptr is
      P : Proxy_Ptr := Proxy_Marshal_Constructor (Seat.all'Access, WL_SEAT_GET_TOUCH, Touch_Interface'Access, 0);
   begin
      return (if P /= null then P.all'Access else null);
   end Seat_Get_Touch;

   procedure Seat_Release (Seat : Seat_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Seat.all'Access), WL_SEAT_RELEASE);
   end Seat_Release;

   function Pointer_Add_Listener
     (Pointer  : Pointer_Ptr;
      Listener : Pointer_Listener_Ptr;
      Data     : Void_Ptr) return Interfaces.C.int
   is
   begin
      return wl_proxy_add_listener (Pointer.all'Access, Listener.all'Address, Data);
   end Pointer_Add_Listener;

   procedure Pointer_Set_User_Data (Pointer : Pointer_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Pointer.all'Access, Data);
   end Pointer_Set_User_Data;

   function Pointer_Get_User_Data (Pointer : Pointer_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Pointer.all'Access);
   end Pointer_Get_User_Data;

   function Pointer_Get_Version (Pointer : Pointer_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Pointer.all'Access);
   end Pointer_Get_Version;

   procedure Pointer_Destroy (Pointer : Pointer_Ptr) is
   begin
      wl_proxy_destroy (Pointer.all'Access);
   end Pointer_Destroy;

   procedure Pointer_Set_Cursor
     (Pointer   : Pointer_Ptr;
      Serial    : Interfaces.Unsigned_32;
      Surface   : Surface_Ptr;
      Hotspot_X : Integer;
      Hotspot_Y : Integer)
   is
   begin
      Proxy_Marshal
        (Proxy_Ptr'(Pointer.all'Access),
         WL_POINTER_SET_CURSOR,
         Serial,
         Surface.all'Address,
         Hotspot_X,
         Hotspot_Y);
   end Pointer_Set_Cursor;

   procedure Pointer_Release (Pointer : Pointer_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Pointer.all'Access), WL_POINTER_RELEASE);
   end Pointer_Release;

   function Keyboard_Add_Listener
     (Keyboard : Keyboard_Ptr;
      Listener : Keyboard_Listener_Ptr;
      Data     : Void_Ptr) return Interfaces.C.int
   is
   begin
      return wl_proxy_add_listener (Keyboard.all'Access, Listener.all'Address, Data);
   end Keyboard_Add_Listener;

   procedure Keyboard_Set_User_Data (Keyboard : Keyboard_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Keyboard.all'Access, Data);
   end Keyboard_Set_User_Data;

   function Keyboard_Get_User_Data (Keyboard : Keyboard_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Keyboard.all'Access);
   end Keyboard_Get_User_Data;

   function Keyboard_Get_Version (Keyboard : Keyboard_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Keyboard.all'Access);
   end Keyboard_Get_Version;

   procedure Keyboard_Destroy (Keyboard : Keyboard_Ptr) is
   begin
      wl_proxy_destroy (Keyboard.all'Access);
   end Keyboard_Destroy;

   procedure Keyboard_Release (Keyboard : Keyboard_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Keyboard.all'Access), WL_KEYBOARD_RELEASE);
   end Keyboard_Release;

   function Touch_Add_Listener
     (Touch    : Touch_Ptr;
      Listener : Touch_Listener_Ptr;
      Data     : Void_Ptr) return Interfaces.C.int
   is
   begin
      return wl_proxy_add_listener (Touch.all'Access, Listener.all'Address, Data);
   end Touch_Add_Listener;

   procedure Touch_Set_User_Data (Touch : Touch_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Touch.all'Access, Data);
   end Touch_Set_User_Data;

   function Touch_Get_User_Data (Touch : Touch_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Touch.all'Access);
   end Touch_Get_User_Data;

   function Touch_Get_Version (Touch : Touch_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Touch.all'Access);
   end Touch_Get_Version;

   procedure Touch_Destroy (Touch : Touch_Ptr) is
   begin
      wl_proxy_destroy (Touch.all'Access);
   end Touch_Destroy;

   procedure Touch_Release (Touch : Touch_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Touch.all'Access), WL_TOUCH_RELEASE);
   end Touch_Release;

   function Output_Add_Listener
     (Output   : Output_Ptr;
      Listener : Output_Listener_Ptr;
      Data     : Void_Ptr) return Interfaces.C.int
   is
   begin
      return wl_proxy_add_listener (Output.all'Access, Listener.all'Address, Data);
   end Output_Add_Listener;

   procedure Output_Set_User_Data (Output : Output_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Output.all'Access, Data);
   end Output_Set_User_Data;

   function Output_Get_User_Data (Output : Output_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Output.all'Access);
   end Output_Get_User_Data;

   function Output_Get_Version (Output : Output_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Output.all'Access);
   end Output_Get_Version;

   procedure Output_Destroy (Output : Output_Ptr) is
   begin
      wl_proxy_destroy (Output.all'Access);
   end Output_Destroy;

   procedure Output_Release (Output : Output_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Output.all'Access), WL_OUTPUT_RELEASE);
   end Output_Release;

   procedure Region_Set_User_Data (Region : Region_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Region.all'Access, Data);
   end Region_Set_User_Data;

   function Region_Get_User_Data (Region : Region_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Region.all'Access);
   end Region_Get_User_Data;

   function Region_Get_Version (Region : Region_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Region.all'Access);
   end Region_Get_Version;

   procedure Region_Destroy (Region : Region_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Region.all'Access), WL_REGION_DESTROY);

      wl_proxy_destroy (Region.all'Access);
   end Region_Destroy;

   procedure Region_Add (Region : Region_Ptr; X : Integer; Y : Integer; Width : Integer; Height : Integer) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Region.all'Access), WL_REGION_ADD, X, Y, Width, Height);
   end Region_Add;

   procedure Region_Subtract (Region : Region_Ptr; X : Integer; Y : Integer; Width : Integer; Height : Integer) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Region.all'Access), WL_REGION_SUBTRACT, X, Y, Width, Height);
   end Region_Subtract;

   procedure Subcompositor_Set_User_Data (Subcompositor : Subcompositor_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Subcompositor.all'Access, Data);
   end Subcompositor_Set_User_Data;

   function Subcompositor_Get_User_Data (Subcompositor : Subcompositor_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Subcompositor.all'Access);
   end Subcompositor_Get_User_Data;

   function Subcompositor_Get_Version (Subcompositor : Subcompositor_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Subcompositor.all'Access);
   end Subcompositor_Get_Version;

   procedure Subcompositor_Destroy (Subcompositor : Subcompositor_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Subcompositor.all'Access), WL_SUBCOMPOSITOR_DESTROY);

      wl_proxy_destroy (Subcompositor.all'Access);
   end Subcompositor_Destroy;

   function Subcompositor_Get_Subsurface
     (Subcompositor : Subcompositor_Ptr;
      Surface       : Surface_Ptr;
      Parent        : Surface_Ptr) return Subsurface_Ptr
   is
      P : Proxy_Ptr :=
        Proxy_Marshal_Constructor
          (Subcompositor.all'Access,
           WL_SUBCOMPOSITOR_GET_SUBSURFACE,
           Subsurface_Interface'Access,
           0,
           Surface.all'Address,
           Parent.all'Address);
   begin
      return (if P /= null then P.all'Access else null);
   end Subcompositor_Get_Subsurface;

   procedure Subsurface_Set_User_Data (Subsurface : Subsurface_Ptr; Data : Void_Ptr) is
   begin
      wl_proxy_set_user_data (Subsurface.all'Access, Data);
   end Subsurface_Set_User_Data;

   function Subsurface_Get_User_Data (Subsurface : Subsurface_Ptr) return Void_Ptr is
   begin
      return wl_proxy_get_user_data (Subsurface.all'Access);
   end Subsurface_Get_User_Data;

   function Subsurface_Get_Version (Subsurface : Subsurface_Ptr) return Interfaces.Unsigned_32 is
   begin
      return wl_proxy_get_version (Subsurface.all'Access);
   end Subsurface_Get_Version;

   procedure Subsurface_Destroy (Subsurface : Subsurface_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Subsurface.all'Access), WL_SUBSURFACE_DESTROY);

      wl_proxy_destroy (Subsurface.all'Access);
   end Subsurface_Destroy;

   procedure Subsurface_Set_Position (Subsurface : Subsurface_Ptr; X : Integer; Y : Integer) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Subsurface.all'Access), WL_SUBSURFACE_SET_POSITION, X, Y);
   end Subsurface_Set_Position;

   procedure Subsurface_Place_Above (Subsurface : Subsurface_Ptr; Sibling : Surface_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Subsurface.all'Access), WL_SUBSURFACE_PLACE_ABOVE, Sibling.all'Address);
   end Subsurface_Place_Above;

   procedure Subsurface_Place_Below (Subsurface : Subsurface_Ptr; Sibling : Surface_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Subsurface.all'Access), WL_SUBSURFACE_PLACE_BELOW, Sibling.all'Address);
   end Subsurface_Place_Below;

   procedure Subsurface_Set_Sync (Subsurface : Subsurface_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Subsurface.all'Access), WL_SUBSURFACE_SET_SYNC);
   end Subsurface_Set_Sync;

   procedure Subsurface_Set_Desync (Subsurface : Subsurface_Ptr) is
   begin
      Proxy_Marshal (Proxy_Ptr'(Subsurface.all'Access), WL_SUBSURFACE_SET_DESYNC);
   end Subsurface_Set_Desync;

end Wl_Thin;