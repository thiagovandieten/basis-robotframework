*** Settings ***
Documentation     Een testset om te leren met Robot Framework te werken.
...               We leren een paar basis prinicipes van Robot Fraamework zoals variabelen,
...               kijken naar Robot's standard library
...               En maken we gebruik van Browser Library.

*** Variables ***
${site}    https://the-internet.herokuapp.com/
@{Lijstje}    Apeldoorn    Zwolle

*** Test Cases ***

001 De Basis dingen: Variabelen
    Log    het begin!