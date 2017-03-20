file 'C:\hello.txt' do
  content 'Hello, world!'
  rights :read, 'Everyone'
  action :create
end
