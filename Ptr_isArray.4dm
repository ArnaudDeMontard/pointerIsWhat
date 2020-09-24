  //%attributes = {"shared":true,"folder":"Ptr pointeurs","lang":"en"} comment added and reserved by 4D.
  //Ptr_isArray (unPointeur_p {;type_l {;type2_l {.. ;typeN_l) -> bool
  //retourne si unPointeur_p pointe un tableau à une dimension
  //$2..$N optionnels : filtre types de tableaux acceptés
  //cf:  Ptr_isTable, Ptr_isField, Ptr_isVar
  //http://forums.4d.fr/Post/FR/4942528/1/16135676#16135676
  //µ Arnaud * 04/07/2020 * debug, tableau blob
  //µ Arnaud * 08/06/2016 * nouveaux types de tableaux
  //µ Arnaud * 21/01/2016 13:08:42 * test plus d'un type
  //µ Arnaud * 21/07/2015 * ?
  //µ Arnaud * 02/03/2015 * $2 contrôler aussi le type attendu
C_BOOLEAN:C305($0)
C_POINTER:C301($1)
C_LONGINT:C283(${2})

C_BOOLEAN:C305($isArray_b)
C_LONGINT:C283($i_l)
C_LONGINT:C283($params_l)
C_LONGINT:C283($type_l)

If (False:C215)
	C_BOOLEAN:C305(Ptr_isArray ;$0)
	C_POINTER:C301(Ptr_isArray ;$1)
	C_LONGINT:C283(Ptr_isArray ;${2})
End if 
  //_
$isArray_b:=False:C215
$params_l:=Count parameters:C259
If (Asserted:C1132($params_l>0;Current method name:C684+" 1 parametre requis"))
	If (Is a variable:C294($1))
		C_COLLECTION:C1488($type_c)
		$type_c:=New collection:C1472(\
			Boolean array:K8:21;\
			Integer array:K8:18;LongInt array:K8:19;Real array:K8:17;\
			Date array:K8:20;Time array:K8:29;\
			String array:K8:15;Text array:K8:16;\
			Blob array:K8:30;Picture array:K8:22;\
			Object array:K8:28;Pointer array:K8:23)
		$type_l:=Type:C295($1->)
		$isArray_b:=($type_c.indexOf($type_l)>=0)
		  //litanie des types tableau monodim
		  //$isArray_b:=(($type_l>13) & ($type_l<23)) | \
			($type_l=Blob array ) | \
			($type_l=Time array) | \
			($type_l=Object array)
		
		  //??? 26=tableau entier64 ???
		
		If ($isArray_b) & ($params_l>1)  //vérifier aussi le type
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
  
