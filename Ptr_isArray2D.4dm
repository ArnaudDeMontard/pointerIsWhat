  //%attributes = {"shared":true,"lang":"en"} comment added and reserved by 4D.
  //Ptr_isArray2D (unPointeur_p {;type_l {;type2_l {.. ;typeN_l) -> bool
  //retourne si unPointeur_p pointe un tableau à 2 dimension
  //$2..$N optionnels : filtre types de tableaux acceptés
  //cf:  Ptr_isTable, Ptr_isField, Ptr_isVar, Ptr_isArray
  //http://forums.4d.fr/Post/FR/17016043/0/0/
  //µ Arnaud * 09/11/2016 * test plus d'un type
  //© Arnaud * 21/07/2015
C_BOOLEAN:C305($0)
C_POINTER:C301($1)
C_LONGINT:C283(${2})

C_BOOLEAN:C305($isArray_b)
C_LONGINT:C283($i_l)
C_LONGINT:C283($params_l)
C_LONGINT:C283($type_l)

If (False:C215)
	C_BOOLEAN:C305(Ptr_isArray2D ;$0)
	C_POINTER:C301(Ptr_isArray2D ;$1)
	C_LONGINT:C283(Ptr_isArray2D ;${2})
End if 

  //_
$isArray_b:=False:C215
$params_l:=Count parameters:C259
If (Asserted:C1132($params_l>0;Current method name:C684+" 1 parametre requis"))
	If (Is a variable:C294($1))
		$type_l:=Type:C295($1->)
		$isArray_b:=($type_l=Array 2D:K8:24)
		If ($isArray_b) & ($params_l>1)  //vérifier aussi le type
			$type_l:=Type:C295($1->{0})
			  //$isArray_b:=($type_l=$2)
			$i_l:=2
			Repeat 
				$isArray_b:=($type_l=${$i_l})
				$i_l:=$i_l+1
			Until ($i_l>$params_l) | ($isArray_b)
		End if 
	End if 
End if 
$0:=$isArray_b
  //_
  
