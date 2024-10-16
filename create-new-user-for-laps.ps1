write-output "Name: create-new-user-for-laps.ps1"
write-output "Description: create a new user for laps with temporary random password"
write-output "Copyright (C) 2024  Ing. Akif Calhan"
write-output ""
write-output "This program is free software; you can redistribute it and/or modify it"
write-output "under the terms of the GNU General Public License as published by the"
write-output "Free Software Foundation; either version 3 of the write-output License, or (at"
write-output "your option) any later version."
write-output ""
write-output "This program is distributed in the hope that it will be useful, but"
write-output "WITHOUT ANY WARRANTY; without even the implied warranty of"
write-output "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU write-output"
write-output "General Public License for more details."
write-output ""
write-output "You should have received a copy of the GNU General Public License along"
write-output "with this program; if not, see http://www.gnu.org/licenses"
# Name of account 
$User = "lapsadmin"
# passwordlength
$size=30
# Check if user already exists
$existUser = Get-LocalUser -Name $User -ErrorAction SilentlyContinue
if (!$existUser) {
    # Create user account with temporary password & enabled
    # Generate a random password
    $password = (([char[]]"abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ1234567890!+@-""$%&/()=?{}" | get-random -Count $size) -join "") 
    # convert pwd to securestring
    $securePassword = ConvertTo-SecureString $password -AsPlainText -Force
    # create user
    New-LocalUser -Name $User -Password $securePassword -AccountNeverExpires -UserMayNotChangePassword -PasswordNeverExpires
    Enable-LocalUser -Name $User
    # write to host
    Write-Host "User '$User' created and enabled with temporary password."
    exit 0  # Exit code 0 > success
} else {
    Write-Host "User '$User' already exists. No remediation needed."
    exit 1  # Exit code 1 > failure
}
