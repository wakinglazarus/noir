require "../../src/detector/detectors/*"

describe "Detect JS Express" do
  options = default_options()
  instance = DetectorJsExpress.new options

  it "require_single_quot" do
    instance.detect("index.js", "require('express')").should eq(true)
  end
  it "require_double_quot" do
    instance.detect("index.js", "require(\"express\")").should eq(true)
  end
end
