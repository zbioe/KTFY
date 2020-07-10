resources ?= serivce deployment secret pv

backup:
	bash backupK8s.sh $(resources)

restore:
	bash restoreK8s.sh $(resources)
