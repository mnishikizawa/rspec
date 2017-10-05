require "spec_helper"

describe 'Check SSL Certificate remaining days' do
  it 'should greater than 2 years - 730 days' do
    expire = command("date +\"%s\" --date=\"`openssl s_client -connect localhost:443 -servername example.com </dev/null 2>/dev/null | openssl x509 -enddate -noout | cut -d\'=\' -f2`\"").stdout.to_i
    today = command("date +\"%s\"").stdout.to_i
    expect(expire - today).to be > 63158400
  end
end
