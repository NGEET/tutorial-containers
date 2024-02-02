Setting up your Docker desktop
==============================

1. Download the Docker Desktop Application
------------------------------------------
- This download will likely take 2-3 minutes and can be accessed at: https://docs.docker.com/get-docker/
- What is Docker Desktop? Docker Desktop "enables developers to locally build, share, and run containerized applications and microservices. Docker Desktop includes Docker Engine, Docker CLI client, Docker Build/BuildKit, Docker Compose, Docker Content Trust, Kubernetes, Docker Scan, and Credential Helper. Docker Desktop is for Mac and Windows and includes the Docker Dashboard for working with local and remote container images, Dev Environments and more new features are being delivered every month such as Volume Management."
- You can learn more about containers here: https://www.docker.com/resources/what-container/

2. Install Docker Desktop on Your Computer
------------------------------------------
- Open the Docker Desktop Installer that you downloaded. Note that this will require having administrative privileges on your computer.
- Windows users: When prompted, uncheck the box for "Use WSL 2 instead of hyper-V (recommended)"
- There will be a lot of code whizzing by as files are unpacked and the like
- Close the installation box when it is done
- This last step is for Windows users only. You will need to add your computer to the docker-users group. Do this by going to the search bar on your bottom taskbar and search/select "Windows PowerShell." The select this app by right-clicking and choosing "Run as administrator." In the terminal window that opens up, you will type the following code but you need to replace "ornl\vsi" with the appropriate details for your username and computer. The code below currently is for Verity's username (vsi) on her ORNL computer. To check what the structure for your specific PC is, click on the windows button in the bottom right hand corner. Select the gear symbol for settings. In the window that opens, select the "Your info" tab on the left-hand menu. You should see the information as part of your user profile. Don't forget to hit enter after you have put in the modified code in your terminal window!

.. code-block::

   net localgroup docker-users ornl\vsi /ADD

3. Open Docker Desktop and Modify Settings
------------------------------------------
- Open Docker Desktop
- Windows users: you will need to do this by right-clicking on the docker app and selecting "Run as administrator"
- Skip the Docker tutorial.
- Go to Settings by opening the gear symbol in the upper right hand corner of the Docker app
- Select the "Resources" tab on the left-hand menu
- Select "Filesharing" tab on the left-hand menu under "Advanced"
- Select the "+" symbol and add your computer's main drive here so Docker can access and write to your computer.
- Windows users: this will probably look like "C:\Users\username" where "username" is your local username on the computer
- Mac users: this will probably look like "/Users/username" where "username" is your local username on the computer
- All users: If you don't want to share your whole drive, you can also add only specific folders, e.g. "/Users/username/scratch"
- Hit the button "Apply and restart" in the bottom right hand corner of the window
- When you are done, the Resources file sharing table should look like one of the images below:

.. figure:: images/file_sharing_windows.png

      Windows users: your username & address should show up instead of vsi

.. figure:: images/file_sharing_macos.png

      Mac users: your username & address should show up instead of sserbin

- Note: If a directory containing your user directory is already in the list, there is no need to add the additional directory, and in fact Docker will ignore the new addition. For example, if /Users is in the list, then there is no need to add /Users/username because in that case Docker would have already been given access to directories within /Users.
- Hit the "X" on the top bar across from Settings to go back to the main Docker screen

.. figure:: images/setup_x.png

**Troubleshooting notes**: If Docker Desktop fails to start, you may need to uninstall and reinstall the program. A very common mistake for Windows users to is to forget to run with administrative privileges! This is an easy one to forget and even doing it once will muck things up for future runs. If this happens to you, the easiest thing to do is uninstall and reinstall Docker Desktop.

4. Defining Docker Volumes (2 options)
--------------------------------------
Option 1: Graphically

- In the Docker desktop app, select the "Volumes" tab on the left-hand menu
- Click the "Create (+)" button the upper right-hand corner
- In the popup window, name your volume elmdata and hit "Create"
- Make another volume called elmoutput

Option 2: Command Line

- Open a terminal window on your computer
- Windows users: do this by going to the search bar on your bottom taskbar and search/select "Windows PowerShell"
- Mac users: click the magnifying glass on the right side of the menu bar on top of the screen (to open Spotlight search) and type "Terminal", then open the Terminal program.
- In the terminal window type or copy and paste the following code into your terminal window and hit enter

.. code-block::

   docker volume create elmdata

- In the terminal window type or copy and paste the following code into your terminal window and hit enter

.. code-block::

   docker volume create elmoutput

5. Download ELM Docker Container
--------------------------------

6. Download meteorological data
-------------------------------

7. Download JupyterLab Docker container for analyzing ELM output
----------------------------------------------------------------

CONGRATULATIONS
---------------

**You are ready for the NGEE Arctic Modex workshop!*
