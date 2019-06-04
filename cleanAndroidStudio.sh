
#!/bin/sh
#__BEGIN_MAIN__
#
clear
echo "\n*** DelAS v1.0 2017 (\033[0;31mDeletar Android Studio\033[0m) by maddo\n"
echo "\033[0;33mPasta\033[0m \ \033[1;4;31mStatus\033[0m\n"

rm -Rf /Applications/Android\ Studio.app
echo "/Applications/Android\ Studio.app \ \033[0;34mDeletado\033[0m"
rm -Rf ~/Library/Preferences/AndroidStudio*
echo "~/Library/Preferences/AndroidStudio* \ \033[0;34mDeletado\033[0m"
rm -Rf ~/Library/Preferences/com.google.android.studio.plist
echo "~/Library/Preferences/com.google.android.studio.plist \ \033[0;34mDeletado\033[0m"
rm -Rf ~/Library/Application\ Support/AndroidStudio*
echo "~/Library/Application\ Support/AndroidStudio* \ \033[0;34mDeletado\033[0m"
rm -Rf ~/Library/Logs/AndroidStudio*
echo "~/Library/Logs/AndroidStudio* \ \033[0;34mDeletado\033[0m"
rm -Rf ~/Library/Caches/AndroidStudio*
echo "~/Library/Caches/AndroidStudio* \ \033[0;34mDeletado\033[0m"
rm -Rf ~/.gradle
echo "~/.gradle \ \033[0;34mDeletado\033[0m"
rm -Rf ~/.android
echo "~/.android \ \033[0;34mDeletado\033[0m"
rm -Rf ~/.android


echo "\033[0;33m\n**** Opcionalmente se desejar deletar a pasta"
echo "**** com todos os projetos execute este comando:"
echo "**** rm -Rf ~/AndroidStudioProjects\n\033[0m"
echo "Concluído"

#__END_MAIN__
DelAS.sh
Exibindo DelAS.sh…
