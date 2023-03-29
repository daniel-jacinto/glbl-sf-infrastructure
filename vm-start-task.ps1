# Set the URL of the Python download page
$pythonUrl = "https://www.python.org/downloads/"

# Use Invoke-WebRequest to download the Python download page
$page = Invoke-WebRequest -Uri $pythonUrl

# Use regular expressions to extract the download link for the latest version of Python
$pattern = 'href="(https://www.python.org/ftp/python/\d\.\d\.\d/python-\d\.\d\.\d[^"]+amd64.exe)"'
$downloadLink = ($page.Content | Select-String -Pattern $pattern).Matches.Groups[1].Value

# Download the Python installer to the current directory
Invoke-WebRequest -Uri $downloadLink -OutFile "python-installer.exe"
