resources ?= serivce deployment secret
resources ?= service deployment secret ingress namespace sc pv pvc pc job endpoints statefulset networkpolicy apiservice configmap serviceaccount clusterrole pdb resourcequota role rolebinding

backup:
	bash backupK8s.sh $(resources)

restore:
	bash restoreK8s.sh $(resources)
