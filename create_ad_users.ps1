#Anname asukoha kus asub fail kasutajate andmetega
$file = "C:\Users\Administrator\Documents\win_scripts\adusers.csv"
#Toome faili sisu sisse
$users = Import-Csv $file -Encoding Default -Delimiter ";"
#TViime kasu ellu, informeerime kasutajat
foreach ($user in $users){
    $username = $user.Firstname + "." + $user.LastName
    $username = $username.ToLower()
    $username = Translit($username)
    $upname = $username + "@sv-kool.local"
    $displayname = $user.Firstname + " " + $user.LastName
    if (Get-ADUser -F {SamAccountName -eq $username})
        {
            Write-Warning "Kasutaja $username kontot ei saanud luua kuna see juba eksisteerib. Palun anna unikaalsed andmed"
        }
        else
        {
        New-ADUser -Name $username `
        -DisplayName $displayname
        -GivenName $user.FirstName
        -Title $user.Role`
        -Surname $user.LastName`
        -Department $user.Department`
        -UserPrincipalName $upname`
        -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -force) -Enabled $true
        echo "Uue kasutaja $username konto lisatud edukalt!"
        }
}

#funktioon translit UTF-8 tahed ladina tahtedeks
function Translit {
       param(
        [string] $inputString
    )
    #define the characters which have to be translated
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
        