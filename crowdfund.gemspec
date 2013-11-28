Gem::Specification.new do |s|
  s.name                  = "crowdfund"
  s.version               = "1.0.0"
  s.author                = "Adam89"
  s.email                 = "adam.dev89@gmail.com"
  s.summary               = "Allows you to store fundraising events locally"
  s.description           = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.homepage              = "http://aspiring-programmer.herokuapp.com/"

  s.files                 = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files            = Dir["spec/**/*"]
  s.executables           = ['crowdfund']

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end
