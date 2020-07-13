prefix ?= .
resources ?= service deployment secret ingress namespace sc pv pvc pc job endpoints statefulset networkpolicy apiservice configmap serviceaccount clusterrole pdb resourcequota role rolebinding
backup=$(PWD)/backupK8s.sh
restore=$(PWD)/restoreK8s.sh

backup:
	cd $(prefix); $(backup) $(resources)

restore:
	cd $(prefix); $(restore) $(resources)

backup.tar.gz: backup
	cd $(prefix); tar --remove-files -czf backup.tar.gz $(resources)
