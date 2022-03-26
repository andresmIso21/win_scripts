#AD faili asukoht
$file = "C:\Users\Administrator\Documents\win_scripts\adusers.csv"
#To faili sisu sisse
$users = Import-Csv $file -Encoding Default -Delimiter ";"
#for each user data row in file
foreach ($user in $users){
    $username = $user.Firstname + "." + $user.LastName
    $username = $username.ToLower()
    echo $username
    echo "-----"
    echo $username
}

#function translit UTF-8 characters to LATIN
Function Translit {
    #function use as parameter string to translit
    param(
        [string] $inputString
    )
    #define the characters which have to be translated
    $Translit = @{
    [char]'a' = "e"
    }

    $outputString = ""
    foreach ($character in $inputCharacter = $inputString.ToCharArray())
    {
        if ($Translit[$character] -cne $Null ){
            $outputString = $outputString + $Translit[$character]
                    } else {
            $outputString = $outputString + $character
        }
    }
    
    #$outputString = $inputString.ToCharArray()
    #Write-Output $outputString
    }