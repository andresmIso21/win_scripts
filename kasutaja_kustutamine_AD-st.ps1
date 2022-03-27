#Loeme andmed
$firstname = Read-Host "Palun sisesta kasutaja eesnimi"
$lastname = Read-Host "Palun sisesta kasutaja perekonnanimi"

#Vormindame andmed
$username = $firstname + "." + $lastname
$username = $username.ToLower()
$username = Translit($username)

#Viime kasu ellu, informeerime kasutajat
$displayname = $firstname + "." +$lastname

    if (Get-ADUser -F {SamAccountName -eq $username})
        
        {
            Remove-ADUser -Identity $username
                echo "Kasutaja $displayname on edukalt eemaldatud."
        }
        else
        {
            Write-Warning "Kasutaja eemaldamine ebaonnestus - konto kas puudub voi siis tekkis muu probleem eemaldamisel. Proovi uuesti"
        }
#Konverdime tahti
function Translit {
       param(
        [string] $inputString
    )
    #Defineerime kuidas tahti konvertida
        $Translit = @{
        [char]'ä' = "a"
        [char]'õ' = "o"
        [char]'ü' = "u"
        [char]'ö' = "o"
        }

        $outputString = ""
        foreach ($character in $inputCharacter = $inputString.ToCharArray())
        {
            if ($Translit[$character] -cne $Null)
                {
                $outputString += $Translit[$character]
                }
            else {
                $outputString += $character
                 }
        }
            Write-Output $outputString
}    