require "../src/utils/*"

describe "remove_start_slash" do
  it "with slash" do
    remove_start_slash("/abcd/1234").should eq("abcd/1234")
  end
  it "without slash" do
    remove_start_slash("abcd/1234").should eq("abcd/1234")
  end
end

describe "get_symbol" do
  it "get" do
    get_symbol("GET").should eq(:get)
  end
  it "post" do
    get_symbol("POST").should eq(:post)
  end
  it "put" do
    get_symbol("PUT").should eq(:put)
  end
  it "delete" do
    get_symbol("DELETE").should eq(:delete)
  end
  it "head" do
    get_symbol("HEAD").should eq(:head)
  end
  it "options" do
    get_symbol("OPTIONS").should eq(:options)
  end
  it "trace" do
    get_symbol("TRACE").should eq(:trace)
  end
  it "connect" do
    get_symbol("CONNECT").should eq(:connect)
  end
  it "patch" do
    get_symbol("PATCH").should eq(:patch)
  end
end

describe "str_to_bool" do
  it "yes" do
    str_to_bool("yes").should eq(true)
  end
  it "no" do
    str_to_bool("no").should eq(false)
  end
  it "any string" do
    str_to_bool("hahwul").should eq(false)
  end
end
