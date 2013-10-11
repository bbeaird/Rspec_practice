require 'spec_helper'

describe "Library Object" do

  before :all do
    lib_arr = [
      Book.new("JavaScript: the Good Parts", "Douglas Crockford", :development),
      Book.new("Designing with Web Standards", "Jeffrey Zeldman", :design),
      Book.new("Don't Make me Think", "Steve Krug", :usability)
    ]

    File.open "books.yml", "w" do |f|
      f.write YAML::dump lib_obj
    end 
  end

  before :each do
    @lib = Library.new "books.yml"
  end

  describe "#new" do
    context "with no parameters" do
      it "has no books" do
        lib = Library.new
        lib.should have(0).books # lib.books.length.should == 0
      end
    end

    context "with a yaml file name parameter" do
      it "has 3 books" do
        @lib.should have(3).books
      end
    end
  end
end

# for another sample commit
