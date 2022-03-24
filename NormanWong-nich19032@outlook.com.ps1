<#
.SYNOPSIS
  Script to list folders in a directory and compare the file size of 2 file. 
#>

# List all the folders in a directory
function listChildFolder  {
    [CmdletBinding()]
    param(
        [String]$folderPath="."
    )

    try {
        # If there is no folder in the directory, return "Folder empty"
        if ((Get-ChildItem -Path $folderPath -Directory -Recurse -ErrorAction Stop | Measure-Object).count -eq 0) {
            return "Folder empty"
        }

        # Return the list of folders in the directorys
        return Get-ChildItem -Path $folderPath -Directory -Recurse -Name -ErrorAction Stop | Sort-Object LastWriteTime -Descending 
    } catch {
        return  "Error: " + $_.Exception.Message
    }
}

# Compare the file size of 2 files
function compareTwoFiles {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [String]$firstFilePath,
        [Parameter(Mandatory=$true)]
        [String]$secondFilePath
    )

    try {
        # Storing the commands in variables to make the code more readable
        $firstFile = Get-Item -Path $firstFilePath -ErrorAction Stop
        $secondFile = Get-Item -Path $secondFilePath -ErrorAction Stop

        # Compare the file size of firstFilePath and secondFilePath
        if (($firstFile).Length -eq ($secondFile).Length) {
            return "File size is the same"
        }

        # Return the filename of the bigger file
        if (($firstFile).Length -gt ($secondFile).Length) {
            return "File 1 is bigger"
        } 

        return "File 2 is bigger"
    } catch {
        return "Error: " + $_.Exception.Message
    }
}