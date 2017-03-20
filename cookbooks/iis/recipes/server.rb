powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name Web-Server).Installed"
end

#template 'C:\inetpub\wwwroot\default.htm' do
#  source 'default.htm.erb'
#end

file 'c:\inetpub\wwwroot\default.htm' do
  content "<h1>Hello, world!</h1>
    <h2>ipaddress: #{node['ipaddress']}</h2>
    <h2>hostname: #{node['hostname']}</h2>
    <h2>total memory: #{node['memory']['total']}</h2>
    <h2>CPU Mhz: #{node['cpu']['0']['mhz']}</h2>"
end

service 'w3svc' do
  action [:enable, :start]
end
