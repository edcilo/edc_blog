---
layout: ../../layouts/Post.astro
title: 'BEM Methodology'
pubDate: 2024-01-02
description: 'BEM: Método CSS para eficiencia y claridad en desarrollo web.'
author:
    name: 'Eduardo C.'
    email: 'me@edcilo.com'
    avatar: '/assets/writters/e.svg'
image:
    url: '/assets/posts/bem-methodology.webp'
    alt: 'The BEM methodology.'
tags: ["css", "methodology"]
resume: BEM organiza clases CSS en módulos, facilitando desarrollo y trabajo en equipo, con bloques, elementos y modificadores.
---

BEM es la abreviatura de Block Element Modifier (Bloque, Elemento, Modificador), la idea principal es acelerar el proceso de desarrollo y facilitar el trabajo en equipo de los desarrolladores organizando las clases CSS en módulos independientes.

La mejor practica para usar la metodologia BEM es sobre los nombres de clases, ya que esto permite repetir nombres de clases si es necesario y crear estructuras de código más consistentes.

Los elementos que la metodologia BEM propone son:

## Bloque

Un bloque representa un objeto estructural que puede estar compuesto por uno o mas componentes en el sitio web, por ejemplo el header, content, sidebar, footer, etc.

El nombre de clase para un bloque usualmente está compuesto por una palabra que describa la función del bloque, si el nombre del bloque está compuesto por más de una palabra se usa un guión medio para separarlas.

```css
.header { /* ... */ }
.theme-toggle { /* ... */ }
```

## Elemento

Un elemento es un componente con una función particular que tiene sentido por sí mismo.

El nombre de la clase para un elemento está compuesto por el nombre del bloque seguido de dos guiones bajos y el nombre del elemento, si el nombre del elemento está compuesto por más de una palabra se usa un guion medio para separarlas.

```css
.header__search { /* ... */ }
.sidebar__menu { /* ... */ }
.theme-toggle__dark-button { /* ... */ }
```

## Modificador

Es una clase usada para cambiar el estilo de un bloque o elemento.

El nombre de clase inicia con el nombre del bloque o elemento seguido de un guión bajo y el nombre del modificador.

```css
.header_fixed { /* ... */ }
.sidebar_dark { /* ... */ }
.content__article_active { /* ... */ }
```

### Ejemplo de uso

```html
<header class="header">
    <img class="header__logo" src="..." />
    <form class="header__search">
        <input class="header__search-input_rounded" type="text" placeholder="Search...">
        <button class="header__search-button" type="submit">
    </form>
</header>
```
