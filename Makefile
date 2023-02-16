DOTENV := $(if $(DOTENV),$(DOTENV),.env)
include $(DOTENV)
export

build-and-push:
	docker buildx build --builder $(BUILDER) --push -t $(TAG) --build-arg BUILDKIT_INLINE_CACHE=1 --platform=linux/amd64,linux/arm64 .
