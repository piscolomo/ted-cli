require File.expand_path("../lib/ted_cli", File.dirname(__FILE__))

scope do
  test "configuring the api key" do
    TedCli.api_key = "mi-api-key"
    assert_equal TedCli.api_key, "mi-api-key"
  end
end