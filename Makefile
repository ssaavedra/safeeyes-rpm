.PHONY: srpm rpm

VERSION = 1.2.2
RELEASE = 1

TARGETS = i386/python3-safeeyes-$(VERSION)-$(RELEASE).i386.rpm x86_64/python3-safeeyes-$(VERSION)-$(RELEASE).x86_64.rpm python-safeeyes-$(VERSION)-$(RELEASE).src.rpm

all: $(TARGETS)

clean:
	rm -f $(TARGETS) v$(VERSION).tar.gz

source: v$(VERSION).tar.gz

v$(VERSION).tar.gz:
	spectool -d "_version $(VERSION)" -g -S safeeyes.spec

rpm: i386/python-3safeeyes-$(VERSION)-$(RELEASE).i386.rpm x86_64/python3-safeeyes-$(VERSION)-$(RELEASE).x86_64.rpm

i386/python3-safeeyes-$(VERSION)-$(RELEASE).i386.rpm: v$(VERSION).tar.gz safeeyes.spec
	rpmbuild -bb --define "_topdir `pwd`" --define "_sourcedir `pwd`" --define "_rpmdir `pwd`" --define "_specdir `pwd`" --define "_srcrpmdir `pwd`" --define "_buildrootdir `mktemp -d /var/tmp/safeeyesXXXXXX`" --define "_builddir `mktemp -d /var/tmp/safeeyesXXXXXX`" --define "_release $(RELEASE)" --define "_version $(VERSION)" --define "_tmppath `mktemp -d /var/tmp/safeeyesXXXXXX`" safeeyes.spec --target=i386

x86_64/python3-safeeyes-$(VERSION)-$(RELEASE).x86_64.rpm: v$(VERSION).tar.gz safeeyes.spec
	rpmbuild -bb --define "_topdir `pwd`" --define "_sourcedir `pwd`" --define "_rpmdir `pwd`" --define "_specdir `pwd`" --define "_srcrpmdir `pwd`" --define "_buildrootdir `mktemp -d /var/tmp/safeeyesXXXXXX`" --define "_builddir `mktemp -d /var/tmp/safeeyesXXXXXX`" --define "_release $(RELEASE)" --define "_version $(VERSION)" --define "_tmppath `mktemp -d /var/tmp/safeeyesXXXXXX`" safeeyes.spec --target=x86_64

SRPM: python-safeeyes-$(VERSION)-$(RELEASE).src.rpm

python-safeeyes-$(VERSION)-$(RELEASE).src.rpm: v$(VERSION).tar.gz safeeyes.spec
	rpmbuild -bs --define "_topdir `pwd`" --define "_sourcedir `pwd`" --define "_rpmdir `pwd`" --define "_specdir `pwd`" --define "_srcrpmdir `pwd`" --define "_buildrootdir `mktemp -d /var/tmp/safeeyesXXXXXX`" --define "_builddir `mktemp -d /var/tmp/safeeyesXXXXXX`" --define "_release $(RELEASE)" --define "_version $(VERSION)" --define "_tmppath `mktemp -d /var/tmp/safeeyesXXXXXX`" safeeyes.spec
