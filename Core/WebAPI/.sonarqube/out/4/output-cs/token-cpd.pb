øY
pC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Extras\SImagen.cs
	namespace 	
	Servicios
 
. 
Extras 
{ 
public 

class 
SImagen 
{ 
private 
const 
short 
CANT_MAX_IMG (
=) *
$num+ ,
;, -
private 
const 
string 
NO_PHOTO %
=& '
$str( 6
;6 7
private 
IWebHostEnvironment #
HostEnvironment$ 3
{4 5
get6 9
;9 :
}; <
public 
SImagen 
( 
IWebHostEnvironment *
_hostEnvironent+ :
): ;
{ 	
HostEnvironment 
= 
_hostEnvironent -
;- .
} 	
public"" 
string"" 
Cargar"" 
("" 
	Proveedor"" &
	proveedor""' 0
,""0 1
Imagen""2 8
datosImagen""9 D
,""D E
	IFormFile""F O
imagen""P V
)""V W
{## 	
if%% 
(%% 
!%% 
ValidarTipoImagen%% "
(%%" #
datosImagen%%# .
.%%. /
Tipo%%/ 3
)%%3 4
)%%4 5
throw%%6 ;
new%%< ?
BadRequestException%%@ S
(%%S T
$str	%%T Ö
)
%%Ö Ü
;
%%Ü á
if'' 
('' 
datosImagen'' 
.'' 
Tipo''  
.''  !
Equals''! '
(''' (
$str''( 3
)''3 4
)''4 5
datosImagen(( 
.(( 
Nombre(( "
=((# $
	proveedor((% .
.((. /
Nit((/ 2
+((3 4
Path((5 9
.((9 :
GetExtension((: F
(((F G
imagen((G M
.((M N
FileName((N V
)((V W
;((W X
string** 
direccionImagen** "
=**# $
Path**% )
.**) *
Combine*** 1
(**1 2
HostEnvironment**2 A
.**A B
ContentRootPath**B Q
,**Q R
$str**S ]
,**] ^
datosImagen**_ j
.**j k
Tipo**k o
,**o p
datosImagen**q |
.**| }
Nombre	**} É
)
**É Ñ
;
**Ñ Ö
using,, 
(,, 

FileStream,, 

fileStream,, (
=,,) *
new,,+ .

FileStream,,/ 9
(,,9 :
direccionImagen,,: I
,,,I J
FileMode,,K S
.,,S T
Create,,T Z
),,Z [
),,[ \
imagen-- 
.-- 
CopyTo-- 
(-- 

fileStream-- (
)--( )
;--) *
return// 
Path// 
.// 
Combine// 
(//  
datosImagen//  +
.//+ ,
Tipo//, 0
,//0 1
datosImagen//2 =
.//= >
Nombre//> D
)//D E
;//E F
}11 	
public;; 
string;; 
CargarImagenes;; $
(;;$ %
	Proveedor;;% .
	proveedor;;/ 8
,;;8 9
string;;: @
tipo;;A E
,;;E F
IFormFileCollection;;G Z
imagenes;;[ c
,;;c d
OfertaTuristica;;e t
oferta;;u {
);;{ |
{<< 	
if>> 
(>> 
!>> 
ValidarTipoImagen>> "
(>>" #
tipo>># '
)>>' (
)>>( )
throw>>* /
new>>0 3#
BadHttpRequestException>>4 K
(>>K L
$str>>L }
)>>} ~
;>>~ 
string@@ 
path@@ 
=@@ 
Path@@ 
.@@ 
Combine@@ &
(@@& '
HostEnvironment@@' 6
.@@6 7
ContentRootPath@@7 F
,@@F G
$str@@H R
,@@R S
$str@@T e
,@@e f
tipo@@g k
,@@k l
	proveedor@@m v
.@@v w
Nit@@w z
)@@z {
;@@{ |
ifBB 
(BB 
!BB 
	DirectoryBB 
.BB 
ExistsBB !
(BB! "
pathBB" &
)BB& '
)BB' (
	DirectoryCC 
.CC 
CreateDirectoryCC )
(CC) *
pathCC* .
)CC. /
;CC/ 0
ListEE 
<EE 
stringEE 
>EE 
listaImagenesEE &
=EE' (
JsonSerializerEE) 7
.EE7 8
DeserializeEE8 C
<EEC D
ListEED H
<EEH I
stringEEI O
>EEO P
>EEP Q
(EEQ R
ofertaEER X
.EEX Y
ImagenEEY _
)EE_ `
;EE` a
shortHH 
cantidadImagenesHH "
=HH# $
$numHH% &
;HH& '
boolII 

noImagenesII 
=II 
falseII #
;II# $
ifKK 
(KK 
listaImagenesKK 
.KK 
CountKK #
==KK$ &
$numKK' (
)KK( )
{LL 

noImagenesNN 
=NN 
ValidarNoPhotoNN +
(NN+ ,
listaImagenesNN, 9
[NN9 :
$numNN: ;
]NN; <
)NN< =
;NN= >
cantidadImagenesOO  
=OO! "

noImagenesOO# -
?OO. /
(OO0 1
shortOO1 6
)OO6 7
$numOO7 8
:OO9 :
(OO; <
shortOO< A
)OOA B
$numOOB C
;OOC D
}QQ 
elseRR 
cantidadImagenesSS  
=SS! "
ConvertSS# *
.SS* +
ToInt16SS+ 2
(SS2 3
CANT_MAX_IMGSS3 ?
-SS@ A
listaImagenesSSB O
.SSO P
CountSSP U
)SSU V
;SSV W
ifVV 
(VV 
cantidadImagenesVV  
>VV! "
$numVV# $
&&VV% '
cantidadImagenesVV( 8
>=VV9 ;
imagenesVV< D
.VVD E
CountVVE J
)VVJ K
{WW 
stringYY 
nombreImagenYY #
;YY# $
stringZZ 
direccionGuardarZZ '
;ZZ' (
List[[ 
<[[ 
string[[ 
>[[ 
listaAuxImagenes[[ -
=[[. /
new[[0 3
List[[4 8
<[[8 9
string[[9 ?
>[[? @
([[@ A
)[[A B
;[[B C
if^^ 
(^^ 
!^^ 

noImagenes^^ 
)^^  
foreach__ 
(__ 
string__ #
imagen__$ *
in__+ -
listaImagenes__. ;
)__; <
listaAuxImagenes__= M
.__M N
Add__N Q
(__Q R
imagen__R X
)__X Y
;__Y Z
foreachaa 
(aa 
	IFormFileaa "
imagenaa# )
inaa* ,
imagenesaa- 5
)aa5 6
{bb 
nombreImagendd  
=dd! "
ofertadd# )
.dd) *
Iddd* ,
.dd, -
ToStringdd- 5
(dd5 6
)dd6 7
+dd8 9
cantidadImagenesdd: J
++ddJ L
.ddL M
ToStringddM U
(ddU V
)ddV W
+ddX Y
PathddZ ^
.dd^ _
GetExtensiondd_ k
(ddk l
imagenddl r
.ddr s
FileNamedds {
)dd{ |
;dd| }
direccionGuardaree $
=ee% &
Pathee' +
.ee+ ,
Combineee, 3
(ee3 4
pathee4 8
,ee8 9
nombreImagenee: F
)eeF G
;eeG H
usinggg 
(gg 

FileStreamgg %

fileStreamgg& 0
=gg1 2
newgg3 6

FileStreamgg7 A
(ggA B
direccionGuardarggB R
,ggR S
FileModeggT \
.gg\ ]
Creategg] c
)ggc d
)ggd e
{hh 
imagenii 
.ii 
CopyToii %
(ii% &

fileStreamii& 0
)ii0 1
;ii1 2
}jj 
listaAuxImagenesll $
.ll$ %
Addll% (
(ll( )
Pathll) -
.ll- .
Combinell. 5
(ll5 6
$strll6 G
,llG H
tipollI M
,llM N
	proveedorllO X
.llX Y
NitllY \
,ll\ ]
nombreImagenll^ j
)llj k
)llk l
;lll m
}nn 
returnpp 
JsonSerializerpp %
.pp% &
	Serializepp& /
(pp/ 0
listaAuxImagenespp0 @
)pp@ A
;ppA B
}rr 
elsess 
throwtt 
newtt 
BadRequestExceptiontt -
(tt- .
$strtt. O
)ttO P
;ttP Q
}vv 	
public}} 
void}} 
Eliminar}} 
(}} 
Imagen}} #
datosImagen}}$ /
)}}/ 0
{~~ 	
if
ÄÄ 
(
ÄÄ 
!
ÄÄ 
ValidarTipoImagen
ÄÄ "
(
ÄÄ" #
datosImagen
ÄÄ# .
.
ÄÄ. /
Tipo
ÄÄ/ 3
)
ÄÄ3 4
)
ÄÄ4 5
throw
ÄÄ6 ;
new
ÄÄ< ?!
BadRequestException
ÄÄ@ S
(
ÄÄS T
$strÄÄT Ö
)ÄÄÖ Ü
;ÄÄÜ á
FileInfo
ÇÇ 
fileInfo
ÇÇ 
=
ÇÇ 
new
ÇÇ  #
FileInfo
ÇÇ$ ,
(
ÇÇ, -
Path
ÇÇ- 1
.
ÇÇ1 2
Combine
ÇÇ2 9
(
ÇÇ9 :
HostEnvironment
ÇÇ: I
.
ÇÇI J
ContentRootPath
ÇÇJ Y
,
ÇÇY Z
$str
ÇÇ[ e
,
ÇÇe f
datosImagen
ÇÇg r
.
ÇÇr s
	Direccion
ÇÇs |
)
ÇÇ| }
)
ÇÇ} ~
;
ÇÇ~ 
if
ÑÑ 
(
ÑÑ 
fileInfo
ÑÑ 
.
ÑÑ 
Exists
ÑÑ 
)
ÑÑ  
{
ÖÖ 
File
ÜÜ 
.
ÜÜ 
Delete
ÜÜ 
(
ÜÜ 
Path
ÜÜ  
.
ÜÜ  !
Combine
ÜÜ! (
(
ÜÜ( )
$str
ÜÜ) 3
,
ÜÜ3 4
datosImagen
ÜÜ5 @
.
ÜÜ@ A
	Direccion
ÜÜA J
)
ÜÜJ K
)
ÜÜK L
;
ÜÜL M
fileInfo
áá 
.
áá 
Delete
áá 
(
áá  
)
áá  !
;
áá! "
}
àà 
}
ää 	
private
çç 
bool
çç 
ValidarNoPhoto
çç #
(
çç# $
string
çç$ *
imagen
çç+ 1
)
çç1 2
{
éé 	
return
èè 
imagen
èè 
.
èè 
Equals
èè  
(
èè  !
NO_PHOTO
èè! )
)
èè) *
?
èè+ ,
true
èè- 1
:
èè2 3
false
èè4 9
;
èè9 :
}
êê 	
private
ìì 
bool
ìì 
ValidarTipoImagen
ìì &
(
ìì& '
string
ìì' -
tipo
ìì. 2
)
ìì2 3
{
îî 	
return
ïï 
tipo
ïï 
.
ïï 
Equals
ïï 
(
ïï 
$str
ïï %
)
ïï% &
||
ïï' )
tipo
ïï* .
.
ïï. /
Equals
ïï/ 5
(
ïï5 6
$str
ïï6 @
)
ïï@ A
||
ïïB D
tipo
ïïE I
.
ïïI J
Equals
ïïJ P
(
ïïP Q
$str
ïïQ \
)
ïï\ ]
?
ïï^ _
true
ïï` d
:
ïïe f
false
ïïg l
;
ïïl m
}
ññ 	
}
òò 
}ôô â6
nC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Extras\SSMTP.cs
	namespace

 	
	Servicios


 
.

 
Extras

 
{ 
public 

class 
SSMTP 
{ 
private 

SmtpSender 

smtpSender %
{& '
get( +
;+ ,
}- .
private 
IConfiguration 
Configuration ,
{- .
get/ 2
;2 3
}4 5
public 
SSMTP 
( 
IConfiguration #
_configuration$ 2
)2 3
{ 	
Configuration 
= 
_configuration *
;* +

smtpSender 
= 
new 

SmtpSender '
(' (
(( )
)) *
=>+ -
new. 1

SmtpClient2 <
(< =
Configuration= J
[J K
$strK V
]V W
)W X
{ 
	EnableSsl 
= 
true  
,  !!
UseDefaultCredentials %
=& '
false( -
,- .
Credentials 
= 
new !
NetworkCredential" 3
(3 4
Configuration4 A
[A B
$strB U
]U V
,V W
ConfigurationX e
[e f
$strf u
]u v
)v w
,w x
DeliveryMethod   
=    
SmtpDeliveryMethod  ! 3
.  3 4
Network  4 ;
,  ; <
Port!! 
=!! 
int!! 
.!! 
Parse!!  
(!!  !
Configuration!!! .
[!!. /
$str!!/ :
]!!: ;
)!!; <
}"" 
)"" 
;"" 
Email$$ 
.$$ 
DefaultSender$$ 
=$$  !

smtpSender$$" ,
;$$, -
}&& 	
public++ 
async++ 
Task++ "
EnviarHashVerificacion++ 0
(++0 1
Usuario++1 8
usuario++9 @
)++@ A
{,, 	
string.. 
url.. 
=.. 
Configuration.. &
[..& '
$str..' 8
]..8 9
+..: ;
$str..< M
+..N O
usuario..P W
...W X
Hash..X \
;..\ ]
var00 
email00 
=00 
await00 
Email00 #
.11 
From11 
(11 
Configuration11 #
[11# $
$str11$ 7
]117 8
,118 9
Configuration11: G
[11G H
$str11H S
]11S T
+11U V
$str11W a
)11a b
.22 
To22 
(22 
usuario22 
.22 
CorreoElectronico22 -
,22- .
usuario22/ 6
.226 7
Nombre227 =
)22= >
.33 
Subject33 
(33 
$str33 G
)33G H
.44 
Body44 
(44 
$str	44 ¢
+
44£ §
url
44• ®
+
44© ™
$str
44´ ˆ
+
44˜ ¯
url55 
+55 
$str55 
+55  !
url55" %
+55& '
$str55( 2
,552 3
true554 8
)558 9
.66 
HighPriority66 
(66 
)66 
.77 
	SendAsync77 
(77 
)77 
;77 
}99 	
public<< 
async<< 
Task<< "
EnviarHashRecuperacion<< 0
(<<0 1
Usuario<<1 8
usuario<<9 @
)<<@ A
{== 	
string?? 
url?? 
=?? 
Configuration?? &
[??& '
$str??' 8
]??8 9
+??: ;
$str??< T
+??U V
usuario??W ^
.??^ _
Hash??_ c
;??c d
varAA 
emailAA 
=AA 
awaitAA 
EmailAA #
.BB 
FromBB 
(BB 
ConfigurationBB #
[BB# $
$strBB$ 7
]BB7 8
,BB8 9
ConfigurationBB: G
[BBG H
$strBBH S
]BBS T
+BBU V
$strBBW i
)BBi j
.CC 
ToCC 
(CC 
usuarioCC 
.CC 
CorreoElectronicoCC -
,CC- .
usuarioCC/ 6
.CC6 7
NombreCC7 =
)CC= >
.DD 
SubjectDD 
(DD 
$strDD ;
)DD; <
.EE 
BodyEE 
(EE 
$str	EE å
+
EEç é
url
EEè í
+
EEì î
$str
EEï Ÿ
+
EE⁄ €
urlFF 
+FF 
$strFF 
+FF  !
urlFF" %
+FF& '
$strFF( 2
,FF2 3
trueFF4 8
)FF8 9
.GG 
HighPriorityGG 
(GG 
)GG 
.HH 
	SendAsyncHH 
(HH 
)HH 
;HH 
}JJ 	
publicSS 
voidSS  
EnviarHashPuntuacionSS (
(SS( )
stringSS) /
tipoOTSS0 6
,SS6 7
intSS8 ;
ofertaTuristicaIdSS< M
,SSM N
stringSSO U
correoElectronicoSSV g
)SSg h
{TT 	
stringVV 
urlVV 
=VV 
ConfigurationVV &
[VV& '
$strVV' 8
]VV8 9
+VV: ;
$strVV< J
+VVK L
tipoOTVVM S
+VVT U
$strVVV Y
+VVZ [
ofertaTuristicaIdVV\ m
+VVn o
$strVVp s
+VVt u
correoElectronico	VVv á
;
VVá à
varXX 
emailXX 
=XX 
EmailXX 
.YY 
FromYY 
(YY 
ConfigurationYY #
[YY# $
$strYY$ 7
]YY7 8
,YY8 9
ConfigurationYY: G
[YYG H
$strYYH S
]YYS T
+YYU V
$strYYW m
)YYm n
.ZZ 
ToZZ 
(ZZ 
correoElectronicoZZ %
)ZZ% &
.[[ 
Subject[[ 
([[ 
$str[[ 3
+[[4 5
tipoOT[[6 <
+[[= >
$str[[? K
)[[K L
.\\ 
Body\\ 
(\\ 
$str\\ t
+\\u v
tipoOT\\w }
+\\~ 
$str
\\Ä ´
+
\\¨ ≠
url
\\Æ ±
+
\\≤ ≥
$str
\\¥ ¯
+
\\˘ ˙
url]] 
+]] 
$str]] 
+]]  !
url]]" %
+]]& '
$str]]( 2
,]]2 3
true]]4 8
)]]8 9
.^^ 
HighPriority^^ 
(^^ 
)^^ 
.__ 
Send__ 
(__ 
)__ 
;__ 
}aa 	
}cc 
}dd é

tC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Generica\SGenerica.cs
	namespace 	
	Servicios
 
. 
Generica 
{ 
public		 

abstract		 
class		 
	SGenerica		 #
{

 
public 
PostgreSQLContext  
	DbContext! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
	SGenerica 
( 
PostgreSQLContext *
_context+ 3
)3 4
{ 	
	DbContext 
= 
_context  
;  !
} 	
public 
	SGenerica 
( 
PostgreSQLContext *
_context+ 3
,3 4
IConfiguration5 C
_configurationD R
)R S
{ 	
	DbContext 
= 
_context  
;  !
Configuration 
= 
_configuration *
;* +
} 	
} 
} å
ÉC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Oferta\Interfaz\ISOfertaTuristica.cs
	namespace 	
	Servicios
 
. 
Oferta 
. 
Interfaz #
{ 
public 

	interface 
ISOfertaTuristica &
<& '
T' (
>( )
where* /
T0 1
:2 3
OfertaTuristica4 C
{ 
public 
void 
Crear 
( 
T 
ofertaTuristica +
,+ ,
string- 3
hash4 8
,8 9
string: @
emailA F
)F G
;G H
public 
List 
< 
T 
> 
Leer 
( 
string "
hash# '
,' (
string) /
email0 5
)5 6
;6 7
public 
Paginado 
< 
T 
> 
Leer 
(  
short  %
pagina& ,
,, -
short. 3
cantidad4 <
,< =
bool> B
estadoC I
)I J
;J K
public   
Paginado   
<   
T   
>   
Leer   
(    
Busqueda    (

parametros  ) 3
,  3 4
short  5 :
pagina  ; A
,  A B
short  C H
cantidad  I Q
)  Q R
;  R S
public## 
T## 
Leer## 
(## 
int## 
id## 
,## 
string## $
hash##% )
,##) *
string##+ 1
email##2 7
)##7 8
;##8 9
public&& 
void&& 

Actualizar&& 
(&& 
T&&  
ofertaTuristica&&! 0
,&&0 1
string&&2 8
hash&&9 =
,&&= >
string&&? E
email&&F K
)&&K L
;&&L M
public)) 
void)) 

Actualizar)) 
()) 
int)) "
id))# %
,))% &
string))' -
hash)). 2
,))2 3
string))4 :
email)); @
,))@ A
IFormFileCollection))B U
imagenes))V ^
)))^ _
;))_ `
public,, 
void,, 
Eliminar,, 
(,, 
int,,  
id,,! #
,,,# $
string,,% +
hash,,, 0
,,,0 1
string,,2 8
email,,9 >
),,> ?
;,,? @
public// 
void// 
Eliminar// 
(// 
int//  
id//! #
,//# $
string//% +
hash//, 0
,//0 1
string//2 8
email//9 >
,//> ?
string//@ F
imagen//G M
)//M N
;//N O
}11 
}22 √
xC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Oferta\Interfaz\ISPlan.cs
	namespace 	
	Servicios
 
. 
Oferta 
. 
Interfaz #
{ 
public 

	interface 
ISPlan 
: 
ISOfertaTuristica /
</ 0
Plan0 4
>4 5
{		 
} 
} œ
|C:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Oferta\Interfaz\ISServicio.cs
	namespace 	
	Servicios
 
. 
Oferta 
. 
Interfaz #
{ 
public 

	interface 

ISServicio 
:  !
ISOfertaTuristica" 3
<3 4
Servicio4 <
>< =
{		 
} 
} Ê&
yC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Oferta\SOfertaTuristica.cs
	namespace 	
	Servicios
 
. 
Oferta 
{ 
public 

abstract 
class 
SOfertaTuristica *
<* +
T+ ,
>, -
:. /
	SGenerica0 9
,9 :
ISOfertaTuristica; L
<L M
TM N
>N O
whereP U
TV W
:X Y
OfertaTuristicaZ i
{ 
	protected 
const 
short "
MAX_OFERTAS_TURISTICAS 4
=5 6
$num7 9
;9 :
	protected 
IWebHostEnvironment %
HostEnvironment& 5
;5 6
public 
SOfertaTuristica 
(  
PostgreSQLContext  1
_context2 :
): ;
:< =
base> B
(B C
_contextC K
)K L
{M N
}O P
public 
SOfertaTuristica 
(  
PostgreSQLContext  1
_context2 :
,: ;
IWebHostEnvironment< O
_hostEnvironmentP `
)` a
:b c
based h
(h i
_contexti q
)q r
{   	
HostEnvironment!! 
=!! 
_hostEnvironment!! .
;!!. /
}"" 	
public'' 
abstract'' 
void'' 
Crear'' "
(''" #
T''# $
ofertaTuristica''% 4
,''4 5
string''6 <
hash''= A
,''A B
string''C I
email''J O
)''O P
;''P Q
public** 
abstract** 
List** 
<** 
T** 
>** 
Leer**  $
(**$ %
string**% +
hash**, 0
,**0 1
string**2 8
email**9 >
)**> ?
;**? @
public-- 
abstract-- 
T-- 
Leer-- 
(-- 
int-- "
id--# %
,--% &
string--' -
hash--. 2
,--2 3
string--4 :
email--; @
)--@ A
;--A B
public00 
abstract00 
Paginado00  
<00  !
T00! "
>00" #
Leer00$ (
(00( )
short00) .
pagina00/ 5
,005 6
short007 <
cantidad00= E
,00E F
bool00G K
estado00L R
)00R S
;00S T
public99 
abstract99 
Paginado99  
<99  !
T99! "
>99" #
Leer99$ (
(99( )
Busqueda99) 1

parametros992 <
,99< =
short99> C
pagina99D J
,99J K
short99L Q
cantidad99R Z
)99Z [
;99[ \
public<< 
abstract<< 
void<< 

Actualizar<< '
(<<' (
T<<( )
ofertaTuristica<<* 9
,<<9 :
string<<; A
hash<<B F
,<<F G
string<<H N
email<<O T
)<<T U
;<<U V
public?? 
abstract?? 
void?? 

Actualizar?? '
(??' (
int??( +
id??, .
,??. /
string??0 6
hash??7 ;
,??; <
string??= C
email??D I
,??I J
IFormFileCollection??K ^
imagenes??_ g
)??g h
;??h i
publicBB 
abstractBB 
voidBB 
EliminarBB %
(BB% &
intBB& )
idBB* ,
,BB, -
stringBB. 4
hashBB5 9
,BB9 :
stringBB; A
emailBBB G
)BBG H
;BBH I
publicKK 
	ProveedorKK 
LeerProveedorKK &
(KK& '
stringKK' -
hashKK. 2
,KK2 3
stringKK4 :
emailKK; @
)KK@ A
{LL 	
	ProveedorNN 
	proveedorNN 
=NN  !
newNN" %

DProveedorNN& 0
(NN0 1
	DbContextNN1 :
)NN: ;
.NN; <
LeerAuthNN< D
(NND E
hashNNE I
,NNI J
emailNNK P
)NNP Q
;NNQ R
ifQQ 
(QQ 
	proveedorQQ 
==QQ 
nullQQ !
)QQ! "
throwRR 
newRR !
UnauthorizedExceptionRR /
(RR/ 0
$strRR0 Z
)RRZ [
;RR[ \
returnTT 
	proveedorTT 
;TT 
}VV 	
publicYY 
abstractYY 
voidYY 
EliminarYY %
(YY% &
intYY& )
idYY* ,
,YY, -
stringYY. 4
hashYY5 9
,YY9 :
stringYY; A
emailYYB G
,YYG H
stringYYI O
imagenYYP V
)YYV W
;YYW X
}ZZ 
}[[ ˆÜ
nC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Oferta\SPlan.cs
	namespace 	
	Servicios
 
. 
Oferta 
{ 
public 

class 
SPlan 
: 
SOfertaTuristica )
<) *
Plan* .
>. /
,/ 0
ISPlan1 7
{ 
private 
DPlan 
	DatosPlan 
{  !
get" %
;% &
}' (
public 
SPlan 
( 
PostgreSQLContext &
_context' /
,/ 0
IWebHostEnvironment1 D
_hostEnvironmentE U
)U V
:W X
baseY ]
(] ^
_context^ f
,f g
_hostEnvironmenth x
)x y
{ 	
	DatosPlan 
= 
new 
DPlan !
(! "
_context" *
)* +
;+ ,
}   	
public,, 
override,, 
void,, 
Crear,, "
(,," #
Plan,,# '
plan,,( ,
,,,, -
string,,. 4
hash,,5 9
,,,9 :
string,,; A
email,,B G
),,G H
{-- 	
	Proveedor// 
	proveedor// 
=//  !
LeerProveedor//" /
(/// 0
hash//0 4
,//4 5
email//6 ;
)//; <
;//< =
if22 
(22 
	DatosPlan22 
.22 
Cantidad22 "
(22" #
	proveedor22# ,
.22, -
Id22- /
)22/ 0
>=221 3"
MAX_OFERTAS_TURISTICAS224 J
)22J K
throw33 
new33 
IntegridadException33 -
(33- .
$str33. J
+33K L"
MAX_OFERTAS_TURISTICAS33M c
+33d e
$str33f z
)33z {
;33{ |
plan66 
.66 
Imagen66 
=66 
JsonSerializer66 (
.66( )
	Serialize66) 2
(662 3
new663 6
List667 ;
<66; <
string66< B
>66B C
{66D E
$str66F T
}66U V
)66V W
;66W X
plan77 
.77 
Actividades77 
=77 
JsonSerializer77 -
.77- .
	Serialize77. 7
(777 8
plan778 <
.77< =
ListaActividades77= M
)77M N
;77N O
plan88 
.88 

Puntuacion88 
=88 
$num88 
;88  
plan99 
.99 
FechaCreacion99 
=99  
DateTime99! )
.99) *
Now99* -
;99- .
plan:: 
.:: 
ProveedorId:: 
=:: 
	proveedor:: (
.::( )
Id::) +
;::+ ,
plan;; 
.;; 

Habilitado;; 
=;; 
true;; "
;;;" #
plan<< 
.<< 
	Eliminado<< 
=<< 
false<< "
;<<" #
	DatosPlan>> 
.>> 
Crear>> 
(>> 
plan>>  
)>>  !
;>>! "
}@@ 	
publicJJ 
overrideJJ 
ListJJ 
<JJ 
PlanJJ !
>JJ! "
LeerJJ# '
(JJ' (
stringJJ( .
hashJJ/ 3
,JJ3 4
stringJJ5 ;
emailJJ< A
)JJA B
{KK 	
	ProveedorMM 
	proveedorMM 
=MM  !
LeerProveedorMM" /
(MM/ 0
hashMM0 4
,MM4 5
emailMM6 ;
)MM; <
;MM< =
ListOO 
<OO 
PlanOO 
>OO 
listaPlanesOO "
=OO# $
	DatosPlanOO% .
.OO. /
LeerOO/ 3
(OO3 4
	proveedorOO4 =
.OO= >
IdOO> @
)OO@ A
;OOA B
ifRR 
(RR 
listaPlanesRR 
.RR 
CountRR !
==RR" $
$numRR% &
)RR& '
throwSS 
newSS 
NoContentExceptionSS ,
(SS, -
$strSS- S
)SSS T
;SST U
returnUU 
listaPlanesUU 
;UU 
}WW 	
publicbb 
overridebb 
Planbb 
Leerbb !
(bb! "
intbb" %
idbb& (
,bb( )
stringbb* 0
hashbb1 5
,bb5 6
stringbb7 =
emailbb> C
)bbC D
{cc 	
	Proveedoree 
	proveedoree 
=ee  !
LeerProveedoree" /
(ee/ 0
hashee0 4
,ee4 5
emailee6 ;
)ee; <
;ee< =
Plangg 
plangg 
=gg 
	DatosPlangg !
.gg! "
Leergg" &
(gg& '
idgg' )
,gg) *
	proveedorgg+ 4
.gg4 5
Idgg5 7
)gg7 8
;gg8 9
ifjj 
(jj 
planjj 
==jj 
nulljj 
)jj 
throwkk 
newkk 
NotFoundExceptionkk +
(kk+ ,
$strkk, N
)kkN O
;kkO P
returnmm 
planmm 
;mm 
}oo 	
publicyy 
overrideyy 
Paginadoyy  
<yy  !
Planyy! %
>yy% &
Leeryy' +
(yy+ ,
shortyy, 1
paginayy2 8
,yy8 9
shortyy: ?
cantidadyy@ H
,yyH I
boolyyJ N
estadoyyO U
)yyU V
{zz 	
List|| 
<|| 
Plan|| 
>|| 
listaPlanes|| "
=||# $
	DatosPlan||% .
.||. /
Leer||/ 3
(||3 4
pagina||4 :
,||: ;
cantidad||< D
,||D E
estado||F L
)||L M
;||M N
if 
( 
listaPlanes 
. 
Count !
==" $
$num% &
)& '
throw
ÄÄ 
new
ÄÄ  
NoContentException
ÄÄ ,
(
ÄÄ, -
$str
ÄÄ- G
)
ÄÄG H
;
ÄÄH I
Paginado
ÉÉ 
<
ÉÉ 
Plan
ÉÉ 
>
ÉÉ 
paginado
ÉÉ #
=
ÉÉ$ %
new
ÉÉ& )
(
ÉÉ) *
)
ÉÉ* +
{
ÑÑ 
	Contenido
ÖÖ 
=
ÖÖ 
listaPlanes
ÖÖ '
,
ÖÖ' (
PaginaActual
ÜÜ 
=
ÜÜ 
pagina
ÜÜ %
,
ÜÜ% &

TotalItems
áá 
=
áá 
	DatosPlan
áá &
.
áá& '&
CantidadEstadoHabilitado
áá' ?
(
áá? @
estado
áá@ F
)
ááF G
}
àà 
;
àà 
paginado
ää 
.
ää 
TotalPaginas
ää !
=
ää" #
Math
ää$ (
.
ää( )
Ceiling
ää) 0
(
ää0 1
(
ää1 2
decimal
ää2 9
)
ää9 :
(
ää: ;
(
ää; <
double
ää< B
)
ääB C
paginado
ääC K
.
ääK L

TotalItems
ääL V
/
ääW X
(
ääY Z
double
ääZ `
)
ää` a
cantidad
ääa i
)
ääi j
)
ääj k
;
ääk l
return
åå 
paginado
åå 
;
åå 
}
éé 	
public
òò 
override
òò 
Paginado
òò  
<
òò  !
Plan
òò! %
>
òò% &
Leer
òò' +
(
òò+ ,
Busqueda
òò, 4

parametros
òò5 ?
,
òò? @
short
òòA F
pagina
òòG M
,
òòM N
short
òòO T
cantidad
òòU ]
)
òò] ^
{
ôô 	
List
õõ 
<
õõ 
Plan
õõ 
>
õõ 
listaPlanes
õõ "
=
õõ# $
	DatosPlan
õõ% .
.
õõ. /
Leer
õõ/ 3
(
õõ3 4

parametros
õõ4 >
,
õõ> ?
pagina
õõ@ F
,
õõF G
cantidad
õõH P
)
õõP Q
;
õõQ R
if
ûû 
(
ûû 
listaPlanes
ûû 
.
ûû 
Count
ûû !
==
ûû" $
$num
ûû% &
)
ûû& '
throw
üü 
new
üü  
NoContentException
üü ,
(
üü, -
$str
üü- R
)
üüR S
;
üüS T
Paginado
¢¢ 
<
¢¢ 
Plan
¢¢ 
>
¢¢ 
paginado
¢¢ #
=
¢¢$ %
new
¢¢& )
(
¢¢) *
)
¢¢* +
{
££ 
	Contenido
§§ 
=
§§ 
listaPlanes
§§ '
,
§§' (
PaginaActual
•• 
=
•• 
(
••  
short
••  %
)
••% &
(
••& '
pagina
••' -
+
••. /
$num
••0 1
)
••1 2
,
••2 3

TotalItems
¶¶ 
=
¶¶ 
	DatosPlan
¶¶ &
.
¶¶& '
Cantidad
¶¶' /
(
¶¶/ 0

parametros
¶¶0 :
)
¶¶: ;
,
¶¶; <
}
ßß 
;
ßß 
paginado
©© 
.
©© 
TotalPaginas
©© !
=
©©" #
Math
©©$ (
.
©©( )
Ceiling
©©) 0
(
©©0 1
(
©©1 2
decimal
©©2 9
)
©©9 :
(
©©: ;
(
©©; <
double
©©< B
)
©©B C
paginado
©©C K
.
©©K L

TotalItems
©©L V
/
©©W X
(
©©Y Z
double
©©Z `
)
©©` a
cantidad
©©a i
)
©©i j
)
©©j k
;
©©k l
return
´´ 
paginado
´´ 
;
´´ 
}
≠≠ 	
public
∑∑ 
override
∑∑ 
void
∑∑ 

Actualizar
∑∑ '
(
∑∑' (
Plan
∑∑( ,
plan
∑∑- 1
,
∑∑1 2
string
∑∑3 9
hash
∑∑: >
,
∑∑> ?
string
∑∑@ F
email
∑∑G L
)
∑∑L M
{
∏∏ 	
	Proveedor
∫∫ 
	proveedor
∫∫ 
=
∫∫  !
LeerProveedor
∫∫" /
(
∫∫/ 0
hash
∫∫0 4
,
∫∫4 5
email
∫∫6 ;
)
∫∫; <
;
∫∫< =
if
ΩΩ 
(
ΩΩ 
	DatosPlan
ΩΩ 
.
ΩΩ 
Cantidad
ΩΩ "
(
ΩΩ" #
plan
ΩΩ# '
.
ΩΩ' (
Id
ΩΩ( *
,
ΩΩ* +
	proveedor
ΩΩ, 5
.
ΩΩ5 6
Id
ΩΩ6 8
)
ΩΩ8 9
!=
ΩΩ: <
$num
ΩΩ= >
)
ΩΩ> ?
throw
ææ 
new
ææ 
NotFoundException
ææ +
(
ææ+ ,
$str
ææ, N
)
ææN O
;
ææO P
	DatosPlan
¿¿ 
.
¿¿ 

Actualizar
¿¿  
(
¿¿  !
plan
¿¿! %
)
¿¿% &
;
¿¿& '
}
¬¬ 	
public
ÕÕ 
override
ÕÕ 
void
ÕÕ 

Actualizar
ÕÕ '
(
ÕÕ' (
int
ÕÕ( +
id
ÕÕ, .
,
ÕÕ. /
string
ÕÕ0 6
hash
ÕÕ7 ;
,
ÕÕ; <
string
ÕÕ= C
email
ÕÕD I
,
ÕÕI J!
IFormFileCollection
ÕÕK ^
imagenes
ÕÕ_ g
)
ÕÕg h
{
ŒŒ 	
	Proveedor
–– 
	proveedor
–– 
=
––  !
LeerProveedor
––" /
(
––/ 0
hash
––0 4
,
––4 5
email
––6 ;
)
––; <
;
––< =
Plan
““ 
plan
““ 
=
““ 
	DatosPlan
““ !
.
““! "
Leer
““" &
(
““& '
id
““' )
,
““) *
	proveedor
““+ 4
.
““4 5
Id
““5 7
)
““7 8
;
““8 9
if
’’ 
(
’’ 
plan
’’ 
==
’’ 
null
’’ 
)
’’ 
throw
÷÷ 
new
÷÷ 
NotFoundException
÷÷ +
(
÷÷+ ,
$str
÷÷, N
)
÷÷N O
;
÷÷O P
plan
ÿÿ 
.
ÿÿ 
Imagen
ÿÿ 
=
ÿÿ 
new
ÿÿ 
SImagen
ÿÿ %
(
ÿÿ% &
HostEnvironment
ÿÿ& 5
)
ÿÿ5 6
.
ÿÿ6 7
CargarImagenes
ÿÿ7 E
(
ÿÿE F
	proveedor
ÿÿF O
,
ÿÿO P
$str
ÿÿQ W
,
ÿÿW X
imagenes
ÿÿY a
,
ÿÿa b
plan
ÿÿc g
)
ÿÿg h
;
ÿÿh i
	DatosPlan
⁄⁄ 
.
⁄⁄ 

Actualizar
⁄⁄  
(
⁄⁄  !
plan
⁄⁄! %
)
⁄⁄% &
;
⁄⁄& '
}
‹‹ 	
public
ÊÊ 
override
ÊÊ 
void
ÊÊ 
Eliminar
ÊÊ %
(
ÊÊ% &
int
ÊÊ& )
id
ÊÊ* ,
,
ÊÊ, -
string
ÊÊ. 4
hash
ÊÊ5 9
,
ÊÊ9 :
string
ÊÊ; A
email
ÊÊB G
)
ÊÊG H
{
ÁÁ 	
	Proveedor
ÈÈ 
	proveedor
ÈÈ 
=
ÈÈ  !
LeerProveedor
ÈÈ" /
(
ÈÈ/ 0
hash
ÈÈ0 4
,
ÈÈ4 5
email
ÈÈ6 ;
)
ÈÈ; <
;
ÈÈ< =
Plan
ÎÎ 
plan
ÎÎ 
=
ÎÎ 
	DatosPlan
ÎÎ !
.
ÎÎ! "
Leer
ÎÎ" &
(
ÎÎ& '
id
ÎÎ' )
,
ÎÎ) *
	proveedor
ÎÎ+ 4
.
ÎÎ4 5
Id
ÎÎ5 7
)
ÎÎ7 8
;
ÎÎ8 9
if
ÓÓ 
(
ÓÓ 
plan
ÓÓ 
==
ÓÓ 
null
ÓÓ 
)
ÓÓ 
throw
ÔÔ 
new
ÔÔ 
NotFoundException
ÔÔ +
(
ÔÔ+ ,
$str
ÔÔ, N
)
ÔÔN O
;
ÔÔO P
plan
ÚÚ 
.
ÚÚ 

Habilitado
ÚÚ 
=
ÚÚ 
false
ÚÚ #
;
ÚÚ# $
plan
ÛÛ 
.
ÛÛ 
	Eliminado
ÛÛ 
=
ÛÛ 
true
ÛÛ !
;
ÛÛ! "
	DatosPlan
ıı 
.
ıı 

Actualizar
ıı  
(
ıı  !
plan
ıı! %
)
ıı% &
;
ıı& '
}
˜˜ 	
public
ÇÇ 
override
ÇÇ 
void
ÇÇ 
Eliminar
ÇÇ %
(
ÇÇ% &
int
ÇÇ& )
id
ÇÇ* ,
,
ÇÇ, -
string
ÇÇ. 4
hash
ÇÇ5 9
,
ÇÇ9 :
string
ÇÇ; A
email
ÇÇB G
,
ÇÇG H
string
ÇÇI O
direccionImagen
ÇÇP _
)
ÇÇ_ `
{
ÉÉ 	
	Proveedor
ÖÖ 
	proveedor
ÖÖ 
=
ÖÖ  !
LeerProveedor
ÖÖ" /
(
ÖÖ/ 0
hash
ÖÖ0 4
,
ÖÖ4 5
email
ÖÖ6 ;
)
ÖÖ; <
;
ÖÖ< =
Plan
áá 
plan
áá 
=
áá 
	DatosPlan
áá !
.
áá! "
Leer
áá" &
(
áá& '
id
áá' )
,
áá) *
	proveedor
áá+ 4
.
áá4 5
Id
áá5 7
)
áá7 8
;
áá8 9
Imagen
ää 
datosImagen
ää 
=
ää  
new
ää! $
(
ää$ %
)
ää% &
{
ãã 
	Direccion
åå 
=
åå 
direccionImagen
åå +
.
åå+ ,
Replace
åå, 3
(
åå3 4
$str
åå4 7
,
åå7 8
$str
åå9 =
)
åå= >
,
åå> ?
Tipo
çç 
=
çç 
$str
çç 
}
éé 
;
éé 
List
êê 
<
êê 
string
êê 
>
êê 
listaImagenes
êê &
=
êê' (
JsonSerializer
êê) 7
.
êê7 8
Deserialize
êê8 C
<
êêC D
List
êêD H
<
êêH I
string
êêI O
>
êêO P
>
êêP Q
(
êêQ R
plan
êêR V
.
êêV W
Imagen
êêW ]
)
êê] ^
;
êê^ _
for
ìì 
(
ìì 
short
ìì 
i
ìì 
=
ìì 
$num
ìì 
;
ìì 
i
ìì 
<
ìì  !
listaImagenes
ìì" /
.
ìì/ 0
Count
ìì0 5
;
ìì5 6
i
ìì7 8
++
ìì8 :
)
ìì: ;
if
îî 
(
îî 
listaImagenes
îî !
[
îî! "
i
îî" #
]
îî# $
.
îî$ %
Equals
îî% +
(
îî+ ,
datosImagen
îî, 7
.
îî7 8
	Direccion
îî8 A
)
îîA B
)
îîB C
{
ïï 
listaImagenes
ññ !
.
ññ! "
RemoveAt
ññ" *
(
ññ* +
i
ññ+ ,
)
ññ, -
;
ññ- .
break
óó 
;
óó 
}
òò 
if
õõ 
(
õõ 
listaImagenes
õõ 
.
õõ 
Count
õõ #
==
õõ$ &
$num
õõ' (
)
õõ( )
listaImagenes
úú 
.
úú 
Add
úú !
(
úú! "
$str
úú" 0
)
úú0 1
;
úú1 2
plan
ûû 
.
ûû 
Imagen
ûû 
=
ûû 
JsonSerializer
ûû (
.
ûû( )
	Serialize
ûû) 2
(
ûû2 3
listaImagenes
ûû3 @
)
ûû@ A
;
ûûA B
	DatosPlan
†† 
.
†† 

Actualizar
††  
(
††  !
plan
††! %
)
††% &
;
††& '
new
¢¢ 
SImagen
¢¢ 
(
¢¢ 
HostEnvironment
¢¢ '
)
¢¢' (
.
¢¢( )
Eliminar
¢¢) 1
(
¢¢1 2
datosImagen
¢¢2 =
)
¢¢= >
;
¢¢> ?
}
§§ 	
}
•• 
}¶¶ ©á
rC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Oferta\SServicio.cs
	namespace 	
	Servicios
 
. 
Oferta 
{ 
public 

class 
	SServicio 
: 
SOfertaTuristica -
<- .
Servicio. 6
>6 7
,7 8

ISServicio9 C
{ 
private 
	DServicio 
DatosServicio '
{( )
get* -
;- .
}/ 0
public   
	SServicio   
(   
PostgreSQLContext   *
_context  + 3
,  3 4
IWebHostEnvironment  5 H
_hostEnvironment  I Y
)  Y Z
:  [ \
base  ] a
(  a b
_context  b j
,  j k
_hostEnvironment  l |
)  | }
{!! 	
DatosServicio"" 
="" 
new"" 
	DServicio""  )
("") *
_context""* 2
)""2 3
;""3 4
}## 	
public// 
override// 
void// 
Crear// "
(//" #
Servicio//# +
servicio//, 4
,//4 5
string//6 <
hash//= A
,//A B
string//C I
email//J O
)//O P
{00 	
	Proveedor22 
	proveedor22 
=22  !
LeerProveedor22" /
(22/ 0
hash220 4
,224 5
email226 ;
)22; <
;22< =
if55 
(55 
DatosServicio55 
.55 
Cantidad55 &
(55& '
	proveedor55' 0
.550 1
Id551 3
)553 4
>=555 7"
MAX_OFERTAS_TURISTICAS558 N
)55N O
throw66 
new66 
IntegridadException66 -
(66- .
$str66. J
+66K L"
MAX_OFERTAS_TURISTICAS66M c
+66d e
$str66f }
)66} ~
;66~ 
servicio99 
.99 
Imagen99 
=99 
JsonSerializer99 ,
.99, -
	Serialize99- 6
(996 7
new997 :
List99; ?
<99? @
string99@ F
>99F G
{99H I
$str99J X
}99Y Z
)99Z [
;99[ \
servicio:: 
.:: 

Puntuacion:: 
=::  !
$num::" #
;::# $
servicio;; 
.;; 
FechaCreacion;; "
=;;# $
DateTime;;% -
.;;- .
Now;;. 1
;;;1 2
servicio<< 
.<< 
ProveedorId<<  
=<<! "
	proveedor<<# ,
.<<, -
Id<<- /
;<</ 0
servicio== 
.== 

Habilitado== 
===  !
true==" &
;==& '
servicio>> 
.>> 
	Eliminado>> 
=>>  
false>>! &
;>>& '
DatosServicio@@ 
.@@ 
Crear@@ 
(@@  
servicio@@  (
)@@( )
;@@) *
}BB 	
publicLL 
overrideLL 
ListLL 
<LL 
ServicioLL %
>LL% &
LeerLL' +
(LL+ ,
stringLL, 2
hashLL3 7
,LL7 8
stringLL9 ?
emailLL@ E
)LLE F
{MM 	
	ProveedorOO 
	proveedorOO 
=OO  !
LeerProveedorOO" /
(OO/ 0
hashOO0 4
,OO4 5
emailOO6 ;
)OO; <
;OO< =
ListQQ 
<QQ 
ServicioQQ 
>QQ 
listaServiciosQQ )
=QQ* +
DatosServicioQQ, 9
.QQ9 :
LeerQQ: >
(QQ> ?
	proveedorQQ? H
.QQH I
IdQQI K
)QQK L
;QQL M
ifTT 
(TT 
listaServiciosTT 
.TT 
CountTT $
==TT% '
$numTT( )
)TT) *
throwUU 
newUU 
NoContentExceptionUU ,
(UU, -
$strUU- V
)UUV W
;UUW X
returnWW 
listaServiciosWW !
;WW! "
}YY 	
publicdd 
overridedd 
Serviciodd  
Leerdd! %
(dd% &
intdd& )
iddd* ,
,dd, -
stringdd. 4
hashdd5 9
,dd9 :
stringdd; A
emailddB G
)ddG H
{ee 	
	Proveedorgg 
	proveedorgg 
=gg  !
LeerProveedorgg" /
(gg/ 0
hashgg0 4
,gg4 5
emailgg6 ;
)gg; <
;gg< =
Servicioii 
servicioii 
=ii 
DatosServicioii  -
.ii- .
Leerii. 2
(ii2 3
idii3 5
,ii5 6
	proveedorii7 @
.ii@ A
IdiiA C
)iiC D
;iiD E
ifll 
(ll 
servicioll 
==ll 
nullll  
)ll  !
throwmm 
newmm 
NotFoundExceptionmm +
(mm+ ,
$strmm, R
)mmR S
;mmS T
returnoo 
serviciooo 
;oo 
}qq 	
public{{ 
override{{ 
Paginado{{  
<{{  !
Servicio{{! )
>{{) *
Leer{{+ /
({{/ 0
short{{0 5
pagina{{6 <
,{{< =
short{{> C
cantidad{{D L
,{{L M
bool{{N R
estado{{S Y
){{Y Z
{|| 	
List~~ 
<~~ 
Servicio~~ 
>~~ 
listaServicios~~ )
=~~* +
DatosServicio~~, 9
.~~9 :
Leer~~: >
(~~> ?
pagina~~? E
,~~E F
cantidad~~G O
,~~O P
estado~~Q W
)~~W X
;~~X Y
if
ÅÅ 
(
ÅÅ 
listaServicios
ÅÅ 
.
ÅÅ 
Count
ÅÅ $
==
ÅÅ% '
$num
ÅÅ( )
)
ÅÅ) *
throw
ÇÇ 
new
ÇÇ  
NoContentException
ÇÇ ,
(
ÇÇ, -
$str
ÇÇ- J
)
ÇÇJ K
;
ÇÇK L
Paginado
ÖÖ 
<
ÖÖ 
Servicio
ÖÖ 
>
ÖÖ 
paginado
ÖÖ '
=
ÖÖ( )
new
ÖÖ* -
(
ÖÖ. /
)
ÖÖ/ 0
{
ÜÜ 
	Contenido
áá 
=
áá 
listaServicios
áá *
,
áá* +
PaginaActual
àà 
=
àà 
pagina
àà %
,
àà% &

TotalItems
ââ 
=
ââ 
DatosServicio
ââ *
.
ââ* +&
CantidadEstadoHabilitado
ââ+ C
(
ââC D
estado
ââD J
)
ââJ K
}
ää 
;
ää 
paginado
åå 
.
åå 
TotalPaginas
åå !
=
åå" #
Math
åå$ (
.
åå( )
Ceiling
åå) 0
(
åå0 1
(
åå1 2
decimal
åå2 9
)
åå9 :
(
åå; <
(
åå< =
double
åå= C
)
ååC D
paginado
ååE M
.
ååM N

TotalItems
ååN X
/
ååY Z
(
åå[ \
double
åå\ b
)
ååb c
cantidad
ååd l
)
åål m
)
ååm n
;
åån o
return
éé 
paginado
éé 
;
éé 
}
êê 	
public
öö 
override
öö 
Paginado
öö  
<
öö  !
Servicio
öö! )
>
öö) *
Leer
öö+ /
(
öö/ 0
Busqueda
öö0 8

parametros
öö9 C
,
ööC D
short
ööE J
pagina
ööK Q
,
ööQ R
short
ööS X
cantidad
ööY a
)
ööa b
{
õõ 	
List
ùù 
<
ùù 
Servicio
ùù 
>
ùù 
listaServicios
ùù )
=
ùù* +
DatosServicio
ùù, 9
.
ùù9 :
Leer
ùù: >
(
ùù> ?

parametros
ùù? I
,
ùùI J
pagina
ùùK Q
,
ùùQ R
cantidad
ùùS [
)
ùù[ \
;
ùù\ ]
if
†† 
(
†† 
listaServicios
†† 
.
†† 
Count
†† $
==
††% '
$num
††( )
)
††) *
throw
°° 
new
°°  
NoContentException
°° ,
(
°°, -
$str
°°- U
)
°°U V
;
°°V W
Paginado
§§ 
<
§§ 
Servicio
§§ 
>
§§ 
paginado
§§ '
=
§§( )
new
§§* -
(
§§- .
)
§§. /
{
•• 
	Contenido
¶¶ 
=
¶¶ 
listaServicios
¶¶ *
,
¶¶* +
PaginaActual
ßß 
=
ßß 
(
ßß  
short
ßß  %
)
ßß% &
(
ßß' (
pagina
ßß( .
+
ßß/ 0
$num
ßß1 2
)
ßß2 3
,
ßß3 4

TotalItems
®® 
=
®® 
DatosServicio
®® *
.
®®* +
Cantidad
®®+ 3
(
®®3 4

parametros
®®4 >
)
®®> ?
}
©© 
;
©© 
paginado
´´ 
.
´´ 
TotalPaginas
´´ !
=
´´" #
Math
´´$ (
.
´´( )
Ceiling
´´) 0
(
´´0 1
(
´´1 2
decimal
´´2 9
)
´´9 :
(
´´: ;
(
´´; <
double
´´< B
)
´´B C
paginado
´´C K
.
´´K L

TotalItems
´´L V
/
´´W X
(
´´Y Z
double
´´Z `
)
´´` a
cantidad
´´a i
)
´´i j
)
´´j k
;
´´k l
return
≠≠ 
paginado
≠≠ 
;
≠≠ 
}
ØØ 	
public
ππ 
override
ππ 
void
ππ 

Actualizar
ππ '
(
ππ' (
Servicio
ππ( 0
servicio
ππ1 9
,
ππ9 :
string
ππ; A
hash
ππB F
,
ππF G
string
ππH N
email
ππO T
)
ππT U
{
∫∫ 	
	Proveedor
ºº 
	proveedor
ºº 
=
ºº  !
LeerProveedor
ºº" /
(
ºº/ 0
hash
ºº0 4
,
ºº4 5
email
ºº6 ;
)
ºº; <
;
ºº< =
if
øø 
(
øø 
DatosServicio
øø 
.
øø 
Cantidad
øø &
(
øø& '
servicio
øø' /
.
øø/ 0
Id
øø0 2
,
øø2 3
	proveedor
øø4 =
.
øø= >
Id
øø> @
)
øø@ A
!=
øøB D
$num
øøE F
)
øøF G
throw
¿¿ 
new
¿¿ 
NotFoundException
¿¿ +
(
¿¿+ ,
$str
¿¿, R
)
¿¿R S
;
¿¿S T
DatosServicio
¬¬ 
.
¬¬ 

Actualizar
¬¬ $
(
¬¬$ %
servicio
¬¬% -
)
¬¬- .
;
¬¬. /
}
ƒƒ 	
public
œœ 
override
œœ 
void
œœ 

Actualizar
œœ '
(
œœ' (
int
œœ( +
id
œœ, .
,
œœ. /
string
œœ0 6
hash
œœ7 ;
,
œœ; <
string
œœ= C
email
œœD I
,
œœI J!
IFormFileCollection
œœK ^
imagenes
œœ_ g
)
œœg h
{
–– 	
	Proveedor
““ 
	proveedor
““ 
=
““  !
LeerProveedor
““" /
(
““/ 0
hash
““0 4
,
““4 5
email
““6 ;
)
““; <
;
““< =
Servicio
‘‘ 
servicio
‘‘ 
=
‘‘ 
DatosServicio
‘‘  -
.
‘‘- .
Leer
‘‘. 2
(
‘‘2 3
id
‘‘3 5
,
‘‘5 6
	proveedor
‘‘7 @
.
‘‘@ A
Id
‘‘A C
)
‘‘C D
;
‘‘D E
if
◊◊ 
(
◊◊ 
servicio
◊◊ 
==
◊◊ 
null
◊◊  
)
◊◊  !
throw
ÿÿ 
new
ÿÿ 
NotFoundException
ÿÿ +
(
ÿÿ+ ,
$str
ÿÿ, R
)
ÿÿR S
;
ÿÿS T
servicio
⁄⁄ 
.
⁄⁄ 
Imagen
⁄⁄ 
=
⁄⁄ 
new
⁄⁄ !
SImagen
⁄⁄" )
(
⁄⁄) *
HostEnvironment
⁄⁄* 9
)
⁄⁄9 :
.
⁄⁄: ;
CargarImagenes
⁄⁄; I
(
⁄⁄I J
	proveedor
⁄⁄J S
,
⁄⁄S T
$str
⁄⁄U _
,
⁄⁄_ `
imagenes
⁄⁄a i
,
⁄⁄i j
servicio
⁄⁄k s
)
⁄⁄s t
;
⁄⁄t u
DatosServicio
‹‹ 
.
‹‹ 

Actualizar
‹‹ $
(
‹‹$ %
servicio
‹‹% -
)
‹‹- .
;
‹‹. /
}
ﬁﬁ 	
public
ËË 
override
ËË 
void
ËË 
Eliminar
ËË %
(
ËË% &
int
ËË& )
id
ËË* ,
,
ËË, -
string
ËË. 4
hash
ËË5 9
,
ËË9 :
string
ËË; A
email
ËËB G
)
ËËG H
{
ÈÈ 	
	Proveedor
ÎÎ 
	proveedor
ÎÎ 
=
ÎÎ  !
LeerProveedor
ÎÎ" /
(
ÎÎ/ 0
hash
ÎÎ0 4
,
ÎÎ4 5
email
ÎÎ6 ;
)
ÎÎ; <
;
ÎÎ< =
Servicio
ÌÌ 
servicio
ÌÌ 
=
ÌÌ 
DatosServicio
ÌÌ  -
.
ÌÌ- .
Leer
ÌÌ. 2
(
ÌÌ2 3
id
ÌÌ3 5
,
ÌÌ5 6
	proveedor
ÌÌ7 @
.
ÌÌ@ A
Id
ÌÌA C
)
ÌÌC D
;
ÌÌD E
if
 
(
 
servicio
 
==
 
null
  
)
  !
throw
ÒÒ 
new
ÒÒ 
NotFoundException
ÒÒ +
(
ÒÒ+ ,
$str
ÒÒ, R
)
ÒÒR S
;
ÒÒS T
servicio
ÙÙ 
.
ÙÙ 

Habilitado
ÙÙ 
=
ÙÙ  !
false
ÙÙ" '
;
ÙÙ' (
servicio
ıı 
.
ıı 
	Eliminado
ıı 
=
ıı  
true
ıı! %
;
ıı% &
DatosServicio
˜˜ 
.
˜˜ 

Actualizar
˜˜ $
(
˜˜$ %
servicio
˜˜% -
)
˜˜- .
;
˜˜. /
}
˘˘ 	
public
ÑÑ 
override
ÑÑ 
void
ÑÑ 
Eliminar
ÑÑ %
(
ÑÑ% &
int
ÑÑ& )
id
ÑÑ* ,
,
ÑÑ, -
string
ÑÑ. 4
hash
ÑÑ5 9
,
ÑÑ9 :
string
ÑÑ; A
email
ÑÑB G
,
ÑÑG H
string
ÑÑI O
direccionImagen
ÑÑP _
)
ÑÑ_ `
{
ÖÖ 	
	Proveedor
áá 
	proveedor
áá 
=
áá  !
LeerProveedor
áá" /
(
áá/ 0
hash
áá0 4
,
áá4 5
email
áá6 ;
)
áá; <
;
áá< =
Servicio
ââ 
servicio
ââ 
=
ââ 
DatosServicio
ââ  -
.
ââ- .
Leer
ââ. 2
(
ââ2 3
id
ââ3 5
,
ââ5 6
	proveedor
ââ7 @
.
ââ@ A
Id
ââA C
)
ââC D
;
ââD E
Imagen
åå 
datosImagen
åå 
=
åå  
new
åå! $
(
åå$ %
)
åå% &
{
çç 
	Direccion
éé 
=
éé 
direccionImagen
éé +
.
éé+ ,
Replace
éé, 3
(
éé3 4
$str
éé4 7
,
éé7 8
$str
éé9 =
)
éé= >
,
éé> ?
Tipo
èè 
=
èè 
$str
èè !
}
êê 
;
êê 
List
íí 
<
íí 
string
íí 
>
íí 
listaImagenes
íí &
=
íí' (
JsonSerializer
íí) 7
.
íí7 8
Deserialize
íí8 C
<
ííC D
List
ííD H
<
ííH I
string
ííI O
>
ííO P
>
ííP Q
(
ííQ R
servicio
ííR Z
.
ííZ [
Imagen
íí[ a
)
íía b
;
ííb c
for
ïï 
(
ïï 
short
ïï 
i
ïï 
=
ïï 
$num
ïï 
;
ïï 
i
ïï 
<
ïï  !
listaImagenes
ïï" /
.
ïï/ 0
Count
ïï0 5
;
ïï5 6
i
ïï7 8
++
ïï8 :
)
ïï: ;
if
ññ 
(
ññ 
listaImagenes
ññ !
[
ññ! "
i
ññ" #
]
ññ# $
.
ññ$ %
Equals
ññ% +
(
ññ+ ,
datosImagen
ññ, 7
.
ññ7 8
	Direccion
ññ8 A
)
ññA B
)
ññB C
{
óó 
listaImagenes
òò !
.
òò! "
RemoveAt
òò" *
(
òò* +
i
òò+ ,
)
òò, -
;
òò- .
break
ôô 
;
ôô 
}
öö 
if
ùù 
(
ùù 
listaImagenes
ùù 
.
ùù 
Count
ùù #
==
ùù$ &
$num
ùù' (
)
ùù( )
listaImagenes
ûû 
.
ûû 
Add
ûû !
(
ûû! "
$str
ûû" 0
)
ûû0 1
;
ûû1 2
servicio
†† 
.
†† 
Imagen
†† 
=
†† 
JsonSerializer
†† ,
.
††, -
	Serialize
††- 6
(
††6 7
listaImagenes
††7 D
)
††D E
;
††E F
DatosServicio
¢¢ 
.
¢¢ 

Actualizar
¢¢ $
(
¢¢$ %
servicio
¢¢% -
)
¢¢- .
;
¢¢. /
new
§§ 
SImagen
§§ 
(
§§ 
HostEnvironment
§§ '
)
§§' (
.
§§( )
Eliminar
§§) 1
(
§§1 2
datosImagen
§§2 =
)
§§= >
;
§§> ?
}
¶¶ 	
}
®® 
}©© Ó
ÖC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Recomendacion\Interfaz\ISPuntuacion.cs
	namespace 	
	Servicios
 
. 
Recomendacion !
.! "
Interfaz" *
{ 
public 

	interface 
ISPuntuacion !
<! "
T" #
># $
where% *
T+ ,
:- .

Puntuacion/ 9
{		 
public 
void 
Crear 
( 
T 

puntuacion &
,& '
string( .
hash/ 3
,3 4
string5 ;
email< A
)A B
;B C
} 
} Î
âC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Recomendacion\Interfaz\ISPuntuacionPlan.cs
	namespace 	
	Servicios
 
. 
Recomendacion !
.! "
Interfaz" *
{ 
public 

	interface 
ISPuntuacionPlan %
:& '
ISPuntuacion( 4
<4 5
PuntuacionPlan5 C
>C D
{		 
} 
} ˜
çC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Recomendacion\Interfaz\ISPuntuacionServicio.cs
	namespace 	
	Servicios
 
. 
Recomendacion !
.! "
Interfaz" *
{ 
public 

	interface  
ISPuntuacionServicio )
:* +
ISPuntuacion, 8
<8 9
PuntuacionServicio9 K
>K L
{		 
} 
} ∆	
{C:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Recomendacion\SPuntuacion.cs
	namespace 	
	Servicios
 
. 
Recomendacion !
{		 
public 

abstract 
class 
SPuntuacion %
<% &
T& '
>' (
:) *
	SGenerica+ 4
,4 5
ISPuntuacion6 B
<B C
TC D
>D E
whereF K
TL M
:N O

PuntuacionP Z
{ 
public 
SPuntuacion 
( 
PostgreSQLContext ,
_context- 5
,5 6
IConfiguration7 E
_configurationF T
)T U
:V W
baseX \
(\ ]
_context] e
,e f
_configurationg u
)u v
{w x
}y z
public 
abstract 
void 
Crear "
(" #
T# $

puntuacion% /
,/ 0
string1 7
hash8 <
,< =
string> D
emailE J
)J K
;K L
} 
}  %
C:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Recomendacion\SPuntuacionPlan.cs
	namespace 	
	Servicios
 
. 
Recomendacion !
{ 
public 

class 
SPuntuacionPlan  
:! "
SPuntuacion# .
<. /
PuntuacionPlan/ =
>= >
,> ?
ISPuntuacionPlan@ P
{ 
private 
DPuntuacionPlan 
DatosPuntuacionPlan  3
{4 5
get6 9
;9 :
}; <
private 
DPlan 
	DatosPlan 
{  !
get" %
;% &
}' (
public 
SPuntuacionPlan 
( 
PostgreSQLContext 0
_context1 9
,9 :
IConfiguration; I
_configurationJ X
)X Y
:Z [
base\ `
(` a
_contexta i
,i j
_configurationk y
)y z
{ 	
DatosPuntuacionPlan 
=  !
new" %
(% &
_context& .
). /
;/ 0
	DatosPlan   
=   
new   
(   
_context   $
)  $ %
;  % &
}!! 	
public.. 
override.. 
void.. 
Crear.. "
(.." #
PuntuacionPlan..# 1

puntuacion..2 <
,..< =
string..> D
hash..E I
,..I J
string..K Q
email..R W
)..W X
{// 	

DProveedor11 
datosProveedor11 %
=11& '
new11( +
(11+ ,
	DbContext11, 5
)115 6
;116 7
	Proveedor33 
	proveedor33 
=33  !
datosProveedor33" 0
.330 1
LeerAuth331 9
(339 :
hash33: >
,33> ?
email33@ E
)33E F
;33F G
if66 
(66 
	proveedor66 
==66 
null66 !
)66! "
throw77 
new77 !
UnauthorizedException77 /
(77/ 0
$str770 Z
)77Z [
;77[ \
if:: 
(:: 
	DatosPlan:: 
.:: $
CantidadEstadoHabilitado:: 2
(::2 3

puntuacion::3 =
.::= >
PlanId::> D
,::D E
	proveedor::F O
.::O P
Id::P R
,::R S
true::T X
)::X Y
!=::Z \
$num::] ^
)::^ _
throw;; 
new;; 
NotFoundException;; +
(;;+ ,
$str;;, N
);;N O
;;;O P
if>> 
(>> 
datosProveedor>> 
.>> 
CantidadEmailSync>> 0
(>>0 1

puntuacion>>1 ;
.>>; <
Email>>< A
)>>A B
>>>C D
$num>>E F
||>>G I
new>>J M
DAdministrador>>N \
(>>\ ]
	DbContext>>] f
)>>f g
.>>g h
CantidadEmailSync>>h y
(>>y z

puntuacion	>>z Ñ
.
>>Ñ Ö
Email
>>Ö ä
)
>>ä ã
>
>>å ç
$num
>>é è
)
>>è ê
throw?? 
new?? 
IntegridadException?? -
(??- .
$str??. R
)??R S
;??S T
ifBB 
(BB 
DatosPuntuacionPlanBB #
.BB# $
CantidadBB$ ,
(BB, -

puntuacionBB- 7
.BB7 8
PlanIdBB8 >
,BB> ?

puntuacionBB@ J
.BBJ K
EmailBBK P
)BBP Q
>BBR S
$numBBT U
)BBU V
throwCC 
newCC 
IntegridadExceptionCC -
(CC- .
$str	CC. é
)
CCé è
;
CCè ê

puntuacionFF 
.FF 

CalificadoFF !
=FF" #
falseFF$ )
;FF) *

puntuacionGG 
.GG 
CalificacionGG #
=GG$ %
nullGG& *
;GG* +

puntuacionHH 
.HH 
	TuristaIdHH  
=HH! "
nullHH# '
;HH' (

puntuacionII 
.II 
FechaCalificacionII (
=II) *
nullII+ /
;II/ 0
DatosPuntuacionPlanKK 
.KK  
CrearKK  %
(KK% &

puntuacionKK& 0
)KK0 1
;KK1 2
newMM 
SSMTPMM 
(MM 
ConfigurationMM #
)MM# $
.MM$ % 
EnviarHashPuntuacionMM% 9
(MM9 :
$strMM: @
,MM@ A

puntuacionMMB L
.MML M
PlanIdMMM S
,MMS T

puntuacionMMU _
.MM_ `
EmailMM` e
)MMe f
;MMf g
}OO 	
}PP 
}QQ î&
ÉC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Recomendacion\SPuntuacionServicio.cs
	namespace 	
	Servicios
 
. 
Recomendacion !
{ 
public 

class 
SPuntuacionServicio $
:% &
SPuntuacion' 2
<2 3
PuntuacionServicio3 E
>E F
,F G 
ISPuntuacionServicioH \
{ 
private 
DPuntuacionServicio ##
DatosPuntuacionServicio$ ;
{< =
get> A
;A B
}C D
private 
	DServicio 
DatosServicio '
{( )
get* -
;- .
}/ 0
public 
SPuntuacionServicio "
(" #
PostgreSQLContext# 4
_context5 =
,= >
IConfiguration? M
_configurationN \
)\ ]
:^ _
base` d
(d e
_contexte m
,m n
_configurationo }
)} ~
{	 Ä
DatosServicio 
= 
new 
(  
_context  (
)( )
;) *#
DatosPuntuacionServicio #
=$ %
new& )
() *
_context* 2
)2 3
;3 4
}   	
public-- 
override-- 
void-- 
Crear-- "
(--" #
PuntuacionServicio--# 5

puntuacion--6 @
,--@ A
string--B H
hash--I M
,--M N
string--O U
email--V [
)--[ \
{.. 	

DProveedor00 
datosProveedor00 %
=00& '
new00( +
(00+ ,
	DbContext00, 5
)005 6
;006 7
	Proveedor22 
	proveedor22 
=22  !
datosProveedor22" 0
.220 1
LeerAuth221 9
(229 :
hash22: >
,22> ?
email22@ E
)22E F
;22F G
if55 
(55 
	proveedor55 
==55 
null55 !
)55! "
throw66 
new66 !
UnauthorizedException66 /
(66/ 0
$str660 Z
)66Z [
;66[ \
if99 
(99 
DatosServicio99 
.99 $
CantidadEstadoHabilitado99 6
(996 7

puntuacion997 A
.99A B

ServicioId99B L
,99L M
	proveedor99N W
.99W X
Id99X Z
,99Z [
true99\ `
)99` a
!=99b d
$num99e f
)99f g
throw:: 
new:: 
NotFoundException:: +
(::+ ,
$str::, R
)::R S
;::S T
if== 
(== 
datosProveedor== 
.== 
CantidadEmailSync== 0
(==0 1

puntuacion==1 ;
.==; <
Email==< A
)==A B
>==C D
$num==E F
||==G I
new==J M
DAdministrador==N \
(==\ ]
	DbContext==] f
)==f g
.==g h
CantidadEmailSync==h y
(==y z

puntuacion	==z Ñ
.
==Ñ Ö
Email
==Ö ä
)
==ä ã
>
==å ç
$num
==é è
)
==è ê
throw>> 
new>> 
IntegridadException>> -
(>>- .
$str>>. R
)>>R S
;>>S T
ifAA 
(AA #
DatosPuntuacionServicioAA '
.AA' (
CantidadAA( 0
(AA0 1

puntuacionAA1 ;
.AA; <

ServicioIdAA< F
,AAF G

puntuacionAAH R
.AAR S
EmailAAS X
)AAX Y
>AAZ [
$numAA\ ]
)AA] ^
throwBB 
newBB 
IntegridadExceptionBB -
(BB- .
$str	BB. í
)
BBí ì
;
BBì î

puntuacionEE 
.EE 

CalificadoEE !
=EE" #
falseEE$ )
;EE) *

puntuacionFF 
.FF 
CalificacionFF #
=FF$ %
nullFF& *
;FF* +

puntuacionGG 
.GG 
	TuristaIdGG  
=GG! "
nullGG# '
;GG' (

puntuacionHH 
.HH 
FechaCalificacionHH (
=HH) *
nullHH+ /
;HH/ 0#
DatosPuntuacionServicioJJ #
.JJ# $
CrearJJ$ )
(JJ) *

puntuacionJJ* 4
)JJ4 5
;JJ5 6
newLL 
SSMTPLL 
(LL 
ConfigurationLL #
)LL# $
.LL$ % 
EnviarHashPuntuacionLL% 9
(LL9 :
$strLL: D
,LLD E

puntuacionLLF P
.LLP Q

ServicioIdLLQ [
,LL[ \

puntuacionLL] g
.LLg h
EmailLLh m
)LLm n
;LLn o
}NN 	
}PP 
}QQ ¢
ÜC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Seguridad\Interfaz\ISRecuperarCuenta.cs
	namespace 	
	Servicios
 
. 
	Seguridad 
. 
Interfaz &
{ 
public 

	interface 
ISRecuperarCuenta &
{		 
public 
Task 
Crear 
( 
string  
email! &
,& '
string( .
rol/ 2
)2 3
;3 4
public 
void 
CambiarClave  
(  !
string! '
hash( ,
,, -
string. 4
clave5 :
): ;
;; <
public 
Task 
ReenviarCodigo "
(" #
string# )
email* /
)/ 0
;0 1
} 
} …
ÄC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Seguridad\Interfaz\ISSeguridad.cs
	namespace 	
	Servicios
 
. 
	Seguridad 
. 
Interfaz &
{ 
public 

	interface 
ISSeguridad  
{		 
public 
object 
IniciarSesion #
(# $
Login$ )
datos* /
,/ 0
bool1 5
encriptarClave6 D
)D E
;E F
} 
} ⁄R
|C:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Seguridad\SRecuperarCuenta.cs
	namespace 	
	Servicios
 
. 
	Seguridad 
{ 
public 

class 
SRecuperarCuenta !
:" #
	SGenerica$ -
,- .
ISRecuperarCuenta/ @
{ 
private 
DRecuperarCuenta   
datosRecuperarCuenta! 5
{6 7
get8 ;
;; <
}= >
public 
SRecuperarCuenta 
(  
PostgreSQLContext  1
_context2 :
,: ;
IConfiguration< J
_configurationK Y
)Y Z
:[ \
base] a
(a b
_contextb j
,j k
_configurationl z
)z {
{ 	 
datosRecuperarCuenta  
=! "
new# &
DRecuperarCuenta' 7
(7 8
_context8 @
)@ A
;A B
} 	
public## 
async## 
Task## 
Crear## 
(##  
string##  &
email##' ,
,##, -
string##. 4
rol##5 8
)##8 9
{$$ 	
if&& 
(&&  
datosRecuperarCuenta&& $
.&&$ %
CantidadEmail&&% 2
(&&2 3
email&&3 8
)&&8 9
==&&: <
$num&&= >
)&&> ?
{'' 
Usuario)) 
usuario)) 
;))  
switch++ 
(++ 
rol++ 
)++ 
{,, 
case.. 
$str.. "
:.." #
usuario// 
=//  !
new//" %
DTurista//& .
(//. /
	DbContext/// 8
)//8 9
.//9 :
Leer//: >
(//> ?
email//? D
)//D E
;//E F
break00 
;00 
case22 
$str22 $
:22$ %
usuario33 
=33  !
new33" %

DProveedor33& 0
(330 1
	DbContext331 :
)33: ;
.33; <
Leer33< @
(33@ A
email33A F
)33F G
;33G H
break44 
;44 
case66 
$str66 (
:66( )
usuario77 
=77  !
new77" %
DAdministrador77& 4
(774 5
	DbContext775 >
)77> ?
.77? @
Leer77@ D
(77D E
email77E J
)77J K
;77K L
break88 
;88 
default:: 
::: 
throw;; 
new;; !
BadRequestException;;" 5
(;;5 6
$str;;6 g
);;g h
;;;h i
}== 
if?? 
(?? 
usuario?? 
!=?? 
null?? #
)??# $
{@@ 
RecuperarCuentaBB #
datosBB$ )
=BB* +
newBB, /
RecuperarCuentaBB0 ?
(BB? @
)BB@ A
{CC 
CorreoElectronicoDD )
=DD* +
emailDD, 1
,DD1 2
FechaCreacionEE %
=EE& '
DateTimeEE( 0
.EE0 1
NowEE1 4
,EE4 5
RolFF 
=FF 
rolFF !
,FF! "
HashGG 
=GG 
usuarioGG &
.GG& '
HashGG' +
}HH 
;HH  
datosRecuperarCuentaJJ (
.JJ( )
CrearJJ) .
(JJ. /
datosJJ/ 4
)JJ4 5
;JJ5 6
awaitLL 
newLL 
SSMTPLL #
(LL# $
ConfigurationLL$ 1
)LL1 2
.LL2 3"
EnviarHashRecuperacionLL3 I
(LLI J
usuarioLLJ Q
)LLQ R
;LLR S
}NN 
elseOO 
throwPP 
newPP 
NotFoundExceptionPP /
(PP/ 0
$strPP0 w
)PPw x
;PPx y
}RR 
elseSS 
throwTT 
newTT 
IntegridadExceptionTT -
(TT- .
$strTT. }
)TT} ~
;TT~ 
}VV 	
publicYY 
voidYY 
CambiarClaveYY  
(YY  !
stringYY! '
hashYY( ,
,YY, -
stringYY. 4
claveYY5 :
)YY: ;
{ZZ 	
RecuperarCuenta\\ 
datos\\ !
=\\" # 
datosRecuperarCuenta\\$ 8
.\\8 9
Leer\\9 =
(\\= >
hash\\> B
)\\B C
;\\C D
if^^ 
(^^ 
datos^^ 
!=^^ 
null^^ 
)^^ 
{__ 

SProveedoraa 
serviciosProveedoraa -
=aa. /
newaa0 3

SProveedoraa4 >
(aa> ?
	DbContextaa? H
)aaH I
;aaI J
switchcc 
(cc 
datoscc 
.cc 
Rolcc !
)cc! "
{dd 
caseff 
$strff "
:ff" #
DTuristagg  
datosTuristagg! -
=gg. /
newgg0 3
DTuristagg4 <
(gg< =
	DbContextgg= F
)ggF G
;ggG H
Turistahh 
turistahh  '
=hh( )
datosTuristahh* 6
.hh6 7
LeerHashhh7 ?
(hh? @
hashhh@ D
)hhD E
;hhE F
turistaii 
.ii  
Claveii  %
=ii& '
serviciosProveedorii( :
.ii: ;
EncriptarClaveii; I
(iiI J
claveiiJ O
)iiO P
;iiP Q
datosTuristajj $
.jj$ %

Actualizarjj% /
(jj/ 0
turistajj0 7
)jj7 8
;jj8 9
breakkk 
;kk 
casemm 
$strmm $
:mm$ %

DProveedornn "
datosProveedornn# 1
=nn2 3
newnn4 7

DProveedornn8 B
(nnB C
	DbContextnnC L
)nnL M
;nnM N
	Proveedoroo !
	proveedoroo" +
=oo, -
datosProveedoroo. <
.oo< =
LeerHashoo= E
(ooE F
hashooF J
)ooJ K
;ooK L
	proveedorpp !
.pp! "
Clavepp" '
=pp( )
serviciosProveedorpp* <
.pp< =
EncriptarClavepp= K
(ppK L
claveppL Q
)ppQ R
;ppR S
datosProveedorqq &
.qq& '

Actualizarqq' 1
(qq1 2
	proveedorqq2 ;
)qq; <
;qq< =
breakrr 
;rr 
casett 
$strtt (
:tt( )
DAdministradoruu &
datosAdministradoruu' 9
=uu: ;
newuu< ?
DAdministradoruu@ N
(uuN O
	DbContextuuO X
)uuX Y
;uuY Z
Administradorvv %
administradorvv& 3
=vv4 5
datosAdministradorvv6 H
.vvH I
LeerHashvvI Q
(vvQ R
hashvvR V
)vvV W
;vvW X
administradorww %
.ww% &
Claveww& +
=ww, -
serviciosProveedorww. @
.ww@ A
EncriptarClavewwA O
(wwO P
clavewwP U
)wwU V
;wwV W
datosAdministradorxx *
.xx* +

Actualizarxx+ 5
(xx5 6
administradorxx6 C
)xxC D
;xxD E
breakyy 
;yy 
default{{ 
:{{ 
throw|| 
new|| !
BadRequestException||" 5
(||5 6
$str||6 g
)||g h
;||h i
}~~ "
datosRecuperarCuenta
ÄÄ $
.
ÄÄ$ %
Eliminar
ÄÄ% -
(
ÄÄ- .
datos
ÄÄ. 3
)
ÄÄ3 4
;
ÄÄ4 5
}
ÇÇ 
else
ÉÉ 
throw
ÑÑ 
new
ÑÑ 
NotFoundException
ÑÑ +
(
ÑÑ+ ,
$str
ÑÑ, h
)
ÑÑh i
;
ÑÑi j
}
ÜÜ 	
public
ââ 
async
ââ 
Task
ââ 
ReenviarCodigo
ââ (
(
ââ( )
string
ââ) /
email
ââ0 5
)
ââ5 6
{
ää 	
RecuperarCuenta
åå 
datos
åå !
=
åå" #"
datosRecuperarCuenta
åå$ 8
.
åå8 9
	LeerEmail
åå9 B
(
ååB C
email
ååC H
)
ååH I
;
ååI J
if
éé 
(
éé 
datos
éé 
!=
éé 
null
éé 
)
éé 
{
èè 
Usuario
ëë 
usuario
ëë 
;
ëë  
switch
ìì 
(
ìì 
datos
ìì 
.
ìì 
Rol
ìì !
)
ìì! "
{
îî 
case
ññ 
$str
ññ "
:
ññ" #
usuario
óó 
=
óó  !
new
óó" %
DTurista
óó& .
(
óó. /
	DbContext
óó/ 8
)
óó8 9
.
óó9 :
Leer
óó: >
(
óó> ?
email
óó? D
)
óóD E
;
óóE F
break
òò 
;
òò 
case
öö 
$str
öö $
:
öö$ %
usuario
õõ 
=
õõ  !
new
õõ" %

DProveedor
õõ& 0
(
õõ0 1
	DbContext
õõ1 :
)
õõ: ;
.
õõ; <
Leer
õõ< @
(
õõ@ A
email
õõA F
)
õõF G
;
õõG H
break
úú 
;
úú 
case
ûû 
$str
ûû (
:
ûû( )
usuario
üü 
=
üü  !
new
üü" %
DAdministrador
üü& 4
(
üü4 5
	DbContext
üü5 >
)
üü> ?
.
üü? @
Leer
üü@ D
(
üüD E
email
üüE J
)
üüJ K
;
üüK L
break
†† 
;
†† 
default
¢¢ 
:
¢¢ 
throw
££ 
new
££ !*
InternalServerErrorException
££" >
(
££> ?
$str
££? v
)
££v w
;
££w x
}
•• 
if
ßß 
(
ßß 
usuario
ßß 
!=
ßß 
null
ßß #
)
ßß# $
await
®® 
new
®® 
SSMTP
®® #
(
®®# $
Configuration
®®$ 1
)
®®1 2
.
®®2 3$
EnviarHashRecuperacion
®®3 I
(
®®I J
usuario
®®J Q
)
®®Q R
;
®®R S
else
©© 
throw
™™ 
new
™™ !
BadRequestException
™™ 1
(
™™1 2
$str
™™2 y
)
™™y z
;
™™z {
}
¨¨ 
else
≠≠ 
throw
ÆÆ 
new
ÆÆ 
NotFoundException
ÆÆ +
(
ÆÆ+ ,
$str
ÆÆ, t
)
ÆÆt u
;
ÆÆu v
}
∞∞ 	
}
±± 
}≥≥ åS
vC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Seguridad\SSeguridad.cs
	namespace 	
	Servicios
 
. 
	Seguridad 
{ 
public 

class 

SSeguridad 
: 
	SGenerica '
,' (
ISSeguridad) 4
{ 
private 
DSupervisionUsuario ##
datosSupervisionUsuario$ ;
;; <
public 

SSeguridad 
( 
PostgreSQLContext +
_context, 4
,4 5
IConfiguration6 D
_configurationE S
)S T
:U V
baseW [
([ \
_context\ d
,d e
_configurationf t
)t u
{   	#
datosSupervisionUsuario!! #
=!!$ %
new!!& )
DSupervisionUsuario!!* =
(!!= >
_context!!> F
)!!F G
;!!G H
}"" 	
public'' 
object'' 
IniciarSesion'' #
(''# $
Login''$ )
datos''* /
,''/ 0
bool''1 5
encriptarClave''6 D
)''D E
{(( 	
Usuario** 
usuario** 
;** 
if,, 
(,, 
encriptarClave,, 
),, 
datos-- 
.-- 
Clave-- 
=-- 
new-- !

SProveedor--" ,
(--, -
	DbContext--- 6
)--6 7
.--7 8
EncriptarClave--8 F
(--F G
datos--G L
.--L M
Clave--M R
)--R S
;--S T
switch// 
(// 
datos// 
.// 
Rol// 
)// 
{00 
case22 
$str22 
:22 
usuario33 
=33 
new33 !
DTurista33" *
(33* +
	DbContext33+ 4
)334 5
.335 6
Leer336 :
(33: ;
datos33; @
.33@ A
Email33A F
,33F G
datos33H M
.33M N
Clave33N S
)33S T
;33T U
break44 
;44 
case66 
$str66  
:66  !
usuario77 
=77 
new77 !

DProveedor77" ,
(77, -
	DbContext77- 6
)776 7
.777 8
	LeerLogin778 A
(77A B
datos77B G
.77G H
Nit77H K
,77K L
datos77M R
.77R S
Clave77S X
)77X Y
;77Y Z
break88 
;88 
case:: 
$str:: $
:::$ %
usuario;; 
=;; 
new;; !
DAdministrador;;" 0
(;;0 1
	DbContext;;1 :
);;: ;
.;;; <
Leer;;< @
(;;@ A
datos;;A F
.;;F G
Email;;G L
,;;L M
datos;;N S
.;;S T
Clave;;T Y
);;Y Z
;;;Z [
break<< 
;<< 
default>> 
:>> 
throw?? 
new?? 
BadRequestException?? 1
(??1 2
$str??2 m
)??m n
;??n o
}AA 
ifCC 
(CC 
usuarioCC 
!=CC 
nullCC 
)CC  
{DD 
DateTimeFF 
fechaActualFF $
=FF% &
DateTimeFF' /
.FF/ 0
NowFF0 3
;FF3 4
stringHH 
JWTokenHH 
=HH  
newHH! $#
JwtSecurityTokenHandlerHH% <
(HH< =
)HH= >
.HH> ?

WriteTokenHH? I
(HHI J

GenerarJWTHHJ T
(HHT U
datosHHU Z
.HHZ [
RolHH[ ^
,HH^ _
usuarioHH` g
,HHg h
fechaActualHHi t
)HHt u
)HHu v
;HHv w
ifJJ 
(JJ #
datosSupervisionUsuarioJJ +
.JJ+ ,
CantidadEmailJJ, 9
(JJ9 :
usuarioJJ: A
.JJA B
CorreoElectronicoJJB S
)JJS T
==JJU W
$numJJX Y
)JJY Z
{KK #
datosSupervisionUsuarioMM +
.MM+ ,
CrearMM, 1
(MM1 2
newMM2 5
SupervisionUsuarioMM6 H
(MMH I
JWTokenMMI P
,MMP Q
datosMMR W
.MMW X
RolMMX [
,MM[ \
usuarioMM] d
.MMd e
CorreoElectronicoMMe v
,MMv w
fechaActual	MMx É
)
MMÉ Ñ
)
MMÑ Ö
;
MMÖ Ü
returnOO 
newOO 
{OO  

nuevoLoginOO! +
=OO, -
trueOO. 2
,OO2 3
tokenOO4 9
=OO: ;
JWTokenOO< C
}OOD E
;OOE F
}QQ #
datosSupervisionUsuarioSS '
.SS' (
EliminarSS( 0
(SS0 1#
datosSupervisionUsuarioSS1 H
.SSH I
LeerSSI M
(SSM N
usuarioSSN U
.SSU V
CorreoElectronicoSSV g
)SSg h
)SSh i
;SSi j#
datosSupervisionUsuarioUU '
.UU' (
CrearUU( -
(UU- .
newUU. 1
SupervisionUsuarioUU2 D
(UUD E
JWTokenUUE L
,UUL M
datosUUN S
.UUS T
RolUUT W
,UUW X
usuarioUUY `
.UU` a
CorreoElectronicoUUa r
,UUr s
fechaActualUUt 
)	UU Ä
)
UUÄ Å
;
UUÅ Ç
returnWW 
newWW 
{WW 

nuevoLoginWW '
=WW( )
falseWW* /
,WW/ 0
tokenWW1 6
=WW7 8
JWTokenWW9 @
}WWA B
;WWB C
}YY 
elseZZ 
throw[[ 
new[[ 
BadRequestException[[ -
([[- .
$str[[. W
)[[W X
;[[X Y
}]] 	
public`` 
void`` 
CerrarSesion``  
(``  !
string``! '
email``( -
)``- .
{aa 	
varcc 
datoscc 
=cc #
datosSupervisionUsuariocc /
.cc/ 0
Leercc0 4
(cc4 5
emailcc5 :
)cc: ;
;cc; <
ifee 
(ee 
datosee 
!=ee 
nullee 
)ee #
datosSupervisionUsuarioff '
.ff' (
Eliminarff( 0
(ff0 1
datosff1 6
)ff6 7
;ff7 8
elsegg 
throwhh 
newhh 
BadRequestExceptionhh -
(hh- .
$strhh. _
)hh_ `
;hh` a
}jj 	
privatemm 
JwtSecurityTokenmm  

GenerarJWTmm! +
(mm+ ,
stringmm, 2
rolmm3 6
,mm6 7
Usuariomm8 ?
usuariomm@ G
,mmG H
DateTimemmI Q
fechaActualmmR ]
)mm] ^
{nn 	 
SymmetricSecurityKeypp  
IssuerSigninKeypp! 0
=pp1 2
newpp3 6 
SymmetricSecurityKeypp7 K
(ppK L
EncodingppL T
.ppT U
UTF8ppU Y
.ppY Z
GetBytesppZ b
(ppb c
Configurationppc p
[ppp q
$str	ppq Ç
]
ppÇ É
)
ppÉ Ñ
)
ppÑ Ö
;
ppÖ Ü
varrr 
claimsrr 
=rr 
newrr 
Listrr !
<rr! "
Claimrr" '
>rr' (
{rr) *
newss 
Claimss 
(ss 
$strss  
,ss  !
usuarioss" )
.ss) *
Hashss* .
)ss. /
,ss/ 0
newtt 
Claimtt 
(tt 
$strtt 
,tt  
roltt! $
)tt$ %
,tt% &
newuu 
Claimuu 
(uu 
$struu "
,uu" #
usuariouu$ +
.uu+ ,
Nombreuu, 2
)uu2 3
,uu3 4
newvv 
Claimvv 
(vv 
$strvv &
,vv& '
usuariovv( /
.vv/ 0

Verificadovv0 :
.vv: ;
ToStringvv; C
(vvC D
)vvD E
)vvE F
,vvF G
newww 
Claimww 
(ww 
$strww !
,ww! "
usuarioww# *
.ww* +
CorreoElectronicoww+ <
)ww< =
,ww= >
newxx 
Claimxx 
(xx 
$strxx !
,xx! "
usuarioxx# *
.xx* +
Iconoxx+ 0
)xx0 1
}yy 
;yy 
if{{ 
({{ 
rol{{ 
.{{ 
Equals{{ 
({{ 
$str{{ &
){{& '
){{' (
claims{{) /
.{{/ 0
Add{{0 3
({{3 4
new{{4 7
Claim{{8 =
({{= >
$str{{> J
,{{J K
new{{L O

DProveedor{{P Z
({{Z [
	DbContext{{[ d
){{d e
.{{e f
LeerHabilitado{{f t
({{t u
usuario{{u |
.{{| }
Hash	{{} Å
,
{{Å Ç
usuario
{{É ä
.
{{ä ã
CorreoElectronico
{{ã ú
)
{{ú ù
.
{{ù û
ToString
{{û ¶
(
{{¶ ß
)
{{ß ®
)
{{® ©
)
{{© ™
;
{{™ ´
return}} 
new}} 
JwtSecurityToken}} '
(}}' (
issuer~~ 
:~~ 
Configuration~~ %
[~~% &
$str~~& 2
]~~2 3
,~~3 4
audience 
: 
Configuration '
[' (
$str( 6
]6 7
,7 8
claims
ÄÄ 
:
ÄÄ 
claims
ÄÄ 
,
ÄÄ 
expires
ÅÅ 
:
ÅÅ 
new
ÅÅ 
DateTime
ÅÅ %
(
ÅÅ% &
fechaActual
ÅÅ& 1
.
ÅÅ1 2
Year
ÅÅ2 6
,
ÅÅ6 7
fechaActual
ÅÅ8 C
.
ÅÅC D
Month
ÅÅD I
,
ÅÅI J
fechaActual
ÅÅK V
.
ÅÅV W
Day
ÅÅW Z
,
ÅÅZ [
$num
ÅÅ\ ^
,
ÅÅ^ _
$num
ÅÅ` b
,
ÅÅb c
$num
ÅÅd f
,
ÅÅf g
$num
ÅÅh k
)
ÅÅk l
.
ÅÅl m
AddDays
ÅÅm t
(
ÅÅt u
$num
ÅÅu w
)
ÅÅw x
,
ÅÅx y
	notBefore
ÇÇ 
:
ÇÇ 
fechaActual
ÇÇ &
,
ÇÇ& ' 
signingCredentials
ÉÉ "
:
ÉÉ" #
new
ÉÉ$ ' 
SigningCredentials
ÉÉ( :
(
ÉÉ: ;
IssuerSigninKey
ÉÉ; J
,
ÉÉJ K 
SecurityAlgorithms
ÉÉL ^
.
ÉÉ^ _

HmacSha256
ÉÉ_ i
)
ÉÉi j
)
ÑÑ 
;
ÑÑ 
}
ÜÜ 	
}
àà 
}ââ €
ÉC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Usuarios\Interfaz\ISAdministrador.cs
	namespace 	
	Servicios
 
. 
Usuarios 
. 
Interfaz %
{ 
public 

	interface 
ISAdministrador $
:% &
	ISUsuario' 0
<0 1
Administrador1 >
>> ?
{		 
} 
} ¢
ÅC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Usuarios\Interfaz\ISPreRegistro.cs
	namespace 	
	Servicios
 
. 
Usuarios 
. 
Interfaz %
{ 
public 

	interface 
ISPreRegistro "
{		 
public 
Task 
ReenviarCodigo "
(" #
string# )
email* /
)/ 0
;0 1
public 
void 
ValidarCodigo !
(! "
string" (
hash) -
)- .
;. /
} 
} ≤
C:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Usuarios\Interfaz\ISProveedor.cs
	namespace 	
	Servicios
 
. 
Usuarios 
. 
Interfaz %
{ 
public 

	interface 
ISProveedor  
:! "
	ISUsuario# ,
<, -
	Proveedor- 6
>6 7
{ 
public 
object 
ActualizarIcono %
(% &
	IFormFile& /
imagen0 6
,6 7
string8 >
hash? C
,C D
stringE K
emailL Q
)Q R
;R S
public 
void 
ActualizarEstado $
($ %
string% +
hash, 0
)0 1
;1 2
public 
Paginado 
< 
	Proveedor !
>! " 
LeerEstadoHabilitado# 7
(7 8
short8 =
pagina> D
,D E
shortF K
cantidadL T
,T U
boolV Z
estado[ a
)a b
;b c
public   
Paginado   
<   
	Proveedor   !
>  ! "
Leer  # '
(  ' (
BusquedaProveedor  ( 9

parametros  : D
,  D E
short  F K
pagina  L R
,  R S
short  T Y
cantidad  Z b
)  b c
;  c d
public## 
Task## 
<## 
bool## 
>## 

ValidarNit## $
(##$ %
string##% +
nit##, /
)##/ 0
;##0 1
}%% 
}&& »
}C:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Usuarios\Interfaz\ISTurista.cs
	namespace 	
	Servicios
 
. 
Usuarios 
. 
Interfaz %
{ 
public 

	interface 
	ISTurista 
:  
	ISUsuario! *
<* +
Turista+ 2
>2 3
{		 
} 
} ÿ
}C:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Usuarios\Interfaz\ISUsuario.cs
	namespace 	
	Servicios
 
. 
Usuarios 
. 
Interfaz %
{ 
public		 

	interface		 
	ISUsuario		 
<		 
T		  
>		  !
where		" '
T		( )
:		* +
Usuario		, 3
{

 
public 
Task 
Crear 
( 
T 
usuario #
)# $
;$ %
public 
T 
Leer 
( 
string 
hash !
)! "
;" #
public 
object %
ActualizarDatosPersonales /
(/ 0
T0 1
usuario2 9
)9 :
;: ;
public 
Task 
< 
bool 
> 
ValidarEmail &
(& '
string' -
email. 3
)3 4
;4 5
} 
} ¸%
yC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Usuarios\SAdministrador.cs
	namespace 	
	Servicios
 
. 
Usuarios 
{ 
public 

class 
SAdministrador 
:  !
SUsuario" *
<* +
Administrador+ 8
>8 9
,9 :
ISAdministrador; J
{ 
private 
DAdministrador 
datosAdministrador 1
{2 3
get4 7
;7 8
}9 :
public 
SAdministrador 
( 
PostgreSQLContext /
_context0 8
)8 9
:: ;
base< @
(@ A
_contextA I
)I J
{ 	
datosAdministrador 
=  
new! $
DAdministrador% 3
(3 4
_context4 <
)< =
;= >
} 	
public 
SAdministrador 
( 
PostgreSQLContext /
_context0 8
,8 9
IConfiguration: H
_configurationI W
)W X
:Y Z
base[ _
(_ `
_context` h
,h i
_configurationj x
)x y
{ 	
datosAdministrador 
=  
new! $
DAdministrador% 3
(3 4
_context4 <
)< =
;= >
} 	
public$$ 
override$$ 
async$$ 
Task$$ "
Crear$$# (
($$( )
Administrador$$) 6
administrador$$7 D
)$$D E
{%% 	
datosAdministrador&& 
.&& 
Crear&& $
(&&$ %
administrador&&% 2
)&&2 3
;&&3 4
}'' 	
public** 
override** 
Administrador** %
Leer**& *
(*** +
string**+ 1
hash**2 6
)**6 7
{++ 	
Administrador-- 
administrador-- '
=--( )
datosAdministrador--* <
.--< =
LeerHash--= E
(--E F
hash--F J
)--J K
;--K L
if// 
(// 
administrador// 
!=//  
null//! %
)//% &
{00 
administrador22 
.22 
Clave22 #
=22$ %
null22& *
;22* +
return44 
administrador44 $
;44$ %
}66 
throw88 
new88 
NotFoundException88 '
(88' (
$str88( I
)88I J
;88J K
}:: 	
public== 
override== 
object== %
ActualizarDatosPersonales== 8
(==8 9
Administrador==9 F
administrador==G T
)==T U
{>> 	
Administrador@@ 
usuario@@ !
=@@" #
datosAdministrador@@$ 6
.@@6 7
LeerAuth@@7 ?
(@@? @
administrador@@@ M
.@@M N
Hash@@N R
,@@R S
administrador@@T a
.@@a b
CorreoElectronico@@b s
)@@s t
;@@t u
ifBB 
(BB 
usuarioBB 
!=BB 
nullBB 
)BB  
{CC 
administradorEE 
.EE 
IdEE  
=EE! "
usuarioEE# *
.EE* +
IdEE+ -
;EE- .
administradorFF 
.FF 
ClaveFF #
=FF$ %
usuarioFF& -
.FF- .
ClaveFF. 3
;FF3 4
administradorGG 
.GG 

VerificadoGG (
=GG) *
usuarioGG+ 2
.GG2 3

VerificadoGG3 =
;GG= >
datosAdministradorII "
.II" #

ActualizarII# -
(II- .
administradorII. ;
,II; <
usuarioII= D
)IID E
;IIE F
LoginKK 
datosKK 
=KK 
newKK !
LoginKK" '
(KK' (
)KK( )
{LL 
ClaveMM 
=MM 
usuarioMM #
.MM# $
ClaveMM$ )
,MM) *
EmailNN 
=NN 
usuarioNN #
.NN# $
CorreoElectronicoNN$ 5
,NN5 6
RolOO 
=OO 
$strOO )
}PP 
;PP 
returnRR 
newRR 

SSeguridadRR %
(RR% &
	DbContextRR& /
,RR/ 0
ConfigurationRR1 >
)RR> ?
.RR? @
IniciarSesionRR@ M
(RRM N
datosRRN S
,RRS T
falseRRU Z
)RRZ [
;RR[ \
}TT 
throwVV 
newVV 
BadRequestExceptionVV )
(VV) *
$strVV* q
)VVq r
;VVr s
}XX 	
}ZZ 
}[[ ‹/
wC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Usuarios\SPreRegistro.cs
	namespace 	
	Servicios
 
. 
Usuarios 
{ 
public 

class 
SPreRegistro 
: 
	SGenerica  )
,) *
ISPreRegistro+ 8
{ 
private 
DPreRegistro 
datosPreRegistro -
{. /
get0 3
;3 4
}5 6
public 
SPreRegistro 
( 
PostgreSQLContext -
_context. 6
)6 7
:8 9
base: >
(> ?
_context? G
)G H
{ 	
datosPreRegistro 
= 
new "
DPreRegistro# /
(/ 0
_context0 8
)8 9
;9 :
} 	
public 
SPreRegistro 
( 
PostgreSQLContext -
_context. 6
,6 7
IConfiguration8 F
_configurationG U
)U V
:W X
baseY ]
(] ^
_context^ f
,f g
_configurationh v
)v w
{ 	
datosPreRegistro 
= 
new "
DPreRegistro# /
(/ 0
_context0 8
)8 9
;9 :
} 	
public$$ 
async$$ 
Task$$ 
ReenviarCodigo$$ (
($$( )
string$$) /
email$$0 5
)$$5 6
{%% 	
PreRegistro'' 
registro''  
=''! "
datosPreRegistro''# 3
.''3 4
Leer''4 8
(''8 9
email''9 >
)''> ?
;''? @
if)) 
()) 
registro)) 
!=)) 
null))  
)))  !
{** 
Usuario,, 
usuario,, 
;,,  
switch.. 
(.. 
registro..  
...  !
Rol..! $
)..$ %
{// 
case11 
$str11 "
:11" #
usuario22 
=22  !
new22" %
DTurista22& .
(22. /
	DbContext22/ 8
)228 9
.229 :
Leer22: >
(22> ?
email22? D
)22D E
;22E F
break33 
;33 
case55 
$str55 $
:55$ %
usuario66 
=66  !
new66" %

DProveedor66& 0
(660 1
	DbContext661 :
)66: ;
.66; <
Leer66< @
(66@ A
email66A F
)66F G
;66G H
break77 
;77 
default99 
:99 
usuario:: 
=::  !
null::" &
;::& '
break;; 
;;; 
}== 
if?? 
(?? 
usuario?? 
!=?? 
null?? #
)??# $
await@@ 
new@@ 
SSMTP@@ #
(@@# $
Configuration@@$ 1
)@@1 2
.@@2 3"
EnviarHashVerificacion@@3 I
(@@I J
usuario@@J Q
)@@Q R
;@@R S
elseAA 
throwBB 
newBB 
NotFoundExceptionBB /
(BB/ 0
$str	BB0 ù
)
BBù û
;
BBû ü
}DD 
elseEE 
throwEE 
newEE 
NotFoundExceptionEE ,
(EE, -
$str	EE- ö
)
EEö õ
;
EEõ ú
}GG 	
publicJJ 
voidJJ 
ValidarCodigoJJ !
(JJ! "
stringJJ" (
hashJJ) -
)JJ- .
{KK 	
PreRegistroMM 
preRegistroMM #
=MM$ %
datosPreRegistroMM& 6
.MM6 7
LeerHashMM7 ?
(MM? @
hashMM@ D
)MMD E
;MME F
ifOO 
(OO 
preRegistroOO 
!=OO 
nullOO #
)OO# $
{PP 
switchRR 
(RR 
preRegistroRR #
.RR# $
RolRR$ '
)RR' (
{SS 
caseUU 
$strUU "
:UU" #
DTuristaVV  
datosTuristaVV! -
=VV. /
newVV0 3
DTuristaVV4 <
(VV< =
	DbContextVV= F
)VVF G
;VVG H
TuristaWW 
turistaWW  '
=WW( )
datosTuristaWW* 6
.WW6 7
LeerWW7 ;
(WW; <
preRegistroWW< G
.WWG H
CorreoElectronicoWWH Y
)WWY Z
;WWZ [
turistaXX 
.XX  

VerificadoXX  *
=XX+ ,
trueXX- 1
;XX1 2
datosTuristaYY $
.YY$ %

ActualizarYY% /
(YY/ 0
turistaYY0 7
)YY7 8
;YY8 9
breakZZ 
;ZZ 
case\\ 
$str\\ $
:\\$ %

DProveedor]] "
datosProveedor]]# 1
=]]2 3
new]]4 7

DProveedor]]8 B
(]]B C
	DbContext]]C L
)]]L M
;]]M N
	Proveedor^^ !
	proveedor^^" +
=^^, -
datosProveedor^^. <
.^^< =
Leer^^= A
(^^A B
preRegistro^^B M
.^^M N
CorreoElectronico^^N _
)^^_ `
;^^` a
	proveedor__ !
.__! "

Verificado__" ,
=__- .
true__/ 3
;__3 4
datosProveedor`` &
.``& '

Actualizar``' 1
(``1 2
	proveedor``2 ;
)``; <
;``< =
breakaa 
;aa 
defaultcc 
:cc 
throwdd 
newdd !
NotFoundExceptiondd" 3
(dd3 4
$str	dd4 ò
)
ddò ô
;
ddô ö
}ff 
datosPreRegistrohh  
.hh  !
Eliminarhh! )
(hh) *
preRegistrohh* 5
)hh5 6
;hh6 7
}jj 
elsekk 
throwll 
newll 
NotFoundExceptionll +
(ll+ ,
$str	ll, ê
)
llê ë
;
llë í
}nn 	
}pp 
}qq œë
uC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Usuarios\SProveedor.cs
	namespace 	
	Servicios
 
. 
Usuarios 
{ 
public 

class 

SProveedor 
: 
SUsuario &
<& '
	Proveedor' 0
>0 1
,1 2
ISProveedor3 >
{ 
private 

DProveedor 
DatosProveedor )
{* +
get, /
;/ 0
}1 2
private 
IWebHostEnvironment #
HostEnvironment$ 3
{4 5
get6 9
;9 :
}; <
public 

SProveedor 
( 
PostgreSQLContext +
_context, 4
)4 5
:6 7
base8 <
(< =
_context= E
)E F
{ 	
DatosProveedor 
= 
new  

DProveedor! +
(+ ,
_context, 4
)4 5
;5 6
}   	
public"" 

SProveedor"" 
("" 
PostgreSQLContext"" +
_context"", 4
,""4 5
IConfiguration""6 D
_configuration""E S
)""S T
:""U V
base""W [
(""[ \
_context""\ d
,""d e
_configuration""f t
)""t u
{## 	
DatosProveedor$$ 
=$$ 
new$$  

DProveedor$$! +
($$+ ,
_context$$, 4
)$$4 5
;$$5 6
}%% 	
public'' 

SProveedor'' 
('' 
PostgreSQLContext'' +
_context'', 4
,''4 5
IConfiguration''6 D
_configuration''E S
,''S T
IWebHostEnvironment''U h
_hostEnvironment''i y
)''y z
:''{ |
base	''} Å
(
''Å Ç
_context
''Ç ä
,
''ä ã
_configuration
''å ö
)
''ö õ
{(( 	
DatosProveedor)) 
=)) 
new))  

DProveedor))! +
())+ ,
_context)), 4
)))4 5
;))5 6
HostEnvironment** 
=** 
_hostEnvironment** .
;**. /
}++ 	
public00 
override00 
async00 
Task00 "
Crear00# (
(00( )
	Proveedor00) 2
	proveedor003 <
)00< =
{11 	
await33 
ValidarDatosUnicos33 $
(33$ %
	proveedor33% .
)33. /
;33/ 0
	proveedor55 
.55 

Verificado55  
=55! "
false55# (
;55( )
	proveedor66 
.66 

Habilitado66  
=66! "
true66# '
;66' (
	proveedor77 
.77 
Icono77 
=77 
$str77 ,
;77, -
	proveedor88 
.88 
Hash88 
=88 
GenerarHash88 (
(88( )
	proveedor88) 2
)882 3
;883 4
	proveedor99 
.99 
Clave99 
=99 
EncriptarClave99 ,
(99, -
	proveedor99- 6
.996 7
Clave997 <
)99< =
;99= >
	proveedor:: 
=:: 
DatosProveedor:: &
.::& '
Crear::' ,
(::, -
	proveedor::- 6
)::6 7
;::7 8
new<< 
DPreRegistro<< 
(<< 
	DbContext<< &
)<<& '
.<<' (
Crear<<( -
(<<- .
new<<. 1
PreRegistro<<2 =
(<<= >
	proveedor<<> G
.<<G H
CorreoElectronico<<H Y
,<<Y Z
	proveedor<<[ d
.<<d e
Hash<<e i
,<<i j
$str<<k v
)<<v w
)<<w x
;<<x y
await>> 
new>> 
SSMTP>> 
(>> 
Configuration>> )
)>>) *
.>>* +"
EnviarHashVerificacion>>+ A
(>>A B
	proveedor>>B K
)>>K L
;>>L M
}@@ 	
publicCC 
overrideCC 
	ProveedorCC !
LeerCC" &
(CC& '
stringCC' -
hashCC. 2
)CC2 3
{DD 	
	ProveedorFF 
	proveedorFF 
=FF  !
DatosProveedorFF" 0
.FF0 1
LeerHashFF1 9
(FF9 :
hashFF: >
)FF> ?
;FF? @
ifHH 
(HH 
	proveedorHH 
!=HH 
nullHH !
)HH! "
{II 
	proveedorKK 
.KK 
ClaveKK 
=KK  !
nullKK" &
;KK& '
returnMM 
	proveedorMM  
;MM  !
}OO 
throwQQ 
newQQ 
NotFoundExceptionQQ '
(QQ' (
$strQQ( E
)QQE F
;QQF G
}SS 	
publicVV 
PaginadoVV 
<VV 
	ProveedorVV !
>VV! " 
LeerEstadoHabilitadoVV# 7
(VV7 8
shortVV8 =
paginaVV> D
,VVD E
shortVVF K
cantidadVVL T
,VVT U
boolVVV Z
estadoVV[ a
)VVa b
{WW 	
ListYY 
<YY 
	ProveedorYY 
>YY 
listaProveedoresYY ,
=YY- .
DatosProveedorYY/ =
.YY= > 
LeerEstadoHabilitadoYY> R
(YYR S
paginaYYS Y
,YYY Z
cantidadYY[ c
,YYc d
estadoYYe k
)YYk l
;YYl m
if[[ 
([[ 
listaProveedores[[  
.[[  !
Count[[! &
>[[' (
$num[[) *
)[[* +
{\\ 
Paginado^^ 
<^^ 
	Proveedor^^ "
>^^" #
paginado^^$ ,
=^^- .
new^^/ 2
Paginado^^3 ;
<^^; <
	Proveedor^^< E
>^^E F
(^^F G
)^^G H
{__ 
	Contenido`` 
=`` 
listaProveedores``  0
,``0 1
PaginaActualaa  
=aa! "
paginaaa# )
,aa) *

TotalItemsbb 
=bb  
DatosProveedorbb! /
.bb/ 0$
CantidadEstadoHabilitadobb0 H
(bbH I
estadobbI O
)bbO P
}cc 
;cc 
paginadoee 
.ee 
TotalPaginasee %
=ee& '
Mathee( ,
.ee, -
Ceilingee- 4
(ee4 5
(ee5 6
decimalee6 =
)ee= >
(ee> ?
paginadoee? G
.eeG H

TotalItemseeH R
/eeS T
cantidadeeU ]
)ee] ^
)ee^ _
;ee_ `
returngg 
paginadogg 
;gg  
}ii 
elsejj 
throwjj 
newjj 
NoContentExceptionjj -
(jj- .
$strjj. B
)jjB C
;jjC D
}ll 	
publicuu 
Paginadouu 
<uu 
	Proveedoruu !
>uu! "
Leeruu# '
(uu' (
BusquedaProveedoruu( 9

parametrosuu: D
,uuD E
shortuuF K
paginauuL R
,uuR S
shortuuT Y
cantidaduuZ b
)uub c
{vv 	
Listxx 
<xx 
	Proveedorxx 
>xx 
listaProveedoresxx ,
=xx- .
DatosProveedorxx/ =
.xx= >
Leerxx> B
(xxB C

parametrosxxC M
,xxM N
paginaxxO U
,xxU V
cantidadxxW _
)xx_ `
;xx` a
if{{ 
({{ 
listaProveedores{{  
.{{  !
Count{{! &
=={{' )
$num{{* +
){{+ ,
throw|| 
new|| 
NoContentException|| ,
(||, -
$str||- L
)||L M
;||M N
listaProveedores 
. 
ForEach $
($ %
x% &
=>' )
{* +
x
ÄÄ 
.
ÄÄ 
Clave
ÄÄ 
=
ÄÄ 
null
ÄÄ 
;
ÄÄ 
x
ÅÅ 
.
ÅÅ 
Hash
ÅÅ 
=
ÅÅ 
null
ÅÅ 
;
ÅÅ 
}
ÇÇ 
)
ÇÇ 
;
ÇÇ 
Paginado
ÖÖ 
<
ÖÖ 
	Proveedor
ÖÖ 
>
ÖÖ 
paginado
ÖÖ  (
=
ÖÖ) *
new
ÖÖ+ .
(
ÖÖ. /
)
ÖÖ/ 0
{
ÜÜ 
	Contenido
áá 
=
áá 
listaProveedores
áá ,
,
áá, -
PaginaActual
àà 
=
àà 
(
àà  
short
àà  %
)
àà% &
(
àà' (
pagina
àà( .
+
àà/ 0
$num
àà1 2
)
àà2 3
,
àà3 4

TotalItems
ââ 
=
ââ 
DatosProveedor
ââ +
.
ââ+ ,
Cantidad
ââ, 4
(
ââ4 5

parametros
ââ5 ?
)
ââ? @
}
ää 
;
ää 
paginado
åå 
.
åå 
TotalPaginas
åå !
=
åå" #
Math
åå$ (
.
åå( )
Ceiling
åå) 0
(
åå0 1
(
åå1 2
decimal
åå2 9
)
åå9 :
(
åå; <
(
åå< =
double
åå= C
)
ååC D
paginado
ååE M
.
ååM N

TotalItems
ååN X
/
ååY Z
(
åå[ \
double
åå\ b
)
ååb c
cantidad
ååd l
)
åål m
)
ååm n
;
åån o
return
éé 
paginado
éé 
;
éé 
}
êê 	
public
ìì 
override
ìì 
object
ìì '
ActualizarDatosPersonales
ìì 8
(
ìì8 9
	Proveedor
ìì9 B
	proveedor
ììC L
)
ììL M
{
îî 	
	Proveedor
ññ 
usuario
ññ 
=
ññ 
DatosProveedor
ññ  .
.
ññ. /
LeerAuth
ññ/ 7
(
ññ7 8
	proveedor
ññ8 A
.
ññA B
Hash
ññB F
,
ññF G
	proveedor
ññH Q
.
ññQ R
CorreoElectronico
ññR c
)
ññc d
;
ññd e
if
òò 
(
òò 
usuario
òò 
!=
òò 
null
òò 
)
òò  
{
ôô 
	proveedor
õõ 
.
õõ 
Id
õõ 
=
õõ 
usuario
õõ &
.
õõ& '
Id
õõ' )
;
õõ) *
	proveedor
úú 
.
úú 
Nit
úú 
=
úú 
usuario
úú  '
.
úú' (
Nit
úú( +
;
úú+ ,
	proveedor
ùù 
.
ùù 
Clave
ùù 
=
ùù  !
usuario
ùù" )
.
ùù) *
Clave
ùù* /
;
ùù/ 0
	proveedor
ûû 
.
ûû 
Icono
ûû 
=
ûû  !
usuario
ûû" )
.
ûû) *
Icono
ûû* /
;
ûû/ 0
	proveedor
üü 
.
üü 

Verificado
üü $
=
üü% &
usuario
üü' .
.
üü. /

Verificado
üü/ 9
;
üü9 :
	proveedor
†† 
.
†† 

Habilitado
†† $
=
††% &
usuario
††' .
.
††. /

Habilitado
††/ 9
;
††9 :
DatosProveedor
¢¢ 
.
¢¢ 

Actualizar
¢¢ )
(
¢¢) *
	proveedor
¢¢* 3
,
¢¢3 4
usuario
¢¢5 <
)
¢¢< =
;
¢¢= >
Login
§§ 
datos
§§ 
=
§§ 
new
§§ !
Login
§§" '
(
§§' (
)
§§( )
{
•• 
Clave
¶¶ 
=
¶¶ 
usuario
¶¶ #
.
¶¶# $
Clave
¶¶$ )
,
¶¶) *
Nit
ßß 
=
ßß 
usuario
ßß !
.
ßß! "
Nit
ßß" %
,
ßß% &
Rol
®® 
=
®® 
$str
®® %
}
©© 
;
©© 
return
´´ 
new
´´ 

SSeguridad
´´ %
(
´´% &
	DbContext
´´& /
,
´´/ 0
Configuration
´´1 >
)
´´> ?
.
´´? @
IniciarSesion
´´@ M
(
´´M N
datos
´´N S
,
´´S T
false
´´U Z
)
´´Z [
;
´´[ \
}
≠≠ 
throw
ØØ 
new
ØØ !
BadRequestException
ØØ )
(
ØØ) *
$str
ØØ* q
)
ØØq r
;
ØØr s
}
±± 	
public
¥¥ 
object
¥¥ 
ActualizarIcono
¥¥ %
(
¥¥% &
	IFormFile
¥¥& /
imagen
¥¥0 6
,
¥¥6 7
string
¥¥8 >
hash
¥¥? C
,
¥¥C D
string
¥¥E K
email
¥¥L Q
)
¥¥Q R
{
µµ 	
	Proveedor
∑∑ 
	proveedor
∑∑ 
=
∑∑  !
DatosProveedor
∑∑" 0
.
∑∑0 1
LeerAuth
∑∑1 9
(
∑∑9 :
hash
∑∑: >
,
∑∑> ?
email
∑∑@ E
)
∑∑E F
;
∑∑F G
if
ππ 
(
ππ 
	proveedor
ππ 
!=
ππ 
null
ππ !
)
ππ! "
{
∫∫ 
Imagen
ºº 
datosImagen
ºº "
=
ºº# $
new
ºº% (
Imagen
ºº) /
(
ºº/ 0
)
ºº0 1
{
ΩΩ 
	Direccion
ææ 
=
ææ 
	proveedor
ææ  )
.
ææ) *
Icono
ææ* /
,
ææ/ 0
Tipo
øø 
=
øø 
$str
øø &
}
¿¿ 
;
¿¿ 
SImagen
¬¬ 
serviciosImagen
¬¬ '
=
¬¬( )
new
¬¬* -
SImagen
¬¬. 5
(
¬¬5 6
HostEnvironment
¬¬6 E
)
¬¬E F
;
¬¬F G
if
ƒƒ 
(
ƒƒ 
!
ƒƒ 
datosImagen
ƒƒ  
.
ƒƒ  !
	Direccion
ƒƒ! *
.
ƒƒ* +
Equals
ƒƒ+ 1
(
ƒƒ1 2
$str
ƒƒ2 @
)
ƒƒ@ A
)
ƒƒA B
serviciosImagen
ƒƒC R
.
ƒƒR S
Eliminar
ƒƒS [
(
ƒƒ[ \
datosImagen
ƒƒ\ g
)
ƒƒg h
;
ƒƒh i
	proveedor
∆∆ 
.
∆∆ 
Icono
∆∆ 
=
∆∆  !
serviciosImagen
∆∆" 1
.
∆∆1 2
Cargar
∆∆2 8
(
∆∆8 9
	proveedor
∆∆9 B
,
∆∆B C
datosImagen
∆∆D O
,
∆∆O P
imagen
∆∆Q W
)
∆∆W X
;
∆∆X Y
DatosProveedor
»» 
.
»» 

Actualizar
»» )
(
»») *
	proveedor
»»* 3
)
»»3 4
;
»»4 5
Login
   
datos
   
=
   
new
   !
Login
  " '
(
  ' (
)
  ( )
{
ÀÀ 
Clave
ÃÃ 
=
ÃÃ 
	proveedor
ÃÃ %
.
ÃÃ% &
Clave
ÃÃ& +
,
ÃÃ+ ,
Nit
ÕÕ 
=
ÕÕ 
	proveedor
ÕÕ #
.
ÕÕ# $
Nit
ÕÕ$ '
,
ÕÕ' (
Rol
ŒŒ 
=
ŒŒ 
$str
ŒŒ %
}
œœ 
;
œœ 
return
—— 
new
—— 

SSeguridad
—— %
(
——% &
	DbContext
——& /
,
——/ 0
Configuration
——1 >
)
——> ?
.
——? @
IniciarSesion
——@ M
(
——M N
datos
——N S
,
——S T
false
——U Z
)
——Z [
;
——[ \
}
”” 
else
‘‘ 
throw
’’ 
new
’’ 
NotFoundException
’’ +
(
’’+ ,
$str
’’, I
)
’’I J
;
’’J K
}
◊◊ 	
public
⁄⁄ 
void
⁄⁄ 
ActualizarEstado
⁄⁄ $
(
⁄⁄$ %
string
⁄⁄% +
hash
⁄⁄, 0
)
⁄⁄0 1
{
€€ 	
	Proveedor
›› 
	proveedor
›› 
=
››  !
DatosProveedor
››" 0
.
››0 1
LeerHash
››1 9
(
››9 :
hash
››: >
)
››> ?
;
››? @
if
ﬂﬂ 
(
ﬂﬂ 
	proveedor
ﬂﬂ 
!=
ﬂﬂ 
null
ﬂﬂ !
)
ﬂﬂ! "
{
‡‡ 
	proveedor
·· 
.
·· 

Habilitado
·· $
=
··% &
!
··' (
	proveedor
··( 1
.
··1 2

Habilitado
··2 <
;
··< =
DatosProveedor
‚‚ 
.
‚‚ 

Actualizar
‚‚ )
(
‚‚) *
	proveedor
‚‚* 3
)
‚‚3 4
;
‚‚4 5
}
„„ 
else
‰‰ 
throw
‰‰ 
new
‰‰ 
NotFoundException
‰‰ ,
(
‰‰, -
$str
‰‰- J
)
‰‰J K
;
‰‰K L
}
ÊÊ 	
private
ÈÈ 
async
ÈÈ 
Task
ÈÈ  
ValidarDatosUnicos
ÈÈ -
(
ÈÈ- .
	Proveedor
ÈÈ. 7
	proveedor
ÈÈ8 A
)
ÈÈA B
{
ÍÍ 	
bool
ÏÏ 
nitIncorrecto
ÏÏ 
=
ÏÏ  
await
ÏÏ! &

ValidarNit
ÏÏ' 1
(
ÏÏ1 2
	proveedor
ÏÏ2 ;
.
ÏÏ; <
Nit
ÏÏ< ?
)
ÏÏ? @
;
ÏÏ@ A
bool
ÌÌ 
emailIncorrecto
ÌÌ  
=
ÌÌ! "
await
ÌÌ# (
ValidarEmail
ÌÌ) 5
(
ÌÌ5 6
	proveedor
ÌÌ6 ?
.
ÌÌ? @
CorreoElectronico
ÌÌ@ Q
)
ÌÌQ R
;
ÌÌR S
if
ÔÔ 
(
ÔÔ 
nitIncorrecto
ÔÔ 
==
ÔÔ  
true
ÔÔ! %
&&
ÔÔ& (
emailIncorrecto
ÔÔ) 8
==
ÔÔ9 ;
true
ÔÔ< @
)
ÔÔ@ A
throw
ÔÔB G
new
ÔÔH K!
IntegridadException
ÔÔL _
(
ÔÔ_ `
$strÔÔ` ê
)ÔÔê ë
;ÔÔë í
if
ÒÒ 
(
ÒÒ 
nitIncorrecto
ÒÒ 
==
ÒÒ  
true
ÒÒ! %
)
ÒÒ% &
throw
ÒÒ' ,
new
ÒÒ- 0!
IntegridadException
ÒÒ1 D
(
ÒÒD E
$str
ÒÒE \
)
ÒÒ\ ]
;
ÒÒ] ^
if
ÛÛ 
(
ÛÛ 
emailIncorrecto
ÛÛ 
==
ÛÛ  "
true
ÛÛ# '
)
ÛÛ' (
throw
ÛÛ) .
new
ÛÛ/ 2!
IntegridadException
ÛÛ3 F
(
ÛÛF G
$str
ÛÛG m
)
ÛÛm n
;
ÛÛn o
}
ıı 	
public
¯¯ 
async
¯¯ 
Task
¯¯ 
<
¯¯ 
bool
¯¯ 
>
¯¯ 

ValidarNit
¯¯  *
(
¯¯* +
string
¯¯+ 1
nit
¯¯2 5
)
¯¯5 6
{
˘˘ 	
return
˙˙ 
(
˙˙ 
await
˙˙ 
DatosProveedor
˙˙ (
.
˙˙( )
CantidadNit
˙˙) 4
(
˙˙4 5
nit
˙˙5 8
)
˙˙8 9
==
˙˙: <
$num
˙˙= >
)
˙˙> ?
?
˙˙@ A
false
˙˙B G
:
˙˙H I
true
˙˙J N
;
˙˙N O
}
˚˚ 	
}
˝˝ 
}˛˛ ı3
sC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Usuarios\STurista.cs
	namespace 	
	Servicios
 
. 
Usuarios 
{ 
public 

class 
STurista 
: 
SUsuario $
<$ %
Turista% ,
>, -
,- .
	ISTurista/ 8
{ 
private 
DTurista 
datosTurista %
{& '
get( +
;+ ,
}- .
public 
STurista 
( 
PostgreSQLContext )
_context* 2
)2 3
:4 5
base6 :
(: ;
_context; C
)C D
{ 	
datosTurista 
= 
new 
DTurista '
(' (
_context( 0
)0 1
;1 2
} 	
public 
STurista 
( 
PostgreSQLContext )
_context* 2
,2 3
IConfiguration4 B
_configurationC Q
)Q R
:S T
baseU Y
(Y Z
_contextZ b
,b c
_configurationd r
)r s
{ 	
datosTurista 
= 
new 
DTurista '
(' (
_context( 0
)0 1
;1 2
}   	
public%% 
override%% 
async%% 
Task%% "
Crear%%# (
(%%( )
Turista%%) 0
turista%%1 8
)%%8 9
{&& 	
await(( 
ValidarDatosUnicos(( $
((($ %
turista((% ,
)((, -
;((- .
turista** 
.** 

Verificado** 
=**  
false**! &
;**& '
turista++ 
.++ 
Hash++ 
=++ 
GenerarHash++ &
(++& '
turista++' .
)++. /
;++/ 0
turista,, 
.,, 
Clave,, 
=,, 
EncriptarClave,, *
(,,* +
turista,,+ 2
.,,2 3
Clave,,3 8
),,8 9
;,,9 :
turista-- 
.-- 
Icono-- 
=-- 
$str-- %
+--& '
turista--( /
.--/ 0
Icono--0 5
;--5 6
turista.. 
=.. 
datosTurista.. "
..." #
Crear..# (
(..( )
turista..) 0
)..0 1
;..1 2
new00 
DPreRegistro00 
(00 
	DbContext00 &
)00& '
.00' (
Crear00( -
(00- .
new00. 1
PreRegistro002 =
(00= >
turista00> E
.00E F
CorreoElectronico00F W
,00W X
turista00Y `
.00` a
Hash00a e
,00e f
$str00g p
)00p q
)00q r
;00r s
await22 
new22 
SSMTP22 
(22 
Configuration22 )
)22) *
.22* +"
EnviarHashVerificacion22+ A
(22A B
turista22B I
)22I J
;22J K
}44 	
public77 
override77 
Turista77 
Leer77  $
(77$ %
string77% +
hash77, 0
)770 1
{88 	
Turista:: 
turista:: 
=:: 
datosTurista:: *
.::* +
LeerHash::+ 3
(::3 4
hash::4 8
)::8 9
;::9 :
if<< 
(<< 
turista<< 
!=<< 
null<< 
)<<  
{== 
turista?? 
.?? 
Clave?? 
=?? 
null??  $
;??$ %
returnBB 
turistaBB 
;BB 
}DD 
throwFF 
newFF 
NotFoundExceptionFF '
(FF' (
$strFF( C
)FFC D
;FFD E
}HH 	
publicKK 
overrideKK 
objectKK %
ActualizarDatosPersonalesKK 8
(KK8 9
TuristaKK9 @
turistaKKA H
)KKH I
{LL 	
TuristaNN 
usuarioNN 
=NN 
datosTuristaNN *
.NN* +
LeerAuthNN+ 3
(NN3 4
turistaNN4 ;
.NN; <
HashNN< @
,NN@ A
turistaNNB I
.NNI J
CorreoElectronicoNNJ [
)NN[ \
;NN\ ]
ifPP 
(PP 
usuarioPP 
!=PP 
nullPP 
)PP  
{QQ 
turistaSS 
.SS 
IdSS 
=SS 
usuarioSS $
.SS$ %
IdSS% '
;SS' (
turistaTT 
.TT 
ClaveTT 
=TT 
usuarioTT  '
.TT' (
ClaveTT( -
;TT- .
turistaUU 
.UU 

VerificadoUU "
=UU# $
usuarioUU% ,
.UU, -

VerificadoUU- 7
;UU7 8
datosTuristaWW 
.WW 

ActualizarWW '
(WW' (
turistaWW( /
,WW/ 0
usuarioWW1 8
)WW8 9
;WW9 :
LoginYY 
datosYY 
=YY 
newYY !
LoginYY" '
(YY' (
)YY( )
{ZZ 
Clave[[ 
=[[ 
usuario[[ #
.[[# $
Clave[[$ )
,[[) *
Email\\ 
=\\ 
usuario\\ #
.\\# $
CorreoElectronico\\$ 5
,\\5 6
Rol]] 
=]] 
$str]] #
}^^ 
;^^ 
return`` 
new`` 

SSeguridad`` %
(``% &
	DbContext``& /
,``/ 0
Configuration``1 >
)``> ?
.``? @
IniciarSesion``@ M
(``M N
datos``N S
,``S T
false``U Z
)``Z [
;``[ \
}bb 
throwdd 
newdd 
BadRequestExceptiondd )
(dd) *
$strdd* q
)ddq r
;ddr s
}ff 	
privateii 
asyncii 
Taskii 
ValidarDatosUnicosii -
(ii- .
Turistaii. 5
turistaii6 =
)ii= >
{jj 	
ifkk 
(kk 
awaitkk 
ValidarEmailkk "
(kk" #
turistakk# *
.kk* +
CorreoElectronicokk+ <
)kk< =
==kk> @
truekkA E
)kkE F
throwkkG L
newkkM P
IntegridadExceptionkkQ d
(kkd e
$str	kke ã
)
kkã å
;
kkå ç
}ll 	
}nn 
}oo ‚-
sC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Servicios\Usuarios\SUsuario.cs
	namespace 	
	Servicios
 
. 
Usuarios 
{ 
public 

abstract 
class 
SUsuario "
<" #
T# $
>$ %
:& '
	SGenerica( 1
,1 2
	ISUsuario3 <
<< =
T= >
>> ?
where@ E
TF G
:H I
UsuarioJ Q
{ 
public 
SUsuario 
( 
PostgreSQLContext )
_context* 2
)2 3
:4 5
base6 :
(: ;
_context; C
)C D
{E F
}G H
public 
SUsuario 
( 
PostgreSQLContext )
_context* 2
,2 3
IConfiguration4 B
_configurationC Q
)Q R
:S T
baseU Y
(Y Z
_contextZ b
,b c
_configurationd r
)r s
{t u
}v w
public 
abstract 
Task 
Crear "
(" #
T# $
usuario% ,
), -
;- .
public 
abstract 
T 
Leer 
( 
string %
hash& *
)* +
;+ ,
public   
abstract   
object   %
ActualizarDatosPersonales   8
(  8 9
T  9 :
usuario  ; B
)  B C
;  C D
public$$ 
async$$ 
Task$$ 
<$$ 
bool$$ 
>$$ 
ValidarEmail$$  ,
($$, -
string$$- 3
email$$4 9
)$$9 :
{%% 	
int'' 
	QTuristas'' 
='' 
await'' !
new''" %
DTurista''& .
(''. /
	DbContext''/ 8
)''8 9
.''9 :
CantidadEmail'': G
(''G H
email''H M
)''M N
;''N O
int(( 
QProveedores(( 
=(( 
await(( $
new((% (

DProveedor(() 3
(((3 4
	DbContext((4 =
)((= >
.((> ?
CantidadEmail((? L
(((L M
email((M R
)((R S
;((S T
int)) 
QAdministradores))  
=))! "
await))# (
new))) ,
DAdministrador))- ;
()); <
	DbContext))< E
)))E F
.))F G
CantidadEmail))G T
())T U
email))U Z
)))Z [
;))[ \
if++ 
(++ 
	QTuristas++ 
==++ 
$num++ 
&&++ !
QProveedores++" .
==++/ 1
$num++2 3
&&++4 6
QAdministradores++7 G
==++H J
$num++K L
)++L M
return++N T
false++U Z
;++Z [
else,, 
return,, 
true,, 
;,, 
}.. 	
public11 
string11 
EncriptarClave11 $
(11$ %
string11% +
clave11, 1
)111 2
{22 	
byte44 
[44 
]44 
cadenaEncriptada44 #
=44$ %
Encoding44& .
.44. /
Unicode44/ 6
.446 7
GetBytes447 ?
(44? @
clave44@ E
)44E F
;44F G
return55 
Convert55 
.55 
ToBase64String55 )
(55) *
cadenaEncriptada55* :
)55: ;
;55; <
}77 	
	protected:: 
string:: 
GenerarHash:: $
(::$ %
T::% &
usuario::' .
)::. /
{;; 	
Guid== 
guid== 
=== 
Guid== 
.== 
NewGuid== $
(==$ %
)==% &
;==& '
string>> 

guidString>> 
=>> 
Convert>>  '
.>>' (
ToBase64String>>( 6
(>>6 7
guid>>7 ;
.>>; <
ToByteArray>>< G
(>>G H
)>>H I
)>>I J
;>>J K

guidString?? 
=?? 

guidString?? #
.??# $
Replace??$ +
(??+ ,
$str??, /
,??/ 0
$str??1 3
)??3 4
;??4 5

guidString@@ 
=@@ 

guidString@@ #
.@@# $
Replace@@$ +
(@@+ ,
$str@@, /
,@@/ 0
$str@@1 3
)@@3 4
;@@4 5
byteBB 
[BB 
]BB 
cadenaEncriptadaBB #
=BB$ %
EncodingBB& .
.BB. /
UnicodeBB/ 6
.BB6 7
GetBytesBB7 ?
(BB? @

guidStringCC 
+CC 
usuarioCC $
.CC$ %
CorreoElectronicoCC% 6
+CC7 8
DateTimeCC9 A
.CCA B
NowCCB E
.CCE F
ToStringCCF N
(CCN O
)CCO P
)CCP Q
;CCQ R
stringEE 
hashEE 
=EE 
ConvertEE !
.EE! "
ToBase64StringEE" 0
(EE0 1
cadenaEncriptadaEE1 A
)EEA B
;EEB C
hashFF 
=FF 
hashFF 
.FF 
ReplaceFF 
(FF  
$strFF  #
,FF# $
$strFF% '
)FF' (
;FF( )
hashGG 
=GG 
hashGG 
.GG 
ReplaceGG 
(GG  
$strGG  #
,GG# $
$strGG% '
)GG' (
;GG( )
returnII 
hashII 
.II 
	SubstringII !
(II! "
$numII" #
,II# $
$numII% '
)II' (
;II( )
}KK 	
}MM 
}NN 