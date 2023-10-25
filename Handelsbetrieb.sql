/*     UEBUNG-004 -- HANDELSBETRIEB     */
/*       3ACIFT        JAN RITT         */
/* Description: Simple Sales Database   */
 
/*        -- delete existing/conflicting tables --
drop table VERKAUF; drop table EINKAUF; drop table STELLT_HER; drop table HERSTELLER; 
drop table LIEFERANT; drop table ARTIKEL; drop table BESTELLUNG; drop table KUNDE;
*/
          -- create tables --
create table KUNDE      (KundenNr       NUMBER PRIMARY KEY, KundenName           VARCHAR(20),
                                                            KundenAnschrift      VARCHAR(40));
create table BESTELLUNG (BestellungsNr  NUMBER PRIMARY KEY, KundenNr             NUMBER REFERENCES KUNDE(KundenNr), 
                                                            BestellDatum         VARCHAR(12));
create table ARTIKEL    (ArtikelNr      NUMBER PRIMARY KEY, Bezeichnung          VARCHAR(20),
                                                            Preis                NUMBER(8,2));
create table LIEFERANT  (Lieferanten_ID NUMBER PRIMARY KEY, LieferantenName      VARCHAR(20), 
                                                            LieferantenAnschrift VARCHAR(40));
create table HERSTELLER (Hersteller_ID  NUMBER PRIMARY KEY, Marke                VARCHAR(20));
create table STELLT_HER (BezugsNr       NUMBER PRIMARY KEY, Hersteller_ID        NUMBER REFERENCES HERSTELLER(Hersteller_ID), 
                                                            ArtikelNr            NUMBER REFERENCES ARTIKEL(ArtikelNr));
create table EINKAUF    (EinkaufsNr     NUMBER PRIMARY KEY, Lieferanten_ID       NUMBER REFERENCES LIEFERANT(Lieferanten_ID),
                                                            ArtikelNr            NUMBER REFERENCES ARTIKEL(ArtikelNr));
create table VERKAUF    (VerkaufsNr     NUMBER PRIMARY KEY, BestellungsNr        NUMBER REFERENCES BESTELLUNG(BestellungsNr),
                                                            ArtikelNr            NUMBER REFERENCES ARTIKEL(ArtikelNr));
          -- fill tables --                                                             
/*           KUNDEN                                                                                                             */
insert into KUNDE VALUES (1,'OBI','Baustrasse 3, 4300 St.Valentin');
insert into KUNDE VALUES (2,'HORNBACH','Industrieviertel 7, 4040 Linz');
insert into KUNDE VALUES (3,'LAGERHAUS','Lagistrasse 69, 4020 Oberhausen');
/*           BESTELLUNGEN                                                                                                       */
insert into BESTELLUNG VALUES (1,3,'07.10.2022');
insert into BESTELLUNG VALUES (2,1,'18.02.2023');
insert into BESTELLUNG VALUES (3,2,'05.06.2023');
/*           ARTIKEL                                                                                                            */
insert into ARTIKEL VALUES (1,'Silikon',1.29);
insert into ARTIKEL VALUES (2,'Farbe',2.09);
insert into ARTIKEL VALUES (3,'Klebeband',0.49);
/*           LIEFERANTEN                                                                                                        */
insert into LIEFERANT VALUES (1,'SOUDAL Oesterreich','Irgendwo 8, 4300 St.Valentin');
insert into LIEFERANT VALUES (2,'Klaus Kleber','UHU Alee 3, 4040 Linz');
insert into LIEFERANT VALUES (3,'Farbmeister','Steyrstrasse 2, 3300 Amstetten');
/*           HERSTELLER                                                                                                         */
insert into HERSTELLER VALUES (1,'SOUDAL');
insert into HERSTELLER VALUES (2,'Farben Wahl');
insert into HERSTELLER VALUES (3,'UHU');
/*           STELLT_HER                                                                                                         */
insert into STELLT_HER VALUES (1,2,2);
insert into STELLT_HER VALUES (2,3,3);
insert into STELLT_HER VALUES (3,1,1);
/*           EINKÄUFE                                                                                                           */
insert into EINKAUF VALUES (1,1,1);
insert into EINKAUF VALUES (2,2,2);
insert into EINKAUF VALUES (3,3,3);
insert into EINKAUF VALUES (4,2,1);
insert into EINKAUF VALUES (5,1,3);
/*           VERKÄUFE                                                                                                           */
insert into VERKAUF VALUES (1,1,3);
insert into VERKAUF VALUES (2,2,1);
insert into VERKAUF VALUES (3,1,3);
insert into VERKAUF VALUES (4,3,1);
insert into VERKAUF VALUES (5,3,2);

          -- output tables --                                                             
select * from KUNDE;
select * from BESTELLUNG;
select * from ARTIKEL;
select * from LIEFERANT;
select * from HERSTELLER;
select * from STELLT_HER;
select * from EINKAUF;
select * from VERKAUF;


