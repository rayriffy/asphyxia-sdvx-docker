asphyxia-sdvx-docker
===

Host Asphyxia CORE with SDVX plugin via Docker

To build image
---

Make changes to configuration in `config.ini` first, and then build image by using following command (By default, there's no need to change properties `port`, `bind`, `matching_port` at all)

```
docker build --tag sdvx:1.0 .
```

To run
---

This will expose 2 ports

- `8083` for API and WebUI
- `5070` for matching

```
docker run -p 8083:8083 -p 5700:5700 -d --name sdvx sdvx:1.0
```

To backup
---

Save data can be located at `/core/savedata.db`, you can get it easily before removing container by copy it

```
docker cp sdvx:/core/savedata.db .
```
