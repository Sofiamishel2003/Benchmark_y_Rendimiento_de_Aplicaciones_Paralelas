## Building

```
docker build -t <image-name> . 
```
Si les sale error de ubuntu:22.04 solo corran lo siguiente, y luego vuelvan a construir la imagen
```
docker pull ubuntu:22.04
```

### Running
(on WSL)
```
docker run --rm -it -v $(pwd)/results:/results <image-name>
```