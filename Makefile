resources ?= serivce deployment secret
prefix ?= .
resources ?= service deployment secret ingress namespace sc pv pvc pc job endpoints statefulset networkpolicy apiservice configmap serviceaccount clusterrole pdb resourcequota role rolebinding
backup=$(PWD)/backupK8s.sh
restore=$(PWD)/restoreK8s.sh

backup:
	bash backupK8s.sh $(resources)
	cd $(prefix); $(backup) $(resources)

restore:
	cd $(prefix); $(restore) $(resources)
