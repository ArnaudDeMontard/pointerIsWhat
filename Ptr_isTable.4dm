  //%attributes = {"shared":true,"folder":"Ptr pointeurs","lang":"en"} comment added and reserved by 4D.
  //Ptr_isTable (unPointeur_p) -> bool
  //retourne si unPointeur_p pointe une table
  //cf : Ptr_isField, Ptr_isArray
  //µ Arnaud * 21/07/2015 

C_BOOLEAN:C305($0)
C_POINTER:C301($1)

C_BOOLEAN:C305($isTable_b)
C_TEXT:C284($varname_t)
C_LONGINT:C283($table_l;$fld_l)
  //_
$isTable_b:=False:C215

Case of 
	: (Not:C34(Asserted:C1132(Count parameters:C259>0;Current method name:C684+" $1 expected")))
		  //: (Nombre de parametres#1)
		  //ErrDev (Nom methode courante+" 1 param requis")
	: (Is nil pointer:C315($1))
		  //que dalle
	Else 
		If (Not:C34(Is a variable:C294($1)))
			RESOLVE POINTER:C394($1;$varname_t;$table_l;$fld_l)
			If (Is table number valid:C999($table_l))
				$isTable_b:=Not:C34(Is field number valid:C1000($table_l;$fld_l))
			End if 
		End if 
End case 
$0:=$isTable_b
  //_
