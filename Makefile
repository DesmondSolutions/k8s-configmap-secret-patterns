apply-all:
	kubectl apply -f manifests/configmap.yaml
	kubectl apply -f manifests/secret.yaml
	kubectl apply -f manifests/pod-env.yaml
	kubectl apply -f manifests/pod-args.yaml
	kubectl apply -f manifests/pod-volume.yaml

delete-all:
	kubectl delete -f manifests/pod-volume.yaml
	kubectl delete -f manifests/pod-args.yaml
	kubectl delete -f manifests/pod-env.yaml
	kubectl delete -f manifests/secret.yaml
	kubectl delete -f manifests/configmap.yaml

logs:
	kubectl logs -l app=demo-pod --tail=100 -f
