# HP Color LaserJet Pro M254dw Firmware Downgrade

This repository contains the `20200612` firmware for the HP M254dw printer. Downgrading to this version is often necessary to re-enable the use of 3rd party (non-HP) toner cartridges that have been blocked by newer HP firmware updates.

## ⚠️ Disclaimer
**WARNING:** Flashing firmware can potentially brick your printer. Use this at your own risk. Ensure the printer is not interrupted or powered off during the update process.

## Mandatory Prerequisites: Printer Configuration
Before proceeding with the firmware downgrade, the printer settings **must** be set as follows in the **Manage Updates** menu.

### Required Settings
- **Allow Downgrade:** Yes
- **Check Automatically:** Off
- **Allow Updates:** Yes

### Navigation Steps

#### For Touchscreen Control Panels:
1. From the Home screen, scroll to and select **Setup**.
2. Scroll to and select the **Service** menu.
3. Scroll to and select **LaserJet Update** (Press 'Next' to clear any messages).
4. Select **Manage Updates**.
5. Configure the following:
   - Select **Allow Downgrade** -> Select **Yes**.
   - Select **Check Automatically** -> Select **Off**.
   - Select **Allow Updates** -> Select **Yes**.

#### For 2-Line Control Panels:
1. Use the right arrow to scroll to **Service** and select **OK**.
2. Scroll to **LaserJet Update** and select **OK**.
3. Scroll to **Manage Updates** and select **OK**.
4. Configure the following:
   - Scroll to **Allow Downgrade** -> Select **OK** -> Scroll to **Yes** -> Select **OK**.
   - Scroll to **Check Automatically** -> Select **OK** -> Scroll to **Off** -> Select **OK**.
   - Scroll to **Allow Updates** -> Select **OK** -> Scroll to **Yes** -> Select **OK**.

---

## Installation Method: Windows (USB Connection)
This method involves sharing the printer locally via PowerShell and copying the firmware binary to the shared print queue.

### Step 1: Identify your Computer Name
Open PowerShell and run:
```powershell
$env:COMPUTERNAME
```
Take note of the output (e.g., `DESKTOP-ABC1234`).

### Step 2: Share the Connected Printer
Before sharing, confirm your printer's exact name by running:
```powershell
Get-Printer | Select-Object Name
```

Once you have the name (e.g., `HP ColorLaserJet M253-M254`), run the following as **Administrator** to share it:
```powershell
Set-Printer -Name "YOUR-PRINTER-NAME" -Shared $true -ShareName "HPLaserJet"
```

### Step 3: Send the Firmware File
Run the following command in PowerShell or Command Prompt (replace `YOUR-COMPUTER-NAME` with the name from Step 1):
```cmd
copy /b "HP_Color_Laser_Pro_M254_dw_Printer_series_20200612-2.rfu" "\\YOUR-COMPUTER-NAME\HPLaserJet"
```
The printer display should show "Programming" or "Erasing". **Do not interact with the printer or computer for about 5 minutes.** The printer will reboot automatically when finished.

### Step 4: Unshare the Printer
Once the update has started, you can stop sharing the printer:
```powershell
Set-Printer -Name "HP ColorLaserJet M253-M254" -Shared $false
```

---

## Post-Downgrade Configuration
**CRITICAL:** Once the downgrade is complete, you **MUST** return to the **Manage Updates** menu and disable updates to prevent the printer from re-installing the blocking firmware.

### For “Allow Updates” setting to be “No”:

#### Touchscreen Control Panel:
1. From the Home screen, scroll to and select **Setup**.
2. Scroll to and select the **Service** menu.
3. Scroll to and select **LaserJet Update**.
   - Press **Next** to clear any messages.
4. Select **Manage Updates**.
5. Select **Allow Updates**.
6. Select **No**.
7. Press the **Home** button to return to the Home screen.

#### 2-Line Control Panel:
1. Use the right arrow to scroll to **Service** and select **OK**.
2. Use the right arrow to scroll to **LaserJet Update** and select **OK**.
3. Use the right arrow to scroll to **Manage Updates** and select **OK**.
4. Use the right arrow to scroll to **Allow Updates** and select **OK**.
5. Use the right arrow to scroll to **No** and select **OK**.
6. Press the **Return Arrow** button multiple times to return to the Home screen.

## Verification
To verify the installation:
1. Print a **Configuration Page** from the printer's Reports menu.
2. Confirm the firmware datecode is `20200612`.

## Source
As HP has removed this firmware from their official support pages, it was retrieved from the Internet Archive (Wayback Machine):
[Archived Firmware Link (2020-11-10)](https://web.archive.org/web/20201110124329/http://ftp.hp.com/pub/networking/software/pfirmware/HP_Color_Laser_Jet_Pro_M254_dw_Printer_series_20200612.rfu)
