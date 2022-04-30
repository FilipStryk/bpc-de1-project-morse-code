# Morse code receiver

### Členové týmu

* David Pěčonka (responsible for xxx)
* Natália Pločeková (responsible for xxx)
* Petra Slotová (responsible for xxx)
* Filip Stryk (responsible for xxx)

### Obsah

* [Project objectives](#objectives)
* [Hardware description](#hardware)
* [VHDL modules description and simulations](#modules)
* [TOP module description and simulations](#top)
* [Video](#video)
* [References](#references)

<a name="objectives"></a>

## Projekt

Write your text here.

<a name="hardware"></a>

## Popis HW

Write your text here.

<a name="modules"></a>

## Popis a simulace VHDL modulů

### btn_to_morse ([kód](morse-code-receiver/morse-code-receiver.srcs/sources_1/new/btn_to_morse.vhd))

Modul btn_to_morse slouží k zadání tečky nebo čárky pomocí jediného vstupního signálu `btn_i`. Tečka a čárka jsou rozlišeny podle doby, po kterou je signál ve vysoké úrovni. Časové intervaly pro tečku/čárku je možné nastavit pomocí hodnot `g_DOT_MIN`, `g_DOT_MAX`, `g_DASH_MIN`, `g_DASH_MAX`, kde každá hodnota značí počet cyklů interního hodinového signálu s frekvencí 25 ms, který je odvozen ze základního 100MHz hodinového signálu pomocí entity `clock_enable` s hodnotou `g_MAX` nastavenou na 2 500 000 cyklů.

Kromě již zmíněného vstupu `btn_i` obsahuje entita dále vstupy `clk` a `rst` pro hodinový signál a reset. Výstupy pak jsou `dot_o` a `dash_o`, které slouží jako hlavní výstup, a `led_dot_o` a `led_dash_o`, které slouží k indikaci toho, jaký symbol by byl zadán, kdyby v danou chvíli přešel vstupní signál do logické nuly. Posledním výstupem je `cnt_o` s aktuální hodnotou interního čítače.

Entita funguje jako stavový automat se 4 stavy - `INIT`, `PUSHED`, `DOT` a `DASH`. Výchozím stavem je `INIT`, ve kterém jsou oba výstupy `dot_o` a `dash_o` nulové, stejně jako hodnota interního čítače `s_cnt`. Ze stavu `INIT` je možný přechod pouze do stavu `PUSHED`, a to pokud má `btn_i` hodnotu logické jedničky. V tomto stavu dochází k pravidelné inkrementaci čítače `s_cnt`, který tak měří dobu trvání vysoké úrovně. Ze stavu `PUSHED` je při změně `btn_i` na 0 možný přechod jak zpět do stavu `INIT`, tak i do stavů `DOT` a `DASH`. Rozhodujícím faktorem je hodnota `s_cnt`. Pokud se nachází v jednom z intervalů pro tečku/čárku, tak automat přejde do stavu `DOT`, resp. `DASH`. V případě, kdy je hodnota mimo oba intervaly, přejde automat zpět do výchozího stavu. Ve stavech `DOT` a `DASH` je pak aktivní odpovídající výstup `dot_o`, resp. `dash_o`. Z těchto dvou stavů je možný přechod pouze do výchozí stavu při vysoké úrovni `btn_i`.

#### Průběhy signálů při simulaci
![btn_to_morse waveforms](images/tb/btn_to_morse.png)

#### Průběhy signálů při simulaci (detail resetu)
![btn_to_morse waveforms](images/tb/btn_to_morse_reset_detail.png)

<a name="top"></a>

## Popis a simulace TOP modulu

Write your text here.

<a name="video"></a>

## Video

Write your text here

<a name="references"></a>

## References

1. Write your text here.