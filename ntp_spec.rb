require "spec_helper"

describe "Check time syncronization" do
  it "system time is synchronized" do
     output = command("ntpstat").stdout
     expect(output).to match(/\Asynchronised/)
  end

  it "offset should be small" do
     offset = command("ntpq -p |grep '^\*' |awk '{print $8}'").stdout.to_i
     expect(offset).to be <= 100
  end
end
