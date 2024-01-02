---
layout: ../../layouts/Post.astro
title: 'Patrón de diseño - Factory Method'
pubDate: 2024-01-02
description: 'Serie de patrones de diseño, Factory Method.'
author:
    name: 'Eduardo C.'
    email: 'me@edcilo.com'
    avatar: '/assets/writters/e.svg'
image:
    url: '/assets/posts/design-pattern-factory-method.webp'
    alt: 'Factory method post cover.'
tags: ["design-pattern", "creational"]
resume: Factory Method permite a subclases definir el tipo de objetos a crear, útil en frameworks y aplicaciones multiplataforma.
---

El patrón de diseño Fa­c­to­ry Method es un pa­t­rón de diseño crea­cio­nal que pro­po­r­cio­na una in­te­r­faz para crear ob­je­tos en una su­pe­r­c­la­se, mie­n­t­ras pe­r­mi­te a las su­b­c­la­ses al­te­rar el tipo de ob­je­tos que se crearán.

Casos de uso:
- Extender la funcionalidad de un framework o biblioteca.
- Encapsular la lógica de creación de objetos de una misma interfaz.
- Desarrollo de aplicaciones multiplataforma.

Ejemplo en TypeScript:

```ts
// product interface
abstract class Service {
  abstract save(filePath: string): boolean;
}

// concrete products
class S3 extends Service {
  save(filePath: string): boolean {
    console.log(`upload file in ${filePath} to s3 bucket`);
    return true;
  }
}

class FTP extends Service {
  save(filePath: string): boolean {
    console.log(`upload file in ${filePath} to ftp server`);
    return true;
  }
}

// creator class
abstract class StorageFactory {
  abstract setupService(): Service;
}

// concrete creators
class S3Factory extends StorageFactory {
  setupService(): Service {
    return new S3();
  }
}

class FTPFactory extends StorageFactory {
  setupService(): Service {
    return new FTP();
  }
}

// usage
const config = {
  storage: 'ftp',
};

function saveFile(filePath: string) {
  const { storage } = config;
  let factory: StorageFactory;

  if (storage === 'ftp') {
    factory = new FTPFactory();
  } else if (storage === 's3') {
    factory = new S3Factory();
  } else {
    throw new Error('invalid storage');
  }

  const service = factory.setupService();
  service.save(filePath);
}

saveFile('/tmp/file.txt');
```

Ejemplo en Python:

```py
from abc import ABC, abstractmethod

# Product interface
class Service(ABC):
    @abstractmethod
    def save(self, file_path: str) -> bool:
        pass

# Product classes
class S3(Service):
    def save(self, file_path: str) -> bool:
        print(f"upload file in {file_path} to s3 bucket")
        return True

class FTP(Service):
    def save(self, file_path: str) -> bool:
        print(f"upload file in {file_path} to ftp server")
        return True

# Creator class
class StorageFactory(ABC):
    @abstractmethod
    def setup_service(self) -> Service:
        pass

# Concrete creators
class S3Factory(StorageFactory):
    def setup_service(self) -> Service:
        return S3()

class FTPFactory(StorageFactory):
    def setup_service(self) -> Service:
        return FTP()

# Usage
config = {
    "storage": "ftp",
}

def save_file(file_path: str):
    storage = config["storage"]
    if storage == "ftp":
        factory = FTPFactory()
    elif storage == "s3":
        factory = S3Factory()
    else:
        raise ValueError("Invalid storage type")

    service = factory.setup_service()
    service.save(file_path)

# Test the function
save_file("/tmp/file.txt")
```

Ejemplo en Go:

```go
package main

import (
	"fmt"
)

// Service interface
type Service interface {
	Save(filePath string) bool
}

// S3 type
type S3 struct{}

func (s S3) Save(filePath string) bool {
	fmt.Printf("upload file in %s to s3 bucket\n", filePath)
	return true
}

// FTP type
type FTP struct{}

func (f FTP) Save(filePath string) bool {
	fmt.Printf("upload file in %s to ftp server\n", filePath)
	return true
}

// StorageFactory interface
type StorageFactory interface {
	SetupService() Service
}

// S3Factory type
type S3Factory struct{}

func (sf S3Factory) SetupService() Service {
	return S3{}
}

// FTPFactory type
type FTPFactory struct{}

func (ff FTPFactory) SetupService() Service {
	return FTP{}
}

// Function to save file
func SaveFile(filePath string, factory StorageFactory) {
	service := factory.SetupService()
	service.Save(filePath)
}

// Main function
func main() {
	var factory StorageFactory

	// Example configuration
	config := map[string]string{
		"storage": "ftp",
	}

	switch config["storage"] {
	case "ftp":
		factory = FTPFactory{}
	case "s3":
		factory = S3Factory{}
	default:
		panic("Invalid storage type")
	}

	SaveFile("/tmp/file.txt", factory)
}
```
