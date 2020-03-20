@echo off
@title rename _book to docs

if exist docs (
	echo delete docs
	rd /s/q docs
)
echo rename _book to docs
ren _book docs
exit