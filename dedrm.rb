cask 'dedrm' do
  version '6.5.5'
  sha256 'c112a3bd1d56cb24cddf0cf280bd3f7d49f8b1a50507c100681aa9c098eac19e'

  url "https://github.com/apprenticeharper/DeDRM_tools/releases/download/v#{version}/DeDRM_tools_#{version}.zip"
  appcast 'https://github.com/apprenticeharper/DeDRM_tools/releases.atom'
  name 'DeDRM'
  homepage 'https://apprenticealf.wordpress.com/'

  app 'DeDRM_Macintosh_Application/DeDRM.app'
end
