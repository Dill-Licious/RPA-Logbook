*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    TestData/data.xlsx
Resource    ../Resources/resources.robot

Suite Setup    Login Student Portal and Going Into Activity Menu
Test Template    Input Form

*** Keywords ***
Login Student Portal and Going Into Activity Menu
    Open Browser    ${url}    chrome    
    Maximize Browser Window
    Sleep    1.5s
    Click Element    ${username}
    Input Text    ${username}    YourUsernameHere
    Click Element    ${password}
    Input Text    ${password}    YourPasswordHere    
    Click Element    ${loginButton}
    Sleep    2s
    Execute JavaScript    document.body.style.zoom='85%'
    Sleep    1.5s
    Click Element    ${KemahasiswaanMenu}
    Click Element    ${ActivityButton}
    Sleep    1.5s
    Execute JavaScript    document.body.style.zoom='85%'
    Scroll Element Into View    ${LogLatestButton}
    Click Element    ${LogLatestButton}
    Sleep    1.5s

Select Tipe Penyelenggaraan
    [Arguments]  ${tipe_penyelenggaraan}
    Run Keyword If  '${tipe_penyelenggaraan}' == 'Hybrid'  Click Element  xpath=//input[@type='radio' and @value='']
    Run Keyword If  '${tipe_penyelenggaraan}' == 'Offline'  Click Element  xpath=//input[@type='radio' and @value='true']
    Run Keyword If  '${tipe_penyelenggaraan}' == 'Online'  Click Element  xpath=//input[@type='radio' and @value='false']

Input Form
    [Arguments]  ${tanggal}    ${waktu_berakhir}    ${waktu_mulai}    ${jenis_kegiatan}    ${tipe_penyelenggaraan}  ${lokasi}  ${keterangan}  ${bukti_aktivitas}
    
    Scroll Element Into View    ${addActivityButton}
    Click Element    ${addActivityButton}
    Execute JavaScript    document.body.style.zoom='85%'

    #Input tanggal
    Sleep    1s
    Click Element   id=Waktu
    Clear Element Text    id=Waktu
    Sleep    0.5s
    Input Text    id=Waktu   ${tanggal}
    Press Key    id=Waktu    ENTER   
    
    #Input waktu berakhir
    Click Element    id=Tsw
    Clear Element Text    id=Tsw
    Input Text    id=Tsw   ${waktu_berakhir}
    Execute JavaScript    document.getElementById('Tsw').value = document.getElementById('Tsw').value.split(':')[1].substring(2)
    
    #Input waktu mulai
    Click Element    id=Tmw
    Clear Element Text    id=Tmw
    Input Text    id=Tmw   ${waktu_mulai}
    Execute JavaScript    document.getElementById('Tmw').value = document.getElementById('Tmw').value.substring(5)

    
    #Pilih Jenis Kegiatan
    Click Element    ${jenisKegiatanDropdown}
    Click Element    xpath=//li[contains(@class, 'select2-results__option') and normalize-space(text())='${jenis_kegiatan}']
    
    #Checklist dospem
    Click Element  ${checklistDospem}

    # Pilih Tipe Penyelenggaraan
    Select Tipe Penyelenggaraan  ${tipe_penyelenggaraan}

    #Input lokasi
    Input Text    id=Lokasi    ${lokasi}

    #Input keterangan
    Input Text    id=Keterangan    ${keterangan}
    
    #Input bukti aktivitas
    Choose File    id=File    ${bukti_aktivitas}

    #Submit Form
    Click Element    ${submitButton}

    Sleep    1s

*** Test Cases ***
As a user, I want to fill out the activity form with data from Excel
    ${tanggal}    ${waktu_berakhir}    ${waktu_mulai}    ${jenis_kegiatan}    ${tipe_penyelenggaraan}    ${lokasi}    ${keterangan}    ${bukti_aktivitas}