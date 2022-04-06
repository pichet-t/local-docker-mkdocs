
# MkDocs in Container
 Hey, This is about using Docker to encapsulate a tool called Mkdocs to produce and serve a website without install Mkdocs locally.

 MkDocs is fast and simple static site generator, you can host anywhere you choose. For details please vist site [MkDocs](https://www.mkdocs.org/#mkdocs)

#### Table of contents

  - [Requirements](#requirements)
  - [Limitation](#limitation)
  - [How to run](#how-to-run)
  - [Conclusion](#conclusion)


## Requirements

I assume you will run this project locally so to creating docker image and container you must have to prepare your environment for docker.


## Limitation

I did not tested it anywhere else, so there might be arise some issues.

## How to run

The wrapper script run like

To create contents
```
./mkdockerize.sh -p produce -l projects -n image_name
```

To serve contents for browser
```
./mkdockerize.sh -s serve -l projects -n image_name
```
Now you should be able to browse
http://localhost:8000

## Conclusion

If you execute the following command step by step

and exactly as it is, then you will be able to browse

http://localhost:8000

```
# Create image
docker build -t image_name .

# Build contents
./mkdockerize.sh -p produce -l projects -n image_name

# Serve contents for browser
./mkdockerize.sh -s serve -l projects -n image_name
```

