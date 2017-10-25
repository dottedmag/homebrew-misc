cask 'fb2mobi' do
  version '3.6.40'
  sha256 '591fe505cbc7ba19a536a7c223de7bbeb65a0189ffa3c529953497b1f768f2c1'
  url "https://github.com/rupor-github/fb2mobi/releases/download/#{version}/fb2mobi_mac.dmg"
  appcast 'https://github.com/rupor-github/fb2mobi/releases.atom'

  name 'fb2mobi'
  homepage 'https://github.com/rupor-github/fb2mobi'

  app 'fb2mobi.app'
  binary '../../../../../Applications/fb2mobi.app/Contents/MacOS/fb2mobi'
end
