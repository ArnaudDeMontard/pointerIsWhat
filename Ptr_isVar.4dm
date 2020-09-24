  //%attributes = {"shared":true,"folder":"Ptr pointeurs","lang":"en"} comment added and reserved by 4D.
  //Ptr_isVar (unPointeur_p {;type_l {;type2_l {.. ;typeN_l) -> bool 
  //retourne si unPointeur_p pointe une variable scalaire (non tableau)
  //paramètres 2 à N : types admis (filtrage du type)
  //cf : Ptr_isTable, Ptr_isArray
  //µ Arnaud * 21/07/2015 
  //© arnaud * 18/02/03
C_BOOLEAN:C305($0)
C_POINTER:C301($1)
C_LONGINT:C283(${2})

C_BOOLEAN:C305($isVar_b)
C_LONGINT:C283($i_l)
C_LONGINT:C283($params_l)
C_LONGINT:C283($type_l)
  //_
$isVar_b:=False:C215
$params_l:=Count parameters:C259
If (Asserted:C1132($params_l>0;Current method name:C684+" $1 expected"))
	If (Is a variable:C294($1))
		$type_l:=Type:C295($1->)
		$isVar_b:=($type_l=Is real:K8:4)\
			 | ($type_l=Is text:K8:3)\
			 | ($type_l=Is picture:K8:10)\
			 | ($type_l=Is date:K8:7)\
			 | ($type_l=Is boolean:K8:9)\
			 | ($type_l=Is integer:K8:5)\
			 | ($type_l=Is longint:K8:6)\
			 | ($type_l=Is time:K8:8)\
			 | ($type_l=Is pointer:K8:14)\
			 | ($type_l=Is string var:K8:2)\
			 | ($type_l=Is BLOB:K8:12)\
			 | ($type_l=Is object:K8:27)\
			 | ($type_l=Is collection:K8:32)
		If ($isVar_b) & ($params_l>1)  //vérifier aussi le(s) type(s)
			$i_l:=2
			Repeat 
				$isVar_b:=($type_l=${$i_l})
				$i_l:=$i_l+1
			Until ($i_l>$params_l) | ($isVar_b)
		End if 
	End if 
End if 
$0:=$isVar_b
  //_
