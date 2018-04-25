Pod::Spec.new do |s|
  s.name         = 'ALSystemUtilities'
  s.version      = '1.3.5'
  s.license      = {
        :type => 'MIT',
        :file => 'LICENSE'
    }
  s.homepage     = 'https://github.com/xiaolouxinyue/ALSystemUtilities'
  s.author            = {
        'Andrea Lufino' => 'andrea.lufino@me.com',
        'Jaym' => 'ywjiang1124@163.com'
    }
  s.summary      = 'Get every kind of info about your device'

# Source Info
  s.platform     =  :ios, '6.1'
  s.source            = {
        :git => 'https://github.com/xiaolouxinyue/ALSystemUtilities.git',
        :tag => s.version
    }
  s.source_files = 'ALSystemUtilities/ALSystemUtilities/**/*.{h,m}'
  s.requires_arc = true
  s.resources = 'ALSystemUtilities/ALSystemUtilities/Resources/**/*.{plist}'

  s.frameworks    =  'AudioToolbox','CFNetwork','CoreTelephony','ExternalAccessory','Security','SystemConfiguration','CoreGraphics','CoreFoundation','Foundation'
  
  non_arc_files = 'ALSystemUtilities/ALSystemUtilities/Reachability/Reachability.h','ALSystemUtilities/ALSystemUtilities/Reachability/Reachability.m'
  s.exclude_files = non_arc_files
  s.subspec 'no-arc' do |sna|
    sna.requires_arc = false
    sna.source_files = non_arc_files
  end
  
# Pod Dependencies

end
