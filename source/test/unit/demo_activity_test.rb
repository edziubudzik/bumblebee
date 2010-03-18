require 'test_helper'

class DemoActivityTest < ActiveSupport::TestCase
  
  test "should validate" do
    assert !Factory.build(:demo_activity, :url => '').save, "Zapisano aktywność bez adresu URL"
    assert !Factory.build(:demo_activity, :url => 'ss').save, "Zapisano aktywność z błędnym adresem URL"
    assert !Factory.build(:demo_activity, :method => '').save, "Zapisano aktywnośc bez metody"
    assert !Factory.build(:demo_activity, :method => 'aa').save, "Zapisano aktywnośc z błędną metodą"
    assert Factory.build(:demo_activity, :method => 'get').save, "Nie zapisano aktywności z poprawną metodą"
    assert Factory.build(:demo_activity, :method => 'post').save, "Nie zapisano aktywności z poprawną metodą"
    assert Factory.build(:demo_activity, :method => 'put').save, "Nie zapisano aktywności z poprawną metodą"
    assert Factory.build(:demo_activity, :method => 'delete').save, "Nie zapisano aktywności z poprawną metodą"
  end
end
