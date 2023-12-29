---
layout: ../../layouts/Post.astro
title: 'Patrón de diseño - Singleton'
pubDate: 2023-12-28
description: 'Serie de patrones de diseño, Singleton.'
author:
    name: 'Eduardo C.'
    email: 'me@edcilo.com'
    avatar: '/assets/writters/e.svg'
image:
    url: '/assets/posts/design-pattern-singleton.webp'
    alt: 'Singleto post cover.'
tags: ["design-pattern", "singleton"]
resume: El Singleton garantiza una única instancia de clase accesible globalmente, útil para bases de datos y configuraciones.
---

El patrón de diseño Singleton es un patrón de diseño creacional que se utiliza para garantizar que una clase solo tenga una instancia y que esa instancia sea accesible globalmente en toda la aplicación.

Casos de uso:
- La conección a una base de datos.
- La configuración de la aplicación.

Ejemplo en TypeScript:
```ts
class Singleton {
  private static instance: Singleton;

  private constructor() {}

  public static getInstance(): Singleton {
    if (!Singleton.instance) {
      Singleton.instance = new Singleton();
    }
    return Singleton.instance;
  }

  public greeting() {
    console.log(`Hello I'm a singleton`);
  }
}

// Ejemplo de uso
const singleton1 = Singleton.getInstance();
const singleton2 = Singleton.getInstance();

console.log(singleton1 === singleton2); // true

singleton1.greeting(); // Hello I'm a singleton
singleton2.greeting(); // Hello I'm a singleton
```

Ejemplo en python
```py
class Singleton:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(Singleton, cls).__new__(cls)
        return cls._instance

    def greeting(self):
        print("Hello I'm a singleton")

# Ejemplo de uso
singleton1 = Singleton()
singleton2 = Singleton()

print(singleton1 == singleton2)  # True

singleton1.greeting()  # Hello I'm a singleton
singleton2.greeting()  # Hello I'm a singleton
```

Ejemplo en go
```go
package main

import (
    "fmt"
    "sync"
)

// Singleton es una estructura para nuestro Singleton.
type Singleton struct{}

// instance es la instancia privada del Singleton.
var instance *Singleton
var once sync.Once

// GetInstance devuelve la instancia del Singleton, creándola si no existe.
func GetInstance() *Singleton {
    once.Do(func() {
        instance = &Singleton{}
    })
    return instance
}

// Greeting imprime un mensaje de saludo.
func (s *Singleton) Greeting() {
    fmt.Println("Hello I'm a singleton")
}

func main() {
    singleton1 := GetInstance()
    singleton2 := GetInstance()

    fmt.Println(singleton1 == singleton2) // true

    singleton1.Greeting() // Hello I'm a singleton
    singleton2.Greeting() // Hello I'm a singleton
}
```