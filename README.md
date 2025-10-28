
# ejecución de archivos

# instalación

```sh
nano ~/.config/nvim/init.lua
```

# ejecución

para ejecutar un archivo .js o .ts
```sh
!node %
```

# funcionalidad

¡Perfecto! Aquí tienes todos los comandos y atajos basados en tu configuración actual:

## **🎯 ATAJOS PRINCIPALES (Leader = Espacio)**

### **Archivos y Exploración**
- `Space + e` → Abrir/cerrar explorador de archivos (nvim-tree)
- `Space + w` → Guardar archivo
- `Space + q` → Salir de Neovim
- `Space + ff` → Buscar archivos (Telescope)
- `Space + fg` → Buscar texto en archivos (grep)
- `Space + fb` → Ver buffers abiertos

### **LSP (Autocompletado y Navegación de Código)**
- `gd` → Ir a definición
- `gr` → Ver todas las referencias
- `K` → Ver documentación (hover)
- `Space + rn` → Renombrar variable/función
- `Space + ca` → Acciones de código (code actions)

### **Autocompletado (en modo INSERT)**
- `Ctrl + Space` → Activar autocompletado manualmente
- `Tab` → Siguiente sugerencia
- `Shift + Tab` → Sugerencia anterior
- `Enter` → Aceptar sugerencia
- `Ctrl + e` → Cancelar autocompletado
- `Ctrl + b` → Scroll docs arriba
- `Ctrl + f` → Scroll docs abajo

### **Comentarios**
- `gcc` → Comentar/descomentar línea actual
- `gc` (en modo VISUAL) → Comentar líneas seleccionadas
- `gc3j` → Comentar 3 líneas hacia abajo
- `gbc` → Comentar en bloque

### **Navegación entre Ventanas**
- `Ctrl + h` → Ir a ventana izquierda
- `Ctrl + j` → Ir a ventana abajo
- `Ctrl + k` → Ir a ventana arriba
- `Ctrl + l` → Ir a ventana derecha

### **Mover Líneas (en modo VISUAL)**
- `J` → Mover líneas seleccionadas hacia abajo
- `K` → Mover líneas seleccionadas hacia arriba

### **Búsqueda**
- `Esc` → Limpiar highlight de búsqueda

## **📦 COMANDOS DE NVIM-TREE (Explorador)**
Presiona `Space + e` para abrir, luego:
- `a` → Crear archivo/carpeta
- `d` → Eliminar archivo
- `r` → Renombrar archivo
- `x` → Cortar archivo
- `c` → Copiar archivo
- `p` → Pegar archivo
- `y` → Copiar nombre del archivo
- `Y` → Copiar ruta relativa
- `R` → Refrescar árbol
- `H` → Mostrar/ocultar archivos ocultos
- `Enter` → Abrir archivo
- `Tab` → Abrir archivo pero mantener cursor en árbol

## **🔍 COMANDOS DE TELESCOPE**
- `Ctrl + n` / `Ctrl + p` → Navegar resultados
- `Ctrl + c` → Cerrar Telescope
- `Enter` → Abrir archivo seleccionado

## **🎨 COMANDOS DE PLUGINS**

### **Mason (Instalar LSP servers)**
```vim
:Mason
```
Luego:
- `i` → Instalar
- `X` → Desinstalar
- `u` → Actualizar

### **Lazy (Gestor de Plugins)**
```vim
:Lazy
```
- `U` → Actualizar plugins
- `S` → Sincronizar
- `C` → Limpiar plugins no usados
- `I` → Instalar plugins faltantes

### **Treesitter**
```vim
:TSInstall <lenguaje>    # Instalar parser
:TSUpdate                 # Actualizar parsers
```

### **Cambiar Tema**
```vim
:colorscheme catppuccin         # Tema actual
:colorscheme monokai-pro        # Monokai clásico
:colorscheme monokai-pro-classic
:colorscheme monokai-pro-machine
```

## **💡 COMANDOS ÚTILES DE VIM**

### **Modos**
- `i` → Modo INSERT (antes del cursor)
- `a` → Modo INSERT (después del cursor)
- `o` → Nueva línea abajo y modo INSERT
- `O` → Nueva línea arriba y modo INSERT
- `v` → Modo VISUAL (selección)
- `V` → Modo VISUAL LINE (líneas completas)
- `Ctrl + v` → Modo VISUAL BLOCK (columnas)
- `Esc` → Volver a modo NORMAL

### **Navegación**
- `h j k l` → Izquierda, abajo, arriba, derecha
- `w` → Siguiente palabra
- `b` → Palabra anterior
- `0` → Inicio de línea
- `$` → Final de línea
- `gg` → Inicio del archivo
- `G` → Final del archivo
- `{número}G` → Ir a línea número

### **Edición**
- `dd` → Borrar línea
- `yy` → Copiar línea
- `p` → Pegar después
- `P` → Pegar antes
- `u` → Deshacer
- `Ctrl + r` → Rehacer
- `.` → Repetir último comando

### **Archivos**
```vim
:e archivo.js          # Abrir archivo
:w                     # Guardar
:w nombre.js           # Guardar como
:wq                    # Guardar y salir
:q                     # Salir
:q!                    # Salir sin guardar
:qa!                   # Cerrar todo sin guardar
```

### **Dividir Pantalla**
```vim
:split              # Split horizontal
:vsplit             # Split vertical
:split archivo.js   # Abrir archivo en split
```

### **Buscar y Reemplazar**
```vim
/texto              # Buscar texto
n                   # Siguiente resultado
N                   # Resultado anterior
:%s/viejo/nuevo/g   # Reemplazar en todo el archivo
:%s/viejo/nuevo/gc  # Reemplazar con confirmación
```

## **🔧 COMANDOS DE DIAGNÓSTICO**
```vim
:checkhealth           # Ver salud de Neovim
:LspInfo              # Info de LSP activos
:TSInstallInfo        # Info de parsers Treesitter
:Lazy                 # Estado de plugins
:Mason                # Gestionar LSP servers
```

¿Necesitas que agregue algún atajo específico o explique alguno con más detalle? 🚀