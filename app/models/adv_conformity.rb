module AdvConformity
  TYPE_CONFORMITY = lambda {
    YAML::load(File.open("#{Rails.root}/lib/other/adv_conformity.yml"))
  }.call

  ATTR_VISIBILITY = lambda {
    YAML::load(File.open("#{Rails.root}/lib/other/attr_visibility.yml"))
  }.call

end
