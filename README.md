# Frame-Cycle

A simple Linux wallpaper rotator that changes your desktop background based on the time of day.

## Overview
- Automatically selects wallpapers based on the current time (morning, afternoon, evening, night)
- Supports multiple desktop environments: GNOME, Cinnamon, MATE, XFCE
- Falls back to `feh` for window managers without built-in wallpaper support

## Requirements
- Bash
- Desktop environment support or `feh` (install with `sudo apt install feh` on Debian-based systems)
- Four wallpaper images named exactly as specified (for now)

## Installation

### File Placement
1. Place the script in your preferred location:
   ```
   /path/to/Frame-Cycle/Frame-Cycle-Linux.sh
   ```

2. Create a Wallpapers directory and add your images:
   ```
   mkdir -p ~/Pictures/Wallpapers/
   ```

3. Place your wallpaper images in the directory with these exact names:
   ```
   ~/Pictures/Wallpapers/morning.jpg
   ~/Pictures/Wallpapers/afternoon.jpg
   ~/Pictures/Wallpapers/evening.jpg
   ~/Pictures/Wallpapers/night.jpg
   ```

### Setup
1. Make the script executable:
   ```bash
   chmod +x /path/to/Frame-Cycle/Frame-Cycle-Linux.sh
   ```

2. Add a cron job to run the script every 30 minutes:
   ```bash
   (crontab -l 2>/dev/null; printf "*/30 * * * * /path/to/Frame-Cycle/Frame-Cycle-Linux.sh\n") | crontab -
   ```
   
   > **Important**: Replace `/path/to/Frame-Cycle/Frame-Cycle-Linux.sh` with the actual path to the script on your system.
   
   > **Note**: If your path contains spaces, you should either:
   > - Move the script to a path without spaces
   > - Escape spaces in the path with backslashes
   > - Create a symlink in a space-free location

## Uninstallation

### Remove the Cron Job
To remove only the Frame-Cycle cron entry:
```bash
crontab -l 2>/dev/null | grep -v 'Frame-Cycle-Linux.sh' | crontab -
```

Or to remove all cron jobs (use with caution):
```bash
crontab -r
```

### Remove the Files
```bash
rm /path/to/Frame-Cycle/Frame-Cycle-Linux.sh
rm ~/Pictures/Wallpapers/{morning.jpg,afternoon.jpg,evening.jpg,night.jpg}
```

## Troubleshooting
- Verify your desktop environment is supported or that `feh` is installed
- Run the script manually to check for errors:
  ```bash
  /path/to/Frame-Cycle/Frame-Cycle-Linux.sh
  ```
- Check your cron logs (system dependent) for any execution failures

## Future Enhancements
- [ ] KDE integration
- [ ] Dynamic naming scheme for wallpaper images
- [ ] PowerShell script for Windows support

