# Cesko-Slovenska hudebni databaze

V tomto projektu implementuji moji nekdejsi semestralni praci z BI-DBS. Jedna se o databazi hudby, u ktere muze uzivatel hodnotit a komentovat.

Pro nainstalovani vsech potrebnych knihoven je treba spustit nasledujici prikaz

bundle install

Nasledne je vse pripravene k spusteni. Je treba pouzit nasledujici prikaz.

rails s

Nyni je uz aplikace spustena a dostupna na localhost s portem 3000 (nebo ktery se ji prideli).

localhost:3000

Na uvodni strance se nachazi nekolik odkazu, ktere jsou dostupne i neprihlasenym uzivatelum. Tito navstevnici si mohou prohlidnout profily umelcu, pisnicek, uzivatelu i hodnoceni. Pro prihlaseni je treba si zalozit profil, nebo se prihlasit k uz vytvorenym. Hesla a emaily jsou dostupne v profilu uzivatelu. 

admin@cshd.cz
admin123

Po registraci nebo vyhledani prihlasovacich udaju se lze prihlasit po najeti na ikonku tri carek pod sebou v hornim pravem rohu stranky. Po prihlaseni si bude moct uzivatel vytvaret hodnoceni k hudebnim dilum. Moznosti uzivatele se lisi dle toho, jestli je admin nebo user. User nema moznost vytvaret profily umelcu, profily hudebnich del, atd. 

Na profilu uzivatele se nachazi mimo jine i vsechna jeho hodnoceni. Na profilu hudebnich del vsechna hodnoceni. Na profilu umelcu pak vsechna jeho hudebni dila. 

Ve vybranych tabulkach lze mimo vyhledavani i serazovat obsah kliknutim na jmeno sloupce. Vyhledavani v pripade shody prenese uzivatele k cili.

Pro odhlaseni se musi opet najet na ikonku tri carek pod sebou v horni casti stranky. O odhlaseni bude uzivatel informovat.