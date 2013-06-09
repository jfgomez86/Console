on run argv
  tell application "iTerm"
    activate

    tell current terminal

      tell the last session
        write text "p " & item 1 of argv
        write text "guard"
      end

      launch session "Default"
      tell the last session
        write text "p " & item 1 of argv
      end

      launch session "Default"
      tell the last session
        write text "p " & item 1 of argv
        write text "rails c"
      end

      launch session "Default"
      tell the last session
        write text "p " & item 1 of argv
      end

      launch session "Default"
      tell the last session
        write text "p " & item 1 of argv
        write text "tail -f log/development.log"
      end

      select second session
    end tell

  end tell
end run
