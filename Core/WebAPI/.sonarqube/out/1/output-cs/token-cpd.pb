ä	
lC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Utilitarios\Busqueda.cs
	namespace 	
Utilitarios
 
{ 
[		 
Serializable		 
]		 
public

 

class

 
Busqueda

 
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public 
List 
< 
string 
> 

Municipios &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
List 
< 
string 
> 

Categorias &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
List 
< 
int 
> 
Puntuaciones %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
bool 
Estado 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ò
uC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Utilitarios\BusquedaProveedor.cs
	namespace 	
Utilitarios
 
{ 
[

 
Serializable

 
]

 
public 

class 
BusquedaProveedor "
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Nit 
{ 
get 
;  
set! $
;$ %
}& '
public 
List 
< 
string 
> 

Municipios &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
bool 
Estado 
{ 
get  
;  !
set" %
;% &
}' (
} 
} Ü
jC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Utilitarios\Imagen.cs
	namespace 	
Utilitarios
 
{ 
public 

class 
Imagen 
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
	Direccion 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Tipo 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ë
iC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Utilitarios\Login.cs
	namespace 	
Utilitarios
 
{ 
public 

class 
Login 
{ 
public 
string 
Rol 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Clave 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Nit 
{ 
get 
;  
set! $
;$ %
}& '
} 
} Ý
lC:\Users\Sandra Moreno\OneDrive - Universidad de Cundinamarca\Documentos\Codigo\Core\Utilitarios\Paginado.cs
	namespace 	
Utilitarios
 
{ 
[		 
Serializable		 
]		 
public

 

class

 
Paginado

 
<

 
T

 
>

 
where

 "
T

# $
:

% &
class

' ,
{ 
public 
List 
< 
T 
> 
	Contenido  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
short 
PaginaActual !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
TotalPaginas #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 

TotalItems 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} 