# Autorun-Linux
A simple shell script to make your scripts auto run at start-up in Linux environments.
# How to use:
1. Edit the Script:
- Open the script in a text editor.
- Replace
{YOURSCRIPT.sh}
with the actual name of the script you want to run. Ensure to remove the brackets.
- Replace
{YOUR_SVC_NAME}
with a unique service name that does not conflict with any existing service names on your system.
2. Save the Script.
3. Make the Script Executable:
- Open a terminal and navigate to the directory where your script is saved.
- Run the following command to make the script executable:
```
chmod +x autorun.sh
```     
4. Run the Script:
- Execute the script with superuser permissions by running:
```
sudo ./autorun.sh
```     
5. Verify the Service Creation:
- After running the script, you should see a success message indicating that the service has been created.
- To ensure it runs at startup, you can reboot your system and check the service status again.

# Important Notes:
- Ensure that the script you are trying to run (
YOURSCRIPT.sh
) is located in the same directory as this autorun script, or adjust the path accordingly.
- The script will run as the root user, so ensure that it does not contain any commands that could harm your system or compromise security.

