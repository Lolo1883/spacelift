resource "docker_image" "registry" {
  name = "registry:2"
}

resource "docker_container" "registry" {
  name  = "local-registry"
  image = docker_image.registry.latest
  ports {
    internal = 5000
    external = 5000
  }
}

resource "kind_cluster" "demo" {
  name = "spacelift-demo"

  node_image = "kindest/node:v1.29.0" 

  config = <<EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
containerdConfigPatches:
- |-
  [plugins."io.containerd.grpc.v1.cri".registry.mirrors."localhost:5000"]
    endpoint = ["http://localhost:5000"]
EOF
}

resource "local_file" "kubeconfig" {
  content  = kind_cluster.demo.kubeconfig
  filename = "${path.module}/kubeconfig.yaml"
}
