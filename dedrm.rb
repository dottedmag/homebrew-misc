cask 'dedrm' do
  version '6.6.0'
  sha256 '30bfdf68cc031541ac253c5a01c318c2f357d09ad88d4f5a63f9f42f8563d200'

  url "https://github.com/apprenticeharper/DeDRM_tools/releases/download/v#{version}/DeDRM_tools_#{version}.zip"
  appcast 'https://github.com/apprenticeharper/DeDRM_tools/releases.atom'
  name 'DeDRM'
  homepage 'https://apprenticealf.wordpress.com/'

  app 'DeDRM_Macintosh_Application/DeDRM.app'
end
