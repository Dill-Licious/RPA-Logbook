# Robotic Process Automation (RPA) for IPB Student Portal Logbook 💻🤖✨

## Overview

### Problem Definition 👀⛔
- IPB students often forget to fill out their daily logbooks.
- MBKM activities, such as committee work, organizations, internships, and others, often lack clarity on whether they can be converted into Enrichment Course (EC) credits.
- Filling out logbooks becomes even more time-consuming when we need to log activities for as much as 3 credits (135 hours) or even 20 credits (900 hours).
- Some activities already have their own logbooks, but students still need to input the data manually across different platforms. 

### Benefit Using this Robot 🤖 🔥
- Excel-Based Configuration: Easily apply the copy-paste method for activities with similar time, type, or descriptions.
- Batch Processing: Run all data in Excel at once.
- No Manual Input: Eliminates the need for repetitive and time-consuming clicks.
- Time Efficient: Log 3 credits (135 hours) in less than 5 minutes


### Things to Note! 📝
- This robot will read the draft of your activity and automatically input it into the logbook on the latest draft (Make sure you have a draft of your activity)
- You’ll need to install certain dependencies to run this robot (details will be provided later).
- You still need to input data into Excel, including gathering activity documentation, determining activity types, etc.
- It’s recommended to run this program between morning and afternoon to avoid incorrect start time entries, which are set to the default (07:00) by the student portal. Alternatively, you can follow additional steps (explained later)

## Prepare Your Robot First 

### Software Requirement
1. **Ensure You Have Python and Pip Installed**  
   You can check if Python and Pip are installed on your computer via the terminal:  
   ```
   python --version
   pip --version 
   ```  
    **Note:** This program is built using the Robot Framework, which requires Python 3.8 or newer.
  <br>
  
2. **Install Robot Framework**
    In the development of this RPA, Robot Framework is used. Robot Framework is a powerful, open-source automation framework for software testing and RPA. It is low-code, meaning users can write automation scripts using simple, keyword-driven syntax, making it accessible to both technical and non-technical teams.
    
    On your terminal, install with:

    ```
    pip install robotframework
    ```

    verify with:
    ```
    robot --version
    ```

    we will be using data from Excel, also we need to install the DataDriver dependencies

    ```
    pip install robotframework-datadriver
    ```

### Let's Started Using This Robot
But before we started, I recommend you to have a code editor. However, if you don’t have one, you can still use Notepad.

1. Download this repository, you can using `git clone` or download as a ZIP (don't forget to unzip) 
2. Open the folder into the VSCode (will be recommended)
There is 5 folder:
    - TestCases: This folder contains the main robot program that will be executed later.
    - Resources: A collection of XPaths or element identifiers for clean programming.
    - TestData: Contains the Excel file that you need to configure later.
    - Images: A collection of images. You can place your documentation here, but it’s not required because the path to your activity documentation will also be stored in the Excel file.
    - Chromedriver: In order to run RPA or automation testing, we need a specific driver (Chromedriver) that allows the program to interact with your web browser. 

<br>

3. Open the `main.robot` file in the TestCases folder. On lines 15 and 17, you’ll find the script for entering the username and password on the student portal. <br>
    You can adjust it according to your own username and password. **Ensure that you don’t change the position or spacing of the writing** <br>
    if you opened by notepad, search the row that contain:
    ```
    Input Text    ${username}    YourUsernameHere
    Input Text    ${password}    YourPasswordHere    
    ```

    And dont forget to save the changes
    
<br>

4. Now it's time to configure the Excel file in the TestData folder. **Ensure that you don’t change the format or design. If there is any example data, I recommend editing it instead of deleting it (to avoid altering the format)** <br>
I recommend that you run the existing template first (the one I created), but don’t forget to correct the paths in the documentation row and Save the changes (if any)


<br>

5. After configuring the username, password, and Excel file, it’s time to run the robot program. Open the terminal and navigate to the TestCases folder -> main.robot, or simply open the logbook folder. That should be sufficient.

    ```
    robot ./TestCases/main.robot
    ```

<br>

6. Enjoy inputting your logbook using RPA! If you encounter any errors, feel free to contact me :D
