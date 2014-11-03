# thx.culture

[![Build Status](https://travis-ci.org/fponticelli/thx.culture.svg)](https://travis-ci.org/fponticelli/thx.culture)

Localization library for Haxe. Strongly based on [.Net globalization](http://msdn.microsoft.com/en-us/library/System.Globalization.aspx) implementation.

## cultures

List of supported cultures.

<!-- BEGIN_CULTURES -->

| code        | english                                            | native                                             | ISO2 | ISO3 | currency      |
| ----------- | -------------------------------------------------- | -------------------------------------------------- | ---- | ---- | ------------- |
| af          | Afrikaans                                          | Afrikaans                                          | af   | afr  | -             |
| af-ZA       | Afrikaans (South Africa)                           | Afrikaans (Suid Afrika)                            | af   | afr  | R             |
| am          | Amharic                                            | አማርኛ                                               | am   | amh  | -             |
| am-ET       | Amharic (Ethiopia)                                 | አማርኛ (ኢትዮጵያ)                                       | am   | amh  | ETB           |
| ar          | Arabic                                             | &#x202b;العربية                                    | ar   | ara  | -             |
| ar-AE       | Arabic (U.A.E.)                                    | &#x202b;العربية (الإمارات العربية المتحدة)         | ar   | ara  | &#x202b;د.إ.‏ |
| ar-BH       | Arabic (Bahrain)                                   | &#x202b;العربية (البحرين)                          | ar   | ara  | &#x202b;د.ب.‏ |
| ar-DZ       | Arabic (Algeria)                                   | &#x202b;العربية (الجزائر)                          | ar   | ara  | &#x202b;د.ج.‏ |
| ar-EG       | Arabic (Egypt)                                     | &#x202b;العربية (مصر)                              | ar   | ara  | &#x202b;ج.م.‏ |
| ar-IQ       | Arabic (Iraq)                                      | &#x202b;العربية (العراق)                           | ar   | ara  | &#x202b;د.ع.‏ |
| ar-JO       | Arabic (Jordan)                                    | &#x202b;العربية (الأردن)                           | ar   | ara  | &#x202b;د.ا.‏ |
| ar-KW       | Arabic (Kuwait)                                    | &#x202b;العربية (الكويت)                           | ar   | ara  | &#x202b;د.ك.‏ |
| ar-LB       | Arabic (Lebanon)                                   | &#x202b;العربية (لبنان)                            | ar   | ara  | &#x202b;ل.ل.‏ |
| ar-LY       | Arabic (Libya)                                     | &#x202b;العربية (ليبيا)                            | ar   | ara  | &#x202b;د.ل.‏ |
| ar-MA       | Arabic (Morocco)                                   | &#x202b;العربية (المملكة المغربية)                 | ar   | ara  | &#x202b;د.م.‏ |
| ar-OM       | Arabic (Oman)                                      | &#x202b;العربية (عمان)                             | ar   | ara  | &#x202b;ر.ع.‏ |
| ar-QA       | Arabic (Qatar)                                     | &#x202b;العربية (قطر)                              | ar   | ara  | &#x202b;ر.ق.‏ |
| ar-SA       | Arabic (Saudi Arabia)                              | &#x202b;العربية (المملكة العربية السعودية)         | ar   | ara  | &#x202b;ر.س.‏ |
| ar-SY       | Arabic (Syria)                                     | &#x202b;العربية (سوريا)                            | ar   | ara  | &#x202b;ل.س.‏ |
| ar-TN       | Arabic (Tunisia)                                   | &#x202b;العربية (تونس)                             | ar   | ara  | &#x202b;د.ت.‏ |
| ar-YE       | Arabic (Yemen)                                     | &#x202b;العربية (اليمن)                            | ar   | ara  | &#x202b;ر.ي.‏ |
| arn         | Mapudungun                                         | Mapudungun                                         | arn  | arn  | -             |
| arn-CL      | Mapudungun (Chile)                                 | Mapudungun (Chile)                                 | arn  | arn  | $             |
| as          | Assamese                                           | অসমীয়া                                             | as   | asm  | -             |
| as-IN       | Assamese (India)                                   | অসমীয়া (ভাৰত)                                      | as   | asm  | ₹             |
| az          | Azeri                                              | Azərbaycan­ılı                                     | az   | aze  | -             |
| az-Cyrl     | Azeri (Cyrillic)                                   | Азәрбајҹан дили                                    | az   | aze  | -             |
| az-Cyrl-AZ  | Azeri (Cyrillic, Azerbaijan)                       | Азәрбајҹан (Азәрбајҹан)                            | az   | aze  | ман.          |
| az-Latn     | Azeri (Latin)                                      | Azərbaycan­ılı                                     | az   | aze  | -             |
| az-Latn-AZ  | Azeri (Latin, Azerbaijan)                          | Azərbaycan­ılı (Azərbaycan)                        | az   | aze  | man.          |
| ba          | Bashkir                                            | Башҡорт                                            | ba   | bak  | -             |
| ba-RU       | Bashkir (Russia)                                   | Башҡорт (Россия)                                   | ba   | bak  | һ.            |
| be          | Belarusian                                         | Беларускі                                          | be   | bel  | -             |
| be-BY       | Belarusian (Belarus)                               | Беларускі (Беларусь)                               | be   | bel  | р.            |
| bg          | Bulgarian                                          | български                                          | bg   | bul  | -             |
| bg-BG       | Bulgarian (Bulgaria)                               | български (България)                               | bg   | bul  | лв.           |
| bn          | Bengali                                            | বাংলা                                              | bn   | bng  | -             |
| bn-BD       | Bengali (Bangladesh)                               | বাংলা (বাংলাদেশ)                                   | bn   | bng  | ৳             |
| bn-IN       | Bengali (India)                                    | বাংলা (ভারত)                                       | bn   | bng  | ₹             |
| bo          | Tibetan                                            | བོད་ཡིག                                            | bo   | bod  | -             |
| bo-CN       | Tibetan (PRC)                                      | བོད་ཡིག (ཀྲུང་ཧྭ་མི་དམངས་སྤྱི་མཐུན་རྒྱལ་ཁབ།)       | bo   | bod  | ¥             |
| br          | Breton                                             | brezhoneg                                          | br   | bre  | -             |
| br-FR       | Breton (France)                                    | brezhoneg (Frañs)                                  | br   | bre  | €             |
| bs          | Bosnian                                            | bosanski                                           | bs   | bsb  | -             |
| bs-Cyrl     | Bosnian (Cyrillic)                                 | босански                                           | bs   | bsc  | -             |
| bs-Cyrl-BA  | Bosnian (Cyrillic, Bosnia and Herzegovina)         | босански (Босна и Херцеговина)                     | bs   | bsc  | КМ            |
| bs-Latn     | Bosnian (Latin)                                    | bosanski                                           | bs   | bsb  | -             |
| bs-Latn-BA  | Bosnian (Latin, Bosnia and Herzegovina)            | bosanski (Bosna i Hercegovina)                     | bs   | bsb  | KM            |
| ca          | Catalan                                            | català                                             | ca   | cat  | -             |
| ca-ES       | Catalan (Catalan)                                  | català (català)                                    | ca   | cat  | €             |
| co          | Corsican                                           | Corsu                                              | co   | cos  | -             |
| co-FR       | Corsican (France)                                  | Corsu (France)                                     | co   | cos  | €             |
| cs          | Czech                                              | čeština                                            | cs   | ces  | -             |
| cs-CZ       | Czech (Czech Republic)                             | čeština (Česká republika)                          | cs   | ces  | Kč            |
| cy          | Welsh                                              | Cymraeg                                            | cy   | cym  | -             |
| cy-GB       | Welsh (United Kingdom)                             | Cymraeg (y Deyrnas Unedig)                         | cy   | cym  | £             |
| da          | Danish                                             | dansk                                              | da   | dan  | -             |
| da-DK       | Danish (Denmark)                                   | dansk (Danmark)                                    | da   | dan  | kr.           |
| de          | German                                             | Deutsch                                            | de   | deu  | -             |
| de-AT       | German (Austria)                                   | Deutsch (Österreich)                               | de   | deu  | €             |
| de-CH       | German (Switzerland)                               | Deutsch (Schweiz)                                  | de   | deu  | Fr.           |
| de-DE       | German (Germany)                                   | Deutsch (Deutschland)                              | de   | deu  | €             |
| de-LI       | German (Liechtenstein)                             | Deutsch (Liechtenstein)                            | de   | deu  | CHF           |
| de-LU       | German (Luxembourg)                                | Deutsch (Luxemburg)                                | de   | deu  | €             |
| dsb         | Lower Sorbian                                      | dolnoserbšćina                                     | dsb  | dsb  | -             |
| dsb-DE      | Lower Sorbian (Germany)                            | dolnoserbšćina (Nimska)                            | dsb  | dsb  | €             |
| dv          | Divehi                                             | -                                                  | dv   | div  | -             |
| dv-MV       | Divehi (Maldives)                                  | -                                                  | dv   | div  | -             |
| el          | Greek                                              | Ελληνικά                                           | el   | ell  | -             |
| el-GR       | Greek (Greece)                                     | Ελληνικά (Ελλάδα)                                  | el   | ell  | €             |
| en          | English                                            | English                                            | en   | eng  | -             |
| en-029      | English (Caribbean)                                | English (Caribbean)                                | en   | eng  | $             |
| en-AU       | English (Australia)                                | English (Australia)                                | en   | eng  | $             |
| en-BZ       | English (Belize)                                   | English (Belize)                                   | en   | eng  | BZ$           |
| en-CA       | English (Canada)                                   | English (Canada)                                   | en   | eng  | $             |
| en-GB       | English (United Kingdom)                           | English (United Kingdom)                           | en   | eng  | £             |
| en-IE       | English (Ireland)                                  | English (Ireland)                                  | en   | eng  | €             |
| en-IN       | English (India)                                    | English (India)                                    | en   | eng  | ₹             |
| en-JM       | English (Jamaica)                                  | English (Jamaica)                                  | en   | eng  | J$            |
| en-MY       | English (Malaysia)                                 | English (Malaysia)                                 | en   | eng  | RM            |
| en-NZ       | English (New Zealand)                              | English (New Zealand)                              | en   | eng  | $             |
| en-PH       | English (Republic of the Philippines)              | English (Philippines)                              | en   | eng  | Php           |
| en-SG       | English (Singapore)                                | English (Singapore)                                | en   | eng  | $             |
| en-TT       | English (Trinidad and Tobago)                      | English (Trinidad y Tobago)                        | en   | eng  | TT$           |
| en-US       | English (United States)                            | English (United States)                            | en   | eng  | $             |
| en-ZA       | English (South Africa)                             | English (South Africa)                             | en   | eng  | R             |
| en-ZW       | English (Zimbabwe)                                 | English (Zimbabwe)                                 | en   | eng  | Z$            |
| es          | Spanish                                            | español                                            | es   | spa  | -             |
| es-AR       | Spanish (Argentina)                                | Español (Argentina)                                | es   | spa  | $             |
| es-BO       | Spanish (Bolivia)                                  | Español (Bolivia)                                  | es   | spa  | $b            |
| es-CL       | Spanish (Chile)                                    | Español (Chile)                                    | es   | spa  | $             |
| es-CO       | Spanish (Colombia)                                 | Español (Colombia)                                 | es   | spa  | $             |
| es-CR       | Spanish (Costa Rica)                               | Español (Costa Rica)                               | es   | spa  | ₡             |
| es-DO       | Spanish (Dominican Republic)                       | Español (República Dominicana)                     | es   | spa  | RD$           |
| es-EC       | Spanish (Ecuador)                                  | Español (Ecuador)                                  | es   | spa  | $             |
| es-ES       | Spanish (Spain, International Sort)                | Español (España, alfabetización internacional)     | es   | spa  | €             |
| es-GT       | Spanish (Guatemala)                                | Español (Guatemala)                                | es   | spa  | Q             |
| es-HN       | Spanish (Honduras)                                 | Español (Honduras)                                 | es   | spa  | L.            |
| es-MX       | Spanish (Mexico)                                   | Español (México)                                   | es   | spa  | $             |
| es-NI       | Spanish (Nicaragua)                                | Español (Nicaragua)                                | es   | spa  | C$            |
| es-PA       | Spanish (Panama)                                   | Español (Panamá)                                   | es   | spa  | B/.           |
| es-PE       | Spanish (Peru)                                     | Español (Perú)                                     | es   | spa  | S/.           |
| es-PR       | Spanish (Puerto Rico)                              | Español (Puerto Rico)                              | es   | spa  | $             |
| es-PY       | Spanish (Paraguay)                                 | Español (Paraguay)                                 | es   | spa  | Gs            |
| es-SV       | Spanish (El Salvador)                              | Español (El Salvador)                              | es   | spa  | $             |
| es-US       | Spanish (United States)                            | Español (Estados Unidos)                           | es   | spa  | $             |
| es-UY       | Spanish (Uruguay)                                  | Español (Uruguay)                                  | es   | spa  | $U            |
| es-VE       | Spanish (Bolivarian Republic of Venezuela)         | Español (Republica Bolivariana de Venezuela)       | es   | spa  | Bs. F.        |
| et          | Estonian                                           | eesti                                              | et   | est  | -             |
| et-EE       | Estonian (Estonia)                                 | eesti (Eesti)                                      | et   | est  | €             |
| eu          | Basque                                             | euskara                                            | eu   | eus  | -             |
| eu-ES       | Basque (Basque)                                    | euskara (euskara)                                  | eu   | eus  | €             |
| fa          | Persian                                            | &#x202b;فارسى                                      | fa   | fas  | -             |
| fa-IR       | Persian                                            | &#x202b;فارسى (ایران)                              | fa   | fas  | &#x202b;ريال  |
| fi          | Finnish                                            | suomi                                              | fi   | fin  | -             |
| fi-FI       | Finnish (Finland)                                  | suomi (Suomi)                                      | fi   | fin  | €             |
| fil         | Filipino                                           | Filipino                                           | fil  | fil  | -             |
| fil-PH      | Filipino (Philippines)                             | Filipino (Pilipinas)                               | fil  | fil  | PhP           |
| fo          | Faroese                                            | føroyskt                                           | fo   | fao  | -             |
| fo-FO       | Faroese (Faroe Islands)                            | føroyskt (Føroyar)                                 | fo   | fao  | kr.           |
| fr          | French                                             | français                                           | fr   | fra  | -             |
| fr-BE       | French (Belgium)                                   | français (Belgique)                                | fr   | fra  | €             |
| fr-CA       | French (Canada)                                    | français (Canada)                                  | fr   | fra  | $             |
| fr-CH       | French (Switzerland)                               | français (Suisse)                                  | fr   | fra  | fr.           |
| fr-FR       | French (France)                                    | français (France)                                  | fr   | fra  | €             |
| fr-LU       | French (Luxembourg)                                | français (Luxembourg)                              | fr   | fra  | €             |
| fr-MC       | French (Monaco)                                    | français (Principauté de Monaco)                   | fr   | fra  | €             |
| fy          | Frisian                                            | Frysk                                              | fy   | fry  | -             |
| fy-NL       | Frisian (Netherlands)                              | Frysk (Nederlân)                                   | fy   | fry  | €             |
| ga          | Irish                                              | Gaeilge                                            | ga   | gle  | -             |
| ga-IE       | Irish (Ireland)                                    | Gaeilge (Éire)                                     | ga   | gle  | €             |
| gd          | Scottish Gaelic                                    | Gàidhlig                                           | gd   | gla  | -             |
| gd-GB       | Scottish Gaelic (United Kingdom)                   | Gàidhlig (An Rìoghachd Aonaichte)                  | gd   | gla  | £             |
| gl          | Galician                                           | galego                                             | gl   | glg  | -             |
| gl-ES       | Galician (Galician)                                | galego (galego)                                    | gl   | glg  | €             |
| gsw         | Alsatian                                           | Elsässisch                                         | gsw  | gsw  | -             |
| gsw-FR      | Alsatian (France)                                  | Elsässisch (Frànkrisch)                            | gsw  | gsw  | €             |
| gu          | Gujarati                                           | ગુજરાતી                                            | gu   | guj  | -             |
| gu-IN       | Gujarati (India)                                   | ગુજરાતી (ભારત)                                     | gu   | guj  | ₹             |
| ha          | Hausa                                              | Hausa                                              | ha   | hau  | -             |
| ha-Latn     | Hausa (Latin)                                      | Hausa                                              | ha   | hau  | -             |
| ha-Latn-NG  | Hausa (Latin, Nigeria)                             | Hausa (Nigeria)                                    | ha   | hau  | N             |
| he          | Hebrew                                             | &#x202b;עברית                                      | he   | heb  | -             |
| he-IL       | Hebrew (Israel)                                    | &#x202b;עברית (ישראל)                              | he   | heb  | &#x202b;₪     |
| hi          | Hindi                                              | हिंदी                                              | hi   | hin  | -             |
| hi-IN       | Hindi (India)                                      | हिंदी (भारत)                                       | hi   | hin  | ₹             |
| hr          | Croatian                                           | hrvatski                                           | hr   | hrv  | -             |
| hr-BA       | Croatian (Latin, Bosnia and Herzegovina)           | hrvatski (Bosna i Hercegovina)                     | hr   | hrb  | KM            |
| hr-HR       | Croatian (Croatia)                                 | hrvatski (Hrvatska)                                | hr   | hrv  | kn            |
| hsb         | Upper Sorbian                                      | hornjoserbšćina                                    | hsb  | hsb  | -             |
| hsb-DE      | Upper Sorbian (Germany)                            | hornjoserbšćina (Němska)                           | hsb  | hsb  | €             |
| hu          | Hungarian                                          | magyar                                             | hu   | hun  | -             |
| hu-HU       | Hungarian (Hungary)                                | magyar (Magyarország)                              | hu   | hun  | Ft            |
| hy          | Armenian                                           | Հայերեն                                            | hy   | hye  | -             |
| hy-AM       | Armenian (Armenia)                                 | Հայերեն (Հայաստան)                                 | hy   | hye  | դր.           |
| id          | Indonesian                                         | Bahasa Indonesia                                   | id   | ind  | -             |
| id-ID       | Indonesian (Indonesia)                             | Bahasa Indonesia (Indonesia)                       | id   | ind  | Rp            |
| ig          | Igbo                                               | Igbo                                               | ig   | ibo  | -             |
| ig-NG       | Igbo (Nigeria)                                     | Igbo (Nigeria)                                     | ig   | ibo  | N             |
| ii          | Yi                                                 | ꆈꌠꁱꂷ                                               | ii   | iii  | -             |
| ii-CN       | Yi (PRC)                                           | ꆈꌠꁱꂷ (ꍏꉸꏓꂱꇭꉼꇩ)                                     | ii   | iii  | ¥             |
| is          | Icelandic                                          | íslenska                                           | is   | isl  | -             |
| is-IS       | Icelandic (Iceland)                                | íslenska (Ísland)                                  | is   | isl  | kr.           |
| it          | Italian                                            | italiano                                           | it   | ita  | -             |
| it-CH       | Italian (Switzerland)                              | italiano (Svizzera)                                | it   | ita  | fr.           |
| it-IT       | Italian (Italy)                                    | italiano (Italia)                                  | it   | ita  | €             |
| iu          | Inuktitut                                          | Inuktitut                                          | iu   | iku  | -             |
| iu-Cans     | Inuktitut (Syllabics)                              | ᐃᓄᒃᑎᑐᑦ                                             | iu   | iku  | -             |
| iu-Cans-CA  | Inuktitut (Syllabics, Canada)                      | ᐃᓄᒃᑎᑐᑦ (ᑲᓇᑕᒥ)                                      | iu   | iku  | $             |
| iu-Latn     | Inuktitut (Latin)                                  | Inuktitut                                          | iu   | iku  | -             |
| iu-Latn-CA  | Inuktitut (Latin, Canada)                          | Inuktitut (Kanatami)                               | iu   | iku  | $             |
| ja          | Japanese                                           | 日本語                                                | ja   | jpn  | -             |
| ja-JP       | Japanese (Japan)                                   | 日本語 (日本)                                           | ja   | jpn  | ¥             |
| ka          | Georgian                                           | ქართული                                            | ka   | kat  | -             |
| ka-GE       | Georgian (Georgia)                                 | ქართული (საქართველო)                               | ka   | kat  | Lari          |
| kk          | Kazakh                                             | Қазақ                                              | kk   | kaz  | -             |
| kk-KZ       | Kazakh (Kazakhstan)                                | Қазақ (Қазақстан)                                  | kk   | kaz  | Т             |
| kl          | Greenlandic                                        | kalaallisut                                        | kl   | kal  | -             |
| kl-GL       | Greenlandic (Greenland)                            | kalaallisut (Kalaallit Nunaat)                     | kl   | kal  | kr.           |
| km          | Khmer                                              | ខ្មែរ                                              | km   | khm  | -             |
| km-KH       | Khmer (Cambodia)                                   | ខ្មែរ (កម្ពុជា)                                    | km   | khm  | ៛             |
| kn          | Kannada                                            | ಕನ್ನಡ                                              | kn   | kan  | -             |
| kn-IN       | Kannada (India)                                    | ಕನ್ನಡ (ಭಾರತ)                                       | kn   | kan  | ₹             |
| ko          | Korean                                             | 한국어                                                | ko   | kor  | -             |
| ko-KR       | Korean (Korea)                                     | 한국어 (대한민국)                                         | ko   | kor  | ₩             |
| kok         | Konkani                                            | कोंकणी                                             | kok  | kok  | -             |
| kok-IN      | Konkani (India)                                    | कोंकणी (भारत)                                      | kok  | kok  | ₹             |
| ky          | Kyrgyz                                             | Кыргыз                                             | ky   | kir  | -             |
| ky-KG       | Kyrgyz (Kyrgyzstan)                                | Кыргыз (Кыргызстан)                                | ky   | kir  | сом           |
| lb          | Luxembourgish                                      | Lëtzebuergesch                                     | lb   | ltz  | -             |
| lb-LU       | Luxembourgish (Luxembourg)                         | Lëtzebuergesch (Luxembourg)                        | lb   | ltz  | €             |
| lo          | Lao                                                | ລາວ                                                | lo   | lao  | -             |
| lo-LA       | Lao (Lao P.D.R.)                                   | ລາວ (ສ.ປ.ປ. ລາວ)                                   | lo   | lao  | ₭             |
| lt          | Lithuanian                                         | lietuvių                                           | lt   | lit  | -             |
| lt-LT       | Lithuanian (Lithuania)                             | lietuvių (Lietuva)                                 | lt   | lit  | Lt            |
| lv          | Latvian                                            | latviešu                                           | lv   | lav  | -             |
| lv-LV       | Latvian (Latvia)                                   | latviešu (Latvija)                                 | lv   | lav  | €             |
| mi          | Maori                                              | Reo Māori                                          | mi   | mri  | -             |
| mi-NZ       | Maori (New Zealand)                                | Reo Māori (Aotearoa)                               | mi   | mri  | $             |
| mk          | Macedonian (FYROM)                                 | македонски јазик                                   | mk   | mkd  | -             |
| mk-MK       | Macedonian (Former Yugoslav Republic of Macedonia) | македонски јазик (Македонија)                      | mk   | mkd  | ден.          |
| ml          | Malayalam                                          | മലയാളം                                             | ml   | mym  | -             |
| ml-IN       | Malayalam (India)                                  | മലയാളം (ഭാരതം)                                     | ml   | mym  | ₹             |
| mn          | Mongolian                                          | Монгол хэл                                         | mn   | mon  | -             |
| mn-Cyrl     | Mongolian (Cyrillic)                               | Монгол хэл                                         | mn   | mon  | -             |
| mn-MN       | Mongolian (Cyrillic, Mongolia)                     | Монгол хэл (Монгол улс)                            | mn   | mon  | ₮             |
| mn-Mong     | Mongolian (Traditional Mongolian)                  | ᠮᠤᠨᠭᠭᠤᠯ ᠬᠡᠯᠡ                                       | mn   | mon  | -             |
| mn-Mong-CN  | Mongolian (Traditional Mongolian, PRC)             | ᠮᠤᠨᠭᠭᠤᠯ ᠬᠡᠯᠡ (ᠪᠦᠭᠦᠳᠡ ᠨᠠᠢᠷᠠᠮᠳᠠᠬᠤ ᠳᠤᠮᠳᠠᠳᠤ ᠠᠷᠠᠳ ᠣᠯᠣᠰ) | mn   | mon  | ¥             |
| moh         | Mohawk                                             | Kanien'kéha                                        | moh  | moh  | -             |
| moh-CA      | Mohawk (Mohawk)                                    | Kanien'kéha                                        | moh  | moh  | $             |
| mr          | Marathi                                            | मराठी                                              | mr   | mar  | -             |
| mr-IN       | Marathi (India)                                    | मराठी (भारत)                                       | mr   | mar  | ₹             |
| ms          | Malay                                              | Bahasa Melayu                                      | ms   | msa  | -             |
| ms-BN       | Malay (Brunei Darussalam)                          | Bahasa Melayu (Brunei Darussalam)                  | ms   | msa  | $             |
| ms-MY       | Malay (Malaysia)                                   | Bahasa Melayu (Malaysia)                           | ms   | msa  | RM            |
| mt          | Maltese                                            | Malti                                              | mt   | mlt  | -             |
| mt-MT       | Maltese (Malta)                                    | Malti (Malta)                                      | mt   | mlt  | €             |
| nb          | Norwegian (Bokmål)                                 | norsk (bokmål)                                     | nb   | nob  | -             |
| nb-NO       | Norwegian, Bokmål (Norway)                         | norsk, bokmål (Norge)                              | nb   | nob  | kr            |
| ne          | Nepali                                             | नेपाली                                             | ne   | nep  | -             |
| ne-NP       | Nepali (Nepal)                                     | नेपाली (नेपाल)                                     | ne   | nep  | रु            |
| nl          | Dutch                                              | Nederlands                                         | nl   | nld  | -             |
| nl-BE       | Dutch (Belgium)                                    | Nederlands (België)                                | nl   | nld  | €             |
| nl-NL       | Dutch (Netherlands)                                | Nederlands (Nederland)                             | nl   | nld  | €             |
| nn          | Norwegian (Nynorsk)                                | norsk (nynorsk)                                    | nn   | nno  | -             |
| nn-NO       | Norwegian, Nynorsk (Norway)                        | norsk, nynorsk (Noreg)                             | nn   | nno  | kr            |
| no          | Norwegian                                          | norsk                                              | nb   | nob  | -             |
| nso         | Sesotho sa Leboa                                   | Sesotho sa Leboa                                   | nso  | nso  | -             |
| nso-ZA      | Sesotho sa Leboa (South Africa)                    | Sesotho sa Leboa (Afrika Borwa)                    | nso  | nso  | R             |
| oc          | Occitan                                            | Occitan                                            | oc   | oci  | -             |
| oc-FR       | Occitan (France)                                   | Occitan (França)                                   | oc   | oci  | €             |
| or          | Oriya                                              | ଓଡ଼ିଆ                                               | or   | ori  | -             |
| or-IN       | Oriya (India)                                      | ଓଡ଼ିଆ (ଭାରତ)                                        | or   | ori  | ₹             |
| pa          | Punjabi                                            | ਪੰਜਾਬੀ                                             | pa   | pan  | -             |
| pa-IN       | Punjabi (India)                                    | ਪੰਜਾਬੀ (ਭਾਰਤ)                                      | pa   | pan  | ₹             |
| pl          | Polish                                             | polski                                             | pl   | pol  | -             |
| pl-PL       | Polish (Poland)                                    | polski (Polska)                                    | pl   | pol  | zł            |
| prs         | Dari                                               | &#x202b;درى                                        | prs  | prs  | -             |
| prs-AF      | Dari (Afghanistan)                                 | &#x202b;درى (افغانستان)                            | prs  | prs  | &#x202b;؋     |
| ps          | Pashto                                             | &#x202b;پښتو                                       | ps   | pus  | -             |
| ps-AF       | Pashto (Afghanistan)                               | &#x202b;پښتو (افغانستان)                           | ps   | pus  | &#x202b;؋     |
| pt          | Portuguese                                         | Português                                          | pt   | por  | -             |
| pt-BR       | Portuguese (Brazil)                                | Português (Brasil)                                 | pt   | por  | R$            |
| pt-PT       | Portuguese (Portugal)                              | português (Portugal)                               | pt   | por  | €             |
| qut         | K'iche                                             | K'iche                                             | qut  | qut  | -             |
| qut-GT      | K'iche (Guatemala)                                 | K'iche (Guatemala)                                 | qut  | qut  | Q             |
| quz         | Quechua                                            | runasimi                                           | quz  | qub  | -             |
| quz-BO      | Quechua (Bolivia)                                  | runasimi (Qullasuyu)                               | quz  | qub  | $b            |
| quz-EC      | Quechua (Ecuador)                                  | runasimi (Ecuador)                                 | quz  | que  | $             |
| quz-PE      | Quechua (Peru)                                     | runasimi (Piruw)                                   | quz  | qup  | S/.           |
| rm          | Romansh                                            | Rumantsch                                          | rm   | roh  | -             |
| rm-CH       | Romansh (Switzerland)                              | Rumantsch (Svizra)                                 | rm   | roh  | fr.           |
| ro          | Romanian                                           | română                                             | ro   | ron  | -             |
| ro-RO       | Romanian (Romania)                                 | română (România)                                   | ro   | ron  | lei           |
| ru          | Russian                                            | русский                                            | ru   | rus  | -             |
| ru-RU       | Russian (Russia)                                   | русский (Россия)                                   | ru   | rus  | р.            |
| rw          | Kinyarwanda                                        | Kinyarwanda                                        | rw   | kin  | -             |
| rw-RW       | Kinyarwanda (Rwanda)                               | Kinyarwanda (Rwanda)                               | rw   | kin  | RWF           |
| sa          | Sanskrit                                           | संस्कृत                                            | sa   | san  | -             |
| sa-IN       | Sanskrit (India)                                   | संस्कृत (भारतम्)                                   | sa   | san  | ₹             |
| sah         | Yakut                                              | саха                                               | sah  | sah  | -             |
| sah-RU      | Yakut (Russia)                                     | саха (Россия)                                      | sah  | sah  | с.            |
| se          | Sami (Northern)                                    | davvisámegiella                                    | se   | sme  | -             |
| se-FI       | Sami, Northern (Finland)                           | davvisámegiella (Suopma)                           | se   | smg  | €             |
| se-NO       | Sami, Northern (Norway)                            | davvisámegiella (Norga)                            | se   | sme  | kr            |
| se-SE       | Sami, Northern (Sweden)                            | davvisámegiella (Ruoŧŧa)                           | se   | smf  | kr            |
| si          | Sinhala                                            | සිංහල                                              | si   | sin  | -             |
| si-LK       | Sinhala (Sri Lanka)                                | සිංහල (ශ්‍රී ලංකා)                                 | si   | sin  | රු.           |
| sk          | Slovak                                             | slovenčina                                         | sk   | slk  | -             |
| sk-SK       | Slovak (Slovakia)                                  | slovenčina (Slovenská republika)                   | sk   | slk  | €             |
| sl          | Slovenian                                          | slovenski                                          | sl   | slv  | -             |
| sl-SI       | Slovenian (Slovenia)                               | slovenski (Slovenija)                              | sl   | slv  | €             |
| sma         | Sami (Southern)                                    | åarjelsaemiengiele                                 | sma  | smb  | -             |
| sma-NO      | Sami, Southern (Norway)                            | åarjelsaemiengiele (Nöörje)                        | sma  | sma  | kr            |
| sma-SE      | Sami, Southern (Sweden)                            | åarjelsaemiengiele (Sveerje)                       | sma  | smb  | kr            |
| smj         | Sami (Lule)                                        | julevusámegiella                                   | smj  | smk  | -             |
| smj-NO      | Sami, Lule (Norway)                                | julevusámegiella (Vuodna)                          | smj  | smj  | kr            |
| smj-SE      | Sami, Lule (Sweden)                                | julevusámegiella (Svierik)                         | smj  | smk  | kr            |
| smn         | Sami (Inari)                                       | sämikielâ                                          | smn  | smn  | -             |
| smn-FI      | Sami, Inari (Finland)                              | sämikielâ (Suomâ)                                  | smn  | smn  | €             |
| sms         | Sami (Skolt)                                       | sääm´ǩiõll                                         | sms  | sms  | -             |
| sms-FI      | Sami, Skolt (Finland)                              | sääm´ǩiõll (Lää´ddjânnam)                          | sms  | sms  | €             |
| sq          | Albanian                                           | shqipe                                             | sq   | sqi  | -             |
| sq-AL       | Albanian (Albania)                                 | shqipe (Shqipëria)                                 | sq   | sqi  | Lek           |
| sr          | Serbian                                            | srpski                                             | sr   | srp  | -             |
| sr-Cyrl     | Serbian (Cyrillic)                                 | српски                                             | sr   | srp  | -             |
| sr-Cyrl-BA  | Serbian (Cyrillic, Bosnia and Herzegovina)         | српски (Босна и Херцеговина)                       | sr   | srn  | КМ            |
| sr-Cyrl-CS  | Serbian (Cyrillic, Serbia and Montenegro (Former)) | српски (Србија и Црна Гора (Претходно))            | sr   | srp  | Дин.          |
| sr-Cyrl-ME  | Serbian (Cyrillic, Montenegro)                     | српски (Црна Гора)                                 | sr   | srp  | €             |
| sr-Cyrl-RS  | Serbian (Cyrillic, Serbia)                         | српски (Србија)                                    | sr   | srp  | Дин.          |
| sr-Latn     | Serbian (Latin)                                    | srpski                                             | sr   | srp  | -             |
| sr-Latn-BA  | Serbian (Latin, Bosnia and Herzegovina)            | srpski (Bosna i Hercegovina)                       | sr   | srs  | KM            |
| sr-Latn-CS  | Serbian (Latin, Serbia and Montenegro (Former))    | srpski (Srbija i Crna Gora (Prethodno))            | sr   | srp  | Din.          |
| sr-Latn-ME  | Serbian (Latin, Montenegro)                        | srpski (Crna Gora)                                 | sr   | srp  | €             |
| sr-Latn-RS  | Serbian (Latin, Serbia)                            | srpski (Srbija)                                    | sr   | srp  | Din.          |
| sv          | Swedish                                            | svenska                                            | sv   | swe  | -             |
| sv-FI       | Swedish (Finland)                                  | svenska (Finland)                                  | sv   | swe  | €             |
| sv-SE       | Swedish (Sweden)                                   | svenska (Sverige)                                  | sv   | swe  | kr            |
| sw          | Kiswahili                                          | Kiswahili                                          | sw   | swa  | -             |
| sw-KE       | Kiswahili (Kenya)                                  | Kiswahili (Kenya)                                  | sw   | swa  | S             |
| syr         | Syriac                                             | &#x202b;ܣܘܪܝܝܐ                                     | syr  | syr  | -             |
| syr-SY      | Syriac (Syria)                                     | &#x202b;ܣܘܪܝܝܐ (سوريا)                             | syr  | syr  | &#x202b;ل.س.‏ |
| ta          | Tamil                                              | தமிழ்                                              | ta   | tam  | -             |
| ta-IN       | Tamil (India)                                      | தமிழ் (இந்தியா)                                    | ta   | tam  | ₹             |
| te          | Telugu                                             | తెలుగు                                             | te   | tel  | -             |
| te-IN       | Telugu (India)                                     | తెలుగు (భారత దేశం)                                 | te   | tel  | ₹             |
| tg          | Tajik                                              | Тоҷикӣ                                             | tg   | tgk  | -             |
| tg-Cyrl     | Tajik (Cyrillic)                                   | Тоҷикӣ                                             | tg   | tgk  | -             |
| tg-Cyrl-TJ  | Tajik (Cyrillic, Tajikistan)                       | Тоҷикӣ (Тоҷикистон)                                | tg   | tgk  | т.р.          |
| th          | Thai                                               | ไทย                                                | th   | tha  | -             |
| th-TH       | Thai (Thailand)                                    | ไทย (ไทย)                                          | th   | tha  | ฿             |
| tk          | Turkmen                                            | türkmençe                                          | tk   | tuk  | -             |
| tk-TM       | Turkmen (Turkmenistan)                             | türkmençe (Türkmenistan)                           | tk   | tuk  | m.            |
| tn          | Setswana                                           | Setswana                                           | tn   | tsn  | -             |
| tn-ZA       | Setswana (South Africa)                            | Setswana (Aforika Borwa)                           | tn   | tsn  | R             |
| tr          | Turkish                                            | Türkçe                                             | tr   | tur  | -             |
| tr-TR       | Turkish (Turkey)                                   | Türkçe (Türkiye)                                   | tr   | tur  | ₺             |
| tt          | Tatar                                              | Татар                                              | tt   | tat  | -             |
| tt-RU       | Tatar (Russia)                                     | Татар (Россия)                                     | tt   | tat  | р.            |
| tzm         | Tamazight                                          | Tamazight                                          | tzm  | tzm  | -             |
| tzm-Latn    | Tamazight (Latin)                                  | Tamazight                                          | tzm  | tzm  | -             |
| tzm-Latn-DZ | Tamazight (Latin, Algeria)                         | Tamazight (Djazaïr)                                | tzm  | tzm  | DZD           |
| ug          | Uyghur                                             | &#x202b;ئۇيغۇرچە                                   | ug   | uig  | -             |
| ug-CN       | Uyghur (PRC)                                       | &#x202b;ئۇيغۇرچە (جۇڭخۇا خەلق جۇمھۇرىيىتى)         | ug   | uig  | &#x202b;¥     |
| uk          | Ukrainian                                          | українська                                         | uk   | ukr  | -             |
| uk-UA       | Ukrainian (Ukraine)                                | українська (Україна)                               | uk   | ukr  | ₴             |
| ur          | Urdu                                               | &#x202b;اُردو                                      | ur   | urd  | -             |
| ur-PK       | Urdu (Islamic Republic of Pakistan)                | &#x202b;اُردو (پاکستان)                            | ur   | urd  | &#x202b;Rs    |
| uz          | Uzbek                                              | U'zbek                                             | uz   | uzb  | -             |
| uz-Cyrl     | Uzbek (Cyrillic)                                   | Ўзбек                                              | uz   | uzb  | -             |
| uz-Cyrl-UZ  | Uzbek (Cyrillic, Uzbekistan)                       | Ўзбек (Ўзбекистон)                                 | uz   | uzb  | сўм           |
| uz-Latn     | Uzbek (Latin)                                      | U'zbek                                             | uz   | uzb  | -             |
| uz-Latn-UZ  | Uzbek (Latin, Uzbekistan)                          | U'zbek (U'zbekiston Respublikasi)                  | uz   | uzb  | so'm          |
| vi          | Vietnamese                                         | Tiếng Việt                                        | vi   | vie  | -             |
| vi-VN       | Vietnamese (Vietnam)                               | Tiếng Việt (Việt Nam)                             | vi   | vie  | ₫             |
| wo          | Wolof                                              | Wolof                                              | wo   | wol  | -             |
| wo-SN       | Wolof (Senegal)                                    | Wolof (Sénégal)                                    | wo   | wol  | XOF           |
| xh          | isiXhosa                                           | isiXhosa                                           | xh   | xho  | -             |
| xh-ZA       | isiXhosa (South Africa)                            | isiXhosa (uMzantsi Afrika)                         | xh   | xho  | R             |
| yo          | Yoruba                                             | Yoruba                                             | yo   | yor  | -             |
| yo-NG       | Yoruba (Nigeria)                                   | Yoruba (Nigeria)                                   | yo   | yor  | N             |
| zh          | Chinese                                            | 中文                                                 | zh   | zho  | -             |
| zh-CHS      | Chinese (Simplified) Legacy                        | 中文(简体) 旧版                                          | zh   | zho  | -             |
| zh-CHT      | Chinese (Traditional) Legacy                       | 中文(繁體) 舊版                                          | zh   | zho  | -             |
| zh-CN       | Chinese (Simplified, PRC)                          | 中文 (中华人民共和国)                                       | zh   | zho  | ¥             |
| zh-HK       | Chinese (Traditional, Hong Kong S.A.R.)            | 中文 (香港特別行政區)                                       | zh   | zho  | HK$           |
| zh-Hans     | Chinese (Simplified)                               | 中文 (简体)                                            | zh   | zho  | -             |
| zh-Hant     | Chinese (Traditional)                              | 中文 (繁體)                                            | zh   | zho  | -             |
| zh-MO       | Chinese (Traditional, Macao S.A.R.)                | 中文 (澳門特別行政區)                                       | zh   | zho  | MOP           |
| zh-SG       | Chinese (Simplified, Singapore)                    | 中文 (新加坡)                                           | zh   | zho  | $             |
| zh-TW       | Chinese (Traditional, Taiwan)                      | 中文 (台灣)                                            | zh   | zho  | NT$           |
| zu          | isiZulu                                            | isiZulu                                            | zu   | zul  | -             |
| zu-ZA       | isiZulu (South Africa)                             | isiZulu (iNingizimu Afrika)                        | zu   | zul  | R             |

<!-- END_CULTURES -->

## install

```bash
haxelib install thx.culture
```