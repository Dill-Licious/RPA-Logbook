*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://studentportal.ipb.ac.id/
${username}    id=Username
${password}    id=Password
${loginButton}    xpath=//button[contains(text(), 'Masuk')]
${KemahasiswaanMenu}    xpath=//*[@id="sidebar"]/ul/li[6]
${ActivityButton}    xpath=//*[@id="sidebar"]/ul/li[6]/ul/li[2]
${LogLatestButton}    xpath=//div[@class='table-responsive']//table/tbody/tr[last()]/td//a[contains(@class, 'btn btn-info')]
${addActivityButton}    xpath=//a[contains(@onclick, 'OpenModal')]
${jenisKegiatanDropdown}    xpath=//*[@id="main_form"]/div[3]/div/span[1]/span[1]/span/span[2]
${checklistDospem}    xpath=//input[@id='ListDosenPembimbing_0__Value']
${submitButton}    xpath=//*[@id="main_form"]/div[9]/input
