require 'fileutils'

RELEASE_DIR = './Release'
BACKUP_DIR = './ReleaseBackup'

if File.directory?(BACKUP_DIR)
  # A previous compilation was interrupted (process killed) after the backup step: the backup
  # still holds the user saves, while Release is a partial build. Keep the backup, drop Release.
  FileUtils.rm_rf(RELEASE_DIR)
  STDERR.puts "Kept #{BACKUP_DIR} from an interrupted compilation, removed the partial #{RELEASE_DIR}"
  puts "Previous Release backup kept (interrupted compilation)."
elsif File.directory?(RELEASE_DIR)
  File.rename(RELEASE_DIR, BACKUP_DIR)
  STDERR.puts "Renamed #{RELEASE_DIR} to #{BACKUP_DIR}"
  puts "Release folder backed up successfully."
else
  STDERR.puts "No existing Release folder, nothing to back up"
  puts "No previous Release to back up."
end
