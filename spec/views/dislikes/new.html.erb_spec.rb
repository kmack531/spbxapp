require 'spec_helper'

describe "dislikes/new" do
  before(:each) do
    assign(:dislike, stub_model(Dislike,
      :comment_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new dislike form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dislikes_path, :method => "post" do
      assert_select "input#dislike_comment_id", :name => "dislike[comment_id]"
      assert_select "input#dislike_user_id", :name => "dislike[user_id]"
    end
  end
end
