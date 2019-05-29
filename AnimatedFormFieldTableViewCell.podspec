Pod::Spec.new do |s|
  s.name             = 'AnimatedFormFieldTableViewCell'
  s.version          = '1.0.0'
  s.summary          = 'UITextField Implementation with built in placeholder scaling animation'
  s.description      = <<-DESC
The AnimatedFormFieldTableViewCell allows you to implement a UITableViewCell with an embedded UITextField that automatically scales the textfield's placeholder upon user interaction.
                       DESC
  s.homepage         = 'https://github.com/intuit/AnimatedFormFieldTableViewCell'
  s.screenshots      = 'https://camo.githubusercontent.com/b149a9177c5c4448dcb15dddd7e54b9063f2aa34/687474703a2f2f692e696d6775722e636f6d2f464d6654434d542e676966'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ido Zaltzberg' => 'zaltzy@gmail.com' }
  s.source           = { :git => 'https://github.com/intuit/AnimatedFormFieldTableViewCell.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'AnimatedFormFieldTableViewCell/*'
  s.swift_version = '5.0'
end
