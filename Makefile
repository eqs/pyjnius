all: build_ext

.PHONY: build_ext tests

PYTHON=python
NOSETESTS=nosetests

JAVAC_OPTS=-target 1.6 -source 1.6
JAVAC=javac $(JAVAC_OPTS)

ANT=ant

build_ext:
	$(ANT) all
	$(PYTHON) setup.py build_ext --inplace -f -g

clean:
	$(ANT) clean
	rm -rf build jnius/config.pxi

html:
	$(MAKE) -C docs html

# for use in travis; tests whatever you got.
# use PYTHON3=1 to force python3 in other environments.
tests:
	(cd tests; env CLASSPATH=../build/test-classes:../build/classes PYTHONPATH=..:$(PYTHONPATH) $(NOSETESTS) -v)
