# biocommons/dockerbase

Parent images used by biocommons


## Building

Build like this:

```
$ make build
$ make push   # perhaps `docker login` first
```


## Versioning

for MAJOR.MINOR.PATCH:

* bump MAJOR for distro updates
* bump MINOR for new packages in same distro
* bump PATCH for updates to packages within MAJOR.MINOR
