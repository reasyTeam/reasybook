@echo off
@title rename _book to docs

if exist docs (
	echo delete docs
	rd /s/q docs
)
ren _book docs
pause