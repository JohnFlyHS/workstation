describe port(80) do
  it { should be_listening }
end

describe http('http://localhost') do
  its('status') { should eq 200 }
end
