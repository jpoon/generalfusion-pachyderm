AVERAGE_VERSION = 0.0.5
SCALE_VERSION = 0.0.5
REPO = japoon.azurecr.io/generalfusion

.PHONY: all build tag push 

all: build

build:
	dotnet restore scale/
	dotnet publish scale -c Release -o out
	docker build average -t average:$(AVERAGE_VERSION)
	docker build scale -t scale:$(SCALE_VERSION)

tag:
	docker tag average:$(AVERAGE_VERSION) $(REPO)/average:latest
	docker tag average:$(AVERAGE_VERSION) $(REPO)/average:$(AVERAGE_VERSION)
	docker tag scale:$(SCALE_VERSION) $(REPO)/scale:latest
	docker tag scale:$(SCALE_VERSION) $(REPO)/scale:$(SCALE_VERSION)

push:
	docker push $(REPO)/average:$(AVERAGE_VERSION)
	docker push $(REPO)/average:latest
	docker push $(REPO)/scale:$(SCALE_VERSION)
	docker push $(REPO)/scale:latest

