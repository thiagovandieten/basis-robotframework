*** Settings ***
Documentation     Een testset om te leren met Robot Framework te werken.
...               We leren een paar basis prinicipes van Robot Fraamework zoals variabelen,
...               kijken naar Robot's standard library
...               En maken we gebruik van Browser Library.
Library           Browser    

*** Variables ***
${site}    https://the-internet.herokuapp.com/
@{Lijstje}    Apeldoorn    Zwolle
&{Gebruiker}    username=Tester    password=${WACHTWOORD}    #zie de args key in launch.json 

*** Test Cases ***

001 De Basis dingen: Variabelen en if-else
    [Documentation]    Meer over variabelen op: https://robotframework.org/robotframework/6.1.1/RobotFrameworkUserGuide.html
    ...    en de IF-ELSE syntax:    https://robotframework.org/robotframework/6.1.1/RobotFrameworkUserGuide.html#if-else-syntax
    ${Variabel}=    Set Variable    "Hallo!"
    Log    ${Variabel}    #Met hashtags kunnen we comments platsen/
    Log To Console    ${Variabel}
    IF  '${Variabel}' != '${EMPTY}'    #${EMPTY is een built-in variable: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#built-in-variables
        Builtin.Pass Execution    Variabel is niet leeg, hoera! 
    ELSE
        Builtin.Fail
    END

002 De Basis dingen: Lusjes en lijstjes
    [Documentation]    Meer over list variables op 
    @{LijstjeInTestCase}    Create List    Den Haag    Zoetermeer    Rotterdam
    Log    ${LijstjeInTestCase}[0]    #Als je 1 waarde wilt van een lijst gebruiken we de ${} syntax
    Log    @{LijstjeInTestCase}[0:1]    #Maar als we meerde waardes willen gebruiken we weer een @{}
    FOR  ${stad}  IN  @{LijstjeInTestCase}
        Log    ${stad} zit in Zuid-Holland
    END
    Comment    Dit is nog een manier om te commenten
    Comment    Nu gaan we hetzelfde doen met de &{Gebruiker} in variables
    FOR  ${key}    ${value}  IN  &{Gebruiker}
        Log    Mijn ${key} is ${value}
    END

003 Browser
    Browser starten


*** Keywords ***

Browser starten
    Browser.New Browser    browser=chromium    headless=false
    Browser.New Context
    Browser.New Page    ${site}
    Browser.Click     \#menu