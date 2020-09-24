# pointerIsWhat

Some methods to determinate what is behind a pointer

Examples (all assert should pass)

C_POINTER($what_p)

C_TEXT($test_t)

$what_p:=->$test_t
ASSERT(Ptr_isVar ($what_p)) 
ASSERT(Ptr_isVar ($what_p;Is text))  //is a text var 
ASSERT(Not(Ptr_isVar ($what_p;Is longint)))  //is Not a longint var
ASSERT(Ptr_isVar ($what_p;Is longint;Is text))  //is text OR longint var

ARRAY TEXT($test_at;0)
$what_p:=->$test_at
ASSERT(Ptr_isArray ($what_p))  //is an array
ASSERT(Ptr_isArray ($what_p;Text array))  //is a text array 
ASSERT(Not(Ptr_isArray ($what_p;LongInt array)))  //is Not a longint array
ASSERT(Ptr_isArray ($what_p;LongInt array;Text array))  //is text OR longint array
