  //%attributes = {"shared":true,"folder":"Ptr pointeurs","lang":"en"} comment added and reserved by 4D.
  //Ptr_isField (unPointeur_p {;type_l {;type2_l {.. ;typeN_l) -> bool 
  //retourne si unPointeur_p pointe un champ
  //$2..$N optionnels : filtre types de champs acceptés
  //cf : Ptr_isTable, Ptr_isArray
  //µ Arnaud * 21/01/2016 13:08:42 * test plus d'un type
  //µ Arnaud * 21/07/2015 
  //µ Arnaud * 13/04/2015 * ajout vérif de type optionnel
  //http://forums.4d.fr/Post//4942528/1/#17058191
C_BOOLEAN:C305($0)
C_POINTER:C301($1)
C_LONGINT:C283(${2})

C_BOOLEAN:C305($isField_b)
C_TEXT:C284($varName_t)
C_LONGINT:C283($table_l)
C_LONGINT:C283($field_l)
C_LONGINT:C283($type_l)
C_LONGINT:C283($i_l)
C_LONGINT:C283($params_l)
  //_
$isField_b:=False:C215
$params_l:=Count parameters:C259
  //$nmc_t:=Nom methode courante
Case of 
	: (Not:C34(Asserted:C1132($params_l>0;Current method name:C684+" $1 expected")))
	: (Is nil pointer:C315($1))
		  //pas bon
	: (Is a variable:C294($1))
		  //pas bon
	Else 
		RESOLVE POINTER:C394($1;$varName_t;$table_l;$field_l)
		$isField_b:=(Is field number valid:C1000($table_l;$field_l))
		If ($isField_b) & ($params_l>1)  //on contrôle également le type
			$type_l:=Type:C295($1->)
			$i_l:=2
			Repeat 
				$isField_b:=($type_l=${$i_l})
				$i_l:=$i_l+1
			Until ($i_l>$params_l) | ($isField_b)
		End if 
End case 
$0:=$isField_b
  //_
 
