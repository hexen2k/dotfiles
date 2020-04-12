.PHONY : all build clean configure

build:
	.venv\Scripts\pyinstaller.exe --onefile numberlist.py
	cp dist\numberlist.exe ..\..\..\numberlist.exe

configure: .venv
	.venv\Scripts\python -m pip install -r requirements.txt

.venv:
	python -m venv .venv

clean:
	rm -rf numberlist.spec __pycache__ build dist

distclean: clean
	rm -rf .venv

all: distclean configure build
