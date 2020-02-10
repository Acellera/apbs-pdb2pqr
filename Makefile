ifndef version
$(error version variable is not set)
endif

release:
	git checkout master
	git fetch
	git pull
	git tag -a $(version) -m "$(version) release"
	git push --tags origin $(version)