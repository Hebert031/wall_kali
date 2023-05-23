#!/bin/bash

#Autor: Hebert Ribeiro
#Sobre: Altera a imagem do grub

echo "Qual caminho da IMG (640x480 8-bit)"

read path


# Verifica o tipo do arquivo
echo "verificando arquivos."
if ! file "$path" | grep -q "640"; then
  echo "Formato de arquivo inválido. O arquivo deve ser uma imagem PNG de 640x480 pixels e 8 bits."
  exit 1
fi

# Copia a imagem para os diretórios do GRUB e do desktop
echo "Copiando arquivos."
cp "$path" /boot/grub/themes/kali/grub-16x9.png
cp "$path" /boot/grub/themes/kali/grub-4x3.png
cp "$path" /boot/grub/themes/kali/desktop-grub.png
cp "$path" /usr/share/images/desktop-base/kali-grub.png
cp "$path" /usr/share/images/desktop-base/desktop-grub.png
echo "Fim da copia de arquivos..."
# Atualiza o GRUB
echo "Iniciando atualização do Grub"
update-grub > /dev/null

# Pergunta se o usuário quer reiniciar o computador
read -p "Gostaria de reiniciar o PC? (s/N)" resposta

if [ "${resposta,,}" == "s" ]; then
  reboot
else
  echo "Tenha um Bom Dia. até a proxima troca"
fi
