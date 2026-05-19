# frozen_string_literal: true

require 'test_helper'
require 'generators/jet_ui/eject/eject_generator'

class EjectGeneratorTest < Minitest::Test
  def test_component_descriptions_keys_match_manifest
    assert_equal JetUi::Generators::EjectGenerator::MANIFEST.keys.sort,
                 JetUi::Generators::EjectGenerator::COMPONENT_DESCRIPTIONS.keys.sort
  end

  def test_component_descriptions_are_non_empty_strings
    JetUi::Generators::EjectGenerator::COMPONENT_DESCRIPTIONS.each do |name, desc|
      assert_kind_of String, desc, "#{name}: description must be a String"
      refute_equal '', desc.strip, "#{name}: description must not be empty"
    end
  end

  def test_desc_includes_component_names_with_descriptions
    help = JetUi::Generators::EjectGenerator.desc

    JetUi::Generators::EjectGenerator::COMPONENT_DESCRIPTIONS.each_key do |name|
      assert_includes help, name
    end
  end

  def test_desc_includes_at_least_one_description_snippet
    help = JetUi::Generators::EjectGenerator.desc

    assert_match(/accordion\s+native/, help)
  end
end
