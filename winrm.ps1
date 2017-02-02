#
# TODO: Добавление сертификата для настройки работы winrm по https
# Скрипт, пока, расчитан только на Windows 10
#
#
#
# gwmi win32_operatingsystem | % caption <- выдаёт версию винды

$Password = "password"

# Устанавливаем choko
#iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

# Активируем локального администратора
Enable-LocalUser Администратор
# Преобразуем пароль
$EncryptedPassword = ConvertTo-SecureString $Password -AsPlainText -Force
# Устанавливаем пароль локальному администратору
Set-LocalUser -Name Администратор -Password $EncryptedPassword

# Включаем тихую установку winrm с использованием http
winrm qc -q -transport:http -f

#Enable-PSRemoting -Force 
#Get-NetConnectionProfile
#Set-NetConnectionProfile -InterfaceIndex 6 -NetworkCategory Private