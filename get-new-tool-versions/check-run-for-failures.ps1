param (
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [System.Uri]$Uri
)

$failedJobs = (Invoke-RestMethod -Uri $Uri).jobs |
    Where-Object conclusion -eq "failure" |
    ForEach-Object {$_.name.split(",")[0].split("(")[-1] + ": $($_.html_url)"}

return $failedJobs