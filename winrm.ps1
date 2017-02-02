#
# TODO: Добавление сертификата для настройки работы winrm по https
# Скрипт, пока, расчитан только на Windows 10 RU
#

$Password = "password"

# Устанавливаем choco
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression

# Активируем локального администратора
Enable-LocalUser Администратор

# Преобразуем пароль
$EncryptedPassword = ConvertTo-SecureString $Password -AsPlainText -Force

# Устанавливаем пароль локальному администратору
Set-LocalUser -Name Администратор -Password $EncryptedPassword

# Включаем тихую установку winrm с использованием http
Enable-PSRemoting -Force -SkipNetworkProfileCheck

#Get-NetConnectionProfile
#Set-NetConnectionProfile -InterfaceIndex 6 -NetworkCategory Private