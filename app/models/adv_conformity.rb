module AdvConformity
  TYPE_CONFORMITY = lambda {
    YAML::load(File.open("#{Rails.root}/lib/other/adv_conformity.yml"))
  }.call

end
