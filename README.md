# Multi-stage dockerfile example for simple flask app


# Build
```docker
docker build -f multi-stage-build.Dockerfile -t multi-stage-docker-flask .
```

# Run 
```docker
docker run -p 5000:5000 multi-stage-docker-flask 
```

# Test
```console
sander@pc:~ $ curl localhost:5000
Hello World!
```