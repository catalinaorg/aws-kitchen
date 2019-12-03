describe package('nginx') do
  it { should be_installed }
end

describe package('wget') do
  it { should be_installed }
end
