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
  :caption: A cool example
  net localgroup docker-users ornl\vsi /ADD

3. Open Docker Desktop and Modify Settings
------------------------------------------

4. Defining Docker Volumes (2 options)
--------------------------------------

5. Download ELM Docker Container
--------------------------------

6. Download meteorological data
-------------------------------

7. Download JupyterLab Docker container for analyzing ELM output
----------------------------------------------------------------

CONGRATULATIONS
---------------

*You are ready for the NGEE Arctic Modex workshop!*
