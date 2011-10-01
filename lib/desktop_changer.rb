class DesktopChanger
  class << self
    def change(image)
      system(%Q{/usr/bin/osascript <<END
tell application "Finder"
  set pFile to POSIX file "#{image}" as string
  set desktop picture to file pFile
end tell
END})
    end
  end
end