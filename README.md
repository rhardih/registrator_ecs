## registrator_ecs

This is an AWS ECS specific version of [https://github.com/gliderlabs/registrator](https://github.com/gliderlabs/registrator).

In order for registrator to register the correct ip for a service, the recommended way to run the container is with `--net=host`.

This mode is not currently available when running containers in the EC2 Container Service, which makes registrator incorrectly register service ips as the internal container address, e.g. `172.17.0.42`.

[Here's an issue](https://github.com/aws/amazon-ecs-agent/issues/185) requesting `--net=host` in the ecs-agent.

---

To work around the problem, this version simply reads the hosts ip from a file instead.

If `/usr/share/docker/ip` is present the content will be passed to registrator as argument to the `-ip` option.

Assuming the file is present on the host system, just run the container with an additional volume mount, `-v /usr/share/docker:/usr/share/docker`.

As a sidenote, the file can be automatically created for each EC2 instance, as part of the launch configuration, by adding the following to the **User data**:

```sh
#!/bin/bash
mkdir /usr/share/docker
curl http://169.254.169.254/latest/meta-data/local-ipv4 > /usr/share/docker/ip
```

---

Docker hub: [https://hub.docker.com/r/rhardih/registrator_ecs](https://hub.docker.com/r/rhardih/registrator_ecs).

Run as `rhardih/registrator_ecs`.

---

### License

MIT: http://rhardih.mit-license.org