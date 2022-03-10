$kasutajaParool = ConvertTo-SecureString "qwerty" -AsPlainText -Force

New-LocalUser "kasutaja1" -Password $kasutajaParool -FullName "Esimene Kasutaja" -Description - "Local Acount - kasutaja1" 
