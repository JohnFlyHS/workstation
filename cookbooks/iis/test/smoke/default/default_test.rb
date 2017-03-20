describe port(80) do
  it(should_be_listening)
end

describe command('(Invoke-WebRequest -UseBasicParsing localhost).Content') do
  its(:stdout) { should match /Hello, world!/ }
end
