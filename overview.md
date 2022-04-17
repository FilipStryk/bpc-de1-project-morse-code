# Přehled entit
## bin_7seg (P, hotovo)
- Převod ASCII kódu pro 0-9, A-F na rozsvícené segmenty.


## display_driver (?)
- Ovládání osmi sedmisegmentových displejů.
- Vstupy:

    - `clk`, `rst` (`std_logic`)
    - `char0_i` až `char7_i` - ASCII kód znaků na jednotlivých displejích (`std_logic_vector(8)`)
- Výstupy:

    - `seg_o` (`std_logic_vector(7)`)
    - `anodes_o` (`std_logic_vector(8)`)

## shift_register (F, hotovo)
- Pro posouvání znaků na displeji. Při každém cyklu hodinového signálu posune výstupní hodnoty a na nultý výstup předá hodnotu ze vstupu.
- `clk` jenom při zadání nového znaku.
- Vstupy:

    - `clk`, `rst` (`std_logic`)
    - `data_i` - vstupní hodnota (`std_logic_vector(8)`)
    - `g_SR_WIDTH` - počet výstupů

- Výstup:
    - `data_o(0 to g_SR_WIDTH-1)` - `t_byte_array` - pole osmibitových `std_logic_vector`

## morse2ascii (N)
- Převede [morseovku](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/International_Morse_Code.svg/1200px-International_Morse_Code.svg.png) na [ASCII](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/ASCII-Table-wide.svg/2560px-ASCII-Table-wide.svg.png) kód písmena/čísla (0-9 a velké písmena).
- Vstup
    - `bin_morse_i` - `std_logic_vector`, velikost 5 (nejvyšší počet teček/čárek v jednom znaku), `0` - tečka, `1` - čárka, `U` - nevyužité bity ([https://www2.cs.sfu.ca/~ggbaker/reference/std_logic/1164/std_logic.html](https://www2.cs.sfu.ca/~ggbaker/reference/std_logic/1164/std_logic.html))
- Výstup:
    - `ascii_o` - `std_logic_vector` - ascii kód znaku
- Např.: J: `"0111U" -> x"4A"`, 0: `"11111" -> x"30"`

## btn2morse (F)
- Převede vstup z tlačítek na binární morsoevku pro `morse2ascii`.
- Vstup buď z jednoho tlačítka podle délky stisku nebo z více tlačítek (tečka, čárka, potvrzení znaku, mezera(?), případně společné tlačítko pro tečku/čárku a podle délky stisku rolišovat a další tlačítko jenom pro potvrzení znaku?).
- Vstupy:
    - Tlačítka
- Výstupy:
    - `bin_morse_o` - `std_logic_vector(5)`
    - `clk_sr`- clock pro posuvný registr, náběžná hrana po zadání nového znaku

## top (D)
- Propojení jednotlivých entit dohromady.
    

## clock_enable (hotovo)
## cnt_up_down (hotovo)