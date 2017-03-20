powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name Web-Server).Installed"
end

template 'C:\inetpub\wwwroot\default.htm' do
  source 'default.htm.erb'
end

service 'w3svc' do
  action [:enable, :start]
end
