prefix ?= ./out
resources ?= service deployment secret ingress namespace sc pv pvc pc job endpoints statefulset networkpolicy apiservice configmap serviceaccount clusterrole pdb resourcequota role rolebinding
backup=$(PWD)/backupK8s.sh
restore=$(PWD)/restoreK8s.sh

prefix:
	mkdir -p $(prefix)

backup: prefix
	cd $(prefix); $(backup) $(resources) | tee -a backup.log

restore: prefix
	cd $(prefix); $(restore) $(resources)

backup.tar.gz: prefix backup
	cd $(prefix); tar --remove-files -czf backup.tar.gz $(resources)

install: prefix
	cp $(backup) $(restore) $(prefix)
