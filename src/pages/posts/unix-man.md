---
layout: ../../layouts/Post.astro
title: 'man command'
pubDate: 2023-12-28
description: 'Definición y ejemplo de uso del comando man.'
author:
    name: 'Eduardo C.'
    email: 'me@edcilo.com'
    avatar: '/assets/writters/e.svg'
image:
    url: '/assets/posts/unix-man.webp'
    alt: 'The man command.'
tags: ["bash", "command"]
resume: Utilidad Unix/Linux/macOS que muestra documentación de comandos/programas, incluyendo uso, opciones y ejemplos.
---

El comando `man` es una utilidad de sistemas operativos Unix, como Linux y macOS, que muestra la documentación del comando o programa especificado, esta incluye información sobre su uso, opciones, argumentos e inclusive ejemplos de uso. "man" es la abreviatura de "manual".

Sintaxis:

```txt
man <command>
```

Ejemplo:

```bash
man ls
```

Salida:

```txt
NAME
     ls – list directory contents

SYNOPSIS
     ls [-@ABCFGHILOPRSTUWabcdefghiklmnopqrstuvwxy1%,] [--color=when] [-D format] [file ...]

...

:
```

Para navegar en la documentación se usa las siguientes teclas:

- `j` o `↓` para bajar
- `k` o `↑` para subir
- `q` para salir