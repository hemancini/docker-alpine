# Alpine docker image with oh-my-zsh

```bash
# simple zsh
docker run -it --rm hemancini/alpine:latest

# zsh + kubectl + aws 
docker run -it --rm \
  -v "$HOME/.aws/credentials":"/root/.aws/credentials" \
  -v "$HOME/.kubeconfigs":"/root/.kubeconfigs" \
  hemancini/alpine-kubectl
```

```bash
# kubectl debug
kubectl debug -it tmf-customer-service-demo-5f99d6bbc6-2dpgj --image=hemancini/alpine --target=tmf-customer-service-demo -n tmf-dev
```
