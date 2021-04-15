function Initial {
    $module_name = $args[0]
    if ( $null -eq $module_name ) {
        Write-Host "Yout go module will be named 'init'"
        $module_name = 'init'
    }
    go mod init $module_name
    go get github.com/labstack/echo/v4
    go get github.com/labstack/echo/v4/middleware
}

#Checks if go.sum file exists. If it exists, this means installation already finished. It will simply run the server.
if ( $(Test-Path go.sum) -ne $true) {
    Write-Host "Setting up."
    Initial
}

#Run the server
go run .
