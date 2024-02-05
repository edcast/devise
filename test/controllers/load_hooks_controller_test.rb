# frozen_string_literal: true

require 'test_helper'

class LoadHooksControllerTest < ActionController::TestCase
  setup do
    ActiveSupport.on_load(:devise_controller) do
      define_method  :defined_by_load_hook do
        puts 'I am defined dynamically by activesupport load hook'
      end
    end
  end

  test 'load hook called when controller is loaded' do
    assert_includes DeviseController.instance_methods, :defined_by_load_hook
  end
end
