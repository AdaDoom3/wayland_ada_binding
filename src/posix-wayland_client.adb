with System.Address_To_Access_Conversions;
package body Posix.Wayland_Client is

   -- Mostly auto generated from Wayland.xml
   package body Wl_Thin is

      procedure wl_proxy_destroy (Registry : Proxy_Ptr) with
        Convention    => C,
        Import        => True,
        External_Name => "wl_proxy_destroy";

      function Display_Connect (Name : C_String) return Display_Ptr is

         function wl_display_connect (Name : in C_String) return Display_Ptr with
           Convention    => C,
           Import        => True,
           External_Name => "wl_display_connect";

      begin
         return wl_display_connect (Name);
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
   
      function wl_proxy_add_listener
        (arg1 : Proxy_Ptr;
         arg2 : Void_Ptr;
         arg3 : Void_Ptr) return Interfaces.C.int with
        Import        => True,
        Convention    => C,
        External_Name => "wl_proxy_add_listener";

      procedure wl_proxy_set_user_data
        (arg1 : Proxy_Ptr;
         arg3 : Void_Ptr) with
        Import        => True,
        Convention    => C,
        External_Name => "wl_proxy_set_user_data";

      function wl_proxy_get_user_data
        (arg1 : Proxy_Ptr) return Void_Ptr with
        Import        => True,
        Convention    => C,
        External_Name => "wl_proxy_get_user_data";

      function wl_proxy_get_version
        (arg1 : Proxy_Ptr) return Unsigned_32 with
        Import        => True,
        Convention    => C,
        External_Name => "wl_proxy_get_version";

      function Display_Add_Listener (Display : Display_Ptr;
                                     Listener : Display_Listener_Ptr;
                                     Data : Void_Ptr) return Interfaces.C.int is
      begin
         return wl_proxy_add_listener (Display.all'Access, Listener.all'Address, Data);
      end Display_Add_Listener;

      procedure Display_Set_User_Data (Display : Display_Ptr;
                                       Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Display.all'Access, Data);
      end Display_Set_User_Data;

      function Display_Get_User_Data (Display : Display_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Display.all'Access);
      end Display_Get_User_Data;

      function Display_Get_Version (Display : Display_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Display.all'Access);
      end Display_Get_Version;

      procedure Display_Destroy (Display : Display_Ptr) is
      begin
         wl_proxy_destroy (Display.all'Access);
      end Display_Destroy;

      function Display_Sync (Display : Display_Ptr) return Callback_Ptr is
         P : Proxy_Ptr := Proxy_Marshal_Constructor (Display.all'Access,
                                                     WL_DISPLAY_SYNC,
                                                     Callback_Interface'Access,
                                                     0);
      begin
         return (if P /= null then P.all'Access else null);
      end Display_Sync;

      function Display_Get_Registry (Display : Display_Ptr) return Registry_Ptr is
         P : Proxy_Ptr := Proxy_Marshal_Constructor (Display.all'Access,
                                                     WL_DISPLAY_GET_REGISTRY,
                                                     Registry_Interface'Access,
                                                     0);
      begin
         return (if P /= null then P.all'Access else null);
      end Display_Get_Registry;

      function Registry_Add_Listener (Registry : Registry_Ptr;
                                      Listener : Registry_Listener_Ptr;
                                      Data : Void_Ptr) return Interfaces.C.int is
      begin
         return wl_proxy_add_listener (Registry.all'Access, Listener.all'Address, Data);
      end Registry_Add_Listener;

      procedure Registry_Set_User_Data (Registry : Registry_Ptr;
                                        Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Registry.all'Access, Data);
      end Registry_Set_User_Data;

      function Registry_Get_User_Data (Registry : Registry_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Registry.all'Access);
      end Registry_Get_User_Data;

      function Registry_Get_Version (Registry : Registry_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Registry.all'Access);
      end Registry_Get_Version;

      procedure Registry_Destroy (Registry : Registry_Ptr) is
      begin
         wl_proxy_destroy (Registry.all'Access);
      end Registry_Destroy;

      function Registry_Bind (Registry : Registry_Ptr;
                              Name : Unsigned_32;
                              Interface_V : Interface_Ptr;
                              New_Id : Unsigned_32) return Proxy_Ptr is
      begin
         return Proxy_Marshal_Constructor_Versioned (Registry.all'Access,
                                                     WL_REGISTRY_BIND,
                                                     Interface_V,
                                                     New_Id,
                                                     Name,
                                                     Interface_V.Name,
                                                     New_Id,
                                                     0);
      end Registry_Bind;

      function Callback_Add_Listener (Callback : Callback_Ptr;
                                      Listener : Callback_Listener_Ptr;
                                      Data : Void_Ptr) return Interfaces.C.int is
      begin
         return wl_proxy_add_listener (Callback.all'Access, Listener.all'Address, Data);
      end Callback_Add_Listener;

      procedure Callback_Set_User_Data (Callback : Callback_Ptr;
                                        Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Callback.all'Access, Data);
      end Callback_Set_User_Data;

      function Callback_Get_User_Data (Callback : Callback_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Callback.all'Access);
      end Callback_Get_User_Data;

      function Callback_Get_Version (Callback : Callback_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Callback.all'Access);
      end Callback_Get_Version;

      procedure Callback_Destroy (Callback : Callback_Ptr) is
      begin
         wl_proxy_destroy (Callback.all'Access);
      end Callback_Destroy;

      procedure Compositor_Set_User_Data (Compositor : Compositor_Ptr;
                                          Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Compositor.all'Access, Data);
      end Compositor_Set_User_Data;

      function Compositor_Get_User_Data (Compositor : Compositor_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Compositor.all'Access);
      end Compositor_Get_User_Data;

      function Compositor_Get_Version (Compositor : Compositor_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Compositor.all'Access);
      end Compositor_Get_Version;

      procedure Compositor_Destroy (Compositor : Compositor_Ptr) is
      begin
         wl_proxy_destroy (Compositor.all'Access);
      end Compositor_Destroy;

      function Compositor_Create_Surface (Compositor : Compositor_Ptr) return Surface_Ptr is
         P : Proxy_Ptr := Proxy_Marshal_Constructor (Compositor.all'Access,
                                                     WL_COMPOSITOR_CREATE_SURFACE,
                                                     Surface_Interface'Access,
                                                     0);
      begin
         return (if P /= null then P.all'Access else null);
      end Compositor_Create_Surface;

      function Compositor_Create_Region (Compositor : Compositor_Ptr) return Region_Ptr is
         P : Proxy_Ptr := Proxy_Marshal_Constructor (Compositor.all'Access,
                                                     WL_COMPOSITOR_CREATE_REGION,
                                                     Region_Interface'Access,
                                                     0);
      begin
         return (if P /= null then P.all'Access else null);
      end Compositor_Create_Region;

      procedure Shm_Pool_Set_User_Data (Shm_Pool : Shm_Pool_Ptr;
                                        Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Shm_Pool.all'Access, Data);
      end Shm_Pool_Set_User_Data;

      function Shm_Pool_Get_User_Data (Shm_Pool : Shm_Pool_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Shm_Pool.all'Access);
      end Shm_Pool_Get_User_Data;

      function Shm_Pool_Get_Version (Shm_Pool : Shm_Pool_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Shm_Pool.all'Access);
      end Shm_Pool_Get_Version;

      procedure Shm_Pool_Destroy (Shm_Pool : Shm_Pool_Ptr) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Shm_Pool.all'Access),
                        WL_SHM_POOL_DESTROY);

         wl_proxy_destroy (Shm_Pool.all'Access);
      end Shm_Pool_Destroy;

      function Shm_Pool_Create_Buffer (Shm_Pool : Shm_Pool_Ptr;
                                       Offset : Integer;
                                       Width : Integer;
                                       Height : Integer;
                                       Stride : Integer;
                                       Format : Unsigned_32
                                      ) return Buffer_Ptr is
         P : Proxy_Ptr := Proxy_Marshal_Constructor (Shm_Pool.all'Access,
                                                     WL_SHM_POOL_CREATE_BUFFER,
                                                     Buffer_Interface'Access,
                                                     0,
                                                     Offset,
                                                     Width,
                                                     Height,
                                                     Stride,
                                                     Format    );
      begin
         return (if P /= null then P.all'Access else null);
      end Shm_Pool_Create_Buffer;


      procedure Shm_Pool_Resize (Shm_Pool : Shm_Pool_Ptr;
                                 Size : Integer
                                ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Shm_Pool.all'Access),
                        WL_SHM_POOL_RESIZE,
                        Size    );
      end Shm_Pool_Resize;

      function Shm_Add_Listener (Shm : Shm_Ptr;
                                 Listener : Shm_Listener_Ptr;
                                 Data : Void_Ptr) return Interfaces.C.int is
      begin
         return wl_proxy_add_listener (Shm.all'Access, Listener.all'Address, Data);
      end Shm_Add_Listener;

      procedure Shm_Set_User_Data (Shm : Shm_Ptr;
                                   Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Shm.all'Access, Data);
      end Shm_Set_User_Data;

      function Shm_Get_User_Data (Shm : Shm_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Shm.all'Access);
      end Shm_Get_User_Data;

      function Shm_Get_Version (Shm : Shm_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Shm.all'Access);
      end Shm_Get_Version;

      procedure Shm_Destroy (Shm : Shm_Ptr) is
      begin
         wl_proxy_destroy (Shm.all'Access);
      end Shm_Destroy;

      function Shm_Create_Pool (Shm : Shm_Ptr;
                                Fd : Integer;
                                Size : Integer
                               ) return Shm_Pool_Ptr is
         P : Proxy_Ptr := Proxy_Marshal_Constructor (Shm.all'Access,
                                                     WL_SHM_CREATE_POOL,
                                                     Shm_Pool_Interface'Access,
                                                     0,
                                                     Fd,
                                                     Size    );
      begin
         return (if P /= null then P.all'Access else null);
      end Shm_Create_Pool;

      function Buffer_Add_Listener (Buffer : Buffer_Ptr;
                                    Listener : Buffer_Listener_Ptr;
                                    Data : Void_Ptr) return Interfaces.C.int is
      begin
         return wl_proxy_add_listener (Buffer.all'Access, Listener.all'Address, Data);
      end Buffer_Add_Listener;

      procedure Buffer_Set_User_Data (Buffer : Buffer_Ptr;
                                      Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Buffer.all'Access, Data);
      end Buffer_Set_User_Data;

      function Buffer_Get_User_Data (Buffer : Buffer_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Buffer.all'Access);
      end Buffer_Get_User_Data;

      function Buffer_Get_Version (Buffer : Buffer_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Buffer.all'Access);
      end Buffer_Get_Version;

      procedure Buffer_Destroy (Buffer : Buffer_Ptr) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Buffer.all'Access),
                        WL_BUFFER_DESTROY);

         wl_proxy_destroy (Buffer.all'Access);
      end Buffer_Destroy;


      function Data_Offer_Add_Listener (Data_Offer : Data_Offer_Ptr;
                                        Listener : Data_Offer_Listener_Ptr;
                                        Data : Void_Ptr) return Interfaces.C.int is
      begin
         return wl_proxy_add_listener (Data_Offer.all'Access, Listener.all'Address, Data);
      end Data_Offer_Add_Listener;

      procedure Data_Offer_Set_User_Data (Data_Offer : Data_Offer_Ptr;
                                          Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Data_Offer.all'Access, Data);
      end Data_Offer_Set_User_Data;

      function Data_Offer_Get_User_Data (Data_Offer : Data_Offer_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Data_Offer.all'Access);
      end Data_Offer_Get_User_Data;

      function Data_Offer_Get_Version (Data_Offer : Data_Offer_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Data_Offer.all'Access);
      end Data_Offer_Get_Version;

      procedure Data_Offer_Destroy (Data_Offer : Data_Offer_Ptr) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Data_Offer.all'Access),
                        WL_DATA_OFFER_DESTROY);

         wl_proxy_destroy (Data_Offer.all'Access);
      end Data_Offer_Destroy;

      procedure Data_Offer_Accept (Data_Offer : Data_Offer_Ptr;
                                   Serial : Unsigned_32;
                                   Mime_Type : chars_ptr
                                  ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Data_Offer.all'Access),
                        WL_DATA_OFFER_ACCEPT,
                        Serial,
                        Mime_Type    );
      end Data_Offer_Accept;

      procedure Data_Offer_Receive (Data_Offer : Data_Offer_Ptr;
                                    Mime_Type : C_String;
                                    Fd : Integer
                                   ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Data_Offer.all'Access),
                        WL_DATA_OFFER_RECEIVE,
                        Mime_Type,
                        Fd    );
      end Data_Offer_Receive;


      procedure Data_Offer_Finish (Data_Offer : Data_Offer_Ptr) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Data_Offer.all'Access), WL_DATA_OFFER_FINISH);
      end Data_Offer_Finish;

      procedure Data_Offer_Set_Actions (Data_Offer : Data_Offer_Ptr;
                                        Dnd_Actions : Unsigned_32;
                                        Preferred_Action : Unsigned_32
                                       ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Data_Offer.all'Access),
                        WL_DATA_OFFER_SET_ACTIONS,
                        Dnd_Actions,
                        Preferred_Action    );
      end Data_Offer_Set_Actions;

      function Data_Source_Add_Listener (Data_Source : Data_Source_Ptr;
                                         Listener : Data_Source_Listener_Ptr;
                                         Data : Void_Ptr) return Interfaces.C.int is
      begin
         return wl_proxy_add_listener (Data_Source.all'Access, Listener.all'Address, Data);
      end Data_Source_Add_Listener;

      procedure Data_Source_Set_User_Data (Data_Source : Data_Source_Ptr;
                                           Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Data_Source.all'Access, Data);
      end Data_Source_Set_User_Data;

      function Data_Source_Get_User_Data (Data_Source : Data_Source_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Data_Source.all'Access);
      end Data_Source_Get_User_Data;

      function Data_Source_Get_Version (Data_Source : Data_Source_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Data_Source.all'Access);
      end Data_Source_Get_Version;

      procedure Data_Source_Destroy (Data_Source : Data_Source_Ptr) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Data_Source.all'Access),
                        WL_DATA_SOURCE_DESTROY);

         wl_proxy_destroy (Data_Source.all'Access);
      end Data_Source_Destroy;

      procedure Data_Source_Offer (Data_Source : Data_Source_Ptr;
                                   Mime_Type : chars_ptr
                                  ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Data_Source.all'Access),
                        WL_DATA_SOURCE_OFFER,
                        Mime_Type    );
      end Data_Source_Offer;


      procedure Data_Source_Set_Actions (Data_Source : Data_Source_Ptr;
                                         Dnd_Actions : Unsigned_32
                                        ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Data_Source.all'Access),
                        WL_DATA_SOURCE_SET_ACTIONS,
                        Dnd_Actions    );
      end Data_Source_Set_Actions;

      function Data_Device_Add_Listener (Data_Device : Data_Device_Ptr;
                                         Listener : Data_Device_Listener_Ptr;
                                         Data : Void_Ptr) return Interfaces.C.int is
      begin
         return wl_proxy_add_listener (Data_Device.all'Access, Listener.all'Address, Data);
      end Data_Device_Add_Listener;

      procedure Data_Device_Set_User_Data (Data_Device : Data_Device_Ptr;
                                           Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Data_Device.all'Access, Data);
      end Data_Device_Set_User_Data;

      function Data_Device_Get_User_Data (Data_Device : Data_Device_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Data_Device.all'Access);
      end Data_Device_Get_User_Data;

      function Data_Device_Get_Version (Data_Device : Data_Device_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Data_Device.all'Access);
      end Data_Device_Get_Version;

      procedure Data_Device_Destroy (Data_Device : Data_Device_Ptr) is
      begin
         wl_proxy_destroy (Data_Device.all'Access);
      end Data_Device_Destroy;

      procedure Data_Device_Start_Drag (Data_Device : Data_Device_Ptr;
                                        Source : Data_Source_Ptr;
                                        Origin : Surface_Ptr;
                                        Icon : Surface_Ptr;
                                        Serial : Unsigned_32
                                       ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Data_Device.all'Access),
                        WL_DATA_DEVICE_START_DRAG,
                        Source.all'Address,
                        Origin.all'Address,
                        Icon.all'Address,
                        Serial    );
      end Data_Device_Start_Drag;

      procedure Data_Device_Set_Selection (Data_Device : Data_Device_Ptr;
                                           Source : Data_Source_Ptr;
                                           Serial : Unsigned_32
                                          ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Data_Device.all'Access),
                        WL_DATA_DEVICE_SET_SELECTION,
                        Source.all'Address,
                        Serial    );
      end Data_Device_Set_Selection;

      procedure Data_Device_Release (Data_Device : Data_Device_Ptr) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Data_Device.all'Access), WL_DATA_DEVICE_RELEASE);
      end Data_Device_Release;

      procedure Data_Device_Manager_Set_User_Data (Data_Device_Manager : Data_Device_Manager_Ptr;
                                                   Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Data_Device_Manager.all'Access, Data);
      end Data_Device_Manager_Set_User_Data;

      function Data_Device_Manager_Get_User_Data (Data_Device_Manager : Data_Device_Manager_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Data_Device_Manager.all'Access);
      end Data_Device_Manager_Get_User_Data;

      function Data_Device_Manager_Get_Version (Data_Device_Manager : Data_Device_Manager_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Data_Device_Manager.all'Access);
      end Data_Device_Manager_Get_Version;

      procedure Data_Device_Manager_Destroy (Data_Device_Manager : Data_Device_Manager_Ptr) is
      begin
         wl_proxy_destroy (Data_Device_Manager.all'Access);
      end Data_Device_Manager_Destroy;

      function Data_Device_Manager_Create_Data_Source (Data_Device_Manager : Data_Device_Manager_Ptr) return Data_Source_Ptr is
         P : Proxy_Ptr := Proxy_Marshal_Constructor (Data_Device_Manager.all'Access,
                                                     WL_DATA_DEVICE_MANAGER_CREATE_DATA_SOURCE,
                                                     Data_Source_Interface'Access,
                                                     0);
      begin
         return (if P /= null then P.all'Access else null);
      end Data_Device_Manager_Create_Data_Source;

      function Data_Device_Manager_Get_Data_Device (Data_Device_Manager : Data_Device_Manager_Ptr;
                                                    Seat : Seat_Ptr
                                                   ) return Data_Device_Ptr is
         P : Proxy_Ptr := Proxy_Marshal_Constructor (Data_Device_Manager.all'Access,
                                                     WL_DATA_DEVICE_MANAGER_GET_DATA_DEVICE,
                                                     Data_Device_Interface'Access,
                                                     0,
                                                     Seat.all'Address    );
      begin
         return (if P /= null then P.all'Access else null);
      end Data_Device_Manager_Get_Data_Device;

      procedure Shell_Set_User_Data (Shell : Shell_Ptr;
                                     Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Shell.all'Access, Data);
      end Shell_Set_User_Data;

      function Shell_Get_User_Data (Shell : Shell_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Shell.all'Access);
      end Shell_Get_User_Data;

      function Shell_Get_Version (Shell : Shell_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Shell.all'Access);
      end Shell_Get_Version;

      procedure Shell_Destroy (Shell : Shell_Ptr) is
      begin
         wl_proxy_destroy (Shell.all'Access);
      end Shell_Destroy;

      function Shell_Get_Shell_Surface (Shell : Shell_Ptr;
                                        Surface : Surface_Ptr
                                       ) return Shell_Surface_Ptr is
         P : Proxy_Ptr := Proxy_Marshal_Constructor (Shell.all'Access,
                                                     WL_SHELL_GET_SHELL_SURFACE,
                                                     Shell_Surface_Interface'Access,
                                                     0,
                                                     Surface.all'Address    );
      begin
         return (if P /= null then P.all'Access else null);
      end Shell_Get_Shell_Surface;

      function Shell_Surface_Add_Listener (Shell_Surface : Shell_Surface_Ptr;
                                           Listener : Shell_Surface_Listener_Ptr;
                                           Data : Void_Ptr) return Interfaces.C.int is
      begin
         return wl_proxy_add_listener (Shell_Surface.all'Access, Listener.all'Address, Data);
      end Shell_Surface_Add_Listener;

      procedure Shell_Surface_Set_User_Data (Shell_Surface : Shell_Surface_Ptr;
                                             Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Shell_Surface.all'Access, Data);
      end Shell_Surface_Set_User_Data;

      function Shell_Surface_Get_User_Data (Shell_Surface : Shell_Surface_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Shell_Surface.all'Access);
      end Shell_Surface_Get_User_Data;

      function Shell_Surface_Get_Version (Shell_Surface : Shell_Surface_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Shell_Surface.all'Access);
      end Shell_Surface_Get_Version;

      procedure Shell_Surface_Destroy (Shell_Surface : Shell_Surface_Ptr) is
      begin
         wl_proxy_destroy (Shell_Surface.all'Access);
      end Shell_Surface_Destroy;

      procedure Shell_Surface_Pong (Shell_Surface : Shell_Surface_Ptr;
                                    Serial : Unsigned_32
                                   ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access),
                        WL_SHELL_SURFACE_PONG,
                        Serial    );
      end Shell_Surface_Pong;

      procedure Shell_Surface_Move (Shell_Surface : Shell_Surface_Ptr;
                                    Seat : Seat_Ptr;
                                    Serial : Unsigned_32
                                   ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access),
                        WL_SHELL_SURFACE_MOVE,
                        Seat.all'Address,
                        Serial    );
      end Shell_Surface_Move;

      procedure Shell_Surface_Resize (Shell_Surface : Shell_Surface_Ptr;
                                      Seat : Seat_Ptr;
                                      Serial : Unsigned_32;
                                      Edges : Unsigned_32
                                     ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access),
                        WL_SHELL_SURFACE_RESIZE,
                        Seat.all'Address,
                        Serial,
                        Edges    );
      end Shell_Surface_Resize;

      procedure Shell_Surface_Set_Toplevel (Shell_Surface : Shell_Surface_Ptr) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access), WL_SHELL_SURFACE_SET_TOPLEVEL);
      end Shell_Surface_Set_Toplevel;

      procedure Shell_Surface_Set_Transient (Shell_Surface : Shell_Surface_Ptr;
                                             Parent : Surface_Ptr;
                                             X : Integer;
                                             Y : Integer;
                                             Flags : Unsigned_32
                                            ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access),
                        WL_SHELL_SURFACE_SET_TRANSIENT,
                        Parent.all'Address,
                        X,
                        Y,
                        Flags    );
      end Shell_Surface_Set_Transient;

      procedure Shell_Surface_Set_Fullscreen (Shell_Surface : Shell_Surface_Ptr;
                                              Method : Unsigned_32;
                                              Framerate : Unsigned_32;
                                              Output : Output_Ptr
                                             ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access),
                        WL_SHELL_SURFACE_SET_FULLSCREEN,
                        Method,
                        Framerate,
                        Output.all'Address    );
      end Shell_Surface_Set_Fullscreen;

      procedure Shell_Surface_Set_Popup (Shell_Surface : Shell_Surface_Ptr;
                                         Seat : Seat_Ptr;
                                         Serial : Unsigned_32;
                                         Parent : Surface_Ptr;
                                         X : Integer;
                                         Y : Integer;
                                         Flags : Unsigned_32
                                        ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access),
                        WL_SHELL_SURFACE_SET_POPUP,
                        Seat.all'Address,
                        Serial,
                        Parent.all'Address,
                        X,
                        Y,
                        Flags    );
      end Shell_Surface_Set_Popup;

      procedure Shell_Surface_Set_Maximized (Shell_Surface : Shell_Surface_Ptr;
                                             Output : Output_Ptr
                                            ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access),
                        WL_SHELL_SURFACE_SET_MAXIMIZED,
                        Output.all'Address    );
      end Shell_Surface_Set_Maximized;

      procedure Shell_Surface_Set_Title (Shell_Surface : Shell_Surface_Ptr;
                                         Title : chars_ptr
                                        ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access),
                        WL_SHELL_SURFACE_SET_TITLE,
                        Title    );
      end Shell_Surface_Set_Title;

      procedure Shell_Surface_Set_Class (Shell_Surface : Shell_Surface_Ptr;
                                         Class_V : chars_ptr
                                        ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Shell_Surface.all'Access),
                        WL_SHELL_SURFACE_SET_CLASS,
                        Class_V    );
      end Shell_Surface_Set_Class;

      function Surface_Add_Listener (Surface : Surface_Ptr;
                                     Listener : Surface_Listener_Ptr;
                                     Data : Void_Ptr) return Interfaces.C.int is
      begin
         return wl_proxy_add_listener (Surface.all'Access, Listener.all'Address, Data);
      end Surface_Add_Listener;

      procedure Surface_Set_User_Data (Surface : Surface_Ptr;
                                       Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Surface.all'Access, Data);
      end Surface_Set_User_Data;

      function Surface_Get_User_Data (Surface : Surface_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Surface.all'Access);
      end Surface_Get_User_Data;

      function Surface_Get_Version (Surface : Surface_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Surface.all'Access);
      end Surface_Get_Version;

      procedure Surface_Destroy (Surface : Surface_Ptr) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Surface.all'Access),
                        WL_SURFACE_DESTROY);

         wl_proxy_destroy (Surface.all'Access);
      end Surface_Destroy;


      procedure Surface_Attach (Surface : Surface_Ptr;
                                Buffer : Buffer_Ptr;
                                X : Integer;
                                Y : Integer
                               ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Surface.all'Access),
                        WL_SURFACE_ATTACH,
                        Buffer.all'Address,
                        X,
                        Y    );
      end Surface_Attach;

      procedure Surface_Damage (Surface : Surface_Ptr;
                                X : Integer;
                                Y : Integer;
                                Width : Integer;
                                Height : Integer
                               ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Surface.all'Access),
                        WL_SURFACE_DAMAGE,
                        X,
                        Y,
                        Width,
                        Height    );
      end Surface_Damage;

      function Surface_Frame (Surface : Surface_Ptr) return Callback_Ptr is
         P : Proxy_Ptr := Proxy_Marshal_Constructor (Surface.all'Access,
                                                     WL_SURFACE_FRAME,
                                                     Callback_Interface'Access,
                                                     0);
      begin
         return (if P /= null then P.all'Access else null);
      end Surface_Frame;

      procedure Surface_Set_Opaque_Region (Surface : Surface_Ptr;
                                           Region : Region_Ptr
                                          ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Surface.all'Access),
                        WL_SURFACE_SET_OPAQUE_REGION,
                        Region.all'Address    );
      end Surface_Set_Opaque_Region;

      procedure Surface_Set_Input_Region (Surface : Surface_Ptr;
                                          Region : Region_Ptr
                                         ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Surface.all'Access),
                        WL_SURFACE_SET_INPUT_REGION,
                        Region.all'Address    );
      end Surface_Set_Input_Region;

      procedure Surface_Commit (Surface : Surface_Ptr) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Surface.all'Access), WL_SURFACE_COMMIT);
      end Surface_Commit;

      procedure Surface_Set_Buffer_Transform (Surface : Surface_Ptr;
                                              Transform : Integer
                                             ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Surface.all'Access),
                        WL_SURFACE_SET_BUFFER_TRANSFORM,
                        Transform    );
      end Surface_Set_Buffer_Transform;

      procedure Surface_Set_Buffer_Scale (Surface : Surface_Ptr;
                                          Scale : Integer
                                         ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Surface.all'Access),
                        WL_SURFACE_SET_BUFFER_SCALE,
                        Scale    );
      end Surface_Set_Buffer_Scale;

      procedure Surface_Damage_Buffer (Surface : Surface_Ptr;
                                       X : Integer;
                                       Y : Integer;
                                       Width : Integer;
                                       Height : Integer
                                      ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Surface.all'Access),
                        WL_SURFACE_DAMAGE_BUFFER,
                        X,
                        Y,
                        Width,
                        Height    );
      end Surface_Damage_Buffer;

      function Seat_Add_Listener (Seat : Seat_Ptr;
                                  Listener : Seat_Listener_Ptr;
                                  Data : Void_Ptr) return Interfaces.C.int is
      begin
         return wl_proxy_add_listener (Seat.all'Access, Listener.all'Address, Data);
      end Seat_Add_Listener;

      procedure Seat_Set_User_Data (Seat : Seat_Ptr;
                                    Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Seat.all'Access, Data);
      end Seat_Set_User_Data;

      function Seat_Get_User_Data (Seat : Seat_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Seat.all'Access);
      end Seat_Get_User_Data;

      function Seat_Get_Version (Seat : Seat_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Seat.all'Access);
      end Seat_Get_Version;

      procedure Seat_Destroy (Seat : Seat_Ptr) is
      begin
         wl_proxy_destroy (Seat.all'Access);
      end Seat_Destroy;

      function Seat_Get_Pointer (Seat : Seat_Ptr) return Pointer_Ptr is
         P : Proxy_Ptr := Proxy_Marshal_Constructor (Seat.all'Access,
                                                     WL_SEAT_GET_POINTER,
                                                     Pointer_Interface'Access,
                                                     0);
      begin
         return (if P /= null then P.all'Access else null);
      end Seat_Get_Pointer;

      function Seat_Get_Keyboard (Seat : Seat_Ptr) return Keyboard_Ptr is
         P : Proxy_Ptr := Proxy_Marshal_Constructor (Seat.all'Access,
                                                     WL_SEAT_GET_KEYBOARD,
                                                     Keyboard_Interface'Access,
                                                     0);
      begin
         return (if P /= null then P.all'Access else null);
      end Seat_Get_Keyboard;

      function Seat_Get_Touch (Seat : Seat_Ptr) return Touch_Ptr is
         P : Proxy_Ptr := Proxy_Marshal_Constructor (Seat.all'Access,
                                                     WL_SEAT_GET_TOUCH,
                                                     Touch_Interface'Access,
                                                     0);
      begin
         return (if P /= null then P.all'Access else null);
      end Seat_Get_Touch;

      procedure Seat_Release (Seat : Seat_Ptr) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Seat.all'Access), WL_SEAT_RELEASE);
      end Seat_Release;

      function Pointer_Add_Listener (Pointer : Pointer_Ptr;
                                     Listener : Pointer_Listener_Ptr;
                                     Data : Void_Ptr) return Interfaces.C.int is
      begin
         return wl_proxy_add_listener (Pointer.all'Access, Listener.all'Address, Data);
      end Pointer_Add_Listener;

      procedure Pointer_Set_User_Data (Pointer : Pointer_Ptr;
                                       Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Pointer.all'Access, Data);
      end Pointer_Set_User_Data;

      function Pointer_Get_User_Data (Pointer : Pointer_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Pointer.all'Access);
      end Pointer_Get_User_Data;

      function Pointer_Get_Version (Pointer : Pointer_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Pointer.all'Access);
      end Pointer_Get_Version;

      procedure Pointer_Destroy (Pointer : Pointer_Ptr) is
      begin
         wl_proxy_destroy (Pointer.all'Access);
      end Pointer_Destroy;

      procedure Pointer_Set_Cursor (Pointer : Pointer_Ptr;
                                    Serial : Unsigned_32;
                                    Surface : Surface_Ptr;
                                    Hotspot_X : Integer;
                                    Hotspot_Y : Integer
                                   ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Pointer.all'Access),
                        WL_POINTER_SET_CURSOR,
                        Serial,
                        Surface.all'Address,
                        Hotspot_X,
                        Hotspot_Y    );
      end Pointer_Set_Cursor;

      procedure Pointer_Release (Pointer : Pointer_Ptr) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Pointer.all'Access), WL_POINTER_RELEASE);
      end Pointer_Release;

      function Keyboard_Add_Listener (Keyboard : Keyboard_Ptr;
                                      Listener : Keyboard_Listener_Ptr;
                                      Data : Void_Ptr) return Interfaces.C.int is
      begin
         return wl_proxy_add_listener (Keyboard.all'Access, Listener.all'Address, Data);
      end Keyboard_Add_Listener;

      procedure Keyboard_Set_User_Data (Keyboard : Keyboard_Ptr;
                                        Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Keyboard.all'Access, Data);
      end Keyboard_Set_User_Data;

      function Keyboard_Get_User_Data (Keyboard : Keyboard_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Keyboard.all'Access);
      end Keyboard_Get_User_Data;

      function Keyboard_Get_Version (Keyboard : Keyboard_Ptr) return Unsigned_32 is
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

      function Touch_Add_Listener (Touch : Touch_Ptr;
                                   Listener : Touch_Listener_Ptr;
                                   Data : Void_Ptr) return Interfaces.C.int is
      begin
         return wl_proxy_add_listener (Touch.all'Access, Listener.all'Address, Data);
      end Touch_Add_Listener;

      procedure Touch_Set_User_Data (Touch : Touch_Ptr;
                                     Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Touch.all'Access, Data);
      end Touch_Set_User_Data;

      function Touch_Get_User_Data (Touch : Touch_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Touch.all'Access);
      end Touch_Get_User_Data;

      function Touch_Get_Version (Touch : Touch_Ptr) return Unsigned_32 is
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

      function Output_Add_Listener (Output : Output_Ptr;
                                    Listener : Output_Listener_Ptr;
                                    Data : Void_Ptr) return Interfaces.C.int is
      begin
         return wl_proxy_add_listener (Output.all'Access, Listener.all'Address, Data);
      end Output_Add_Listener;

      procedure Output_Set_User_Data (Output : Output_Ptr;
                                      Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Output.all'Access, Data);
      end Output_Set_User_Data;

      function Output_Get_User_Data (Output : Output_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Output.all'Access);
      end Output_Get_User_Data;

      function Output_Get_Version (Output : Output_Ptr) return Unsigned_32 is
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

      procedure Region_Set_User_Data (Region : Region_Ptr;
                                      Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Region.all'Access, Data);
      end Region_Set_User_Data;

      function Region_Get_User_Data (Region : Region_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Region.all'Access);
      end Region_Get_User_Data;

      function Region_Get_Version (Region : Region_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Region.all'Access);
      end Region_Get_Version;

      procedure Region_Destroy (Region : Region_Ptr) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Region.all'Access),
                        WL_REGION_DESTROY);

         wl_proxy_destroy (Region.all'Access);
      end Region_Destroy;


      procedure Region_Add (Region : Region_Ptr;
                            X : Integer;
                            Y : Integer;
                            Width : Integer;
                            Height : Integer
                           ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Region.all'Access),
                        WL_REGION_ADD,
                        X,
                        Y,
                        Width,
                        Height    );
      end Region_Add;

      procedure Region_Subtract (Region : Region_Ptr;
                                 X : Integer;
                                 Y : Integer;
                                 Width : Integer;
                                 Height : Integer
                                ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Region.all'Access),
                        WL_REGION_SUBTRACT,
                        X,
                        Y,
                        Width,
                        Height    );
      end Region_Subtract;

      procedure Subcompositor_Set_User_Data (Subcompositor : Subcompositor_Ptr;
                                             Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Subcompositor.all'Access, Data);
      end Subcompositor_Set_User_Data;

      function Subcompositor_Get_User_Data (Subcompositor : Subcompositor_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Subcompositor.all'Access);
      end Subcompositor_Get_User_Data;

      function Subcompositor_Get_Version (Subcompositor : Subcompositor_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Subcompositor.all'Access);
      end Subcompositor_Get_Version;

      procedure Subcompositor_Destroy (Subcompositor : Subcompositor_Ptr) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Subcompositor.all'Access),
                        WL_SUBCOMPOSITOR_DESTROY);

         wl_proxy_destroy (Subcompositor.all'Access);
      end Subcompositor_Destroy;


      function Subcompositor_Get_Subsurface (Subcompositor : Subcompositor_Ptr;
                                             Surface : Surface_Ptr;
                                             Parent : Surface_Ptr
                                            ) return Subsurface_Ptr is
         P : Proxy_Ptr := Proxy_Marshal_Constructor (Subcompositor.all'Access,
                                                     WL_SUBCOMPOSITOR_GET_SUBSURFACE,
                                                     Subsurface_Interface'Access,
                                                     0,
                                                     Surface.all'Address,
                                                     Parent.all'Address    );
      begin
         return (if P /= null then P.all'Access else null);
      end Subcompositor_Get_Subsurface;

      procedure Subsurface_Set_User_Data (Subsurface : Subsurface_Ptr;
                                          Data : Void_Ptr) is
      begin
         wl_proxy_set_user_data (Subsurface.all'Access, Data);
      end Subsurface_Set_User_Data;

      function Subsurface_Get_User_Data (Subsurface : Subsurface_Ptr) return Void_Ptr is
      begin
         return wl_proxy_get_user_data (Subsurface.all'Access);
      end Subsurface_Get_User_Data;

      function Subsurface_Get_Version (Subsurface : Subsurface_Ptr) return Unsigned_32 is
      begin
         return wl_proxy_get_version (Subsurface.all'Access);
      end Subsurface_Get_Version;

      procedure Subsurface_Destroy (Subsurface : Subsurface_Ptr) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Subsurface.all'Access),
                        WL_SUBSURFACE_DESTROY);

         wl_proxy_destroy (Subsurface.all'Access);
      end Subsurface_Destroy;


      procedure Subsurface_Set_Position (Subsurface : Subsurface_Ptr;
                                         X : Integer;
                                         Y : Integer
                                        ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Subsurface.all'Access),
                        WL_SUBSURFACE_SET_POSITION,
                        X,
                        Y    );
      end Subsurface_Set_Position;

      procedure Subsurface_Place_Above (Subsurface : Subsurface_Ptr;
                                        Sibling : Surface_Ptr
                                       ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Subsurface.all'Access),
                        WL_SUBSURFACE_PLACE_ABOVE,
                        Sibling.all'Address    );
      end Subsurface_Place_Above;

      procedure Subsurface_Place_Below (Subsurface : Subsurface_Ptr;
                                        Sibling : Surface_Ptr
                                       ) is
      begin
         Proxy_Marshal (Proxy_Ptr'(Subsurface.all'Access),
                        WL_SUBSURFACE_PLACE_BELOW,
                        Sibling.all'Address    );
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
   
   use type Wl_Thin.Proxy_Ptr;

   subtype Registry_Global_Subprogram_Ptr is Wl_Thin.Registry_Global_Subprogram_Ptr;

   subtype Registry_Global_Remove_Subprogram_Ptr is Wl_Thin.Registry_Global_Remove_Subprogram_Ptr;

   subtype Registry_Listener_T is Wl_Thin.Registry_Listener_T;

   subtype Registry_Listener_Ptr is Wl_Thin.Registry_Listener_Ptr;

   package body Registry_Events is

      package Conv is new System.Address_To_Access_Conversions (Data_Type);
      
      procedure Internal_Object_Added (Unused_Data : Void_Ptr;
                                       Registry    : Wl_Thin.Registry_Ptr;
                                       Id          : Wl.Unsigned_32;
                                       Interface_V : Wl.chars_ptr;
                                       Version     : Wl.Unsigned_32) with
        Convention => C,
        Global     => null;

      procedure Internal_Object_Added (Unused_Data : Void_Ptr;
                                       Registry    : Wl_Thin.Registry_Ptr;
                                       Id          : Wl.Unsigned_32;
                                       Interface_V : Wl.chars_ptr;
                                       Version     : Wl.Unsigned_32)
      is
--         pragma Unreferenced (Unused_Data);

         R : Wl.Registry := (
                             My_Registry                 => Registry,
                             My_Has_Started_Subscription => True
                            );
      begin
         Global_Object_Added (Data_Ptr (Conv.To_Pointer (Unused_Data)),
                              R, Id, Value (Interface_V), Version);
      end Internal_Object_Added;

      procedure Internal_Object_Removed (Unused_Data : Void_Ptr;
                                         Registry    : Wl_Thin.Registry_Ptr;
                                         Id          : Wl.Unsigned_32) with
        Convention => C;

      procedure Internal_Object_Removed (Unused_Data : Void_Ptr;
                                         Registry    : Wl_Thin.Registry_Ptr;
                                         Id          : Wl.Unsigned_32)
      is
         R : Wl.Registry := (
                             My_Registry                 => Registry,
                             My_Has_Started_Subscription => True
                            );
      begin
         Global_Object_Removed (Data_Ptr (Conv.To_Pointer (Unused_Data)), R, Id);
      end Internal_Object_Removed;

      Listener : aliased Wl.Registry_Listener_T :=
        (
         Global        => Internal_Object_Added'Unrestricted_Access,
         Global_Remove => Internal_Object_Removed'Unrestricted_Access
        );
      -- Note: It should be safe to use Unrestricted_Access here since
      -- this generic can only be instantiated at library level.

      procedure Subscribe (Registry : in out Wl.Registry;
                           Data     : not null Data_Ptr) is
         I : Px.int;
      begin
         I := Wl_Thin.Registry_Add_Listener (Registry.My_Registry,
                                             Listener'Access,
                                             Data.all'Address);
      end Subscribe;

   end Registry_Events;
   
   package body Shell_Surface_Events is

      procedure Internal_Shell_Surface_Ping
        (Unused_Data : Void_Ptr;
         Surface     : Wl_Thin.Shell_Surface_Ptr;
         Serial      : Unsigned_32) with
        Convention => C;

      procedure Internal_Shell_Surface_Configure
        (Unused_Data : Void_Ptr;
         Surface     : Wl_Thin.Shell_Surface_Ptr;
         Edges       : Unsigned_32;
         Width       : Integer;
         Height      : Integer) with
        Convention => C;

      procedure Internal_Shell_Surface_Popup_Done
        (Unused_Data : Void_Ptr;
         Surface     : Wl_Thin.Shell_Surface_Ptr) with
        Convention => C;

      procedure Internal_Shell_Surface_Ping
        (Unused_Data : Void_Ptr;
         Surface     : Wl_Thin.Shell_Surface_Ptr;
         Serial      : Unsigned_32)
      is
         S : Wl.Shell_Surface := (My_Shell_Surface => Surface);
      begin
         Shell_Surface_Ping (Data, S, Serial);
      end Internal_Shell_Surface_Ping;

      procedure Internal_Shell_Surface_Configure
        (Unused_Data : Void_Ptr;
         Surface     : Wl_Thin.Shell_Surface_Ptr;
         Edges       : Unsigned_32;
         Width       : Integer;
         Height      : Integer)
      is
         S : Wl.Shell_Surface := (My_Shell_Surface => Surface);
      begin
         Shell_Surface_Configure (Data, S, Edges, Width, Height);
      end Internal_Shell_Surface_Configure;

      procedure Internal_Shell_Surface_Popup_Done
        (Unused_Data : Void_Ptr;
         Surface     : Wl_Thin.Shell_Surface_Ptr)
      is
         S : Wl.Shell_Surface := (My_Shell_Surface => Surface);
      begin
         Shell_Surface_Popup_Done (Data, S);
      end Internal_Shell_Surface_Popup_Done;

      Listener : aliased Wl_Thin.Shell_Surface_Listener_T :=
        (
         Ping       => Internal_Shell_Surface_Ping'Unrestricted_Access,
         Configure  => Internal_Shell_Surface_Configure'Unrestricted_Access,
         Popup_Done => Internal_Shell_Surface_Popup_Done'Unrestricted_Access
        );

      procedure Subscribe (Surface : in out Wl.Shell_Surface) is
         I : Px.int;
      begin
         I := Wl_Thin.Shell_Surface_Add_Listener
           (Surface.My_Shell_Surface,
            Listener'Unchecked_Access,
            Nil);
      end Subscribe;

   end Shell_Surface_Events;

   package body Seat_Events is

      procedure Internal_Seat_Capabilities (Unused_Data  : Void_Ptr;
                                            Seat         : Wl_Thin.Seat_Ptr;
                                            Capabilities : Unsigned_32) with
        Convention => C;

      procedure Internal_Seat_Capabilities (Unused_Data  : Void_Ptr;
                                            Seat         : Wl_Thin.Seat_Ptr;
                                            Capabilities : Unsigned_32)
      is
         S : Wl.Seat := (
                         My_Seat                     => Seat,
                         My_Has_Started_Subscription => True
                        );
      begin
         Seat_Capabilities (Data, S, Capabilities);
      end Internal_Seat_Capabilities;

      procedure Internal_Seat_Name (Unused_Data : Void_Ptr;
                                    Seat        : Wl_Thin.Seat_Ptr;
                                    Name        : Interfaces.C.Strings.chars_ptr) with
        Convention => C;

      procedure Internal_Seat_Name (Unused_Data : Void_Ptr;
                                    Seat        : Wl_Thin.Seat_Ptr;
                                    Name        : Interfaces.C.Strings.chars_ptr)
      is
         N : String := Interfaces.C.Strings.Value (Name);

         S : Wl.Seat := (
                         My_Seat                     => Seat,
                         My_Has_Started_Subscription => True
                        );
      begin
         Seat_Name (Data, S, N);
      end Internal_Seat_Name;

      Seat_Listener : aliased Wl_Thin.Seat_Listener_T :=
        (
         Capabilities => Internal_Seat_Capabilities'Unrestricted_Access,
         Name         => Internal_Seat_Name'Unrestricted_Access
        );

      procedure Subscribe (S : in out Wl.Seat) is
         I : Px.int;
      begin
         I := Wl_Thin.Seat_Add_Listener (Seat     => S.My_Seat,
                                         Listener => Seat_Listener'Unchecked_Access,
                                         Data     => Nil);
      end Subscribe;

   end Seat_Events;

   package body Pointer_Events is

      procedure Internal_Pointer_Enter
        (Unused_Data : Void_Ptr;
         Pointer     : Wl_Thin.Pointer_Ptr;
         Serial      : Unsigned_32;
         Surface     : Wl_Thin.Surface_Ptr;
         Surface_X   : Wl.Fixed;
         Surface_Y   : Wl.Fixed) with
        Convention => C;

      procedure Internal_Pointer_Leave
        (Unused_Data : Void_Ptr;
         Pointer     : Wl_Thin.Pointer_Ptr;
         Serial      : Unsigned_32;
         Surface     : Wl_Thin.Surface_Ptr) with
        Convention => C;

      procedure Internal_Pointer_Motion
        (Data      : Void_Ptr;
         Pointer   : Wl_Thin.Pointer_Ptr;
         Time      : Unsigned_32;
         Surface_X : Wl.Fixed;
         Surface_Y : Wl.Fixed) with
        Convention => C;

      procedure Internal_Pointer_Button
        (Unused_Data : Void_Ptr;
         Pointer     : Wl_Thin.Pointer_Ptr;
         Serial      : Unsigned_32;
         Time        : Unsigned_32;
         Button      : Unsigned_32;
         State       : Unsigned_32) with
        Convention => C;

      procedure Internal_Pointer_Axis
        (Data    : Void_Ptr;
         Pointer : Wl_Thin.Pointer_Ptr;
         Time    : Unsigned_32;
         Axis    : Unsigned_32;
         Value   : Wl.Fixed) with
        Convention => C;

      procedure Internal_Pointer_Frame (Data    : Void_Ptr;
                                        Pointer : Wl_Thin.Pointer_Ptr) with
        Convention => C;

      procedure Internal_Pointer_Axis_Source
        (Data        : Void_Ptr;
         Pointer     : Wl_Thin.Pointer_Ptr;
         Axis_Source : Unsigned_32) with
        Convention => C;

      procedure Internal_Pointer_Axis_Stop
        (Data    : Void_Ptr;
         Pointer : Wl_Thin.Pointer_Ptr;
         Time    : Unsigned_32;
         Axis    : Unsigned_32) with
        Convention => C;

      procedure Internal_Pointer_Axis_Discrete
        (Data     : Void_Ptr;
         Pointer  : Wl_Thin.Pointer_Ptr;
         Axis     : Unsigned_32;
         Discrete : Integer) with
        Convention => C;

      procedure Internal_Pointer_Enter
        (Unused_Data : Void_Ptr;
         Pointer     : Wl_Thin.Pointer_Ptr;
         Serial      : Unsigned_32;
         Surface     : Wl_Thin.Surface_Ptr;
         Surface_X   : Wl.Fixed;
         Surface_Y   : Wl.Fixed)
      is
         P : Wl.Pointer := (My_Pointer => Pointer);
         S : Wl.Surface := (My_Surface => Surface);
      begin
         Pointer_Enter (Data, P, Serial, S, Surface_X, Surface_Y);
      end Internal_Pointer_Enter;

      procedure Internal_Pointer_Leave
        (Unused_Data : Void_Ptr;
         Pointer     : Wl_Thin.Pointer_Ptr;
         Serial      : Unsigned_32;
         Surface     : Wl_Thin.Surface_Ptr)
      is
         P : Wl.Pointer := (My_Pointer => Pointer);
         S : Wl.Surface := (My_Surface => Surface);
      begin
         Pointer_Leave (Data, P, Serial, S);
      end Internal_Pointer_Leave;

      procedure Internal_Pointer_Motion
        (Data      : Void_Ptr;
         Pointer   : Wl_Thin.Pointer_Ptr;
         Time      : Unsigned_32;
         Surface_X : Wl.Fixed;
         Surface_Y : Wl.Fixed) is
      begin
         null;
      end Internal_Pointer_Motion;

      procedure Internal_Pointer_Button
        (Unused_Data : Void_Ptr;
         Pointer     : Wl_Thin.Pointer_Ptr;
         Serial      : Unsigned_32;
         Time        : Unsigned_32;
         Button      : Unsigned_32;
         State       : Unsigned_32)
      is
         P : Wl.Pointer := (My_Pointer => Pointer);
      begin
         Pointer_Button (Data, P, Serial, Time, Button, State);
      end Internal_Pointer_Button;

      procedure Internal_Pointer_Axis
        (Data    : Void_Ptr;
         Pointer : Wl_Thin.Pointer_Ptr;
         Time    : Unsigned_32;
         Axis    : Unsigned_32;
         Value   : Wl.Fixed) is
      begin
         null;
      end Internal_Pointer_Axis;

      procedure Internal_Pointer_Frame (Data    : Void_Ptr;
                                        Pointer : Wl_Thin.Pointer_Ptr) is
      begin
         null;
      end Internal_Pointer_Frame;

      procedure Internal_Pointer_Axis_Source
        (Data        : Void_Ptr;
         Pointer     : Wl_Thin.Pointer_Ptr;
         Axis_Source : Unsigned_32) is
      begin
         null;
      end Internal_Pointer_Axis_Source;

      procedure Internal_Pointer_Axis_Stop
        (Data    : Void_Ptr;
         Pointer : Wl_Thin.Pointer_Ptr;
         Time    : Unsigned_32;
         Axis    : Unsigned_32) is
      begin
         null;
      end Internal_Pointer_Axis_Stop;

      procedure Internal_Pointer_Axis_Discrete
        (Data     : Void_Ptr;
         Pointer  : Wl_Thin.Pointer_Ptr;
         Axis     : Unsigned_32;
         Discrete : Integer) is
      begin
         null;
      end Internal_Pointer_Axis_Discrete;

      Pointer_Listener : aliased Wl_Thin.Pointer_Listener_T :=
        (
         Enter         => Internal_Pointer_Enter'Unrestricted_Access,
         Leave         => Internal_Pointer_Leave'Unrestricted_Access,
         Motion        => Internal_Pointer_Motion'Unrestricted_Access,
         Button        => Internal_Pointer_Button'Unrestricted_Access,
         Axis          => Internal_Pointer_Axis'Unrestricted_Access,
         Frame         => Internal_Pointer_Frame'Unrestricted_Access,
         Axis_Source   => Internal_Pointer_Axis_Source'Unrestricted_Access,
         Axis_Stop     => Internal_Pointer_Axis_Stop'Unrestricted_Access,
         Axis_Discrete => Internal_Pointer_Axis_Discrete'Unrestricted_Access
        );

      procedure Subscribe (P : in out Wl.Pointer) is
         I : Px.int;
      begin
         I := Wl_Thin.Pointer_Add_Listener (Pointer  => P.My_Pointer,
                                            Listener => Pointer_Listener'Unrestricted_Access,
                                            Data     => Nil);
      end Subscribe;

   end Pointer_Events;

   procedure Connect (Display : in out Wl.Display;
                      Name    : C_String) is
   begin
      Display.My_Display := Wl_Thin.Display_Connect (Name);
   end Connect;

   procedure Disconnect (Display : in out Wl.Display) is
   begin
      if Display.My_Display /= null then
         Wl_Thin.Display_Disconnect (Display.My_Display);
      end if;
   end Disconnect;

   function Get_Version (Display : Wl.Display) return Unsigned_32 is
   begin
      return Wl_Thin.Display_Get_Version (Display.My_Display);
   end Get_Version;
   
   procedure Get_Registry (Display  : Wl.Display;
                           Registry : in out Wl.Registry) is
   begin
      Registry.My_Registry := Wl_Thin.Display_Get_Registry (Display.My_Display);
   end Get_Registry;

   procedure Destroy (Registry : in out Wl.Registry) is
   begin
      if Registry.My_Registry /= null then
         Wl_Thin.Registry_Destroy (Registry.My_Registry);
         Registry.My_Registry := null;
      end if;
   end Destroy;

   function Dispatch (Display : Wl.Display) return Int is
   begin
      return Wl_Thin.Display_Dispatch (Display.My_Display);
   end Dispatch;

   procedure Dispatch (Display : Wl.Display) is
      I : Int;
      pragma Unreferenced (I);
   begin
      I := Display.Dispatch;
   end Dispatch;

   function Roundtrip (Display : Wl.Display) return Int is
   begin
      return Wl_Thin.Display_Roundtrip (Display.My_Display);
   end Roundtrip;

   procedure Roundtrip (Display : Wl.Display) is
      I : Int;
      pragma Unreferenced (I);
   begin
      I := Display.Roundtrip;
   end Roundtrip;

   procedure Get_Proxy (Compositor  : in out Wl.Compositor;
                        Registry    : Wl.Registry;
                        Id          : Unsigned_32;
                        Version     : Unsigned_32)
   is
      P : Wl_Thin.Proxy_Ptr :=
        Wl_Thin.Registry_Bind (Registry    => Registry.My_Registry,
                               Name        => Id,
                               Interface_V => Wl_Thin.Compositor_Interface'Access,
                               New_Id      => Version);

   begin
      if P /= null then
         Compositor.My_Compositor := P.all'Access;
      end if;
   end Get_Proxy;

   procedure Get_Surface_Proxy (Compositor : Wl.Compositor;
                             Surface    : in out Wl.Surface) is
   begin
      Surface.My_Surface :=
        Wl_Thin.Compositor_Create_Surface (Compositor.My_Compositor);
   end Get_Surface_Proxy;

   procedure Get_Region_Proxy (Compositor : Wl.Compositor;
                               Region     : in out Wl.Region) is
   begin
      Region.My_Region :=
        Wl_Thin.Compositor_Create_Region (Compositor.My_Compositor);
   end Get_Region_Proxy;

   procedure Destroy (Compositor : in out Wl.Compositor) is
   begin
      if Compositor.My_Compositor /= null then
         Wl_Thin.Compositor_Destroy (Compositor.My_Compositor);
         Compositor.My_Compositor := null;
      end if;
   end Destroy;

   function Get_Version (Seat : Wl.Seat) return Unsigned_32 is
   begin
      return Wl_Thin.Seat_Get_Version (Seat.My_Seat);
   end Get_Version;
   
   procedure Get_Proxy (Seat     : in out Wl.Seat;
                        Registry : Wl.Registry;
                        Id       : Unsigned_32;
                        Version  : Unsigned_32)
   is
      P : Wl_Thin.Proxy_Ptr :=
        Wl_Thin.Registry_Bind (Registry    => Registry.My_Registry,
                               Name        => Id,
                               Interface_V => Wl_Thin.Seat_Interface'Access,
                               New_Id      => Version);

   begin
      if P /= null then
         Seat.My_Seat := P.all'Access;
      end if;
   end Get_Proxy;

   procedure Get_Pointer (Seat    : Wl.Seat;
                          Pointer : in out Wl.Pointer) is
   begin
      Pointer.My_Pointer := Wl_Thin.Seat_Get_Pointer (Seat.My_Seat);
   end Get_Pointer;

   procedure Get_Keyboard (Seat     : Wl.Seat;
                           Keyboard : in out Wl.Keyboard) is
   begin
      Keyboard.My_Keyboard := Wl_Thin.Seat_Get_Keyboard (Seat.My_Seat);
   end Get_Keyboard;
   
   procedure Get_Touch (Seat  : Wl.Seat;
                        Touch : in out Wl.Touch) is
   begin
      Touch.My_Touch := Wl_Thin.Seat_Get_Touch (Seat.My_Seat);
   end Get_Touch;
   
   procedure Release (Seat : in out Wl.Seat) is
   begin
      Wl_Thin.Seat_Release (Seat.My_Seat);
      Seat.My_Seat := null;
   end Release;
   
   procedure Get_Proxy (Shell    : in out Wl.Shell;
                        Registry : Wl.Registry;
                        Id       : Unsigned_32;
                        Version  : Unsigned_32)
   is
      P : Wl_Thin.Proxy_Ptr :=
        Wl_Thin.Registry_Bind (Registry    => Registry.My_Registry,
                               Name        => Id,
                               Interface_V => Wl_Thin.Shell_Interface'Access,
                               New_Id      => Version);

   begin
      if P /= null then
         Shell.My_Shell := P.all'Access;
      end if;
   end Get_Proxy;

   procedure Get_Shell_Surface (Shell         : Wl.Shell;
                                Surface       : Wl.Surface;
                                Shell_Surface : in out Wl.Shell_Surface) is
   begin
      Shell_Surface.My_Shell_Surface :=
        Wl_Thin.Shell_Get_Shell_Surface (Shell.My_Shell, Surface.My_Surface);
   end Get_Shell_Surface;

   procedure Get_Proxy (Shm      : in out Wl.Shm;
                        Registry : Wl.Registry;
                        Id       : Unsigned_32;
                        Version  : Unsigned_32)
   is
      P : Wl_Thin.Proxy_Ptr :=
        Wl_Thin.Registry_Bind (Registry    => Registry.My_Registry,
                               Name        => Id,
                               Interface_V => Wl_Thin.Shm_Interface'Access,
                               New_Id      => Version);

   begin
      if P /= null then
         Shm.My_Shm := P.all'Access;
      end if;
   end Get_Proxy;

   procedure Create_Pool (Shm             : Wl.Shm;
                          File_Descriptor : File;
                          Size            : Integer;
                          Pool            : in out Wl.Shm_Pool) is
   begin
      Pool.My_Shm_Pool := Wl_Thin.Shm_Create_Pool
        (Shm.My_Shm,
         File_Descriptor.My_File_Descriptor,
         Size);
   end Create_Pool;

   function Get_Version (Shm : Wl.Shm) return Unsigned_32 is
   begin
      return Wl_Thin.Shm_Get_Version (Shm.My_Shm);
   end Get_Version;
   
   procedure Destroy (Shm : in out Wl.Shm) is
   begin
      if Shm.My_Shm /= null then
         Wl_Thin.Shm_Destroy (Shm.My_Shm);
         Shm.My_Shm := null;
      end if;
   end Destroy;
   
   procedure Create_Buffer (Pool   : Wl.Shm_Pool;
                            Offset   : Integer;
                            Width    : Integer;
                            Height   : Integer;
                            Stride   : Integer;
                            Format   : Shm_Format;
                            Buffer : in out Wl.Buffer) is
   begin
      Buffer.My_Buffer := Wl_Thin.Shm_Pool_Create_Buffer (Pool.My_Shm_Pool,
                                                          Offset,
                                                          Width,
                                                          Height,
                                                          Stride,
                                                          Unsigned_32 (Format));
   end Create_Buffer;

   procedure Resize (Pool : Wl.Shm_Pool;
                     Size : Integer) is
   begin
      Wl_Thin.Shm_Pool_Resize (Pool.My_Shm_Pool, Size);
   end Resize;

   function Get_Version (Pool : Wl.Shm_Pool) return Unsigned_32 is
   begin
      return Wl_Thin.Shm_Pool_Get_Version (Pool.My_Shm_Pool);
   end Get_Version;
   
   procedure Destroy (Pool : in out Wl.Shm_Pool) is
   begin
      if Pool.My_Shm_Pool /= null then
         Wl_Thin.Shm_Pool_Destroy (Pool.My_Shm_Pool);
         Pool.My_Shm_Pool := null;
      end if;
   end Destroy;

   function Get_Version (Buffer : Wl.Buffer) return Unsigned_32 is
   begin
      return Wl_Thin.Buffer_Get_Version (Buffer.My_Buffer);
   end Get_Version;
   
   procedure Destroy (Buffer : in out Wl.Buffer) is
   begin
      if Buffer.My_Buffer /= null then
         Wl_Thin.Buffer_Destroy (Buffer.My_Buffer);
         Buffer.My_Buffer := null;
      end if;
   end Destroy;

   function Has_Proxy (Offer : Wl.Data_Offer) return Boolean is
      (Offer.My_Data_Offer /= null);

   function Get_Version (Offer : Wl.Data_Offer) return Unsigned_32 is
   begin
      return Wl_Thin.Data_Offer_Get_Version (Offer.My_Data_Offer);
   end Get_Version;
   
   procedure Destroy (Offer : in out Wl.Data_Offer) is
   begin
      if Offer.My_Data_Offer /= null then
         Wl_Thin.Data_Offer_Destroy (Offer.My_Data_Offer);
         Offer.My_Data_Offer := null;
      end if;
   end Destroy;

   procedure Do_Accept (Offer     : Data_Offer;
                        Serial    : Unsigned_32;
                        Mime_Type : C_String) is
   begin
      Wl_Thin.Proxy_Marshal (Wl_Thin.Proxy_Ptr'(Offer.My_Data_Offer.all'Access),
                             WL_DATA_OFFER_ACCEPT,
                             Serial,
                             Mime_Type);

   end Do_Accept;

   procedure Do_Not_Accept (Offer  : Data_Offer;
                            Serial : Unsigned_32) is
   begin
      Wl_Thin.Data_Offer_Accept (Offer.My_Data_Offer,
                                 Serial,
                                 Interfaces.C.Strings.Null_Ptr);
   end Do_Not_Accept;
   
   procedure Receive (Offer           : Data_Offer;
                      Mime_Type       : C_String;
                      File_Descriptor : Integer) is
   begin
      Wl_Thin.Data_Offer_Receive (Offer.My_Data_Offer, Mime_Type, File_Descriptor);
   end Receive;

   procedure Finish (Offer : Data_Offer) is
   begin
      Wl_Thin.Data_Offer_Finish (Offer.My_Data_Offer);
   end Finish;

   procedure Set_Actions (Offer            : Data_Offer;
                          Dnd_Actions      : Unsigned_32;
                          Preferred_Action : Unsigned_32) is
   begin
      Wl_Thin.Data_Offer_Set_Actions (Offer.My_Data_Offer,
                                      Dnd_Actions,
                                      Preferred_Action);
   end Set_Actions;

   function Get_Version (Surface : Shell_Surface) return Unsigned_32 is
   begin
      return Wl_Thin.Shell_Surface_Get_Version (Surface.My_Shell_Surface);
   end Get_Version;
   
   procedure Destroy (Surface : in out Shell_Surface) is
   begin
      if Surface.My_Shell_Surface /= null then
         Wl_Thin.Shell_Surface_Destroy (Surface.My_Shell_Surface);
         Surface.My_Shell_Surface := null;
      end if;
   end Destroy;

   procedure Pong (Surface : Wl.Shell_Surface;
                   Serial  : Unsigned_32) is
   begin
      Wl_Thin.Shell_Surface_Pong (Surface.My_Shell_Surface, Serial);
   end Pong;
   
   procedure Move (Surface : Shell_Surface;
                   Seat    : Wl.Seat;
                   Serial  : Unsigned_32) is
   begin
      Wl_Thin.Shell_Surface_Move (Surface.My_Shell_Surface,
                                  Seat.My_Seat,
                                  Serial);
   end Move;

   procedure Resize (Surface : Shell_Surface;
                     Seat    : Wl.Seat;
                     Serial  : Unsigned_32;
                     Edges   : Unsigned_32) is
   begin
      Wl_Thin.Shell_Surface_Resize (Surface.My_Shell_Surface,
                                    Seat.My_Seat,
                                    Serial,
                                    Edges);
   end Resize;
   
   procedure Set_Toplevel (Surface : Wl.Shell_Surface) is
   begin
      Wl_Thin.Shell_Surface_Set_Toplevel (Surface.My_Shell_Surface);
   end Set_Toplevel;

   procedure Set_Transient (Surface : Shell_Surface;
                            Parent  : Wl.Surface;
                            X       : Integer;
                            Y       : Integer;
                            Flags   : Unsigned_32) is
   begin
      Wl_Thin.Shell_Surface_Set_Transient (Surface.My_Shell_Surface,
                                           Parent.My_Surface,
                                           X,
                                           Y,
                                           Flags);
   end Set_Transient;
   
   procedure Set_Fullscreen (Surface   : Shell_Surface;
                             Method    : Unsigned_32;
                             Framerate : Unsigned_32;
                             Output    : Wl.Output) is
   begin
      Wl_Thin.Shell_Surface_Set_Fullscreen (Surface.My_Shell_Surface,
                                            Method,
                                            Framerate,
                                            Output.My_Output);
   end Set_Fullscreen;
   
   procedure Set_Popup (Surface : Shell_Surface;
                        Seat    : Wl.Seat;
                        Serial  : Unsigned_32;
                        Parent  : Wl.Surface;
                        X       : Integer;
                        Y       : Integer;
                        Flags   : Unsigned_32) is
   begin
      Wl_Thin.Shell_Surface_Set_Popup (Surface.My_Shell_Surface,
                                       Seat.My_Seat,
                                       Serial,
                                       Parent.My_Surface,
                                       X,
                                       Y,
                                       Flags);
   end Set_Popup;
   
   procedure Set_Maximized (Surface : Shell_Surface;
                            Output  : Wl.Output) is
   begin
      Wl_Thin.Shell_Surface_Set_Maximized (Surface.My_Shell_Surface,
                                           Output.My_Output);
   end Set_Maximized;
   
   procedure Set_Title (Surface : Shell_Surface;
                        Title   : C_String) is
   begin
      Wl_Thin.Proxy_Marshal
        (Wl_Thin.Proxy_Ptr'(Surface.My_Shell_Surface.all'Access),
         WL_SHELL_SURFACE_SET_TITLE,
         Title);
   end Set_Title;
   
   procedure Set_Class (Surface : Shell_Surface;
                        Class_V : C_String) is
   begin
      Wl_Thin.Proxy_Marshal
        (Wl_Thin.Proxy_Ptr'(Surface.My_Shell_Surface.all'Access),
         WL_SHELL_SURFACE_SET_CLASS,
         Class_V);
   end Set_Class;
   
   procedure Attach (Surface : Wl.Surface;
                     Buffer  : Wl.Buffer;
                     X       : Integer;
                     Y       : Integer) is
   begin
      Wl_Thin.Surface_Attach (Surface.My_Surface, Buffer.My_Buffer, X, Y);
   end Attach;

   procedure Damage (Surface : Wl.Surface;
                     X       : Integer;
                     Y       : Integer;
                     Width   : Integer;
                     Height  : Integer) is
   begin
      Wl_Thin.Surface_Damage (Surface.My_Surface, X, Y, Width, Height);
   end Damage;
   
   function Frame (Surface : Wl.Surface) return Callback is
   begin
      return C : Callback do
         C.My_Callback := Wl_Thin.Surface_Frame (Surface.My_Surface);
      end return;
   end Frame;
   
   procedure Set_Opaque_Region (Surface : Wl.Surface;
                                Region  : Wl.Region) is
   begin
      Wl_Thin.Surface_Set_Opaque_Region (Surface.My_Surface,
                                         Region.My_Region);
   end Set_Opaque_Region;
   
   procedure Set_Input_Region (Surface : Wl.Surface;
                               Region  : Wl.Region) is
   begin
      Wl_Thin.Surface_Set_Input_Region (Surface.My_Surface,
                                        Region.My_Region);
      
   end Set_Input_Region;
   
   procedure Commit (Surface : Wl.Surface) is
   begin
      Wl_Thin.Surface_Commit (Surface.My_Surface);
   end Commit;

   procedure Set_Buffer_Transform (Surface   : Wl.Surface;
                                   Transform : Integer) is
   begin
      Wl_Thin.Surface_Set_Buffer_Transform (Surface.My_Surface,
                                            Transform);
   end Set_Buffer_Transform;
   
   procedure Set_Buffer_Scale (Surface : Wl.Surface;
                               Scale   : Integer) is
   begin
      Wl_Thin.Surface_Set_Buffer_Scale (Surface.My_Surface,
                                        Scale);
   end Set_Buffer_Scale;
   
   procedure Damage_Buffer (Surface : Wl.Surface;
                            X       : Integer;
                            Y       : Integer;
                            Width   : Integer;
                            Height  : Integer) is
   begin
      Wl_Thin.Surface_Damage_Buffer (Surface.My_Surface, X, Y, Width, Height);
   end Damage_Buffer;
   
   procedure Destroy (Surface : in out Wl.Surface) is
   begin
      if Surface.My_Surface /= null then
         Wl_Thin.Surface_Destroy (Surface.My_Surface);
         Surface.My_Surface := null;
      end if;
   end Destroy;

   function Sync (Display : Wl.Display) return Callback is
   begin
      return Callback : Wl.Callback do
         Callback.My_Callback := Wl_Thin.Display_Sync (Display.My_Display);
      end return;
   end Sync;

   function Get_Version (Registry : Wl.Registry) return Unsigned_32 is
   begin
      return Wl_Thin.Registry_Get_Version (Registry.My_Registry);
   end Get_Version;

   function Has_Proxy (Callback : Wl.Callback) return Boolean is
      (Callback.My_Callback /= null);
   
   procedure Destroy (Callback : in out Wl.Callback) is
   begin
      if Callback.My_Callback /= null then
         Wl_Thin.Callback_Destroy (Callback.My_Callback);
         Callback.My_Callback := null;
      end if;
   end Destroy;

   function Get_Version (Callback : Wl.Callback) return Unsigned_32 is
   begin
      return Wl_Thin.Callback_Get_Version (Callback.My_Callback);
   end Get_Version;

   function Get_Version (Pointer : Wl.Pointer) return Unsigned_32 is
   begin
      return Wl_Thin.Pointer_Get_Version (Pointer.My_Pointer);
   end Get_Version;
   
   procedure Destroy (Pointer : in out Wl.Pointer) is
   begin
      if Pointer.My_Pointer /= null then
         Wl_Thin.Pointer_Destroy (Pointer.My_Pointer);
         Pointer.My_Pointer := null;
      end if;
   end Destroy;
   
   procedure Set_Cursor (Pointer   : Wl.Pointer;
                         Serial    : Unsigned_32;
                         Surface   : Wl.Surface;
                         Hotspot_X : Integer;
                         Hotspot_Y : Integer) is
   begin
      Wl_Thin.Pointer_Set_Cursor (Pointer.My_Pointer,
                                  Serial,
                                  Surface.My_Surface,
                                  Hotspot_X,
                                  Hotspot_Y);
   end Set_Cursor;
   
   procedure Release (Pointer : in out Wl.Pointer) is
   begin
      if Pointer.My_Pointer /= null then
         Wl_Thin.Pointer_Release (Pointer.My_Pointer);
         Pointer.My_Pointer := null;
      end if;
   end Release;

   function Get_Version (Keyboard : Wl.Keyboard) return Unsigned_32 is
   begin
      return Wl_Thin.Keyboard_Get_Version (Keyboard.My_Keyboard);
   end Get_Version;
   
   procedure Destroy (Keyboard : in out Wl.Keyboard) is
   begin
      if Keyboard.My_Keyboard /= null then
         Wl_Thin.Keyboard_Destroy (Keyboard.My_Keyboard);
         Keyboard.My_Keyboard := null;
      end if;
   end Destroy;

   procedure Release (Keyboard : in out Wl.Keyboard) is
   begin
      if Keyboard.My_Keyboard /= null then
         Wl_Thin.Keyboard_Release (Keyboard.My_Keyboard);
         Keyboard.My_Keyboard := null;
      end if;
   end Release;

   function Get_Version (Touch : Wl.Touch) return Unsigned_32 is
   begin
      return Wl_Thin.Touch_Get_Version (Touch.My_Touch);
   end Get_Version;
   
   procedure Destroy (Touch : in out Wl.Touch) is
   begin
      if Touch.My_Touch /= null then
         Wl_Thin.Touch_Destroy (Touch.My_Touch);
         Touch.My_Touch := null;
      end if;
   end Destroy;

   procedure Release (Touch : in out Wl.Touch) is
   begin
      if Touch.My_Touch /= null then
         Wl_Thin.Touch_Release (Touch.My_Touch);
         Touch.My_Touch := null;
      end if;
   end Release;

   function Get_Version (Output : Wl.Output) return Unsigned_32 is
   begin
      return Wl_Thin.Output_Get_Version (Output.My_Output);
   end Get_Version;
   
   procedure Destroy (Output : in out Wl.Output) is
   begin
      if Output.My_Output /= null then
         Wl_Thin.Output_Destroy (Output.My_Output);
         Output.My_Output := null;
      end if;
   end Destroy;

   procedure Release (Output : in out Wl.Output) is
   begin
      if Output.My_Output /= null then
         Wl_Thin.Output_Release (Output.My_Output);
         Output.My_Output := null;
      end if;
   end Release;

   function Get_Version (Region : Wl.Region) return Unsigned_32 is
   begin
      return Wl_Thin.Region_Get_Version (Region.My_Region);
   end Get_Version;
   
   procedure Destroy (Region : in out Wl.Region) is
   begin
      if Region.My_Region /= null then
         Wl_Thin.Region_Destroy (Region.My_Region);
         Region.My_Region := null;
      end if;
   end Destroy;

   procedure Add (Region : Wl.Region;
                  X      : Integer;
                  Y      : Integer;
                  Width  : Integer;
                  Height : Integer) is
   begin
      Wl_Thin.Region_Add (Region.My_Region, X, Y, Width, Height);
   end Add;
   
   procedure Subtract (Region : Wl.Region;
                       X      : Integer;
                       Y      : Integer;
                       Width  : Integer;
                       Height : Integer) is
   begin
      Wl_Thin.Region_Subtract (Region.My_Region, X, Y, Width, Height);
   end Subtract;

   function Get_Version (S : Wl.Subcompositor) return Unsigned_32 is
   begin
      return Wl_Thin.Subcompositor_Get_Version (S.My_Subcompositor);
   end Get_Version;
   
   procedure Destroy (S : in out Wl.Subcompositor) is
   begin
      if S.My_Subcompositor /= null then
         Wl_Thin.Subcompositor_Destroy (S.My_Subcompositor);
         S.My_Subcompositor := null;
      end if;
   end Destroy;

   procedure Get_Subsurface (Subcompositor : Wl.Subcompositor;
                             Surface       : Wl.Surface;
                             Parent        : Wl.Surface;
                             Subsurface    : in out Wl.Subsurface) is
   begin
      Subsurface.My_Subsurface :=
        Wl_Thin.Subcompositor_Get_Subsurface (Subcompositor.My_Subcompositor,
                                              Surface.My_Surface,
                                              Parent.My_Surface);
   end Get_Subsurface;
   
   function Get_Version (Subsurface : Wl.Subsurface) return Unsigned_32 is
   begin
      return Wl_Thin.Subsurface_Get_Version (Subsurface.My_Subsurface);
   end Get_Version;
   
   procedure Destroy (Subsurface : in out Wl.Subsurface) is
   begin
      if Subsurface.My_Subsurface /= null then
         Wl_Thin.Subsurface_Destroy (Subsurface.My_Subsurface);
         Subsurface.My_Subsurface := null;
      end if;
   end Destroy;

   procedure Set_Position (Subsurface : Wl.Subsurface;
                           X          : Integer;
                           Y          : Integer) is
   begin
      Wl_Thin.Subsurface_Set_Position (Subsurface.My_Subsurface,
                                       X,
                                       Y);
   end Set_Position;
   
   procedure Place_Above (Subsurface : Wl.Subsurface;
                          Sibling    : Wl.Surface) is
   begin
      Wl_Thin.Subsurface_Place_Above (Subsurface.My_Subsurface,
                                      Sibling.My_Surface);
   end Place_Above;
   
   procedure Place_Below (Subsurface : Wl.Subsurface;
                          Sibling    : Wl.Surface) is
   begin
      Wl_Thin.Subsurface_Place_Below (Subsurface.My_Subsurface,
                                      Sibling.My_Surface);
   end Place_Below;
   
   procedure Set_Sync (Subsurface : Wl.Subsurface) is
   begin
      Wl_Thin.Subsurface_Set_Sync (Subsurface.My_Subsurface);
   end Set_Sync;
   
   procedure Set_Desync (Subsurface : Wl.Subsurface) is
   begin
      Wl_Thin.Subsurface_Set_Desync (Subsurface.My_Subsurface);
   end Set_Desync;

   function Get_Version (Source : Data_Source) return Unsigned_32 is
   begin
      return Wl_Thin.Data_Source_Get_Version (Source.My_Data_Source);
   end Get_Version;
   
   procedure Destroy (Source : in out Data_Source) is
   begin
      if Source.My_Data_Source /= null then
         Wl_Thin.Data_Source_Destroy (Source.My_Data_Source);
         Source.My_Data_Source := null;
      end if;
   end Destroy;
   
   procedure Offer (Source    : Data_Source;
                    Mime_Type : C_String) is
   begin
      Wl_Thin.Proxy_Marshal
        (Wl_Thin.Proxy_Ptr'(Source.My_Data_Source.all'Access),
         WL_DATA_SOURCE_OFFER,
         Mime_Type);
   end Offer;
   
   procedure Set_Actions (Source      : Data_Source;
                          Dnd_Actions : Unsigned_32) is
   begin
      Wl_Thin.Data_Source_Set_Actions (Source.My_Data_Source,
                                       Dnd_Actions);
   end Set_Actions;

   function Get_Version (Device : Data_Device) return Unsigned_32 is
   begin
      return Wl_Thin.Data_Device_Get_Version (Device.My_Data_Device);
   end Get_Version;
   
   procedure Destroy (Device : in out Data_Device) is
   begin
      if Device.My_Data_Device /= null then
         Wl_Thin.Data_Device_Destroy (Device.My_Data_Device);
         Device.My_Data_Device := null;
      end if;
   end Destroy;

   procedure Start_Drag (Device : Data_Device;
                         Source : Data_Source;
                         Origin : Surface;
                         Icon   : Surface;
                         Serial : Unsigned_32) is
   begin
      Wl_Thin.Data_Device_Start_Drag (Device.My_Data_Device,
                                      Source.My_Data_Source,
                                      Origin.My_Surface,
                                      Icon.My_Surface,
                                      Serial);
   end Start_Drag;
   
   procedure Set_Selection (Device : Data_Device;
                            Source : Data_Source;
                            Serial : Unsigned_32) is
   begin
      Wl_Thin.Data_Device_Set_Selection (Device.My_Data_Device,
                                         Source.My_Data_Source,
                                         Serial);
   end Set_Selection;
   
   procedure Release (Device : in out Data_Device) is
   begin
      if Device.My_Data_Device /= null then
         Wl_Thin.Data_Device_Release (Device.My_Data_Device);
         Device.My_Data_Device := null;
      end if;
   end Release;

   function Get_Version (Manager : Data_Device_Manager) return Unsigned_32 is
   begin
      return Wl_Thin.Data_Device_Manager_Get_Version
        (Manager.My_Data_Device_Manager);
   end Get_Version;
   
   procedure Destroy (Manager : in out Data_Device_Manager) is
   begin
      if Manager.My_Data_Device_Manager /= null then
         Wl_Thin.Data_Device_Manager_Destroy (Manager.My_Data_Device_Manager);
         Manager.My_Data_Device_Manager := null;
      end if;
   end Destroy;

   procedure Create_Data_Source (Manager : Data_Device_Manager;
                                 Source  : in out Data_Source) is
   begin
      Source.My_Data_Source := Wl_Thin.Data_Device_Manager_Create_Data_Source
        (Manager.My_Data_Device_Manager);
   end Create_Data_Source;
   
   procedure Get_Data_Device (Manager : Data_Device_Manager;
                              Seat    : Wl.Seat;
                              Device  : in out Data_Device) is
   begin
      Device.My_Data_Device := Wl_Thin.Data_Device_Manager_Get_Data_Device
        (Manager.My_Data_Device_Manager, Seat.My_Seat);
   end Get_Data_Device;
   
end Posix.Wayland_Client;
