


171,2,8,0,1,2,0,0,0,0,0,0,0,32,80 - raw передача модулю F на включение

171,0,0,0,0,6,1,100,0,0,0,0,0,0,0 - яркость

================ F ==================================

  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16	
$AB$02$00$00$01$0F$00$00$00$00$00$00$00$00$00$BD$AC - Биндинг на ячейку 01 устройства F 
 AD 02 03 00 01 1C 41 01 00 00 00 00 00 20 50 81 AE - Ответ на биндинг

  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 
$AB$02$00$00$01$02$00$00$00$00$00$00$00$00$00$B0$AC - Включение устройства F на ячейке 01
 AD 02 00 00 01 82 00 01 01 01 FF 00 00 20 50 A4 AE - Ответ на включение

  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16
$AB$02$00$00$01$19$05$02$00$00$00$00$00$00$00$CE$AC - Включение на 2 по 5 сек
 AD 02 00 00 01 82 00 01 01 02 FF 00 00 20 50 A5 AE  - Ответ на включение 

 
$AB$02$00$00$01$00$00$00$00$00$00$00$00$00$00$AE$AC - Выключение 
 AD 02 00 00 01 82 00 01 01 00 00 00 00 20 50 A4 AE - Ответ на выключение
 
$AB$02$00$00$01$80$00$00$00$00$00$00$00$00$00$2E$AC 
$AB$02$00$00$01$80$00$00$00$00$00$00$00$00$00$2E$AC - Запрос сосотяния
 AD 02 00 00 01 82 00 01 01 00 00 00 00 20 50 A4 AE  - Ответы
 AD 02 00 00 01 82 00 01 01 01 FF 00 00 20 50 A4 AE  - После включениея




 
================= Выключатель ==================	
	
	
 AD 01 00 1B 00 04 00 E6 10 00 FF 00 00 00 00 C2 AE  - прием от привязанного пульта на канале 0, пульт - левая кнопка, к ней привязан блок SU111-200
 AD 01 00 26 00 04 00 E7 10 00 FF 00 00 00 00 CE AE 
 AD 01 00 27 00 04 00 E7 10 00 FF 00 00 00 00 CF AE 
$AD$01$00$0B$00$04$00$00$00$00$00$00$00$00$00$BD$AE

AD 00 00 00 00 02 00 00 00 00 00 00 00 00 00 AF AE - ответ на передачу на модуль команды от ESP включение
AD 00 00 00 00 00 00 00 00 00 00 00 00 00 00 AD AE - ответ на передачу на модуль команды от ESP выключение

================== Выключатель 61 канал ==========

$AD$01$00$07$3D$04$00$00$00$00$00$00$00$00$00$F6$AE
$AD$01$00$08$3D$04$00$00$00$00$00$00$00$00$00$F7$AE
$AD$01$00$09$3D$04$00$00$00$00$00$00$00$00$00$F8$AE
$AD$01$00$0A$3D$05$00$00$00$00$00$00$00$00$00$FA$AE
$AD$01$00$0B$3D$0A$00$00$00$00$00$00$00$00$00$00$AE
$AD$01$00$0C$3D$0A$00$00$00$00$00$00$00$00$00$01$AE
$AD$01$00$0D$3D$0A$00$00$00$00$00$00$00$00$00$02$AE
$AD$01$00$0E$3D$0A$00$00$00$00$00$00$00$00$00$03$AE

================= Выключатель F ==================
$AD$02$00$00$01$82$00$01$01$01$FF$00$00$20$50$A4$AE
$AD$02$00$00$01$82$00$01$01$00$00$00$00$20$50$A4$AE




================== Датчик температуры =================
 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 
AD 01 00 04 1E 15 07 0D 11 00 FF 00 00 00 00 09 AE  - прием от датчика температуры (привязан) на канале 30
AD 01 00 05 1E 15 07 EC 10 00 FF 00 00 00 00 E8 AE 
AD 01 00 0E 1E 15 07 E6 10 00 FF 00 00 00 00 EB AE 
AD 01 00 25 1E 15 07 E7 10 00 FF 00 00 00 00 03 AE 
AD 01 00 1F 1E 15 07 E2 10 00 FF 00 00 00 00 F8 AE 
AD 01 00 21 1E 15 07 E2 10 00 FF 00 00 00 00 FA AE 
AD 01 00 23 1E 15 07 E4 10 00 FF 00 00 00 00 FE AE 

==================Датчик температуры и влажности ========

AD 01 00 07 1F 0F 01 02 20 23 FF 00 00 00 00 28 AE - прием от датчика температуры и влажности(привязан) на канале 31
AD 01 00 08 1F 0F 00 02 20 23 FF 00 00 00 00 28 AE 
AD 01 00 09 1F 15 07 F9 20 20 FF 00 00 00 00 2A AE 
AD 01 00 0A 1F 15 07 05 21 27 FF 00 00 00 00 3F AE 
AD 01 00 0B 1F 15 07 07 21 20 FF 00 00 00 00 3B AE
AD 01 00 0C 1F 15 07 07 21 1D FF 00 00 00 00 39 AE
AD 01 00 0D 1F 15 07 3C 21 29 FF 00 00 00 00 7B AE
AD 01 00 0F 1F 15 07 02 21 1F FF 00 00 00 00 39 AE 
AD 01 00 10 1F 15 07 01 21 1C FF 00 00 00 00 36 AE
AD 01 00 24 1F 15 07 E0 20 1F FF 00 00 00 00 2B AE 
AD 01 00 20 1F 15 07 E2 20 1D FF 00 00 00 00 27 AE


+================== RGB =================================
$AD$01$00$06$3D$0A$00$00$00$00$00$00$00$00$00$FB$AE
$AD$01$00$05$3D$0A$00$00$00$00$00$00$00$00$00$FA$AE
$AD$01$00$04$3D$0A$00$00$00$00$00$00$00$00$00$F9$AE
$AD$01$00$03$3D$0A$00$00$00$00$00$00$00$00$00$F8$AE
$AD$01$00$02$3D$10$04$00$00$00$00$00$00$00$00$01$AE
$AD$01$00$01$3D$11$04$00$00$00$00$00$00$00$00$01$AE
$AD$01$00$00$3D$11$04$00$00$00$00$00$00$00$00$00$AE
$AD$01$00$3F$3D$11$04$00$00$00$00$00$00$00$00$3F$AE


==================== Кружок ============================
$AD$01$00$3C$3D$0A$00$00$00$00$00$00$00$00$00$31$AE
$AD$01$00$3B$3D$0A$00$00$00$00$00$00$00$00$00$30$AE
$AD$01$00$3A$3D$0A$00$00$00$00$00$00$00$00$00$2F$AE
$AD$01$00$39$3D$0A$00$00$00$00$00$00$00$00$00$2E$AE
$AD$01$00$38$3D$13$04$00$00$00$00$00$00$00$00$3A$AE
$AD$01$00$37$3D$12$04$00$00$00$00$00$00$00$00$38$AE
$AD$01$00$36$3D$12$04$00$00$00$00$00$00$00$00$37$AE
$AD$01$00$35$3D$12$04$00$00$00$00$00$00$00$00$36$AE






  