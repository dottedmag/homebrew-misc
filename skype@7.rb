cask 'skype@7' do
  version '7.58.501'
  sha256 '14dfca8f79f35b4c994c11d3a514b2d7537640803c72d1b18dc8631e80db515a'

  url "file:///fromcache/skype-#{version.dots_to_hyphens}.dmg"
  name 'Skype'
  homepage 'https://skype.com/'

  app 'Skype.app'

  zap delete: [
                '~/Library/Caches/com.plausiblelabs.crashreporter.data/com.skype.skype',
                '~/Library/Caches/com.skype.skype',
                '~/Library/Saved Application State/com.skype.skype.savedState',
              ],
      trash:  [
                '~/Library/Application Support/Skype',
                '~/Library/Preferences/com.skype.skype.plist',
                '~/Library/Preferences/com.skype.skypewifi.plist',
              ]
end
