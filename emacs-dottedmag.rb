cask "emacs-dottedmag" do
  version "28.2"
  sha256 "6228b41938ad3ef76450c843a510615b07f8058bc9a256d1ff3fbf928a384235"

  url "https://emacsformacosx.com/emacs-builds/Emacs-#{version}-universal.dmg"
  name "Emacs"
  desc "Text editor"
  homepage "https://emacsformacosx.com/"

  livecheck do
    url "https://emacsformacosx.com/atom/release"
    regex(%r{href=.*?/Emacs[._-]v?(\d+(?:\.\d+)*(?:-\d+)?)[._-]universal\.dmg}i)
  end

  conflicts_with cask:    [
                   "homebrew/cask/emacs",
                   "homebrew/cask-versions/emacs-nightly",
                   "homebrew/cask-versions/emacs-pretest",
                 ],
                 formula: "emacs"

  preflight do
    ti = "/Applications/kitty.app/Contents/Resources/kitty/terminfo"
    e = "#{staged_path}/Emacs.app"
    id = "C9DC2E6FCB8F02C93AFCDB43145B33F85DEE45D7"
    system_command "/usr/bin/plutil",
                   args: [
                     "-insert", "LSEnvironment",
                     "-dictionary",
                     e+"/Contents/Info.plist",
                   ]
    system_command "/usr/bin/plutil",
                   args: [
                     "-insert", "LSEnvironment.TERMINFO",
                     "-string", ti,
                     e+"/Contents/Info.plist",
                   ]
    system_command "/usr/bin/codesign", args: ["--remove-signature", e]
    system_command "/usr/bin/codesign", args: ["--sign", id, e]
  end

  app "Emacs.app"
  binary "#{appdir}/Emacs.app/Contents/MacOS/Emacs", target: "emacs"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/ebrowse"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/emacsclient"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/etags"
  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/ebrowse.1.gz"
  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/emacs.1.gz"
  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/emacsclient.1.gz"
  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/etags.1.gz"

  zap trash: [
    "~/Library/Caches/org.gnu.Emacs",
    "~/Library/Preferences/org.gnu.Emacs.plist",
    "~/Library/Saved Application State/org.gnu.Emacs.savedState",
  ]
end
