ù
âC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\WebAPI\WebAPI\Controllers\AdministradorController.cs
	namespace

 	
WebAPI


 
.

 
Controllers

 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class #
AdministradorController (
:) *
ControllerBase+ 9
{ 
private 
PostgreSQLContext !
	DbContext" +
{, -
get. 1
;1 2
}3 4
private 
IConfiguration 
Configuration ,
{- .
get/ 2
;2 3
}4 5
private 
SAdministrador "
serviciosAdministrador 5
{6 7
get8 ;
;; <
}= >
public #
AdministradorController &
(& '
PostgreSQLContext' 8
_context9 A
,A B
IConfigurationC Q
_configurationR `
)` a
{ 	
	DbContext 
= 
_context  
;  !
Configuration 
= 
_configuration *
;* +"
serviciosAdministrador "
=# $
new% (
SAdministrador) 7
(7 8
_context8 @
,@ A
_configurationB P
)P Q
;Q R
} 	
["" 	
HttpGet""	 
("" 
$str"" 
)"" 
]"" 
[## 	
	Authorize##	 
]## 
[$$ 	%
CustomAuthorizationFilter$$	 "
($$" #
$str$$# 2
)$$2 3
]$$3 4
public%% 
IActionResult%% 
Leer%% !
(%%! "
string%%" (
hash%%) -
)%%- .
{&& 	
return'' 

StatusCode'' 
('' 
$num'' !
,''! "
new''# &
{''' (
administrador'') 6
=''7 8"
serviciosAdministrador''9 O
.''O P
Leer''P T
(''T U
hash''U Y
)''Y Z
}''[ \
)''\ ]
;''] ^
}(( 	
[++ 	
HttpPut++	 
]++ 
[,, 	
	Authorize,,	 
],, 
[-- 	%
CustomAuthorizationFilter--	 "
(--" #
$str--# 2
)--2 3
]--3 4
public.. 
IActionResult.. 

Actualizar.. '
(..' (
Administrador..( 5
administrador..6 C
)..C D
{// 	
return00 

StatusCode00 
(00 
$num00 !
,00! "
new00# &
{00' (
informacion00) 4
=005 6"
serviciosAdministrador007 M
.00M N%
ActualizarDatosPersonales00N g
(00g h
administrador00h u
)00u v
}00w x
)00x y
;00y z
}11 	
}33 
}44 ∏S
ÄC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\WebAPI\WebAPI\Controllers\PlanController.cs
	namespace 	
WebAPI
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
PlanController 
:  !
ControllerBase" 0
{ 
private 
SPlan 
ServiciosPlan #
{$ %
get& )
;) *
}+ ,
public 
PlanController 
( 
PostgreSQLContext /
_context0 8
,8 9
IWebHostEnvironment: M
_hostEnvironmentN ^
)^ _
{ 	
ServiciosPlan 
= 
new 
SPlan  %
(% &
_context& .
,. /
_hostEnvironment0 @
)@ A
;A B
} 	
[,, 	
HttpPost,,	 
(,, 
$str,, "
),," #
],,# $
[-- 	
	Authorize--	 
]-- 
[.. 	%
CustomAuthorizationFilter..	 "
(.." #
$str..# .
)... /
]../ 0
public// 
IActionResult// 
Crear// "
(//" #
[//# $
FromBody//$ ,
]//, -
Plan//. 2
plan//3 7
,//7 8
string//9 ?
hash//@ D
,//D E
string//F L
email//M R
)//R S
{00 	
ServiciosPlan11 
.11 
Crear11 
(11  
plan11  $
,11$ %
hash11& *
,11* +
email11, 1
)111 2
;112 3
return22 

StatusCode22 
(22 
$num22 !
)22! "
;22" #
}33 	
[>> 	
HttpGet>>	 
(>> 
$str>> !
)>>! "
]>>" #
[?? 	
	Authorize??	 
]?? 
[@@ 	%
CustomAuthorizationFilter@@	 "
(@@" #
$str@@# .
)@@. /
]@@/ 0
publicAA 
IActionResultAA 
LeerAA !
(AA! "
stringAA" (
hashAA) -
,AA- .
stringAA/ 5
emailAA6 ;
)AA; <
{BB 	
returnCC 

StatusCodeCC 
(CC 
$numCC !
,CC! "
newCC# &
{CC' (
listaPlanesCC) 4
=CC5 6
ServiciosPlanCC7 D
.CCD E
LeerCCE I
(CCI J
hashCCJ N
,CCN O
emailCCP U
)CCU V
}CCW X
)CCX Y
;CCY Z
}DD 	
[PP 	
HttpGetPP	 
(PP 
$strPP &
)PP& '
]PP' (
[QQ 	
	AuthorizeQQ	 
]QQ 
[RR 	%
CustomAuthorizationFilterRR	 "
(RR" #
$strRR# .
)RR. /
]RR/ 0
publicSS 
IActionResultSS 
LeerSS !
(SS! "
intSS" %
idSS& (
,SS( )
stringSS* 0
hashSS1 5
,SS5 6
stringSS7 =
emailSS> C
)SSC D
{TT 	
returnUU 

StatusCodeUU 
(UU 
$numUU !
,UU! "
newUU# &
{UU' (
planUU) -
=UU. /
ServiciosPlanUU0 =
.UU= >
LeerUU> B
(UUB C
idUUC E
,UUE F
hashUUG K
,UUK L
emailUUM R
)UUR S
}UUT U
)UUU V
;UUV W
}VV 	
[aa 	
HttpGetaa	 
(aa 
$straa 3
)aa3 4
]aa4 5
[bb 	
	Authorizebb	 
]bb 
[cc 	%
CustomAuthorizationFiltercc	 "
(cc" #
$strcc# (
)cc( )
]cc) *
publicdd 
IActionResultdd 
Leerdd !
(dd! "
shortdd" '
paginadd( .
,dd. /
shortdd0 5
cantidaddd6 >
,dd> ?
booldd@ D
estadoddE K
)ddK L
{ee 	
returnff 

StatusCodeff 
(ff 
$numff !
,ff! "
newff# &
{ff' (
informacionff) 4
=ff5 6
ServiciosPlanff7 D
.ffD E
LeerffE I
(ffI J
paginaffJ P
,ffP Q
cantidadffR Z
,ffZ [
estadoff\ b
)ffb c
}ffd e
)ffe f
;fff g
}gg 	
[qq 	
HttpPostqq	 
(qq 
$strqq +
)qq+ ,
]qq, -
[rr 	
	Authorizerr	 
]rr 
[ss 	%
CustomAuthorizationFilterss	 "
(ss" #
$strss# 2
)ss2 3
]ss3 4
publictt 
IActionResulttt 
Leertt !
(tt! "
[tt" #
FromBodytt# +
]tt+ ,
Busquedatt- 5

parametrostt6 @
,tt@ A
shortttB G
paginattH N
,ttN O
shortttP U
cantidadttV ^
)tt^ _
{uu 	
returnvv 

StatusCodevv 
(vv 
$numvv !
,vv! "
newvv# &
{vv' (
informacionvv) 4
=vv5 6
ServiciosPlanvv7 D
.vvD E
LeervvE I
(vvI J

parametrosvvJ T
,vvT U
paginavvV \
,vv\ ]
cantidadvv^ f
)vvf g
}vvh i
)vvi j
;vvj k
}ww 	
[
ÅÅ 	
HttpPost
ÅÅ	 
(
ÅÅ 
$str
ÅÅ -
)
ÅÅ- .
]
ÅÅ. /
public
ÇÇ 
IActionResult
ÇÇ 
LeerPaginado
ÇÇ )
(
ÇÇ) *
[
ÇÇ* +
FromBody
ÇÇ+ 3
]
ÇÇ3 4
Busqueda
ÇÇ5 =

parametros
ÇÇ> H
,
ÇÇH I
short
ÇÇJ O
pagina
ÇÇP V
,
ÇÇV W
short
ÇÇX ]
cantidad
ÇÇ^ f
)
ÇÇf g
{
ÉÉ 	

parametros
ÑÑ 
.
ÑÑ 
Estado
ÑÑ 
=
ÑÑ 
true
ÑÑ  $
;
ÑÑ$ %
return
ÖÖ 

StatusCode
ÖÖ 
(
ÖÖ 
$num
ÖÖ !
,
ÖÖ! "
new
ÖÖ# &
{
ÖÖ' (
informacion
ÖÖ) 4
=
ÖÖ5 6
ServiciosPlan
ÖÖ7 D
.
ÖÖD E
Leer
ÖÖE I
(
ÖÖI J

parametros
ÖÖJ T
,
ÖÖT U
pagina
ÖÖV \
,
ÖÖ\ ]
cantidad
ÖÖ^ f
)
ÖÖf g
}
ÖÖh i
)
ÖÖi j
;
ÖÖj k
}
ÜÜ 	
[
íí 	
HttpPut
íí	 
(
íí 
$str
íí !
)
íí! "
]
íí" #
[
ìì 	
	Authorize
ìì	 
]
ìì 
[
îî 	'
CustomAuthorizationFilter
îî	 "
(
îî" #
$str
îî# .
)
îî. /
]
îî/ 0
public
ïï 
IActionResult
ïï 

Actualizar
ïï '
(
ïï' (
[
ïï( )
FromBody
ïï) 1
]
ïï1 2
Plan
ïï3 7
plan
ïï8 <
,
ïï< =
string
ïï> D
hash
ïïE I
,
ïïI J
string
ïïK Q
email
ïïR W
)
ïïW X
{
ññ 	
ServiciosPlan
óó 
.
óó 

Actualizar
óó $
(
óó$ %
plan
óó% )
,
óó) *
hash
óó+ /
,
óó/ 0
email
óó1 6
)
óó6 7
;
óó7 8
return
òò 

StatusCode
òò 
(
òò 
$num
òò !
)
òò! "
;
òò" #
}
ôô 	
[
¶¶ 	
HttpPut
¶¶	 
(
¶¶ 
$str
¶¶ /
)
¶¶/ 0
]
¶¶0 1
[
ßß 	
	Authorize
ßß	 
]
ßß 
[
®® 	'
CustomAuthorizationFilter
®®	 "
(
®®" #
$str
®®# .
)
®®. /
]
®®/ 0
public
©© 
IActionResult
©© 

Actualizar
©© '
(
©©' (
int
©©( +
id
©©, .
,
©©. /
string
©©0 6
hash
©©7 ;
,
©©; <
string
©©= C
email
©©D I
)
©©I J
{
™™ 	!
IFormFileCollection
´´ 
listaImagenes
´´  -
=
´´. /
Request
´´0 7
.
´´7 8
Form
´´8 <
.
´´< =
Files
´´= B
;
´´B C
ServiciosPlan
¨¨ 
.
¨¨ 

Actualizar
¨¨ $
(
¨¨$ %
id
¨¨% '
,
¨¨' (
hash
¨¨) -
,
¨¨- .
email
¨¨/ 4
,
¨¨4 5
listaImagenes
¨¨6 C
)
¨¨C D
;
¨¨D E
return
≠≠ 

StatusCode
≠≠ 
(
≠≠ 
$num
≠≠ !
)
≠≠! "
;
≠≠" #
}
ÆÆ 	
[
∫∫ 	

HttpDelete
∫∫	 
(
∫∫ 
$str
∫∫ )
)
∫∫) *
]
∫∫* +
[
ªª 	
	Authorize
ªª	 
]
ªª 
[
ºº 	'
CustomAuthorizationFilter
ºº	 "
(
ºº" #
$str
ºº# .
)
ºº. /
]
ºº/ 0
public
ΩΩ 
IActionResult
ΩΩ 
Eliminar
ΩΩ %
(
ΩΩ% &
int
ΩΩ& )
id
ΩΩ* ,
,
ΩΩ, -
string
ΩΩ. 4
hash
ΩΩ5 9
,
ΩΩ9 :
string
ΩΩ; A
email
ΩΩB G
)
ΩΩG H
{
ææ 	
ServiciosPlan
øø 
.
øø 
Eliminar
øø "
(
øø" #
id
øø# %
,
øø% &
hash
øø' +
,
øø+ ,
email
øø- 2
)
øø2 3
;
øø3 4
return
¿¿ 

StatusCode
¿¿ 
(
¿¿ 
$num
¿¿ !
)
¿¿! "
;
¿¿" #
}
¡¡ 	
[
ÕÕ 	

HttpDelete
ÕÕ	 
(
ÕÕ 
$str
ÕÕ D
)
ÕÕD E
]
ÕÕE F
public
ŒŒ 
IActionResult
ŒŒ 
Eliminar
ŒŒ %
(
ŒŒ% &
int
ŒŒ& )
id
ŒŒ* ,
,
ŒŒ, -
string
ŒŒ. 4
hash
ŒŒ5 9
,
ŒŒ9 :
string
ŒŒ; A
email
ŒŒB G
,
ŒŒG H
string
ŒŒI O
direccionImagen
ŒŒP _
)
ŒŒ_ `
{
œœ 	
ServiciosPlan
–– 
.
–– 
Eliminar
–– "
(
––" #
id
––# %
,
––% &
hash
––' +
,
––+ ,
email
––- 2
,
––2 3
direccionImagen
––4 C
)
––C D
;
––D E
return
—— 

StatusCode
—— 
(
—— 
$num
—— !
)
——! "
;
——" #
}
““ 	
}
‘‘ 
}’’ ≠<
ÖC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\WebAPI\WebAPI\Controllers\ProveedorController.cs
	namespace 	
WebAPI
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
ProveedorController $
:% &
ControllerBase' 5
{ 
private 

SProveedor 
ServiciosProveedor -
{. /
get0 3
;3 4
}5 6
public 
ProveedorController "
(" #
PostgreSQLContext# 4
_context5 =
,= >
IConfiguration? M
_configurationN \
,\ ]
IWebHostEnvironment^ q
_hostEnvironment	r Ç
)
Ç É
{ 	
ServiciosProveedor 
=  
new! $

SProveedor% /
(/ 0
_context0 8
,8 9
_configuration: H
,H I
_hostEnvironmentJ Z
)Z [
;[ \
} 	
[## 	
HttpPost##	 
]## 
public$$ 
async$$ 
Task$$ 
<$$ 
IActionResult$$ '
>$$' (
Crear$$) .
($$. /
[$$/ 0
FromBody$$0 8
]$$8 9
	Proveedor$$: C
	proveedor$$D M
)$$M N
{%% 	
await&& 
ServiciosProveedor&& $
.&&$ %
Crear&&% *
(&&* +
	proveedor&&+ 4
)&&4 5
;&&5 6
return'' 

StatusCode'' 
('' 
$num'' !
)''! "
;''" #
}(( 	
[++ 	
HttpGet++	 
(++ 
$str++ 
)++ 
]++ 
[,, 	
	Authorize,,	 
],, 
[-- 	%
CustomAuthorizationFilter--	 "
(--" #
$str--# .
)--. /
]--/ 0
public.. 
IActionResult.. 
Leer.. !
(..! "
string.." (
hash..) -
)..- .
{// 	
return00 

StatusCode00 
(00 
$num00 !
,00! "
new00# &
{00' (
	proveedor00) 2
=003 4
ServiciosProveedor005 G
.00G H
Leer00H L
(00L M
hash00M Q
)00Q R
}00S T
)00T U
;00U V
}11 	
[44 	
HttpGet44	 
(44 
$str44 3
)443 4
]444 5
[55 	
	Authorize55	 
]55 
[66 	%
CustomAuthorizationFilter66	 "
(66" #
$str66# 2
)662 3
]663 4
public77 
IActionResult77 
Leer77 !
(77! "
short77" '
pagina77( .
,77. /
short770 5
cantidad776 >
,77> ?
bool77@ D
estado77E K
)77K L
{88 	
return99 

StatusCode99 
(99 
$num99 !
,99! "
new99# &
{99' (
informacion99) 4
=995 6
ServiciosProveedor997 I
.99I J 
LeerEstadoHabilitado99J ^
(99^ _
pagina99_ e
,99e f
cantidad99g o
,99o p
estado99q w
)99w x
}99y z
)99z {
;99{ |
}:: 	
[CC 	
HttpPostCC	 
(CC 
$strCC +
)CC+ ,
]CC, -
[DD 	
	AuthorizeDD	 
]DD 
[EE 	%
CustomAuthorizationFilterEE	 "
(EE" #
$strEE# 2
)EE2 3
]EE3 4
publicFF 
IActionResultFF 
LeerFF !
(FF! "
[FF" #
FromBodyFF# +
]FF+ ,
BusquedaProveedorFF- >

parametrosFF? I
,FFI J
shortFFK P
paginaFFQ W
,FFW X
shortFFY ^
cantidadFF_ g
)FFg h
{GG 	
returnHH 

StatusCodeHH 
(HH 
$numHH !
,HH! "
newHH# &
{HH' (
informacionHH) 4
=HH5 6
ServiciosProveedorHH7 I
.HHI J
LeerHHJ N
(HHN O

parametrosHHO Y
,HHY Z
paginaHH[ a
,HHa b
cantidadHHc k
)HHk l
}HHm n
)HHn o
;HHo p
}II 	
[LL 	
HttpPutLL	 
]LL 
[MM 	
	AuthorizeMM	 
]MM 
[NN 	%
CustomAuthorizationFilterNN	 "
(NN" #
$strNN# .
)NN. /
]NN/ 0
publicOO 
IActionResultOO 

ActualizarOO '
(OO' (
[OO( )
FromBodyOO) 1
]OO1 2
	ProveedorOO3 <
	proveedorOO= F
)OOF G
{PP 	
returnQQ 

StatusCodeQQ 
(QQ 
$numQQ !
,QQ! "
newQQ# &
{QQ' (
informacionQQ) 4
=QQ5 6
ServiciosProveedorQQ7 I
.QQI J%
ActualizarDatosPersonalesQQJ c
(QQc d
	proveedorQQd m
)QQm n
}QQo p
)QQp q
;QQq r
}RR 	
[UU 	
HttpPutUU	 
(UU 
$strUU !
)UU! "
]UU" #
[VV 	
	AuthorizeVV	 
]VV 
[WW 	%
CustomAuthorizationFilterWW	 "
(WW" #
$strWW# .
)WW. /
]WW/ 0
publicXX 
IActionResultXX 

ActualizarXX '
(XX' (
[XX( )
FromFormXX) 1
]XX1 2
	IFormFileXX3 <
imagenXX= C
,XXC D
stringXXE K
hashXXL P
,XXP Q
stringXXR X
emailXXY ^
)XX^ _
{YY 	
returnZZ 

StatusCodeZZ 
(ZZ 
$numZZ !
,ZZ! "
newZZ# &
{ZZ' (
informacionZZ) 4
=ZZ5 6
ServiciosProveedorZZ7 I
.ZZI J
ActualizarIconoZZJ Y
(ZZY Z
imagenZZZ `
,ZZ` a
hashZZb f
,ZZf g
emailZZh m
)ZZm n
}ZZo p
)ZZp q
;ZZq r
}[[ 	
[^^ 	
HttpPut^^	 
(^^ 
$str^^ 
)^^ 
]^^ 
[__ 	
	Authorize__	 
]__ 
[`` 	%
CustomAuthorizationFilter``	 "
(``" #
$str``# 2
)``2 3
]``3 4
publicaa 
IActionResultaa 

Actualizaraa '
(aa' (
stringaa( .
hashaa/ 3
)aa3 4
{bb 	
ServiciosProveedorcc 
.cc 
ActualizarEstadocc /
(cc/ 0
hashcc0 4
)cc4 5
;cc5 6
returndd 

StatusCodedd 
(dd 
$numdd !
)dd! "
;dd" #
}ee 	
[hh 	
HttpGethh	 
(hh 
$strhh 
)hh 
]hh 
publicii 
asyncii 
Taskii 
<ii 
IActionResultii '
>ii' (

ValidarNitii) 3
(ii3 4
stringii4 :
nitii; >
)ii> ?
{jj 	
returnkk 

StatusCodekk 
(kk 
$numkk !
,kk! "
newkk# &
{kk' (
existekk) /
=kk0 1
awaitkk2 7
ServiciosProveedorkk8 J
.kkJ K

ValidarNitkkK U
(kkU V
nitkkV Y
)kkY Z
}kk[ \
)kk\ ]
;kk] ^
}ll 	
}nn 
}pp ò
äC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\WebAPI\WebAPI\Controllers\PuntuacionPlanController.cs
	namespace

 	
WebAPI


 
.

 
Controllers

 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class $
PuntuacionPlanController )
:* +
ControllerBase, :
{ 
private 
SPuntuacionPlan #
ServiciosPuntuacionPlan  7
{8 9
get: =
;= >
}? @
public $
PuntuacionPlanController '
(' (
PostgreSQLContext( 9
_context: B
,B C
IConfigurationD R
_configurationS a
)a b
{ 	#
ServiciosPuntuacionPlan #
=$ %
new& )
SPuntuacionPlan* 9
(9 :
_context: B
,B C
_configurationD R
)R S
;S T
} 	
[++ 	
HttpPost++	 
(++ 
$str++ "
)++" #
]++# $
[,, 	
	Authorize,,	 
],, 
[-- 	%
CustomAuthorizationFilter--	 "
(--" #
$str--# .
)--. /
]--/ 0
public.. 
IActionResult.. 
Crear.. "
(.." #
[..# $
FromBody..$ ,
].., -
PuntuacionPlan... <

puntuacion..= G
,..G H
string..I O
hash..P T
,..T U
string..V \
email..] b
)..b c
{// 	#
ServiciosPuntuacionPlan00 #
.00# $
Crear00$ )
(00) *

puntuacion00* 4
,004 5
hash006 :
,00: ;
email00< A
)00A B
;00B C
return11 

StatusCode11 
(11 
$num11 !
)11! "
;11" #
}22 	
}44 
}55 º
éC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\WebAPI\WebAPI\Controllers\PuntuacionServicioController.cs
	namespace

 	
WebAPI


 
.

 
Controllers

 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class (
PuntuacionServicioController -
:. /
ControllerBase0 >
{ 
private 
SPuntuacionServicio #'
ServiciosPuntuacionServicio$ ?
{@ A
getB E
;E F
}G H
public (
PuntuacionServicioController +
(+ ,
PostgreSQLContext, =
_context> F
,F G
IConfigurationH V
_configurationW e
)e f
{ 	'
ServiciosPuntuacionServicio '
=( )
new* -
SPuntuacionServicio. A
(A B
_contextB J
,J K
_configurationL Z
)Z [
;[ \
} 	
[++ 	
HttpPost++	 
(++ 
$str++ "
)++" #
]++# $
[,, 	
	Authorize,,	 
],, 
[-- 	%
CustomAuthorizationFilter--	 "
(--" #
$str--# .
)--. /
]--/ 0
public.. 
IActionResult.. 
Crear.. "
(.." #
[..# $
FromBody..$ ,
].., -
PuntuacionServicio... @

puntuacion..A K
,..K L
string..M S
hash..T X
,..X Y
string..Z `
email..a f
)..f g
{// 	'
ServiciosPuntuacionServicio00 '
.00' (
Crear00( -
(00- .

puntuacion00. 8
,008 9
hash00: >
,00> ?
email00@ E
)00E F
;00F G
return11 

StatusCode11 
(11 
$num11 !
)11! "
;11" #
}22 	
}44 
}55 †
ãC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\WebAPI\WebAPI\Controllers\RecuperarCuentaController.cs
	namespace 	
WebAPI
 
. 
Controllers 
{		 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class %
RecuperarCuentaController *
:+ ,
ControllerBase- ;
{ 
private 
PostgreSQLContext !
	DbContext" +
{, -
get. 1
;1 2
}3 4
private 
IConfiguration 
Configuration ,
{- .
get/ 2
;2 3
}4 5
private 
SRecuperarCuenta  $
serviciosRecuperarCuenta! 9
{: ;
get< ?
;? @
}A B
public %
RecuperarCuentaController (
(( )
PostgreSQLContext) :
_context; C
,C D
IConfigurationE S
_configurationT b
)b c
{ 	
	DbContext 
= 
_context  
;  !
Configuration 
= 
_configuration *
;* +$
serviciosRecuperarCuenta $
=% &
new' *
SRecuperarCuenta+ ;
(; <
_context< D
,D E
_configurationF T
)T U
;U V
} 	
[!! 	
HttpGet!!	 
(!! 
$str!!  
)!!  !
]!!! "
public"" 
async"" 
Task"" 
<"" 
IActionResult"" '
>""' (
Crear"") .
("". /
string""/ 5
email""6 ;
,""; <
string""= C
rol""D G
)""G H
{## 	
await$$ $
serviciosRecuperarCuenta$$ *
.$$* +
Crear$$+ 0
($$0 1
email$$1 6
,$$6 7
rol$$8 ;
)$$; <
;$$< =
return%% 

StatusCode%% 
(%% 
$num%% !
)%%! "
;%%" #
}&& 	
[)) 	
HttpGet))	 
()) 
$str)) /
)))/ 0
]))0 1
public** 
IActionResult** 
CambiarClave** )
(**) *
string*** 0
hash**1 5
,**5 6
string**7 =
clave**> C
)**C D
{++ 	$
serviciosRecuperarCuenta,, $
.,,$ %
CambiarClave,,% 1
(,,1 2
hash,,2 6
,,,6 7
clave,,8 =
),,= >
;,,> ?
return-- 

StatusCode-- 
(-- 
$num-- !
)--! "
;--" #
}.. 	
[11 	
HttpGet11	 
(11 
$str11 0
)110 1
]111 2
public22 
async22 
Task22 
<22 
IActionResult22 '
>22' (
ReenviarCodigo22) 7
(227 8
string228 >
email22? D
)22D E
{33 	
await44 $
serviciosRecuperarCuenta44 *
.44* +
ReenviarCodigo44+ 9
(449 :
email44: ?
)44? @
;44@ A
return55 

StatusCode55 
(55 
$num55 !
)55! "
;55" #
}66 	
}88 
}99 ‚
ÖC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\WebAPI\WebAPI\Controllers\SeguridadController.cs
	namespace

 	
WebAPI


 
.

 
Controllers

 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
SeguridadController $
:% &
ControllerBase' 5
{ 
private 

SSeguridad 
serviciosSeguridad -
{. /
get0 3
;3 4
}5 6
private 
PostgreSQLContext !
	DbContext" +
{, -
get. 1
;1 2
}3 4
private 
IConfiguration 
Configuration ,
{- .
get/ 2
;2 3
}4 5
public 
SeguridadController "
(" #
PostgreSQLContext# 4
_context5 =
,= >
IConfiguration? M
_configurationN \
)\ ]
{ 	
serviciosSeguridad 
=  
new! $

SSeguridad% /
(/ 0
_context0 8
,8 9
_configuration: H
)H I
;I J
	DbContext 
= 
_context  
;  !
Configuration 
= 
_configuration *
;* +
} 	
[## 	
HttpPost##	 
(## 
$str## "
)##" #
]### $
public$$ 
IActionResult$$ 
IniciarSesion$$ *
($$* +
Login$$+ 0
login$$1 6
)$$6 7
{%% 	
return&& 

StatusCode&& 
(&& 
$num&& !
,&&! "
serviciosSeguridad&&# 5
.&&5 6
IniciarSesion&&6 C
(&&C D
login&&D I
,&&I J
true&&K O
)&&O P
)&&P Q
;&&Q R
}'' 	
[** 	
	Authorize**	 
]** 
[++ 	%
CustomAuthorizationFilter++	 "
(++" #
$str++# (
)++( )
]++) *
[,, 	
HttpGet,,	 
(,, 
$str,, (
),,( )
],,) *
public-- 
IActionResult-- 
CerrarSesion-- )
(--) *
string--* 0
email--1 6
)--6 7
{.. 	
serviciosSeguridad// 
.// 
CerrarSesion// +
(//+ ,
email//, 1
)//1 2
;//2 3
return00 

StatusCode00 
(00 
$num00 !
)00! "
;00" #
}11 	
}33 
}44 õT
ÑC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\WebAPI\WebAPI\Controllers\ServicioController.cs
	namespace 	
WebAPI
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
ServicioController #
:$ %
ControllerBase& 4
{ 
private 
	SServicio 
ServiciosServicio +
{, -
get. 1
;1 2
}3 4
public 
ServicioController !
(! "
PostgreSQLContext" 3
_context4 <
,< =
IWebHostEnvironment> Q
_hostEnvironmentR b
)b c
{ 	
ServiciosServicio 
= 
new  #
	SServicio$ -
(- .
_context. 6
,6 7
_hostEnvironment8 H
)H I
;I J
} 	
[,, 	
HttpPost,,	 
(,, 
$str,, "
),," #
],,# $
[-- 	
	Authorize--	 
]-- 
[.. 	%
CustomAuthorizationFilter..	 "
(.." #
$str..# .
)... /
]../ 0
public// 
IActionResult// 
Crear// "
(//" #
[//# $
FromBody//$ ,
]//, -
Servicio//. 6
servicio//7 ?
,//? @
string//A G
hash//H L
,//L M
string//N T
email//U Z
)//Z [
{00 	
ServiciosServicio11 
.11 
Crear11 #
(11# $
servicio11$ ,
,11, -
hash11. 2
,112 3
email114 9
)119 :
;11: ;
return22 

StatusCode22 
(22 
$num22 !
)22! "
;22" #
}33 	
[>> 	
HttpGet>>	 
(>> 
$str>> !
)>>! "
]>>" #
[?? 	
	Authorize??	 
]?? 
[@@ 	%
CustomAuthorizationFilter@@	 "
(@@" #
$str@@# .
)@@. /
]@@/ 0
publicAA 
IActionResultAA 
LeerAA !
(AA! "
stringAA" (
hashAA) -
,AA- .
stringAA/ 5
emailAA6 ;
)AA; <
{BB 	
returnCC 

StatusCodeCC 
(CC 
$numCC !
,CC! "
newCC# &
{CC' (
listaServiciosCC) 7
=CC8 9
ServiciosServicioCC: K
.CCK L
LeerCCL P
(CCP Q
hashCCQ U
,CCU V
emailCCW \
)CC\ ]
}CC^ _
)CC_ `
;CC` a
}DD 	
[PP 	
HttpGetPP	 
(PP 
$strPP &
)PP& '
]PP' (
[QQ 	
	AuthorizeQQ	 
]QQ 
[RR 	%
CustomAuthorizationFilterRR	 "
(RR" #
$strRR# .
)RR. /
]RR/ 0
publicSS 
IActionResultSS 
LeerSS !
(SS! "
intSS" %
idSS& (
,SS( )
stringSS* 0
hashSS1 5
,SS5 6
stringSS7 =
emailSS> C
)SSC D
{TT 	
returnUU 

StatusCodeUU 
(UU 
$numUU !
,UU! "
newUU# &
{UU' (
servicioUU) 1
=UU2 3
ServiciosServicioUU4 E
.UUE F
LeerUUF J
(UUJ K
idUUK M
,UUM N
hashUUO S
,UUS T
emailUUU Z
)UUZ [
}UU\ ]
)UU] ^
;UU^ _
}VV 	
[aa 	
HttpGetaa	 
(aa 
$straa 3
)aa3 4
]aa4 5
[bb 	
	Authorizebb	 
]bb 
[cc 	%
CustomAuthorizationFiltercc	 "
(cc" #
$strcc# (
)cc( )
]cc) *
publicdd 
IActionResultdd 
Leerdd !
(dd! "
shortdd" '
paginadd( .
,dd. /
shortdd0 5
cantidaddd6 >
,dd> ?
booldd@ D
estadoddE K
)ddK L
{ee 	
returnff 

StatusCodeff 
(ff 
$numff !
,ff! "
newff# &
{ff' (
informacionff) 4
=ff5 6
ServiciosServicioff7 H
.ffH I
LeerffI M
(ffM N
paginaffN T
,ffT U
cantidadffV ^
,ff^ _
estadoff` f
)fff g
}ffh i
)ffi j
;ffj k
}gg 	
[qq 	
HttpPostqq	 
(qq 
$strqq +
)qq+ ,
]qq, -
[rr 	
	Authorizerr	 
]rr 
[ss 	%
CustomAuthorizationFilterss	 "
(ss" #
$strss# 2
)ss2 3
]ss3 4
publictt 
IActionResulttt 
Leertt !
(tt! "
[tt" #
FromBodytt# +
]tt+ ,
Busquedatt- 5

parametrostt6 @
,tt@ A
shortttB G
paginattH N
,ttN O
shortttP U
cantidadttV ^
)tt^ _
{uu 	
returnvv 

StatusCodevv 
(vv 
$numvv !
,vv! "
newvv# &
{vv' (
informacionvv) 4
=vv5 6
ServiciosServiciovv7 H
.vvH I
LeervvI M
(vvM N

parametrosvvN X
,vvX Y
paginavvZ `
,vv` a
cantidadvvb j
)vvj k
}vvl m
)vvm n
;vvn o
}ww 	
[
ÅÅ 	
HttpPost
ÅÅ	 
(
ÅÅ 
$str
ÅÅ -
)
ÅÅ- .
]
ÅÅ. /
public
ÇÇ 
IActionResult
ÇÇ 
LeerPaginado
ÇÇ )
(
ÇÇ) *
[
ÇÇ* +
FromBody
ÇÇ+ 3
]
ÇÇ3 4
Busqueda
ÇÇ5 =

parametros
ÇÇ> H
,
ÇÇH I
short
ÇÇJ O
pagina
ÇÇP V
,
ÇÇV W
short
ÇÇX ]
cantidad
ÇÇ^ f
)
ÇÇf g
{
ÉÉ 	

parametros
ÑÑ 
.
ÑÑ 
Estado
ÑÑ 
=
ÑÑ 
true
ÑÑ  $
;
ÑÑ$ %
return
ÖÖ 

StatusCode
ÖÖ 
(
ÖÖ 
$num
ÖÖ !
,
ÖÖ! "
new
ÖÖ# &
{
ÖÖ' (
informacion
ÖÖ) 4
=
ÖÖ5 6
ServiciosServicio
ÖÖ7 H
.
ÖÖH I
Leer
ÖÖI M
(
ÖÖM N

parametros
ÖÖN X
,
ÖÖX Y
pagina
ÖÖZ `
,
ÖÖ` a
cantidad
ÖÖb j
)
ÖÖj k
}
ÖÖl m
)
ÖÖm n
;
ÖÖn o
}
ÜÜ 	
[
íí 	
HttpPut
íí	 
(
íí 
$str
íí !
)
íí! "
]
íí" #
[
ìì 	
	Authorize
ìì	 
]
ìì 
[
îî 	'
CustomAuthorizationFilter
îî	 "
(
îî" #
$str
îî# .
)
îî. /
]
îî/ 0
public
ïï 
IActionResult
ïï 

Actualizar
ïï '
(
ïï' (
[
ïï( )
FromBody
ïï) 1
]
ïï1 2
Servicio
ïï3 ;
servicio
ïï< D
,
ïïD E
string
ïïF L
hash
ïïM Q
,
ïïQ R
string
ïïS Y
email
ïïZ _
)
ïï_ `
{
ññ 	
ServiciosServicio
óó 
.
óó 

Actualizar
óó (
(
óó( )
servicio
óó) 1
,
óó1 2
hash
óó3 7
,
óó7 8
email
óó9 >
)
óó> ?
;
óó? @
return
òò 

StatusCode
òò 
(
òò 
$num
òò !
)
òò! "
;
òò" #
}
ôô 	
[
¶¶ 	
HttpPut
¶¶	 
(
¶¶ 
$str
¶¶ /
)
¶¶/ 0
]
¶¶0 1
[
ßß 	
	Authorize
ßß	 
]
ßß 
[
®® 	'
CustomAuthorizationFilter
®®	 "
(
®®" #
$str
®®# .
)
®®. /
]
®®/ 0
public
©© 
IActionResult
©© 

Actualizar
©© '
(
©©' (
int
©©( +
id
©©, .
,
©©. /
string
©©0 6
hash
©©7 ;
,
©©; <
string
©©= C
email
©©D I
)
©©I J
{
™™ 	!
IFormFileCollection
´´ 
listaImagenes
´´  -
=
´´. /
Request
´´0 7
.
´´7 8
Form
´´8 <
.
´´< =
Files
´´= B
;
´´B C
ServiciosServicio
¨¨ 
.
¨¨ 

Actualizar
¨¨ (
(
¨¨( )
id
¨¨) +
,
¨¨+ ,
hash
¨¨- 1
,
¨¨1 2
email
¨¨3 8
,
¨¨8 9
listaImagenes
¨¨: G
)
¨¨G H
;
¨¨H I
return
≠≠ 

StatusCode
≠≠ 
(
≠≠ 
$num
≠≠ !
)
≠≠! "
;
≠≠" #
}
ÆÆ 	
[
∫∫ 	

HttpDelete
∫∫	 
(
∫∫ 
$str
∫∫ )
)
∫∫) *
]
∫∫* +
[
ªª 	
	Authorize
ªª	 
]
ªª 
[
ºº 	'
CustomAuthorizationFilter
ºº	 "
(
ºº" #
$str
ºº# .
)
ºº. /
]
ºº/ 0
public
ΩΩ 
IActionResult
ΩΩ 
Eliminar
ΩΩ %
(
ΩΩ% &
int
ΩΩ& )
id
ΩΩ* ,
,
ΩΩ, -
string
ΩΩ. 4
hash
ΩΩ5 9
,
ΩΩ9 :
string
ΩΩ; A
email
ΩΩB G
)
ΩΩG H
{
ææ 	
ServiciosServicio
øø 
.
øø 
Eliminar
øø &
(
øø& '
id
øø' )
,
øø) *
hash
øø+ /
,
øø/ 0
email
øø1 6
)
øø6 7
;
øø7 8
return
¿¿ 

StatusCode
¿¿ 
(
¿¿ 
$num
¿¿ !
)
¿¿! "
;
¿¿" #
}
¡¡ 	
[
ŒŒ 	

HttpDelete
ŒŒ	 
(
ŒŒ 
$str
ŒŒ D
)
ŒŒD E
]
ŒŒE F
public
œœ 
IActionResult
œœ 
Eliminar
œœ %
(
œœ% &
int
œœ& )
id
œœ* ,
,
œœ, -
string
œœ. 4
hash
œœ5 9
,
œœ9 :
string
œœ; A
email
œœB G
,
œœG H
string
œœI O
direccionImagen
œœP _
)
œœ_ `
{
–– 	
ServiciosServicio
—— 
.
—— 
Eliminar
—— &
(
——& '
id
——' )
,
——) *
hash
——+ /
,
——/ 0
email
——1 6
,
——6 7
direccionImagen
——8 G
)
——G H
;
——H I
return
““ 

StatusCode
““ 
(
““ 
$num
““ !
)
““! "
;
““" #
}
”” 	
}
’’ 
}÷÷ ÷
ÉC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\WebAPI\WebAPI\Controllers\TuristaController.cs
	namespace 	
WebAPI
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
TuristaController "
:# $
ControllerBase% 3
{ 
private 
STurista 
serviciosTurista )
{* +
get, /
;/ 0
}1 2
private 
PostgreSQLContext !
	DbContext" +
{, -
get. 1
;1 2
}3 4
private 
IConfiguration 
Configuration ,
{- .
get/ 2
;2 3
}4 5
public 
TuristaController  
(  !
PostgreSQLContext! 2
_context3 ;
,; <
IConfiguration= K
_configurationL Z
)Z [
{ 	
	DbContext 
= 
_context  
;  !
Configuration 
= 
_configuration *
;* +
serviciosTurista 
= 
new "
STurista# +
(+ ,
_context, 4
,4 5
_configuration6 D
)D E
;E F
} 	
[$$ 	
HttpPost$$	 
]$$ 
public%% 
async%% 
Task%% 
<%% 
IActionResult%% '
>%%' (
Crear%%) .
(%%. /
[%%/ 0
FromBody%%0 8
]%%8 9
Turista%%: A
turista%%B I
)%%I J
{&& 	
await'' 
serviciosTurista'' "
.''" #
Crear''# (
(''( )
turista'') 0
)''0 1
;''1 2
return(( 

StatusCode(( 
((( 
$num(( !
)((! "
;((" #
})) 	
[,, 	
HttpGet,,	 
(,, 
$str,, 
),, 
],, 
[-- 	
	Authorize--	 
]-- 
[.. 	%
CustomAuthorizationFilter..	 "
(.." #
$str..# ,
).., -
]..- .
public// 
IActionResult// 
Leer// !
(//! "
string//" (
hash//) -
)//- .
{00 	
return11 

StatusCode11 
(11 
$num11 !
,11! "
new11# &
{11' (
turista11) 0
=111 2
serviciosTurista113 C
.11C D
Leer11D H
(11H I
hash11I M
)11M N
}11O P
)11P Q
;11Q R
}22 	
[55 	
HttpPut55	 
]55 
[66 	
	Authorize66	 
]66 
[77 	%
CustomAuthorizationFilter77	 "
(77" #
$str77# ,
)77, -
]77- .
public88 
IActionResult88 

Actualizar88 '
(88' (
[88( )
FromBody88) 1
]881 2
Turista883 :
turista88; B
)88B C
{99 	
return:: 

StatusCode:: 
(:: 
$num:: !
,::! "
new::# &
{::' (
informacion::) 4
=::5 6
serviciosTurista::7 G
.::G H%
ActualizarDatosPersonales::H a
(::a b
turista::b i
)::i j
}::k l
)::l m
;::m n
};; 	
}== 
}>> æ
ÉC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\WebAPI\WebAPI\Controllers\UsuarioController.cs
	namespace 	
WebAPI
 
. 
Controllers 
{		 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
UsuarioController "
:# $
ControllerBase% 3
{ 
private 
PostgreSQLContext !
	DbContext" +
{, -
get. 1
;1 2
}3 4
private 
IConfiguration 
Configuration ,
{- .
get/ 2
;2 3
}4 5
private 

SProveedor 
serviciosProveedor -
{. /
get0 3
;3 4
}5 6
public 
UsuarioController  
(  !
PostgreSQLContext! 2
_context3 ;
,; <
IConfiguration= K
_configurationL Z
)Z [
{ 	
	DbContext 
= 
_context  
;  !
Configuration 
= 
_configuration *
;* +
serviciosProveedor 
=  
new! $

SProveedor% /
(/ 0
_context0 8
,8 9
_configuration: H
)H I
;I J
} 	
[!! 	
HttpGet!!	 
(!! 
$str!!  
)!!  !
]!!! "
public"" 
async"" 
Task"" 
<"" 
IActionResult"" '
>""' (
ValidarEmail"") 5
(""5 6
string""6 <
email""= B
)""B C
{## 	
return$$ 

StatusCode$$ 
($$ 
$num$$ !
,$$! "
new$$# &
{$$' (
existe$$) /
=$$0 1
await$$2 7
serviciosProveedor$$8 J
.$$J K
ValidarEmail$$K W
($$W X
email$$X ]
)$$] ^
}$$_ `
)$$` a
;$$a b
}%% 	
[(( 	
HttpGet((	 
((( 
$str(( *
)((* +
]((+ ,
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
ReenviarCodigo))) 7
())7 8
string))8 >
email))? D
)))D E
{** 	
await++ 
new++ 
SPreRegistro++ "
(++" #
	DbContext++# ,
,++, -
Configuration++. ;
)++; <
.++< =
ReenviarCodigo++= K
(++K L
email++L Q
)++Q R
;++R S
return,, 

StatusCode,, 
(,, 
$num,, !
),,! "
;,," #
}-- 	
[00 	
HttpGet00	 
(00 
$str00 (
)00( )
]00) *
public11 
IActionResult11 
ValidarCodigo11 *
(11* +
string11+ 1
hash112 6
)116 7
{22 	
new33 
SPreRegistro33 
(33 
	DbContext33 &
)33& '
.33' (
ValidarCodigo33( 5
(335 6
hash336 :
)33: ;
;33; <
return44 

StatusCode44 
(44 
$num44 !
)44! "
;44" #
}55 	
}77 
}88 •%
áC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\WebAPI\WebAPI\Filters\CustomAuthorizationFilter.cs
	namespace		 	
WebAPI		
 
.		 
Filters		 
{

 
public 

class %
CustomAuthorizationFilter *
:+ ,
	Attribute- 6
,6 7 
IAuthorizationFilter8 L
{ 
private 
string 
Permiso 
{  
get! $
;$ %
}& '
public %
CustomAuthorizationFilter (
(( )
string) /
permisos0 8
)8 9
{ 	
Permiso 
= 
permisos 
; 
} 	
public 
void 
OnAuthorization #
(# $&
AuthorizationFilterContext$ >
context? F
)F G
{ 	
var 
tokenManager 
= 
(  
ITokenManager  -
)- .
context. 5
.5 6
HttpContext6 A
.A B
RequestServicesB Q
.Q R

GetServiceR \
(\ ]
typeof] c
(c d
ITokenManagerd q
)q r
)r s
;s t
bool 
tokenExiste 
= 
true #
;# $
if!! 
(!! 
!!! 
context!! 
.!! 
HttpContext!! $
.!!$ %
Request!!% ,
.!!, -
Headers!!- 4
.!!4 5
ContainsKey!!5 @
(!!@ A
$str!!A P
)!!P Q
)!!Q R
tokenExiste"" 
="" 
false"" #
;""# $
string$$ 
token$$ 
=$$ 
string$$ !
.$$! "
Empty$$" '
;$$' (
if&& 
(&& 
tokenExiste&& 
)&& 
{'' 
if)) 
()) 
!)) 
Permiso)) 
.)) 
Equals)) #
())# $
$str))$ )
)))) *
)))* +
{** 
token,, 
=,, 
context,, #
.,,# $
HttpContext,,$ /
.,,/ 0
Request,,0 7
.,,7 8
Headers,,8 ?
.,,? @
First,,@ E
(,,E F
x,,F G
=>,,H J
x,,K L
.,,L M
Key,,M P
==,,Q S
$str,,T c
),,c d
.,,d e
Value,,e j
;,,j k
string-- 
rol-- 
=--  
tokenManager--! -
.--- .
GetRol--. 4
(--4 5
token--5 :
.--: ;
Replace--; B
(--B C
$str--C L
,--L M
$str--N P
)--P Q
)--Q R
;--R S
if// 
(// 
!// 
rol// 
.// 
Equals// #
(//# $
Permiso//$ +
)//+ ,
)//, -
{00 
context11 
.11  
HttpContext11  +
.11+ ,
Response11, 4
.114 5

StatusCode115 ?
=11@ A
(11B C
int11C F
)11F G
HttpStatusCode11G U
.11U V
Unauthorized11V b
;11b c
context22 
.22  
HttpContext22  +
.22+ ,
Response22, 4
.224 5
ContentType225 @
=22A B
$str22C U
;22U V
context33 
.33  
Result33  &
=33' (
new33) ,

JsonResult33- 7
(337 8
new338 ;
{44 
error55 !
=55" #
new55$ '
{55( )
message55* 1
=552 3
$str554 c
}55d e
}66 
)66 
;66 
}77 
}99 
};; 
else<< 
{== 
context?? 
.?? 
HttpContext?? #
.??# $
Response??$ ,
.??, -

StatusCode??- 7
=??8 9
(??: ;
int??; >
)??> ?
HttpStatusCode??? M
.??M N
Unauthorized??N Z
;??Z [
context@@ 
.@@ 
HttpContext@@ #
.@@# $
Response@@$ ,
.@@, -
ContentType@@- 8
=@@9 :
$str@@; M
;@@M N
contextAA 
.AA 
ResultAA 
=AA  
newAA! $

JsonResultAA% /
(AA/ 0
newAA0 3
{BB 
errorCC 
=CC 
newCC 
{CC  !
messageCC" )
=CC* +
$strCC, [
}CC\ ]
}DD 
)DD 
;DD 
}FF 
}HH 	
}II 
}JJ „
ÉC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\WebAPI\WebAPI\Filters\CustomExceptionFilter.cs
	namespace 	
WebAPI
 
. 
Filters 
{		 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Class% *
|+ ,
AttributeTargets- =
.= >
Method> D
)D E
]E F
public 

class !
CustomExceptionFilter &
:' ($
ExceptionFilterAttribute) A
{ 
public 
override 
void 
OnException (
(( )
ExceptionContext) 9
context: A
)A B
{ 	
if 
( 
context 
. 
	Exception !
is" $
IntegridadException% 8
)8 9
context 
. 
HttpContext #
.# $
Response$ ,
., -

StatusCode- 7
=8 9
(: ;
int; >
)> ?
HttpStatusCode? M
.M N
ConflictN V
;V W
else 
if 
( 
context 
. 
	Exception &
is' )
NoContentException* <
)< =
context 
. 
HttpContext #
.# $
Response$ ,
., -

StatusCode- 7
=8 9
(: ;
int; >
)> ?
HttpStatusCode? M
.M N
	NoContentN W
;W X
else 
if 
( 
context 
. 
	Exception &
is' )
NotFoundException* ;
); <
context 
. 
HttpContext #
.# $
Response$ ,
., -

StatusCode- 7
=8 9
(: ;
int; >
)> ?
HttpStatusCode? M
.M N
NotFoundN V
;V W
else 
if 
( 
context 
. 
	Exception &
is' )
BadRequestException* =
)= >
context 
. 
HttpContext #
.# $
Response$ ,
., -

StatusCode- 7
=8 9
(: ;
int; >
)> ?
HttpStatusCode? M
.M N

BadRequestN X
;X Y
else 
if 
( 
context 
. 
	Exception &
is' )!
UnauthorizedException* ?
)? @
context 
. 
HttpContext #
.# $
Response$ ,
., -

StatusCode- 7
=8 9
(: ;
int; >
)> ?
HttpStatusCode? M
.M N
UnauthorizedN Z
;Z [
else 
context 
. 
HttpContext #
.# $
Response$ ,
., -

StatusCode- 7
=8 9
(: ;
int; >
)> ?
HttpStatusCode? M
.M N
InternalServerErrorN a
;a b
context!! 
.!! 
HttpContext!! 
.!!  
Response!!  (
.!!( )
ContentType!!) 4
=!!5 6
$str!!7 I
;!!I J
context"" 
."" 
Result"" 
="" 
new""  

JsonResult""! +
(""+ ,
new"", /
{## 
error$$ 
=$$ 
new$$ 
{$$ 
context$$ %
.$$% &
	Exception$$& /
.$$/ 0
Message$$0 7
}$$8 9
}%% 
)%% 
;%% 
}'' 	
})) 
}** ¡

mC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\WebAPI\WebAPI\Program.cs
	namespace 	
WebAPI
 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{		 	
CreateHostBuilder

 
(

 
args

 "
)

" #
.

# $
Build

$ )
(

) *
)

* +
.

+ ,
Run

, /
(

/ 0
)

0 1
;

1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} îC
mC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\WebAPI\WebAPI\Startup.cs
	namespace 	
WebAPI
 
{ 
public 

class 
Startup 
{ 
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{   	
Configuration!! 
=!! 
configuration!! )
;!!) *
}"" 	
public'' 
void'' 
ConfigureServices'' %
(''% &
IServiceCollection''& 8
services''9 A
)''A B
{(( 	
services++ 
.++ 
AddTransient++ !
<++! "
ITokenManager++" /
,++/ 0
TokenManager++1 =
>++= >
(++> ?
)++? @
;++@ A
services-- 
.-- 
AddControllers.. 
(.. 
opt.. "
=>..# %
opt..& )
...) *
Filters..* 1
...1 2
Add..2 5
(..5 6
typeof..6 <
(..< =!
CustomExceptionFilter..= R
)..R S
)..S T
)// 
.// #
SetCompatibilityVersion// )
(//) * 
CompatibilityVersion//* >
.//> ?
Version_3_0//? J
)//J K
;//K L
services22 
.22 
AddCors22 
(22 
opt22  
=>22! #
{33 
opt44 
.44 
AddDefaultPolicy44 $
(44$ %
builder44% ,
=>44- /
{55 
builder66 
.66 
AllowAnyOrigin66 *
(66* +
)66+ ,
.77 
AllowAnyHeader77 +
(77+ ,
)77, -
.88 
WithMethods88 (
(88( )
$str88) /
,88/ 0
$str881 6
,886 7
$str888 =
,88= >
$str88? G
)88G H
;88H I
}99 
)99 
;99 
}:: 
):: 
;:: 
services== 
.== 
AddSwaggerGen== "
(==" #
c==# $
=>==% '
{>> 
c?? 
.?? 

SwaggerDoc?? 
(?? 
$str?? !
,??! "
new??# &
OpenApiInfo??' 2
{??3 4
Title??5 :
=??; <
$str??= E
,??E F
Version??G N
=??O P
$str??Q U
}??V W
)??W X
;??X Y
}@@ 
)@@ 
;@@ 
servicesCC 
.CC $
AddEntityFrameworkNpgsqlCC -
(CC- .
)CC. /
.CC/ 0
AddDbContextCC0 <
<CC< =
PostgreSQLContextCC= N
>CCN O
(CCO P
optCCP S
=>CCT V
{DD 
optEE 
.EE 
	UseNpgsqlEE 
(EE 
ConfigurationEE +
.EE+ ,
GetConnectionStringEE, ?
(EE? @
$strEE@ V
)EEV W
)EEW X
;EEX Y
}FF 
)FF 
;FF 
servicesII 
.II 
AddAuthenticationII &
(II& '
optII' *
=>II+ -
{JJ 
optKK 
.KK %
DefaultAuthenticateSchemeKK -
=KK. /
JwtBearerDefaultsKK0 A
.KKA B 
AuthenticationSchemeKKB V
;KKV W
optLL 
.LL 
DefaultSchemeLL !
=LL" #
JwtBearerDefaultsLL$ 5
.LL5 6 
AuthenticationSchemeLL6 J
;LLJ K
optMM 
.MM "
DefaultChallengeSchemeMM *
=MM+ ,
JwtBearerDefaultsMM- >
.MM> ? 
AuthenticationSchemeMM? S
;MMS T
}NN 
)NN 
.NN 
AddJwtBearerNN 
(NN 
JwtBearerOptionsNN ,
=>NN- /
{OO 
JwtBearerOptionsPP  
.PP  !%
TokenValidationParametersPP! :
=PP; <
newPP= @%
TokenValidationParametersPPA Z
(PPZ [
)PP[ \
{QQ 
SaveSigninTokenRR #
=RR$ %
trueRR& *
,RR* +
ValidateActorSS !
=SS" #
trueSS$ (
,SS( )
ValidateIssuerTT "
=TT# $
trueTT% )
,TT) *
ValidateAudienceUU $
=UU% &
trueUU' +
,UU+ ,
ValidateLifetimeVV $
=VV% &
trueVV' +
,VV+ ,$
ValidateIssuerSigningKeyWW ,
=WW- .
trueWW/ 3
,WW3 4
ValidIssuerXX 
=XX  !
ConfigurationXX" /
[XX/ 0
$strXX0 <
]XX< =
,XX= >
ValidAudienceYY !
=YY" #
ConfigurationYY$ 1
[YY1 2
$strYY2 @
]YY@ A
,YYA B
IssuerSigningKeyZZ $
=ZZ% &
newZZ' * 
SymmetricSecurityKeyZZ+ ?
(ZZ? @
EncodingZZ@ H
.ZZH I
UTF8ZZI M
.ZZM N
GetBytesZZN V
(ZZV W
ConfigurationZZW d
[ZZd e
$strZZe v
]ZZv w
)ZZw x
)ZZx y
}[[ 
;[[ 
}\\ 
)\\ 
;\\ 
services__ 
.__ 
	Configure__ 
<__ 
FormOptions__ *
>__* +
(__+ ,
opt__, /
=>__0 2
{`` 
optaa 
.aa 
ValueLengthLimitaa $
=aa% &
$numaa' .
;aa. /
optbb 
.bb $
MultipartBodyLengthLimitbb ,
=bb- .
$numbb/ 6
;bb6 7
optcc 
.cc !
MemoryBufferThresholdcc )
=cc* +
intcc, /
.cc/ 0
MaxValuecc0 8
;cc8 9
}dd 
)dd 
;dd 
}ff 	
publicii 
voidii 
	Configureii 
(ii 
IApplicationBuilderii 1
appii2 5
,ii5 6
IWebHostEnvironmentii7 J
enviiK N
)iiN O
{jj 	
ifll 
(ll 
envll 
.ll 
IsDevelopmentll !
(ll! "
)ll" #
)ll# $
{mm 
appnn 
.nn %
UseDeveloperExceptionPagenn -
(nn- .
)nn. /
;nn/ 0
appoo 
.oo 

UseSwaggeroo 
(oo 
)oo  
;oo  !
apppp 
.pp 
UseSwaggerUIpp  
(pp  !
cpp! "
=>pp# %
cpp& '
.pp' (
SwaggerEndpointpp( 7
(pp7 8
$strpp8 R
,ppR S
$strppT _
)pp_ `
)pp` a
;ppa b
}qq 
appss 
.ss 
UseHttpsRedirectionss #
(ss# $
)ss$ %
;ss% &
appuu 
.uu 

UseRoutinguu 
(uu 
)uu 
;uu 
appww 
.ww 
UseCorsww 
(ww 
)ww 
;ww 
appzz 
.zz 
UseStaticFileszz 
(zz 
)zz  
;zz  !
app}} 
.}} 
UseStaticFiles}} 
(}} 
new}} "
StaticFileOptions}}# 4
(}}4 5
)}}5 6
{~~ 
FileProvider 
= 
new " 
PhysicalFileProvider# 7
(7 8
Path8 <
.< =
Combine= D
(D E
	DirectoryE N
.N O
GetCurrentDirectoryO b
(b c
)c d
,d e
$strf q
)q r
)r s
,s t
RequestPath
ÄÄ 
=
ÄÄ 
new
ÄÄ !

PathString
ÄÄ" ,
(
ÄÄ, -
$str
ÄÄ- 8
)
ÄÄ8 9
}
ÅÅ 
)
ÅÅ 
;
ÅÅ 
app
ÉÉ 
.
ÉÉ 
UseAuthentication
ÉÉ !
(
ÉÉ! "
)
ÉÉ" #
;
ÉÉ# $
app
ÖÖ 
.
ÖÖ 
UseAuthorization
ÖÖ  
(
ÖÖ  !
)
ÖÖ! "
;
ÖÖ" #
app
áá 
.
áá 
UseEndpoints
áá 
(
áá 
	endpoints
áá &
=>
áá' )
{
àà 
	endpoints
ââ 
.
ââ 
MapControllers
ââ (
(
ââ( )
)
ââ) *
;
ââ* +
}
ää 
)
ää 
;
ää 
}
åå 	
}
çç 
}éé ‘
yC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\WebAPI\WebAPI\Token\ITokenManager.cs
	namespace 	
WebAPI
 
. 
Token 
{ 
public 

	interface 
ITokenManager "
{ 
public 
string 
GetRol 
( 
string #
token$ )
)) *
;* +
} 
} æ

xC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\WebAPI\WebAPI\Token\TokenManager.cs
	namespace 	
WebAPI
 
. 
Token 
{ 
public		 

class		 
TokenManager		 
:		 
ITokenManager		  -
{

 
private #
JwtSecurityTokenHandler '
tokenHandler( 4
;4 5
public 
TokenManager 
( 
) 
{ 	
tokenHandler 
= 
new #
JwtSecurityTokenHandler 6
(6 7
)7 8
;8 9
} 	
public 
string 
GetRol 
( 
string #
token$ )
)) *
{ 	
var 
jwt 
= 
tokenHandler "
." #
ReadJwtToken# /
(/ 0
token0 5
)5 6
;6 7
return 
jwt 
. 
Claims 
. 
First #
(# $
x$ %
=>& (
x) *
.* +
Type+ /
==0 2
$str3 8
)8 9
.9 :
Value: ?
;? @
} 	
}!! 
}"" 