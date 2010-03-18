require 'test_helper'

class DemoTest < ActiveSupport::TestCase

  test "should validate" do
    demo_with_no_name = Factory.build(:demo, :name => '')
    demo_with_no_description = Factory.build(:demo, :description => '')
    demo_with_no_url = Factory.build(:demo, :url => '')
    demo_with_bad_url = Factory.build(:demo, :url => 'ss')
    demo_with_too_long_name = Factory.build(:demo, :name => 'Za długa nazwa dema. 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111' )
    
    assert !demo_with_no_name.save, "Zapisano demo bez nazwy"
    assert !demo_with_no_description.save, "Zapisano demo bez opisu"
    assert !demo_with_no_url.save, "Zapisano demo bez adresu URL"
    assert !demo_with_bad_url.save, "Zapisano demo z błędnym adresem URL"
    assert !demo_with_too_long_name.save, "Zapisano demo ze zbyt długą nazwą"
  end
end
