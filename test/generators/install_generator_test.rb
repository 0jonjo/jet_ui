# frozen_string_literal: true

require 'test_helper'
require 'generators/jet_ui/install/install_generator'

class InstallGeneratorTest < Minitest::Test
  def test_desc_includes_gem_overview
    assert_match(/ViewComponent/, JetUi::Generators::InstallGenerator.desc)
  end

  def test_desc_includes_pointer_to_eject_help
    assert_match(/jet_ui:eject/, JetUi::Generators::InstallGenerator.desc)
  end

  def test_desc_includes_component_count
    assert_match(/\d+ /, JetUi::Generators::InstallGenerator.desc)
  end
end
