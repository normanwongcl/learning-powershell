# Install
```
git clone 
```

# Run script in the background
```ps1
# Keep the script running in the background, don't throw away script when it is done executing
. ./script.ps1
```

# Usage
```ps1
# Run the help command to see the parameters the functions accept
Get-help listChildFolder
Get-help compareTwoFiles
```

# Test script
```ps1
# Test listChildFolder
listChildFolder
listChildFolder -folderPath "test\test2"

# Test empty folder
listChildFolder -folderPath "test\test1"
listChildFolder -folderPath "test\test2\test3"

# Test error handling
listChildFolder -folderPath "test3"

# -----------------

# Test compareTwoFiles, same file size
compareTwoFiles .\test\big_file.txt .\test\big_file.txt

# Test which file is bigger
compareTwoFiles .\test\big_file.txt .\test\small_file.txt
compareTwoFiles .\test\small_file.txt .\test\big_file.txt

# Test error handling
compareTwoFiles .\test4\small_file.txt .\test5\big_file.txt
```

# Clean up script
```ps1
# Remove the script running in the background
Remove-Item Function:\listChildFolder
Remove-Item Function:\compareTwoFiles
```