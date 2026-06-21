# Docker Endpoint Poller

A lightweight Docker image that continuously polls an HTTP endpoint and writes the result to standard output.

## Configuration

The container is configured through environment variables:

| Variable       | Description                                | Default                    |
| -------------- | ------------------------------------------ | -------------------------- |
| `URL`          | Endpoint to poll                           | `https://httpbin.org/uuid` |
| `INTERVAL`     | Delay between requests (seconds)           | `5`                        |
| `CURL_OPTIONS` | Additional options passed directly to curl | (empty)                    |

## Example Usage

```yaml
docker run --rm -e URL=http://httpbin.org/uuid -e INTERVAL=2 mrgazdag/endpoint-poller
docker run --rm -e URL=http://httpbin.org/status/500 -e INTERVAL=2 -e CURL_OPTIONS=-sSf mrgazdag/endpoint-poller
```

Successful requests:

```text
Requesting: http://httpbin.org/uuid
{
  "uuid": "d5d5f6ef-9d97-4d6e-a6c5-2fefcf3b0c49"
}

Requesting: http://httpbin.org/uuid
{
  "uuid": "9d0c4b2d-2a58-4f5b-a841-c40c0f14c35d"
}
```

Failed requests:

```text
Requesting: http://does-not-exist
curl: (6) Could not resolve host: does-not-exist

Requesting: http://httpbin/status/500
```

## Use Cases

* Testing log aggregation systems
* Monitoring and alerting demonstrations
* HTTP connectivity testing
* Request/response correlation examples
