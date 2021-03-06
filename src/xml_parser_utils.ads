with Wayland_XML;
with Aida;
with Ada.Containers.Vectors;

package Xml_Parser_Utils is

   package Wx renames Wayland_XML;

   function Adaify_Name (Old_Name : String) return String;

   -- If the variable name is "Interface" then it will be recognized as
   -- a reserved word in Ada and it will be suffixed with "_V" resulting
   -- in "Interface_V".
   function Adaify_Variable_Name (Old_Name : String) return String;

   function Make_Upper_Case (Source : String) return String;

   function Arg_Type_As_String (Arg_Tag : Wx.Arg_Tag) return String;

   function Number_Of_Args (Request_Tag : Wx.Request_Tag) return Aida.Nat32_T;

   function Is_New_Id_Argument_Present (Request_Tag : Wx.Request_Tag) return Boolean;

   function Is_Interface_Specified (Request_Tag : Wx.Request_Tag) return Boolean with
     Pre => Is_New_Id_Argument_Present (Request_Tag);

   Interface_Not_Found_Exception : exception;

   -- will raise Interface_Not_Found_Exception is pre-condition is not met.
   function Find_Specified_Interface (Request_Tag : Wx.Request_Tag) return String with
     Pre => Is_Interface_Specified (Request_Tag);

   function Interface_Ptr_Name (Interface_Tag : Wx.Interface_Tag) return String;

   function Is_Request_Destructor (Request_Tag : Wx.Request_Tag) return Boolean;

   function Exists_Reference_To_Enum (Protocol_Tag   : Wx.Protocol_Tag;
                                      Interface_Name : String;
                                      Enum_Name      : String) return Boolean;

   function Exists_Destructor (Interface_Tag : Wx.Interface_Tag) return Boolean;

   function Exists_Any_Event_Tag (Interface_Tag : Wx.Interface_Tag) return Boolean;

   function Remove_Tabs (Text : String) return String;

   type Interval is record
      First : Aida.Pos32_T;
      Last  : Aida.Nat32_T;
   end record;

   package Interval_Vectors is new Ada.Containers.Vectors (Index_Type => Positive, Element_Type => Interval, "=" => "=");

   type Intervals_Ref (E : not null access constant Interval_Vectors.Vector) is limited null record with
     Implicit_Dereference => E;

   type Interval_Identifier is tagged limited private;

   function Intervals (This : aliased Interval_Identifier) return Intervals_Ref with
     Global => null;

   function Make (Text : String) return Interval_Identifier with
     Global => null;

private

   type Interval_Identifier is tagged limited record
      My_Intervals : aliased Interval_Vectors.Vector;
   end record;

   function Intervals (This : aliased Interval_Identifier) return Intervals_Ref is ((E => This.My_Intervals'Access));

end Xml_Parser_Utils;
