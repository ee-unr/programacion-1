# Aclaraciones sobre el repo del libro y su armado

## Creación del repo

- Lo inicié localmente (Nuevo RProject, Quarto Book, con opción de iniciar git y con renv)
- Agregué `README`
- Agregué `/_book/` en `.gitignore` para no versionar renders locales
- hacer un primer commit
- creo un repo en github con el mismo nombre, sin nada, ni readme
- los vinculo:

	`git remote add origin https://github.com/mpru/programacion1.git`
	`git push --set-upstream origin main`
	`git remote -v`


## Uso de renv

- Es necesario para el render con GH Action con *code execution* (ver abajo), pero también por si alguien quiere reproducirlo exactamente de forma local.
- No usamos muchos paquetes de R, así que tampoco es que rastrea muchas versiones.
- [Doc Quarto+renv](https://quarto.org/docs/projects/virtual-environments.html#using-renv).
- Después de instalar algún paquete, actualizar el *lock* con `renv::snapshot()`.
- Podemos chequear que esté todo actualizado con `renv::status()`.
- Al clonar el repo, y abrir el proyecto, hay que restaurar el ambiente de renv: `renv::restore()`


## Publicación del libro

- Hay varias opciones, me defino por GitHub Pages, renderizando con GitHub Actions, incluso con *code execution*. Sería [este caso de la doc de Quarto](https://quarto.org/docs/publishing/github-pages.html#executing-code).
- *Ventaja*: no hay que hacer build del libro local, con cada push a la main se hace todo, no depende en nada de la configuración local de nadie.
- *Desventaja*: la action tiene que instalar R, las dependencias y tinytex, supuestamente se hace un poco más lento, pero por ahora no me pareció así. Hubo que ver bien cómo se hacía, pero eso ya está.
- Url del libro en pdf: https://programacion1-ecd-unr.github.io/libro/Programaci%C3%B3n-1.pdf
  
### Pasos a seguir

1. Una sola vez localmente: `quarto publish gh-pages`
2. Agrego en `.github/workflows` el archivo `publish.yml`, que lo tomé de la docu de Quarto Publishing, en la parte de Executing Code Example with renv.
3. si no lo hice antes, agrego en `.gitignore` a la carpeta `_book`.
4. commit y push para probar

### Solucionando problemas:

- Problema con el render a PDF: la action no corre porque dice que no tiene tinytex, agrego en `publish.yaml` ([solución](https://github.com/r-lib/actions/tree/v2-branch/setup-tinytex)):

  ```
  - name: Install TinyTex
    uses: r-lib/actions/setup-tinytex@v2
  ```

- Por las dudas, [solución](https://forum.posit.co/t/add-latex-tinytex-dependencies-to-github-actions/90896/2) por si faltan paquetes de latex:
- Nota: si por algo no quiero hacer el build en pdf con la action, sacar el step de instalar tinytex y sacar la parte de format pdf en el _quarto.yml.

## Otras cuestiones del armado del libro

- Hay que ver si después usamos estos ambiente o queremos definir otros, por ahora pienso en los siguientes:

	| **Ambiente**              | **Ícono**          | **Nombre en el código** |
	|---------------------------|--------------------|-------------------------|
	| Presentación del capítulo | 006-clean-code.png | presentacion-capitulo   |
	| Ejemplo                   | code-review.png    | ejemplo                 |
	| Para resolver             | 008-edit-code.png  | ejercicio               |
	| Concepto clave            | 001-anchor.png     | concepto                |
	| Info importante           | 010-review.png     | info                    |
	| Comentario adicional      | 007-browser.png    | comentario              |
	| Página en construcción    | 003-website.png    | en-construccion         |

- Atribución de imágenes para íconos: ya lo puse en bibliografía

## Interactividad (ejercicios en el libro)

- Podríamos poner con este formato algún ejercicio o ejemplo suelto, y también las actividades autoevaluativas que teníamos en Comunidades.
- No exploré la opción de Iván con Quarto Live ([ejemplo](https://ivanm26.github.io/test.quarto.live/))
- Vi las opciones mencionadas [en este recurso](https://utrechtuniversity.github.io/open-textbooks/interactivity.html): sólo me parece interesante la del paquete [webexercises](https://psyteachr.github.io/webexercises/).
- La funcionalidad depende de que en algún lugar del repo estén los archivos `webex.css` y `webex.js`, no importa dónde, el nombre de la carpeta lo elige uno (yo puse `webexercises` en el root) y que en `_quarto.yml` estén referenciados, dentro de las opciones para html, con `css: webexercises/webex.css` y `include-after-body: webexercises/webex.js`.
- Después, en cualquier archivo `.qmd` se puede usar el paquete (cargarlo con `library`) para incluir ejercicios. 
- Para poder usarlo en el libro:

	```r
	install.packages("webexercises")
	# genera los archivos .css y .js, edita el yaml (chequear todo) y genera un qmd de ejemplo
	add_to_quarto(
	  quarto_dir = ".",
	  include_dir = "webexercises", # default es "include"
	  output_format = c("html")
	)
	```

- Agrego el template del paquete que muestra todas las opciones como una página del libro, provisoriamente, para ver qué se puede hacer y chequear que funcione.
- En el render del PDF se ven bien los ejercicios (algunas cosas no tanto, pero se entiende todo bien, se ven las opciones o espacios en blanco para completar, etc). Por ahora el output "oficial" es en html.

## Pendientes

- Poner una licencia.

## Pasos para Agregar una Práctica

1. Crear una branch desde `main`.
1. Crear `{numero unidad}_practica.qmd` en la carpeta `capitulos`. En el caso que la unidad sea menor a `10`, `{numero unidad}` debe comenzar con cero (por ejemplo, `01`).
2. Usar [NN_practica.qmd](templates/NN_practica.qmd) como referencia para completar `{numero unidad}_practica.qmd`. Los ejercicios consisten en un enunciado y una solución que por defecto está escondida.
3. Agregar `- capitulos/{numero unidad}_practica.qmd` dentro de la `part` correspondiente en [_quarto.yml](_quarto.yml).
4. Corroborar que la práctica fue agregada correctamente ejecutando `quarto preview` en la `Terminal`. Nota: Para cerrar `quarto preview`, en RStudio se puede usar el shortcut `Ctrl + C`.
5. Una vez completada la práctica, hacer un PR desde la branch a `main`. Tener en cuenta que el libro se debería actualizar automáticamente cuando la branch sea integrada a `main`.
