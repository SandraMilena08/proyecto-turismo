˘

pC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Generica\DGenerica.cs
	namespace 	
Datos
 
. 
Generica 
{ 
public 

class 
	DGenerica 
< 
T 
> 
: 

IDGenerica  *
<* +
T+ ,
>, -
where. 3
T4 5
:6 7
class8 =
{		 
public 
PostgreSQLContext  
	DbContext! *
{+ ,
get- 0
;0 1
}2 3
public 
	DGenerica 
( 
PostgreSQLContext *

_dbContext+ 5
)5 6
{ 	
	DbContext 
= 

_dbContext "
;" #
} 	
public 
T 
Crear 
( 
T 
t 
) 
{ 	
	DbContext 
. 
Set 
< 
T 
> 
( 
) 
. 
Add "
(" #
t# $
)$ %
;% &
	DbContext 
. 
SaveChanges !
(! "
)" #
;# $
return 
t 
; 
}   	
}"" 
}## €
zC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Generica\Interfaz\IDGenerica.cs
	namespace 	
Datos
 
. 
Generica 
. 
Interfaz !
{ 
public 

	interface 

IDGenerica 
<  
T  !
>! "
where# (
T) *
:+ ,
class- 2
{ 
public 
T 
Crear 
( 
T 
t 
) 
; 
} 
} ïa
uC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Oferta\DOfertaTuristica.cs
	namespace

 	
Datos


 
.

 
Oferta

 
{ 
public 

class 
DOfertaTuristica !
<! "
T" #
># $
:% &
	DGenerica' 0
<0 1
T1 2
>2 3
,3 4
IDOfertaTuristica5 F
<F G
TG H
>H I
whereJ O
TP Q
:R S
OfertaTuristicaT c
{ 
public 
DOfertaTuristica 
(  
PostgreSQLContext  1
_context2 :
): ;
:< =
base> B
(B C
_contextC K
)K L
{M N
}O P
public 
List 
< 
T 
> 
Leer 
( 
short !
proveedorId" -
)- .
{ 	
return 
	DbContext 
. 
Set  
<  !
T! "
>" #
(# $
)$ %
.% &
Where& +
(+ ,
x, -
=>. 0
x1 2
.2 3
ProveedorId3 >
==? A
proveedorIdB M
&&N P
xQ R
.R S
	EliminadoS \
==] _
false` e
)e f
.f g
OrderByg n
(n o
xo p
=>q s
xt u
.u v
Idv x
)x y
.y z
ToList	z Ä
(
Ä Å
)
Å Ç
;
Ç É
} 	
public&& 
T&& 
Leer&& 
(&& 
int&& 
id&& 
,&& 
short&& #
proveedorId&&$ /
)&&/ 0
{'' 	
return(( 
	DbContext(( 
.(( 
Set((  
<((  !
T((! "
>((" #
(((# $
)(($ %
.((% &
SingleOrDefault((& 5
(((5 6
x((6 7
=>((8 :
x((; <
.((< =
Id((= ?
==((@ B
id((C E
&&((F H
x((I J
.((J K
ProveedorId((K V
==((W Y
proveedorId((Z e
&&((f h
x((i j
.((j k
	Eliminado((k t
==((u w
false((x }
)((} ~
;((~ 
})) 	
public22 
List22 
<22 
T22 
>22 
Leer22 
(22 
short22 !
pagina22" (
,22( )
short22* /
cantidad220 8
,228 9
bool22: >
estado22? E
)22E F
{33 	
return44 
	DbContext44 
.44 
Set44  
<44  !
T44! "
>44" #
(44# $
)44$ %
.44% &
Where44& +
(44+ ,
x44, -
=>44. 0
x441 2
.442 3

Habilitado443 =
==44> @
estado44A G
&&44H J
x44K L
.44L M
	Eliminado44M V
==44W Y
false44Z _
)44_ `
.44` a
OrderBy44a h
(44h i
x44i j
=>44k m
x44n o
.44o p
Id44p r
)44r s
.44s t
Skip44t x
(44x y
pagina44y 
*
44Ä Å
cantidad
44Ç ä
)
44ä ã
.
44ã å
Take
44å ê
(
44ê ë
cantidad
44ë ô
)
44ô ö
.
44ö õ
ToList
44õ °
(
44° ¢
)
44¢ £
;
44£ §
}55 	
public>> 
List>> 
<>> 
T>> 
>>> 
Leer>> 
(>> 
Busqueda>> $

parametros>>% /
,>>/ 0
short>>1 6
pagina>>7 =
,>>= >
short>>? D
cantidad>>E M
)>>M N
{?? 	
return@@ 
	DbContext@@ 
.@@ 
Set@@  
<@@  !
T@@! "
>@@" #
(@@# $
)@@$ %
.@@% &
AsEnumerable@@& 2
(@@2 3
)@@3 4
.@@4 5
Where@@5 :
(@@: ;
x@@; <
=>@@= ?
xAA 
.AA 
NombreAA 
.AA 
ToLowerAA $
(AA$ %
)AA% &
.AA& '
ContainsAA' /
(AA/ 0

parametrosAA0 :
.AA: ;
NombreAA; A
.AAA B
ToLowerAAB I
(AAI J
)AAJ K
)AAK L
&&AAM O

parametrosBB 
.BB 

MunicipiosBB )
.BB) *
AnyBB* -
(BB- .
mBB. /
=>BB0 2
xBB3 4
.BB4 5
	MunicipioBB5 >
.BB> ?
ContainsBB? G
(BBG H
mBBH I
)BBI J
)BBJ K
&&BBL N

parametrosCC 
.CC 

CategoriasCC )
.CC) *
AnyCC* -
(CC- .
cCC. /
=>CC0 2
xCC3 4
.CC4 5
	CategoriaCC5 >
.CC> ?
ContainsCC? G
(CCG H
cCCH I
)CCI J
)CCJ K
&&CCL N
(DD 
xDD 
.DD 

PuntuacionDD !
>=DD" $

parametrosDD% /
.DD/ 0
PuntuacionesDD0 <
[DD< =
$numDD= >
]DD> ?
&&DD@ B
xDDC D
.DDD E

PuntuacionDDE O
<=DDP R

parametrosDDS ]
.DD] ^
PuntuacionesDD^ j
[DDj k
$numDDk l
]DDl m
)DDm n
&&DDo q
xEE 
.EE 

HabilitadoEE  
==EE! #

parametrosEE$ .
.EE. /
EstadoEE/ 5
)FF 
.FF 
OrderByFF 
(FF 
xFF 
=>FF 
xFF  
.FF  !
IdFF! #
)FF# $
.FF$ %
SkipFF% )
(FF) *
paginaFF* 0
*FF1 2
cantidadFF3 ;
)FF; <
.FF< =
TakeFF= A
(FFA B
cantidadFFB J
)FFJ K
.FFK L
ToListFFL R
(FFR S
)FFS T
;FFT U
}GG 	
publicMM 
voidMM 

ActualizarMM 
(MM 
TMM  
ofertaTuristicaMM! 0
)MM0 1
{NN 	
	DbContextOO 
.OO 
EntryOO 
(OO 
ofertaTuristicaOO +
)OO+ ,
.OO, -
StateOO- 2
=OO3 4
EntityStateOO5 @
.OO@ A
ModifiedOOA I
;OOI J
	DbContextPP 
.PP 
SaveChangesPP !
(PP! "
)PP" #
;PP# $
}QQ 	
publicTT 
voidTT 
EliminarTT 
(TT 
TTT 
ofertaTuristicaTT .
)TT. /
{UU 	
	DbContextVV 
.VV 
SetVV 
<VV 
TVV 
>VV 
(VV 
)VV 
.VV 
RemoveVV %
(VV% &
ofertaTuristicaVV& 5
)VV5 6
;VV6 7
	DbContextWW 
.WW 
SaveChangesWW !
(WW! "
)WW" #
;WW# $
}XX 	
public__ 
int__ 
Cantidad__ 
(__ 
short__ !
proveedorId__" -
)__- .
{`` 	
returnaa 
	DbContextaa 
.aa 
Setaa  
<aa  !
Taa! "
>aa" #
(aa# $
)aa$ %
.aa% &
Countaa& +
(aa+ ,
xaa, -
=>aa. 0
xaa1 2
.aa2 3
ProveedorIdaa3 >
==aa? A
proveedorIdaaB M
&&aaN P
xaaQ R
.aaR S
	EliminadoaaS \
==aa] _
falseaa` e
)aae f
;aaf g
}bb 	
publicjj 
intjj 
Cantidadjj 
(jj 
intjj 
idjj  "
,jj" #
shortjj$ )
proveedorIdjj* 5
)jj5 6
{kk 	
returnll 
	DbContextll 
.ll 
Setll  
<ll  !
Tll! "
>ll" #
(ll# $
)ll$ %
.ll% &
Countll& +
(ll+ ,
xll, -
=>ll. 0
xll1 2
.ll2 3
Idll3 5
==ll6 8
idll9 ;
&&ll< >
xll? @
.ll@ A
ProveedorIdllA L
==llM O
proveedorIdllP [
&&ll\ ^
xll_ `
.ll` a
	Eliminadolla j
==llk m
falselln s
)lls t
;llt u
}mm 	
publictt 
inttt 
Cantidadtt 
(tt 
Busquedatt $

parametrostt% /
)tt/ 0
{uu 	
returnvv 
	DbContextvv 
.vv 
Setvv  
<vv  !
Tvv! "
>vv" #
(vv# $
)vv$ %
.vv% &
AsEnumerablevv& 2
(vv2 3
)vv3 4
.vv4 5
Countvv5 :
(vv: ;
xvv; <
=>vv= ?
xww 
.ww 
Nombreww 
.ww 
ToLowerww $
(ww$ %
)ww% &
.ww& '
Containsww' /
(ww/ 0

parametrosww0 :
.ww: ;
Nombreww; A
.wwA B
ToLowerwwB I
(wwI J
)wwJ K
)wwK L
&&wwM O

parametrosxx 
.xx 

Municipiosxx )
.xx) *
Anyxx* -
(xx- .
mxx. /
=>xx0 2
xxx3 4
.xx4 5
	Municipioxx5 >
.xx> ?
Containsxx? G
(xxG H
mxxH I
)xxI J
)xxJ K
&&xxL N

parametrosyy 
.yy 

Categoriasyy )
.yy) *
Anyyy* -
(yy- .
cyy. /
=>yy0 2
xyy3 4
.yy4 5
	Categoriayy5 >
.yy> ?
Containsyy? G
(yyG H
cyyH I
)yyI J
)yyJ K
&&yyL N
(zz 
xzz 
.zz 

Puntuacionzz !
>=zz" $

parametroszz% /
.zz/ 0
Puntuacioneszz0 <
[zz< =
$numzz= >
]zz> ?
&&zz@ B
xzzC D
.zzD E

PuntuacionzzE O
<=zzP R

parametroszzS ]
.zz] ^
Puntuacioneszz^ j
[zzj k
$numzzk l
]zzl m
)zzm n
&&zzo q
x{{ 
.{{ 

Habilitado{{  
=={{! #

parametros{{$ .
.{{. /
Estado{{/ 5
)|| 
;|| 
}}} 	
public
ÑÑ 
int
ÑÑ &
CantidadEstadoHabilitado
ÑÑ +
(
ÑÑ+ ,
bool
ÑÑ, 0
estado
ÑÑ1 7
)
ÑÑ7 8
{
ÖÖ 	
return
ÜÜ 
	DbContext
ÜÜ 
.
ÜÜ 
Set
ÜÜ  
<
ÜÜ  !
T
ÜÜ! "
>
ÜÜ" #
(
ÜÜ# $
)
ÜÜ$ %
.
ÜÜ% &
Count
ÜÜ& +
(
ÜÜ+ ,
x
ÜÜ, -
=>
ÜÜ. 0
x
ÜÜ1 2
.
ÜÜ2 3

Habilitado
ÜÜ3 =
==
ÜÜ> @
estado
ÜÜA G
&&
ÜÜH J
x
ÜÜK L
.
ÜÜL M
	Eliminado
ÜÜM V
==
ÜÜW Y
false
ÜÜZ _
)
ÜÜ_ `
;
ÜÜ` a
}
áá 	
public
êê 
int
êê &
CantidadEstadoHabilitado
êê +
(
êê+ ,
int
êê, /
id
êê0 2
,
êê2 3
short
êê4 9
proveedorId
êê: E
,
êêE F
bool
êêG K
estado
êêL R
)
êêR S
{
ëë 	
return
íí 
	DbContext
íí 
.
íí 
Set
íí  
<
íí  !
T
íí! "
>
íí" #
(
íí# $
)
íí$ %
.
íí% &
Count
íí& +
(
íí+ ,
x
íí, -
=>
íí. 0
x
íí1 2
.
íí2 3
Id
íí3 5
==
íí6 8
id
íí9 ;
&&
íí< >
x
íí? @
.
íí@ A
ProveedorId
ííA L
==
ííM O
proveedorId
ííP [
&&
íí\ ^
x
íí_ `
.
íí` a

Habilitado
íía k
==
ííl n
estado
íío u
&&
íív x
x
ííy z
.
ííz {
	Eliminadoíí{ Ñ
==ííÖ á
falseííà ç
)ííç é
;ííé è
}
ìì 	
}
ïï 
}ññ ñ
jC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Oferta\DPlan.cs
	namespace 	
Datos
 
. 
Oferta 
{ 
public		 

class		 
DPlan		 
:		 
DOfertaTuristica		 )
<		) *
Plan		* .
>		. /
,		/ 0
IDPlan		1 7
{

 
public 
DPlan 
( 
PostgreSQLContext &
_context' /
)/ 0
:1 2
base3 7
(7 8
_context8 @
)@ A
{B C
}D E
} 
} ™
nC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Oferta\DServicio.cs
	namespace 	
Datos
 
. 
Oferta 
{ 
public		 

class		 
	DServicio		 
:		 
DOfertaTuristica		 -
<		- .
Servicio		. 6
>		6 7
,		7 8

IDServicio		9 C
{

 
public 
	DServicio 
( 
PostgreSQLContext *
_context+ 3
)3 4
:5 6
base7 ;
(; <
_context< D
)D E
{F G
}H I
} 
} ”
C:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Oferta\Interfaz\IDOfertaTuristica.cs
	namespace 	
Datos
 
. 
Oferta 
. 
Interfaz 
{ 
public 

	interface 
IDOfertaTuristica &
<& '
T' (
>( )
:* +

IDGenerica, 6
<6 7
T7 8
>8 9
where: ?
T@ A
:B C
OfertaTuristicaD S
{ 
public 
List 
< 
T 
> 
Leer 
( 
short !
proveedorId" -
)- .
;. /
public 
T 
Leer 
( 
int 
id 
, 
short #
proveedorId$ /
)/ 0
;0 1
public 
List 
< 
T 
> 
Leer 
( 
short !
pagina" (
,( )
short* /
cantidad0 8
,8 9
bool: >
estado? E
)E F
;F G
public 
List 
< 
T 
> 
Leer 
( 
Busqueda $

parametros% /
,/ 0
short1 6
pagina7 =
,= >
short? D
cantidadE M
)M N
;N O
public!! 
void!! 

Actualizar!! 
(!! 
T!!  
ofertaTuristica!!! 0
)!!0 1
;!!1 2
public$$ 
void$$ 
Eliminar$$ 
($$ 
T$$ 
ofertaTuristica$$ .
)$$. /
;$$/ 0
public'' 
int'' 
Cantidad'' 
('' 
short'' !
proveedorId''" -
)''- .
;''. /
public** 
int** 
Cantidad** 
(** 
int** 
id**  "
,**" #
short**$ )
proveedorId*** 5
)**5 6
;**6 7
public11 
int11 
Cantidad11 
(11 
Busqueda11 $

parametros11% /
)11/ 0
;110 1
public44 
int44 $
CantidadEstadoHabilitado44 +
(44+ ,
bool44, 0
estado441 7
)447 8
;448 9
public== 
int== $
CantidadEstadoHabilitado== +
(==+ ,
int==, /
id==0 2
,==2 3
short==4 9
proveedorId==: E
,==E F
bool==G K
estado==L R
)==R S
;==S T
}?? 
}@@ ª
tC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Oferta\Interfaz\IDPlan.cs
	namespace 	
Datos
 
. 
Oferta 
. 
Interfaz 
{ 
public 

	interface 
IDPlan 
: 
IDOfertaTuristica /
</ 0
Plan0 4
>4 5
{		 
} 
} «
xC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Oferta\Interfaz\IDServicio.cs
	namespace 	
Datos
 
. 
Oferta 
. 
Interfaz 
{ 
public 

	interface 

IDServicio 
:  !
IDOfertaTuristica" 3
<3 4
Servicio4 <
>< =
{		 
} 
} »
oC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\PostgreSQLContext.cs
	namespace 	
Datos
 
{		 
public 

class 
PostgreSQLContext "
:# $
	DbContext% .
{ 
public 
PostgreSQLContext  
(  !
DbContextOptions! 1
<1 2
PostgreSQLContext2 C
>C D
optE H
)H I
:J K
baseL P
(P Q
optQ T
)T U
{V W
}X Y
public 
DbSet 
< 
Turista 
> 
Turista %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DbSet 
< 
	Proveedor 
> 
	Proveedor  )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DbSet 
< 
PreRegistro  
>  !
PreRegistro" -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
DbSet 
< 
Administrador "
>" #
Administrador$ 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
DbSet 
< 
RecuperarCuenta $
>$ %
RecuperarCuenta& 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
DbSet 
< 
SupervisionUsuario '
>' (
SupervisionUsuario) ;
{< =
get> A
;A B
setC F
;F G
}H I
public 
DbSet 
< 
Plan 
> 
Plan 
{  !
get" %
;% &
set' *
;* +
}, -
public   
DbSet   
<   
Servicio   
>   
Servicio   '
{  ( )
get  * -
;  - .
set  / 2
;  2 3
}  4 5
public## 
DbSet## 
<## 
PuntuacionPlan## #
>### $
PuntuacionPlan##% 3
{##4 5
get##6 9
;##9 :
set##; >
;##> ?
}##@ A
public$$ 
DbSet$$ 
<$$ 
PuntuacionServicio$$ '
>$$' (
PuntuacionServicio$$) ;
{$$< =
get$$> A
;$$A B
set$$C F
;$$F G
}$$H I
}&& 
}'' ≠

wC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Recomendacion\DPuntuacion.cs
	namespace 	
Datos
 
. 
Recomendacion 
{ 
public

 

abstract

 
class

 
DPuntuacion

 %
<

% &
T

& '
>

' (
:

) *
	DGenerica

+ 4
<

4 5
T

5 6
>

6 7
,

7 8
IDPuntuacion

9 E
<

E F
T

F G
>

G H
where

I N
T

O P
:

Q R

Puntuacion

S ]
{ 
public 
DPuntuacion 
( 
PostgreSQLContext ,
_context- 5
)5 6
:7 8
base9 =
(= >
_context> F
)F G
{H I
}J K
public 
abstract 
T 
Leer 
( 
int "
ofertaTuristicaId# 4
,4 5
string6 <
email= B
)B C
;C D
public 
abstract 
int 
Cantidad $
($ %
int% (
ofertaTuristicaId) :
,: ;
string< B
emailC H
)H I
;I J
}   
}!! ê
{C:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Recomendacion\DPuntuacionPlan.cs
	namespace 	
Datos
 
. 
Recomendacion 
{ 
public

 

class

 
DPuntuacionPlan

  
:

! "
DPuntuacion

# .
<

. /
PuntuacionPlan

/ =
>

= >
,

> ?
IDPuntuacionPlan

@ P
{ 
public 
DPuntuacionPlan 
( 
PostgreSQLContext 0
_context1 9
)9 :
:; <
base= A
(A B
_contextB J
)J K
{L M
}N O
public 
override 
PuntuacionPlan &
Leer' +
(+ ,
int, /
planId0 6
,6 7
string8 >
email? D
)D E
{ 	
return 
	DbContext 
. 
PuntuacionPlan +
.+ ,
SingleOrDefault, ;
(; <
x< =
=>> @
xA B
.B C
PlanIdC I
==J L
planIdM S
&&T V
xW X
.X Y
EmailY ^
.^ _
Equals_ e
(e f
emailf k
)k l
)l m
;m n
} 	
public!! 
override!! 
int!! 
Cantidad!! $
(!!$ %
int!!% (
planId!!) /
,!!/ 0
string!!1 7
email!!8 =
)!!= >
{"" 	
return## 
	DbContext## 
.## 
PuntuacionPlan## +
.##+ ,
Count##, 1
(##1 2
x##2 3
=>##4 6
x##7 8
.##8 9
PlanId##9 ?
==##@ B
planId##C I
&&##J L
x##M N
.##N O
Email##O T
.##T U
Equals##U [
(##[ \
email##\ a
)##a b
)##b c
;##c d
}$$ 	
}&& 
}'' »
C:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Recomendacion\DPuntuacionServicio.cs
	namespace 	
Datos
 
. 
Recomendacion 
{ 
public

 

class

 
DPuntuacionServicio

 $
:

% &
DPuntuacion

' 2
<

2 3
PuntuacionServicio

3 E
>

E F
,

F G 
IDPuntuacionServicio

H \
{ 
public 
DPuntuacionServicio "
(" #
PostgreSQLContext# 4
_context5 =
)= >
:? @
baseA E
(E F
_contextF N
)N O
{P Q
}R S
public 
override 
PuntuacionServicio *
Leer+ /
(/ 0
int0 3

servicioId4 >
,> ?
string@ F
emailG L
)L M
{ 	
return 
	DbContext 
. 
PuntuacionServicio /
./ 0
SingleOrDefault0 ?
(? @
x@ A
=>B D
xE F
.F G

ServicioIdG Q
==R T

servicioIdU _
&&` b
xc d
.d e
Emaile j
.j k
Equalsk q
(q r
emailr w
)w x
)x y
;y z
} 	
public## 
override## 
int## 
Cantidad## $
(##$ %
int##% (

servicioId##) 3
,##3 4
string##5 ;
email##< A
)##A B
{$$ 	
return%% 
	DbContext%% 
.%% 
PuntuacionServicio%% /
.%%/ 0
Count%%0 5
(%%5 6
x%%6 7
=>%%8 :
x%%; <
.%%< =

ServicioId%%= G
==%%H J

servicioId%%K U
&&%%V X
x%%Y Z
.%%Z [
Email%%[ `
.%%` a
Equals%%a g
(%%g h
email%%h m
)%%m n
)%%n o
;%%o p
}&& 	
}(( 
})) ÿ
ÅC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Recomendacion\Interfaz\IDPuntuacion.cs
	namespace 	
Datos
 
. 
Recomendacion 
. 
Interfaz &
{ 
public		 

	interface		 
IDPuntuacion		 !
<		! "
T		" #
>		# $
:		% &

IDGenerica		' 1
<		1 2
T		2 3
>		3 4
where		5 :
T		; <
:		= >

Puntuacion		? I
{

 
public 
T 
Leer 
( 
int 
ofertaTuristicaId +
,+ ,
string- 3
email4 9
)9 :
;: ;
public 
int 
Cantidad 
( 
int 
ofertaTuristicaId  1
,1 2
string3 9
email: ?
)? @
;@ A
} 
} „
ÖC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Recomendacion\Interfaz\IDPuntuacionPlan.cs
	namespace 	
Datos
 
. 
Recomendacion 
. 
Interfaz &
{ 
public 

	interface 
IDPuntuacionPlan %
:& '
IDPuntuacion( 4
<4 5
PuntuacionPlan5 C
>C D
{		 
} 
} Ô
âC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Recomendacion\Interfaz\IDPuntuacionServicio.cs
	namespace 	
Datos
 
. 
Recomendacion 
. 
Interfaz &
{ 
public 

	interface  
IDPuntuacionServicio )
:* +
IDPuntuacion, 8
<8 9
PuntuacionServicio9 K
>K L
{		 
} 
} Å
xC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Seguridad\DRecuperarCuenta.cs
	namespace 	
Datos
 
. 
	Seguridad 
{ 
public 

class 
DRecuperarCuenta !
:" #
	DGenerica$ -
<- .
RecuperarCuenta. =
>= >
,> ?
IDRecuperarCuenta@ Q
{ 
public 
DRecuperarCuenta 
(  
PostgreSQLContext  1
_context2 :
): ;
:< =
base> B
(B C
_contextC K
)K L
{M N
}O P
public 
RecuperarCuenta 
Leer #
(# $
string$ *
hash+ /
)/ 0
{ 	
return 
	DbContext 
. 
RecuperarCuenta ,
., -
SingleOrDefault- <
(< =
x= >
=>? A
xB C
.C D
HashD H
.H I
EqualsI O
(O P
hashP T
)T U
)U V
;V W
} 	
public 
RecuperarCuenta 
	LeerEmail (
(( )
string) /
email0 5
)5 6
{ 	
return 
	DbContext 
. 
RecuperarCuenta ,
., -
SingleOrDefault- <
(< =
x= >
=>? A
xB C
.C D
CorreoElectronicoD U
.U V
EqualsV \
(\ ]
email] b
)b c
)c d
;d e
} 	
public   
void   
Eliminar   
(   
RecuperarCuenta   ,
datos  - 2
)  2 3
{!! 	
	DbContext"" 
."" 
RecuperarCuenta"" %
.""% &
Remove""& ,
("", -
datos""- 2
)""2 3
;""3 4
	DbContext## 
.## 
SaveChanges## !
(##! "
)##" #
;### $
}$$ 	
public'' 
int'' 
CantidadEmail''  
(''  !
string''! '
email''( -
)''- .
{(( 	
return)) 
	DbContext)) 
.)) 
RecuperarCuenta)) ,
.)), -
Count))- 2
())2 3
x))3 4
=>))5 7
x))8 9
.))9 :
CorreoElectronico)): K
.))K L
Equals))L R
())R S
email))S X
)))X Y
)))Y Z
;))Z [
}** 	
},, 
}-- Ω
{C:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Seguridad\DSupervisionUsuario.cs
	namespace 	
Datos
 
. 
	Seguridad 
{ 
public 

class 
DSupervisionUsuario $
:% &
	DGenerica' 0
<0 1
SupervisionUsuario1 C
>C D
,D E 
IDSupervisionUsuarioF Z
{ 
public 
DSupervisionUsuario "
(" #
PostgreSQLContext# 4
_context5 =
)= >
:? @
baseA E
(E F
_contextF N
)N O
{P Q
}R S
public 
SupervisionUsuario !
Leer" &
(& '
string' -
email. 3
)3 4
{ 	
return 
	DbContext 
. 
SupervisionUsuario /
./ 0
SingleOrDefault0 ?
(? @
x@ A
=>B D
xE F
.F G
CorreoElectronicoG X
.X Y
EqualsY _
(_ `
email` e
)e f
)f g
;g h
} 	
public 
void 
Eliminar 
( 
SupervisionUsuario /
supervisionUsuario0 B
)B C
{ 	
	DbContext 
. 
SupervisionUsuario (
.( )
Remove) /
(/ 0
supervisionUsuario0 B
)B C
;C D
	DbContext 
. 
SaveChanges !
(! "
)" #
;# $
} 	
public!! 
int!! 
CantidadEmail!!  
(!!  !
string!!! '
email!!( -
)!!- .
{"" 	
return## 
	DbContext## 
.## 
SupervisionUsuario## /
.##/ 0
Count##0 5
(##5 6
x##6 7
=>##8 :
x##; <
.##< =
CorreoElectronico##= N
.##N O
Equals##O U
(##U V
email##V [
)##[ \
)##\ ]
;##] ^
}$$ 	
}&& 
}'' ª
ÇC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Seguridad\Interfaz\IDRecuperarCuenta.cs
	namespace 	
Datos
 
. 
	Seguridad 
. 
Interfaz "
{ 
public		 

	interface		 
IDRecuperarCuenta		 &
:		' (

IDGenerica		) 3
<		3 4
RecuperarCuenta		4 C
>		C D
{

 
public 
RecuperarCuenta 
Leer #
(# $
string$ *
hash+ /
)/ 0
;0 1
public 
RecuperarCuenta 
	LeerEmail (
(( )
string) /
email0 5
)5 6
;6 7
public 
void 
Eliminar 
( 
RecuperarCuenta ,
datos- 2
)2 3
;3 4
public 
int 
CantidadEmail  
(  !
string! '
email( -
)- .
;. /
} 
} º
ÖC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Seguridad\Interfaz\IDSupervisionUsuario.cs
	namespace 	
Datos
 
. 
	Seguridad 
. 
Interfaz "
{ 
public		 

	interface		  
IDSupervisionUsuario		 )
:		* +

IDGenerica		, 6
<		6 7
SupervisionUsuario		7 I
>		I J
{

 
public 
SupervisionUsuario !
Leer" &
(& '
string' -
email. 3
)3 4
;4 5
public 
void 
Eliminar 
( 
SupervisionUsuario /
supervisionUsuario0 B
)B C
;C D
public 
int 
CantidadEmail  
(  !
string! '
email( -
)- .
;. /
} 
} ø
uC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Usuarios\DAdministrador.cs
	namespace 	
Datos
 
. 
Usuarios 
{ 
public		 

class		 
DAdministrador		 
:		  !
DUsuario		" *
<		* +
Administrador		+ 8
>		8 9
,		9 :
IDAdministrador		; J
{

 
public 
DAdministrador 
( 
PostgreSQLContext /
_context0 8
)8 9
:: ;
base< @
(@ A
_contextA I
)I J
{K L
}M N
} 
} Â
sC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Usuarios\DPreRegistro.cs
	namespace 	
Datos
 
. 
Usuarios 
{ 
public 

class 
DPreRegistro 
: 
	DGenerica  )
<) *
PreRegistro* 5
>5 6
,6 7
IDPreRegistro8 E
{ 
public 
DPreRegistro 
( 
PostgreSQLContext -
_context. 6
)6 7
:8 9
base: >
(> ?
_context? G
)G H
{I J
}K L
public 
PreRegistro 
Leer 
(  
string  &
email' ,
), -
{ 	
return 
	DbContext 
. 
PreRegistro (
.( )
SingleOrDefault) 8
(8 9
x9 :
=>; =
x> ?
.? @
CorreoElectronico@ Q
.Q R
EqualsR X
(X Y
emailY ^
)^ _
)_ `
;` a
} 	
public 
PreRegistro 
LeerHash #
(# $
string$ *
hash+ /
)/ 0
{ 	
return 
	DbContext 
. 
PreRegistro (
.( )
SingleOrDefault) 8
(8 9
x9 :
=>; =
x> ?
.? @
Hash@ D
.D E
EqualsE K
(K L
hashL P
)P Q
)Q R
;R S
} 	
public   
void   
Eliminar   
(   
PreRegistro   (
preRegistro  ) 4
)  4 5
{!! 	
	DbContext"" 
."" 
PreRegistro"" !
.""! "
Remove""" (
(""( )
preRegistro"") 4
)""4 5
;""5 6
	DbContext## 
.## 
SaveChanges## !
(##! "
)##" #
;### $
}$$ 	
}&& 
}'' ”;
qC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Usuarios\DProveedor.cs
	namespace

 	
Datos


 
.

 
Usuarios

 
{ 
public 

class 

DProveedor 
: 
DUsuario &
<& '
	Proveedor' 0
>0 1
,1 2
IDProveedor3 >
{ 
public 

DProveedor 
( 
PostgreSQLContext +
_context, 4
)4 5
:6 7
base8 <
(< =
_context= E
)E F
{G H
}I J
public 
	Proveedor 
	LeerLogin "
(" #
string# )
nit* -
,- .
string/ 5
clave6 ;
); <
{ 	
return 
	DbContext 
. 
	Proveedor &
.& '
SingleOrDefault' 6
(6 7
x7 8
=>9 ;
x< =
.= >
Nit> A
.A B
EqualsB H
(H I
nitI L
)L M
&&N P
xQ R
.R S
ClaveS X
.X Y
EqualsY _
(_ `
clave` e
)e f
)f g
;g h
} 	
public 
bool 
LeerHabilitado "
(" #
string# )
hash* .
,. /
string0 6
email7 <
)< =
{ 	
return 
	DbContext 
. 
	Proveedor &
.& '
Where' ,
(, -
x- .
=>/ 1
x2 3
.3 4
Hash4 8
.8 9
Equals9 ?
(? @
hash@ D
)D E
&&F H
xI J
.J K
CorreoElectronicoK \
.\ ]
Equals] c
(c d
emaild i
)i j
)j k
.k l
Selectl r
(r s
xs t
=>u w
xx y
.y z

Habilitado	z Ñ
)
Ñ Ö
.
Ö Ü
SingleOrDefault
Ü ï
(
ï ñ
)
ñ ó
;
ó ò
}   	
public## 
List## 
<## 
	Proveedor## 
>##  
LeerEstadoHabilitado## 3
(##3 4
short##4 9
pagina##: @
,##@ A
short##B G
cantidad##H P
,##P Q
bool##R V
estado##W ]
)##] ^
{$$ 	
return%% 
	DbContext%% 
.%% 
	Proveedor%% &
.%%& '
Where%%' ,
(%%, -
x%%- .
=>%%/ 1
x%%2 3
.%%3 4

Habilitado%%4 >
==%%? A
estado%%B H
)%%H I
.%%I J
OrderBy%%J Q
(%%Q R
x%%R S
=>%%T V
x%%W X
.%%X Y
Id%%Y [
)%%[ \
.%%\ ]
Skip%%] a
(%%a b
pagina%%b h
)%%h i
.%%i j
Take%%j n
(%%n o
cantidad%%o w
)%%w x
.%%x y
ToList%%y 
(	%% Ä
)
%%Ä Å
;
%%Å Ç
}&& 	
public// 
List// 
<// 
	Proveedor// 
>// 
Leer// #
(//# $
BusquedaProveedor//$ 5

parametros//6 @
,//@ A
short//B G
pagina//H N
,//N O
short//P U
cantidad//V ^
)//^ _
{00 	
return11 
	DbContext11 
.11 
	Proveedor11 &
.11& '
AsEnumerable11' 3
(113 4
)114 5
.115 6
Where116 ;
(11; <
x11< =
=>11> @
x22 
.22 
Nombre22 
.22 
ToLower22  
(22  !
)22! "
.22" #
Contains22# +
(22+ ,

parametros22, 6
.226 7
Nombre227 =
.22= >
ToLower22> E
(22E F
)22F G
)22G H
&&22I K
x33 
.33 
Nit33 
.33 
Contains33 
(33 

parametros33 )
.33) *
Nit33* -
)33- .
&&33/ 1
x44 
.44 

Habilitado44 
==44 

parametros44  *
.44* +
Estado44+ 1
&&442 4

parametros55 
.55 

Municipios55 %
.55% &
Any55& )
(55) *
m55* +
=>55, .
x55/ 0
.550 1
	Municipio551 :
.55: ;
Contains55; C
(55C D
m55D E
)55E F
)55F G
)66 
.66 
OrderBy66 
(66 
x66 
=>66 
x66 
.66 
Id66 
)66  
.66  !
Skip66! %
(66% &
pagina66& ,
*66- .
cantidad66/ 7
)667 8
.668 9
Take669 =
(66= >
cantidad66> F
)66F G
.66G H
ToList66H N
(66N O
)66O P
;66P Q
}77 	
public:: 
Task:: 
<:: 
int:: 
>:: 
CantidadNit:: $
(::$ %
string::% +
nit::, /
)::/ 0
{;; 	
return<< 
	DbContext<< 
.<< 
	Proveedor<< &
.<<& '

CountAsync<<' 1
(<<1 2
x<<2 3
=><<4 6
x<<7 8
.<<8 9
Nit<<9 <
.<<< =
Equals<<= C
(<<C D
nit<<D G
)<<G H
)<<H I
;<<I J
}== 	
public@@ 
int@@ $
CantidadEstadoHabilitado@@ +
(@@+ ,
bool@@, 0
estado@@1 7
)@@7 8
{AA 	
returnBB 
	DbContextBB 
.BB 
	ProveedorBB &
.BB& '
CountBB' ,
(BB, -
xBB- .
=>BB/ 1
xBB2 3
.BB3 4

HabilitadoBB4 >
==BB? A
estadoBBB H
)BBH I
;BBI J
}CC 	
publicJJ 
intJJ 
CantidadJJ 
(JJ 
BusquedaProveedorJJ -

parametrosJJ. 8
)JJ8 9
{KK 	
returnLL 
	DbContextLL 
.LL 
	ProveedorLL &
.LL& '
AsEnumerableLL' 3
(LL3 4
)LL4 5
.LL5 6
CountLL6 ;
(LL; <
xLL< =
=>LL> @
xMM 
.MM 
NombreMM 
.MM 
ToLowerMM  
(MM  !
)MM! "
.MM" #
ContainsMM# +
(MM+ ,

parametrosMM, 6
.MM6 7
NombreMM7 =
.MM= >
ToLowerMM> E
(MME F
)MMF G
)MMG H
&&MMI K
xNN 
.NN 
NitNN 
.NN 
ContainsNN 
(NN 

parametrosNN )
.NN) *
NitNN* -
)NN- .
&&NN/ 1
xOO 
.OO 

HabilitadoOO 
==OO 

parametrosOO  *
.OO* +
EstadoOO+ 1
&&OO2 4

parametrosPP 
.PP 

MunicipiosPP %
.PP% &
AnyPP& )
(PP) *
mPP* +
=>PP, .
xPP/ 0
.PP0 1
	MunicipioPP1 :
.PP: ;
ContainsPP; C
(PPC D
mPPD E
)PPE F
)PPF G
)QQ 
;QQ 
}RR 	
}TT 
}UU °
oC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Usuarios\DTurista.cs
	namespace 	
Datos
 
. 
Usuarios 
{ 
public		 

class		 
DTurista		 
:		 
DUsuario		 $
<		$ %
Turista		% ,
>		, -
,		- .
	IDTurista		/ 8
{

 
public 
DTurista 
( 
PostgreSQLContext )
_context* 2
)2 3
:4 5
base6 :
(: ;
_context; C
)C D
{E F
}G H
} 
} Ä1
oC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Usuarios\DUsuario.cs
	namespace		 	
Datos		
 
.		 
Usuarios		 
{

 
public 

class 
DUsuario 
< 
T 
> 
: 
	DGenerica (
<( )
T) *
>* +
,+ ,
	IDUsuario- 6
<6 7
T7 8
>8 9
where: ?
T@ A
:B C
UsuarioD K
{ 
public 
DUsuario 
( 
PostgreSQLContext )
_context* 2
)2 3
:4 5
base6 :
(: ;
_context; C
)C D
{E F
}G H
public 
T 
Leer 
( 
short 
id 
) 
{ 	
return 
	DbContext 
. 
Set  
<  !
T! "
>" #
(# $
)$ %
.% &
SingleOrDefault& 5
(5 6
x6 7
=>8 :
x; <
.< =
Id= ?
==@ B
idC E
)E F
;F G
} 	
public 
T 
Leer 
( 
string 
email "
)" #
{ 	
return 
	DbContext 
. 
Set  
<  !
T! "
>" #
(# $
)$ %
.% &
SingleOrDefault& 5
(5 6
x6 7
=>8 :
x; <
.< =
CorreoElectronico= N
.N O
EqualsO U
(U V
emailV [
)[ \
)\ ]
;] ^
} 	
public"" 
T"" 
Leer"" 
("" 
string"" 
email"" "
,""" #
string""$ *
clave""+ 0
)""0 1
{## 	
return$$ 
	DbContext$$ 
.$$ 
Set$$  
<$$  !
T$$! "
>$$" #
($$# $
)$$$ %
.$$% &
SingleOrDefault$$& 5
($$5 6
x$$6 7
=>$$8 :
x$$; <
.$$< =
CorreoElectronico$$= N
.$$N O
Equals$$O U
($$U V
email$$V [
)$$[ \
&&$$] _
x$$` a
.$$a b
Clave$$b g
.$$g h
Equals$$h n
($$n o
clave$$o t
)$$t u
)$$u v
;$$v w
}%% 	
public(( 
T(( 
LeerHash(( 
((( 
string((  
hash((! %
)((% &
{)) 	
return** 
	DbContext** 
.** 
Set**  
<**  !
T**! "
>**" #
(**# $
)**$ %
.**% &
SingleOrDefault**& 5
(**5 6
x**6 7
=>**8 :
x**; <
.**< =
Hash**= A
.**A B
Equals**B H
(**H I
hash**I M
)**M N
)**N O
;**O P
}++ 	
public33 
T33 
LeerAuth33 
(33 
string33  
hash33! %
,33% &
string33' -
email33. 3
)333 4
{44 	
return55 
	DbContext55 
.55 
Set55  
<55  !
T55! "
>55" #
(55# $
)55$ %
.55% &
SingleOrDefault55& 5
(555 6
x556 7
=>558 :
x55; <
.55< =
Hash55= A
.55A B
Equals55B H
(55H I
hash55I M
)55M N
&&55O Q
x55R S
.55S T
CorreoElectronico55T e
.55e f
Equals55f l
(55l m
email55m r
)55r s
)55s t
;55t u
}66 	
public99 
void99 

Actualizar99 
(99 
T99  
usuario99! (
)99( )
{:: 	
	DbContext;; 
.;; 
Entry;; 
(;; 
usuario;; #
);;# $
.;;$ %
State;;% *
=;;+ ,
EntityState;;- 8
.;;8 9
Modified;;9 A
;;;A B
	DbContext<< 
.<< 
SaveChanges<< !
(<<! "
)<<" #
;<<# $
}== 	
public@@ 
void@@ 

Actualizar@@ 
(@@ 
T@@  
usuario@@! (
,@@( )
T@@* +
usuarioActualizar@@, =
)@@= >
{AA 	
	DbContextBB 
.BB 
EntryBB 
(BB 
usuarioActualizarBB -
)BB- .
.BB. /
CurrentValuesBB/ <
.BB< =
	SetValuesBB= F
(BBF G
usuarioBBG N
)BBN O
;BBO P
	DbContextCC 
.CC 
SaveChangesCC !
(CC! "
)CC" #
;CC# $
}DD 	
publicKK 
TaskKK 
<KK 
intKK 
>KK 
CantidadEmailKK &
(KK& '
stringKK' -
emailKK. 3
)KK3 4
{LL 	
returnMM 
	DbContextMM 
.MM 
SetMM  
<MM  !
TMM! "
>MM" #
(MM# $
)MM$ %
.MM% &

CountAsyncMM& 0
(MM0 1
xMM1 2
=>MM3 5
xMM6 7
.MM7 8
CorreoElectronicoMM8 I
.MMI J
EqualsMMJ P
(MMP Q
emailMMQ V
)MMV W
)MMW X
;MMX Y
}NN 	
publicUU 
intUU 
CantidadEmailSyncUU $
(UU$ %
stringUU% +
emailUU, 1
)UU1 2
{VV 	
returnWW 
	DbContextWW 
.WW 
SetWW  
<WW  !
TWW! "
>WW" #
(WW# $
)WW$ %
.WW% &
CountWW& +
(WW+ ,
xWW, -
=>WW. 0
xWW1 2
.WW2 3
CorreoElectronicoWW3 D
.WWD E
EqualsWWE K
(WWK L
emailWWL Q
)WWQ R
)WWR S
;WWS T
}XX 	
}ZZ 
}[[ “
C:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Usuarios\Interfaz\IDAdministrador.cs
	namespace 	
Datos
 
. 
Usuarios 
. 
Interfaz !
{ 
public 

	interface 
IDAdministrador $
:% &
	IDUsuario' 0
<0 1
Administrador1 >
>> ?
{		 
} 
} ë
}C:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Usuarios\Interfaz\IDPreRegistro.cs
	namespace 	
Datos
 
. 
Usuarios 
. 
Interfaz !
{ 
public		 

	interface		 
IDPreRegistro		 "
:		# $

IDGenerica		% /
<		/ 0
PreRegistro		0 ;
>		; <
{

 
public 
PreRegistro 
Leer 
(  
string  &
email' ,
), -
;- .
public 
PreRegistro 
LeerHash #
(# $
string$ *
hash+ /
)/ 0
;0 1
public 
void 
Eliminar 
( 
PreRegistro (
preRegistro) 4
)4 5
;5 6
} 
} ’
{C:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Usuarios\Interfaz\IDProveedor.cs
	namespace 	
Datos
 
. 
Usuarios 
. 
Interfaz !
{ 
public 

	interface 
IDProveedor  
:! "
	IDUsuario# ,
<, -
	Proveedor- 6
>6 7
{ 
public 
	Proveedor 
	LeerLogin "
(" #
string# )
nit* -
,- .
string/ 5
clave6 ;
); <
;< =
public 
bool 
LeerHabilitado "
(" #
string# )
hash* .
,. /
string0 6
email7 <
)< =
;= >
public 
List 
< 
	Proveedor 
>  
LeerEstadoHabilitado 3
(3 4
short4 9
pagina: @
,@ A
shortB G
cantidadH P
,P Q
boolR V
estadoW ]
)] ^
;^ _
public   
List   
<   
	Proveedor   
>   
Leer   #
(  # $
BusquedaProveedor  $ 5

parametros  6 @
,  @ A
short  B G
pagina  H N
,  N O
short  P U
cantidad  V ^
)  ^ _
;  _ `
public## 
Task## 
<## 
int## 
>## 
CantidadNit## $
(##$ %
string##% +
nit##, /
)##/ 0
;##0 1
public&& 
int&& $
CantidadEstadoHabilitado&& +
(&&+ ,
bool&&, 0
estado&&1 7
)&&7 8
;&&8 9
public-- 
int-- 
Cantidad-- 
(-- 
BusquedaProveedor-- -

parametros--. 8
)--8 9
;--9 :
}00 
}11 ¿
yC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Usuarios\Interfaz\IDTurista.cs
	namespace 	
Datos
 
. 
Usuarios 
. 
Interfaz !
{ 
public 

	interface 
	IDTurista 
:  
	IDUsuario! *
<* +
Turista+ 2
>2 3
{		 
} 
} Ä
yC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Datos\Usuarios\Interfaz\IDUsuario.cs
	namespace 	
Datos
 
. 
Usuarios 
. 
Interfaz !
{ 
public

 

	interface

 
	IDUsuario

 
<

 
T

  
>

  !
:

" #

IDGenerica

$ .
<

. /
T

/ 0
>

0 1
where

2 7
T

8 9
:

: ;
Usuario

< C
{ 
public 
T 
Leer 
( 
short 
id 
) 
;  
public 
T 
Leer 
( 
string 
email "
)" #
;# $
public 
T 
Leer 
( 
string 
email "
," #
string$ *
clave+ 0
)0 1
;1 2
public 
T 
LeerHash 
( 
string  
hash! %
)% &
;& '
public 
T 
LeerAuth 
( 
string  
hash! %
,% &
string' -
email. 3
)3 4
;4 5
public 
void 

Actualizar 
( 
T  
usuario! (
)( )
;) *
public"" 
void"" 

Actualizar"" 
("" 
T""  
usuario""! (
,""( )
T""* +
usuarioActualizar"", =
)""= >
;""> ?
public%% 
Task%% 
<%% 
int%% 
>%% 
CantidadEmail%% &
(%%& '
string%%' -
email%%. 3
)%%3 4
;%%4 5
public,, 
int,, 
CantidadEmailSync,, $
(,,$ %
string,,% +
email,,, 1
),,1 2
;,,2 3
}.. 
}// 