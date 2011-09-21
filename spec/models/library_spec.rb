require "spec_helper"

describe Library do
  it "should import library from remote source" do
    json = File.read(Rails.root.join('spec/support/ivans_library.json'))
    RestClient.stubs(:get).returns(json)

    library = Library.create! :url => 'http://localhost:1337', :name => 'test_local', :online => true
    lambda {
      library.import
    }.should change(Track, :count)

    library.songs.count.should == 1201
  end
end