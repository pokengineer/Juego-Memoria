Param(  [parameter(Mandatory = $true)] 
    [validateLength(1, 255)]
    [string] $path ,
    [parameter(Mandatory = $true)] 
    [validateLength(1, 255)]
    [string] $pathpuntaje
)
function salir {
    param( [int]$puntaje )
    Clear-Host
    Write-Output "Gracias por jugar,`n su puntaje final es: $puntaje"
    $nombre = Read-Host = "`n Ingresa Tu nombre: "
    $obj = [PSCustomObject]@{
        nombre = $nombre
        puntuacion = $puntaje
    }
    [PSObject[]]$lista = Import-Csv -Path $pathpuntaje                                                                                              #Es importante castearlo como Array porque sino powershell asume que es un objeto
    $lista += $obj                                                                                                                                  #Agrego el jugador actual
    $lista| Sort-Object -Property puntuacion  -Descending | Format-Table                                                                            #Se Muestra por pantalla el ranking + el jugador recien ingresado
    $lista | Sort-Object -Property puntuacion  -Descending | Select-Object -First 3  | Export-Csv -Force -Path $pathpuntaje -NoTypeInformation      #Solamente se guarda el TOP 3
    write-host "`n`n Press any key to continue..."
    [void][System.Console]::ReadKey($true)
    exit 1;
}

if ( -not (Test-Path -path $path) -or -not (Test-Path -path $pathpuntaje) ) {
    Write-Error 'Path Invalido'
    return;
}

Clear-Host
$palabras = Get-Content $path
[int[]]$numeros = @();
$numeros += Get-Random  -Maximum $palabras.count
for ( $i = 0 ; ; $i++ ) {
    Write-Output "palabas a recordar:"
    Write-Output $palabras[$numeros[0..$i]]
    Write-Output `n
    $numeros += Get-Random  -Maximum $palabras.count
    Start-Sleep -s 3
    Clear-Host
    $stopwatch =  [system.diagnostics.stopwatch]::StartNew()
    Write-Output "Ingresar palabras ahora:"
    for ($j = 0 ; $j -le $i ; $j++ ) {
        $input = Read-Host
        if ($input -ne $palabras[$numeros[$j]] -or $stopwatch.Elapsed.TotalSeconds -gt 10) {
            salir $i
            $stopwatch.Stop()
        }
    }
    $stopwatch.Stop()
    Clear-Host
}

<#
.SYNOPSIS
Juego de Memoria

.DESCRIPTION
Juego similar a Simon dice pero con palabras tomadas de un archivo de texto. 
se deberan ingresar las palabras mostradas en el mismo orden que aparecen, si se tarda mas de 10 segundos en escribir una palabra o se ingresa la palabra incorrecta, el juego acaba.

.NOTES
Es necesario para ingresar el juego ingresar la direccion de las palabras y los puntajes

.LINK
https://github.com/pokengineer

#>