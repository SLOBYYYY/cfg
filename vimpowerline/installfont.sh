echo Copy conf file
if [ ! -d ~/.config/fontconfig/conf.d ]; then
	mkdir -p ~/.config/fontconfig/conf.d;
fi;
cp 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

echo Copy otf file
if [ ! -d ~/.fonts ]; then
	mkdir ~/.fonts;
fi;
cp PowerlineSymbols.otf ~/.fonts

echo Updating font cache
#update font cache
fc-cache -vf ~/.fonts

echo FINISHED!
