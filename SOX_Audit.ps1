#This script is for gathering the permissions on the specified folder for the SOX report.#

cd C:\

$folder = read-host "Enter yyyymmdd: "


#This section creates the folder and subfolder for the bi-weekly report#

New-Item -Path \\File_Server\Filelist$\IT_Folder\procedures\Security_audit\Year\$folder_1 -ItemType directory
Pause

New-Item -Path \\File_Server\Filelist$\IT_Folder\procedures\Security_audit\Year\$folder_1\Dev_Access -ItemType directory
Pause


#This section gathere the permissions for the files in the specified folders and creates individual reports for each folder.#

Get-Acl \\File_Server\Test$\production\system\*.* | Format-list > \\File_Server\Filelist$\IT_Folder\procedures\Security_audit\Year\$folder_1\Dev_Access\System_Folder.txt
Get-Acl \\File_Server\Test$\production\system\Apps\*.* | Format-list > \\File_Server\Filelist$\IT_Folder\procedures\Security_audit\Year\$folder_1\Dev_Access\Apps_Folder.txt
Get-Acl \\File_Server\Test$\production\system\Corresp\*.* | Format-list > \\File_Server\Filelist$\IT_Folder\procedures\Security_audit\Year\$folder_1\Dev_Access\Corresp_Folder.txt
Pause


#This section combines the seperate reports into one report.#

Get-Content \\File_Server\Filelist$\IT_Folder\procedures\Security_audit\Year\$folder_1\Dev_Access\System_Folder.txt | Out-file -append \\File_Server\Filelist$\IT_Folder\procedures\Security_audit\Year\$folder_1\Dev_Access.txt
Get-Content \\File_Server\Filelist$\IT_Folder\procedures\Security_audit\Year\$folder_1\Dev_Access\Apps_Folder.txt | Out-file -append \\File_Server\Filelist$\IT_Folder\procedures\Security_audit\Year\$folder_1\Dev_Access.txt
Get-Content \\File_Server\Filelist$\IT_Folder\procedures\Security_audit\Year\$folder_1\Dev_Access\Corresp_Folder.txt | Out-file -append \\File_Server\Filelist$\IT_Folder\procedures\Security_audit\Year\$folder_1\Dev_Access.txt
Pause