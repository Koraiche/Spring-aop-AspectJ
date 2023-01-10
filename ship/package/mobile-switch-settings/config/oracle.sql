
alter session set current_schema = NXP_SMNM_SETTINGS;

CREATE SEQUENCE CENTER_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
  NOKEEP
  NOSCALE
  GLOBAL;
 
 CREATE SEQUENCE INSTITUTION_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
  NOKEEP
  NOSCALE
  GLOBAL;

CREATE SEQUENCE CENTER_FEE_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
  NOKEEP
  NOSCALE
  GLOBAL;

 
 CREATE SEQUENCE CENTER_FEE_RULE_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
  NOKEEP
  NOSCALE
  GLOBAL;
 
 CREATE SEQUENCE INTER_FEE_RULE_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
  NOKEEP
  NOSCALE
  GLOBAL;

 
 CREATE SEQUENCE KEYS_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
  NOKEEP
  NOSCALE
  GLOBAL;
 
 CREATE SEQUENCE CURRENCY_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
  NOKEEP
  NOSCALE
  GLOBAL;
 
 
 CREATE SEQUENCE INTER_SERVICE_FEES_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
  NOKEEP
  NOSCALE
  GLOBAL;

 
 CREATE SEQUENCE SERVICE_FEES_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
  NOKEEP
  NOSCALE
  GLOBAL;
 
 CREATE SEQUENCE SERVICE_FEE_RULE_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
  NOKEEP
  NOSCALE
  GLOBAL;

 CREATE SEQUENCE SERVICE_FEE_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
  NOKEEP
  NOSCALE
  GLOBAL;
 
 CREATE SEQUENCE INTER_FEE_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
  NOKEEP
  NOSCALE
  GLOBAL;
 
 CREATE SEQUENCE INTER_FEE_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
  NOKEEP
  NOSCALE
  GLOBAL;
 
 CREATE SEQUENCE INTER_FEE_SEQ_NAME
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER
  NOKEEP
  NOSCALE
  GLOBAL;


CREATE TABLE center (
  id number(19) NOT NULL,
  created_by varchar2(50) DEFAULT NULL,
  ts_create timestamp(0) DEFAULT NULL,
  updated_by varchar2(50) DEFAULT NULL,
  ts_update timestamp(0) DEFAULT NULL,
  owner_ref varchar2(255) DEFAULT NULL,
  cnt_email varchar2(255) DEFAULT NULL,
  cnt_fax varchar2(255) DEFAULT NULL,
  cnt_fname varchar2(255) DEFAULT NULL,
  cnt_phone_number_1 varchar2(255) DEFAULT NULL,
  cnt_lname varchar2(255) DEFAULT NULL,
  cnt_phone_number_2 varchar2(255) DEFAULT NULL,
  country varchar2(50) NOT NULL,
  end_of_day_time timestamp(0) NOT NULL,
  logo clob NOT NULL,
  name varchar2(30) NOT NULL,
  reference varchar2(6) NOT NULL,
  reference_currency varchar2(3) NOT NULL,
  settlement_currency varchar2(3) NOT NULL,
  status varchar2(255) DEFAULT NULL,
  time_zone varchar2(255) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT UK5ud80f0napdot3uqsg50rady1 UNIQUE  (reference),
  CONSTRAINT UK12w4b5j1cmod7fftaruvrg5q5 UNIQUE  (name)
) ;

CREATE TABLE institution (
  id number(19) NOT NULL,
  created_by varchar2(50) DEFAULT NULL,
  ts_create timestamp(0) DEFAULT NULL,
  updated_by varchar2(50) DEFAULT NULL,
  ts_update timestamp(0) DEFAULT NULL,
  owner_ref varchar2(255) DEFAULT NULL,
  acquirer_id varchar2(6) DEFAULT NULL,
  cnt_email varchar2(255) DEFAULT NULL,
  cnt_fax varchar2(255) DEFAULT NULL,
  cnt_fname varchar2(255) DEFAULT NULL,
  cnt_phone_number_1 varchar2(255) DEFAULT NULL,
  cnt_lname varchar2(255) DEFAULT NULL,
  cnt_phone_number_2 varchar2(255) DEFAULT NULL,
  country varchar2(50) NOT NULL,
  credit_endpoint varchar2(255) NOT NULL,
  debit_endpoint varchar2(255) NOT NULL,
  initiale varchar2(10) NOT NULL,
  logo clob NOT NULL,
  manage_notification raw(1) NOT NULL,
  name varchar2(100) NOT NULL,
  notify_endpoint varchar2(255) NOT NULL,
  reference varchar2(6) NOT NULL,
  status varchar2(255) DEFAULT NULL,
  center_id number(19) DEFAULT NULL,
  notification_configuration_name varchar2(255) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT UKq5f8y8p4uuvfg5afjim7r5htw UNIQUE  (reference),
  CONSTRAINT UKtr592c69igygahy57ba6x82gr UNIQUE  (name),
  CONSTRAINT UK1pp6aq0scfuq9t3fwphe0tqhx UNIQUE  (initiale),
  CONSTRAINT UKrf1wmcepmpe4sga4269cxnpco UNIQUE  (acquirer_id)
 ,
  CONSTRAINT FKi8enkccy2y3cu5keg17754nmw FOREIGN KEY (center_id) REFERENCES center (id)
) ;

CREATE INDEX FKi8enkccy2y3cu5keg17754nmw ON institution (center_id);

CREATE TABLE center_fee_rule (
  id number(19) NOT NULL,
  fee_max_amount number(19,2) NOT NULL,
  fee_min_amount number(19,2) NOT NULL,
  fixe number(19,2) NOT NULL,
  percentage binary_double NOT NULL,
  tr_max_amount number(19,2) NOT NULL,
  tr_min_amount number(19,2) NOT NULL,
  service_fees_id number(19) DEFAULT NULL,
  created_by varchar2(50) DEFAULT NULL,
  ts_create timestamp(0) DEFAULT NULL,
  updated_by varchar2(50) DEFAULT NULL,
  ts_update timestamp(0) DEFAULT NULL,
  PRIMARY KEY (id)
 ,
  CONSTRAINT FKlvimpipicnpfog0k1qvbky9dl FOREIGN KEY (service_fees_id) REFERENCES center_service_fee (id)
) ;

CREATE INDEX FKlvimpipicnpfog0k1qvbky9dl ON center_fee_rule (service_fees_id);

CREATE TABLE center_fee_template (
  id number(19) NOT NULL,
  created_by varchar2(50) DEFAULT NULL,
  ts_create timestamp(0) DEFAULT NULL,
  updated_by varchar2(50) DEFAULT NULL,
  ts_update timestamp(0) DEFAULT NULL,
  owner_ref varchar2(255) DEFAULT NULL,
  description varchar2(100) NOT NULL,
  name varchar2(30) NOT NULL,
  reference varchar2(6) NOT NULL,
  status varchar2(255) DEFAULT NULL,
  center_id number(19) DEFAULT NULL,
  PRIMARY KEY (id)
 ,
  CONSTRAINT FK15mw8elqv0fye335eu247p728 FOREIGN KEY (center_id) REFERENCES center (id)
) ;

CREATE INDEX FK15mw8elqv0fye335eu247p728 ON center_fee_template (center_id);



CREATE TABLE center_service_fee (
  id number(19) NOT NULL,
  service number(10) NOT NULL,
  fee_template_id number(19) DEFAULT NULL,
  created_by varchar2(50) DEFAULT NULL,
  ts_create timestamp(0) DEFAULT NULL,
  updated_by varchar2(50) DEFAULT NULL,
  ts_update timestamp(0) DEFAULT NULL,
  owner_ref varchar2(255) DEFAULT NULL,
  PRIMARY KEY (id)
 ,
  CONSTRAINT FKm12mtcihven5d645jvt2ywdbu FOREIGN KEY (fee_template_id) REFERENCES center_fee_template (id)
) ;

CREATE INDEX FKm12mtcihven5d645jvt2ywdbu ON center_service_fee (fee_template_id);

CREATE TABLE currency (
  id number(19) NOT NULL,
  fraction_digits number(10) NOT NULL,
  iso_code varchar2(255) DEFAULT NULL,
  name varchar2(255) DEFAULT NULL,
  numeric_code number(10) NOT NULL,
  PRIMARY KEY (id)
) ;


CREATE TABLE institution_services (
  institution_id number(19) NOT NULL,
  services varchar2(255) DEFAULT NULL
 ,
  CONSTRAINT FKl6uq39il06dq6la5ulbxvud9a FOREIGN KEY (institution_id) REFERENCES institution (id)
) ;

CREATE INDEX FKl6uq39il06dq6la5ulbxvud9a ON institution_services (institution_id);


CREATE TABLE inter_fee_institution (
  interchange_fee_template_id number(19) NOT NULL,
  institutions_id number(19) NOT NULL,
  PRIMARY KEY (interchange_fee_template_id,institutions_id)
 ,
  CONSTRAINT FK60txv6v3a3y13tgv4upu62iyd FOREIGN KEY (interchange_fee_template_id) REFERENCES interchange_fee_template (id),
  CONSTRAINT FKepfhh54pj7h89wlxhi5vhb41f FOREIGN KEY (institutions_id) REFERENCES institution (id)
) ;

CREATE INDEX FKepfhh54pj7h89wlxhi5vhb41f ON inter_fee_institution (institutions_id);

CREATE TABLE interchange_fee_rule (
  id number(19) NOT NULL,
  fee_max_amount number(19,2) NOT NULL,
  fee_min_amount number(19,2) NOT NULL,
  fixe number(19,2) NOT NULL,
  percentage binary_double NOT NULL,
  sense varchar2(255) DEFAULT NULL,
  tr_max_amount number(19,2) NOT NULL,
  tr_min_amount number(19,2) NOT NULL,
  inter_service_fees_id number(19) DEFAULT NULL,
  created_by varchar2(50) DEFAULT NULL,
  ts_create timestamp(0) DEFAULT NULL,
  updated_by varchar2(50) DEFAULT NULL,
  ts_update timestamp(0) DEFAULT NULL,
  owner_ref varchar2(255) DEFAULT NULL,
  PRIMARY KEY (id)
 ,
  CONSTRAINT FKri1yjo5jsgya3mmp8jlnye2ln FOREIGN KEY (inter_service_fees_id) REFERENCES interchange_service_fee (id)
) ;

CREATE INDEX FKri1yjo5jsgya3mmp8jlnye2ln ON interchange_fee_rule (inter_service_fees_id);

CREATE TABLE interchange_fee_template (
  id number(19) NOT NULL,
  created_by varchar2(50) DEFAULT NULL,
  ts_create timestamp(0) DEFAULT NULL,
  updated_by varchar2(50) DEFAULT NULL,
  ts_update timestamp(0) DEFAULT NULL,
  owner_ref varchar2(255) DEFAULT NULL,
  description varchar2(100) NOT NULL,
  name varchar2(30) NOT NULL,
  reference varchar2(6) NOT NULL,
  status varchar2(255) DEFAULT NULL,
  center_id number(19) DEFAULT NULL,
  PRIMARY KEY (id)
 ,
  CONSTRAINT FK93fagmsut8eee1li3nicd574d FOREIGN KEY (center_id) REFERENCES center (id)
) ;

CREATE INDEX FK93fagmsut8eee1li3nicd574d ON interchange_fee_template (center_id);


CREATE TABLE interchange_service_fee (
  id number(19) NOT NULL,
  service number(10) NOT NULL,
  inter_fee_template_id number(19) DEFAULT NULL,
  created_by varchar2(50) DEFAULT NULL,
  ts_create timestamp(0) DEFAULT NULL,
  updated_by varchar2(50) DEFAULT NULL,
  ts_update timestamp(0) DEFAULT NULL,
  owner_ref varchar2(255) DEFAULT NULL,
  PRIMARY KEY (id)
 ,
  CONSTRAINT FKarkam5sibn8knjru11kd4kuhd FOREIGN KEY (inter_fee_template_id) REFERENCES interchange_fee_template (id)
) ;

CREATE INDEX FKarkam5sibn8knjru11kd4kuhd ON interchange_service_fee (inter_fee_template_id);

CREATE TABLE key_generation (
  id number(19) NOT NULL,
  alias varchar2(30) NOT NULL,
  environment number(10) DEFAULT NULL,
  exp_date timestamp(0) DEFAULT NULL,
  gen_date timestamp(0) DEFAULT NULL,
  status varchar2(255) DEFAULT NULL,
  institution_id number(19) DEFAULT NULL,
  date_from timestamp(0) DEFAULT NULL,
  date_to timestamp(0) DEFAULT NULL,
  created_by varchar2(50) DEFAULT NULL,
  ts_create timestamp(0) DEFAULT NULL,
  updated_by varchar2(50) DEFAULT NULL,
  ts_update timestamp(0) DEFAULT NULL,
  owner_ref varchar2(255) DEFAULT NULL,
  PRIMARY KEY (id)
 ,
  CONSTRAINT FK7e7s3d1xqdb4n164ss6yuubwa FOREIGN KEY (institution_id) REFERENCES institution (id)
) ;

CREATE INDEX FK7e7s3d1xqdb4n164ss6yuubwa ON key_generation (institution_id);

CREATE TABLE service_fee_rule (
  id number(19) NOT NULL,
  fee_date_application timestamp(0) DEFAULT NULL,
  fee_amount number(19,2) DEFAULT NULL,
  fee_name varchar2(255) DEFAULT NULL,
  periodicity varchar2(255) DEFAULT NULL,
  service_fees_id number(19) DEFAULT NULL,
  created_by varchar2(50) DEFAULT NULL,
  ts_create timestamp(0) DEFAULT NULL,
  updated_by varchar2(50) DEFAULT NULL,
  ts_update timestamp(0) DEFAULT NULL,
  owner_ref varchar2(255) DEFAULT NULL,
  PRIMARY KEY (id)
 ,
  CONSTRAINT FKfkjytnosw9dvfe4729djtdr0w FOREIGN KEY (service_fees_id) REFERENCES service_fee_template (id)
) ;

CREATE INDEX FKfkjytnosw9dvfe4729djtdr0w ON service_fee_rule (service_fees_id);

CREATE TABLE service_fee_template (
  id number(19) NOT NULL,
  created_by varchar2(50) DEFAULT NULL,
  ts_create timestamp(0) DEFAULT NULL,
  updated_by varchar2(50) DEFAULT NULL,
  ts_update timestamp(0) DEFAULT NULL,
  owner_ref varchar2(255) DEFAULT NULL,
  description varchar2(100) NOT NULL,
  name varchar2(30) NOT NULL,
  notif_unit_price binary_double DEFAULT NULL,
  reference varchar2(6) NOT NULL,
  status varchar2(255) DEFAULT NULL,
  center_id number(19) DEFAULT NULL,
  institution_id number(19) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT UK_lc97s723hf4m1nnhd609ei28c UNIQUE  (name),
  CONSTRAINT UK_e6lwxa0en1apj6mdpijcn5llm UNIQUE  (reference),
  CONSTRAINT UKcjb4sr436wgjknfbr110iju63 UNIQUE  (reference),
  CONSTRAINT UKcjm68st3wngmx6n81yfppy6gv UNIQUE  (name)
 ,
  CONSTRAINT FKfmpwnbmqkx3jip6xnjxj1t0u1 FOREIGN KEY (institution_id) REFERENCES institution (id),
  CONSTRAINT FKg26haitv5w0utpyt9aechrlp8 FOREIGN KEY (center_id) REFERENCES center (id)
) ;

CREATE INDEX FKg26haitv5w0utpyt9aechrlp8 ON service_fee_template (center_id);
CREATE INDEX FKfmpwnbmqkx3jip6xnjxj1t0u1 ON service_fee_template (institution_id);

-- --------------------------------------------------------------
-- Datas
-- --------------------------------------------------------------

INSERT INTO currency  SELECT 1,2,'CZK','couronne tchque',203 FROM dual
 UNION ALL
 SELECT 2,-1,'XFO','franc or',0 FROM dual
 UNION ALL
 SELECT 3,2,'DOP','peso dominicain',214 FROM dual
 UNION ALL
 SELECT 4,2,'AWG','florin arubais',533 FROM dual
 UNION ALL
 SELECT 5,2,'MAD','dirham marocain',504 FROM dual
 UNION ALL
 SELECT 6,2,'PLN','zloty polonais',985 FROM dual
 UNION ALL
 SELECT 7,3,'TND','dinar tunisien',788 FROM dual
 UNION ALL
 SELECT 8,2,'BWP','pula botswanais',72 FROM dual
 UNION ALL
 SELECT 9,2,'GMD','dalasi gambien',270 FROM dual
 UNION ALL
 SELECT 10,2,'SDD','dinar soudanais',736 FROM dual
 UNION ALL
 SELECT 11,3,'JOD','dinar jordanien',400 FROM dual
 UNION ALL
 SELECT 12,2,'BOB','boliviano',68 FROM dual
 UNION ALL
 SELECT 13,2,'ZWL','Zimbabwean Dollar (2009)',932 FROM dual
 UNION ALL
 SELECT 14,2,'DKK','couronne danoise',208 FROM dual
 UNION ALL
 SELECT 15,2,'RUB','rouble russe',643 FROM dual
 UNION ALL
 SELECT 16,4,'CLF','unit dinvestissement chilienne',990 FROM dual
 UNION ALL
 SELECT 17,2,'CVE','escudo capverdien',132 FROM dual
 UNION ALL
 SELECT 18,2,'EEK','couronne estonienne',233 FROM dual
 UNION ALL
 SELECT 19,3,'KWD','dinar kowetien',414 FROM dual
 UNION ALL
 SELECT 20,2,'IEP','livre irlandaise',372 FROM dual
 UNION ALL
 SELECT 21,2,'PKR','roupie pakistanaise',586 FROM dual
 UNION ALL
 SELECT 22,0,'TRL','livre turque',792 FROM dual
 UNION ALL
 SELECT 23,2,'SOS','shilling somalien',706 FROM dual
 UNION ALL
 SELECT 24,2,'MWK','kwacha malawite',454 FROM dual
 UNION ALL
 SELECT 25,2,'AZM','manat azri (1993-2006)',31 FROM dual
 UNION ALL
 SELECT 26,2,'CHW','CHW',948 FROM dual
 UNION ALL
 SELECT 27,2,'AYM','AYM',945 FROM dual
 UNION ALL
 SELECT 28,0,'PYG','guaran paraguayen',600 FROM dual
 UNION ALL
 SELECT 29,-1,'XBB','unit montaire europenne',956 FROM dual
 UNION ALL
 SELECT 30,2,'ZMW','ZMW',967 FROM dual
 UNION ALL
 SELECT 31,2,'MXV','unit de conversion mexicaine (UDI)',979 FROM dual
 UNION ALL
 SELECT 32,2,'XCD','dollar des Carabes orientales',951 FROM dual
 UNION ALL
 SELECT 33,0,'GRD','drachme grecque',300 FROM dual
 UNION ALL
 SELECT 34,2,'SRD','dollar surinamais',968 FROM dual
 UNION ALL
 SELECT 35,2,'BND','dollar brunien',96 FROM dual
 UNION ALL
 SELECT 36,-1,'XFU','franc UIC',0 FROM dual
 UNION ALL
 SELECT 37,2,'GIP','livre de Gibraltar',292 FROM dual
 UNION ALL
 SELECT 38,2,'ZWD','dollar zimbabwen',716 FROM dual
 UNION ALL
 SELECT 39,2,'SZL','lilangeni swazi',748 FROM dual
 UNION ALL
 SELECT 40,2,'ZMK','kwacha zambien',894 FROM dual
 UNION ALL
 SELECT 41,2,'RUR','rouble russe (19911998)',810 FROM dual
 UNION ALL
 SELECT 42,-1,'XTS','(devise de test)',963 FROM dual
 UNION ALL
 SELECT 43,2,'AED','dirham des mirats arabes unis',784 FROM dual
 UNION ALL
 SELECT 44,0,'VND','dng vietnamien',704 FROM dual
 UNION ALL
 SELECT 45,2,'BRL','ral brsilien',986 FROM dual
 UNION ALL
 SELECT 46,2,'UAH','hryvnia ukrainienne',980 FROM dual
 UNION ALL
 SELECT 47,-1,'XDR','droit de tirage spcial',960 FROM dual
 UNION ALL
 SELECT 48,2,'MGA','ariary malgache',969 FROM dual
 UNION ALL
 SELECT 49,3,'OMR','rial omani',512 FROM dual
 UNION ALL
 SELECT 50,0,'BEF','franc belge',56 FROM dual
 UNION ALL
 SELECT 51,2,'BOV','mvdol bolivien',984 FROM dual
 UNION ALL
 SELECT 52,2,'MZM','mtical',508 FROM dual
 UNION ALL
 SELECT 53,2,'CHF','franc suisse',756 FROM dual
 UNION ALL
 SELECT 54,2,'COP','peso colombien',170 FROM dual
 UNION ALL
 SELECT 55,0,'MGF','franc malgache',450 FROM dual
 UNION ALL
 SELECT 56,3,'LYD','dinar lybien',434 FROM dual
 UNION ALL
 SELECT 57,2,'BDT','taka bangladeshi',50 FROM dual
 UNION ALL
 SELECT 58,2,'EGP','livre gyptienne',818 FROM dual
 UNION ALL
 SELECT 59,2,'PGK','kina papouan-no-guinen',598 FROM dual
 UNION ALL
 SELECT 60,0,'BIF','franc burundais',108 FROM dual
 UNION ALL
 SELECT 61,2,'SGD','dollar de Singapour',702 FROM dual
 UNION ALL
 SELECT 62,2,'AZN','manat azri',944 FROM dual
 UNION ALL
 SELECT 63,2,'NLG','florin nerlandais',528 FROM dual
 UNION ALL
 SELECT 64,0,'VUV','vatu vanuatuan',548 FROM dual
 UNION ALL
 SELECT 65,0,'CLP','peso chilien',152 FROM dual
 UNION ALL
 SELECT 66,2,'LKR','roupie srilankaise',144 FROM dual
 UNION ALL
 SELECT 67,0,'ITL','lire italienne',380 FROM dual
 UNION ALL
 SELECT 68,2,'WST','tala samoan',882 FROM dual
 UNION ALL
 SELECT 69,2,'GEL','lari gorgien',981 FROM dual
 UNION ALL
 SELECT 70,2,'SEK','couronne sudoise',752 FROM dual
 UNION ALL
 SELECT 71,2,'ILS','nouveau shekel isralien',376 FROM dual
 UNION ALL
 SELECT 72,2,'SDG','livre soudanaise',938 FROM dual
 UNION ALL
 SELECT 73,2,'AMD','dram armnien',51 FROM dual
 UNION ALL
 SELECT 74,2,'BGL','lev bulgare (19621999)',100 FROM dual
 UNION ALL
 SELECT 75,2,'CNY','yuan renminbi chinois',156 FROM dual
 UNION ALL
 SELECT 76,2,'MRO','ouguiya mauritanien',478 FROM dual
 UNION ALL
 SELECT 77,2,'VEB','bolivar',862 FROM dual
 UNION ALL
 SELECT 78,2,'CRC','coln costaricain',188 FROM dual
 UNION ALL
 SELECT 79,2,'AFN','afghani',971 FROM dual
 UNION ALL
 SELECT 80,2,'HRK','kuna croate',191 FROM dual
 UNION ALL
 SELECT 81,-1,'XPD','palladium',964 FROM dual
 UNION ALL
 SELECT 82,2,'LVL','lats letton',428 FROM dual
 UNION ALL
 SELECT 83,2,'KGS','som kirghize',417 FROM dual
 UNION ALL
 SELECT 84,2,'HUF','forint hongrois',348 FROM dual
 UNION ALL
 SELECT 85,0,'BYB','nouveau rouble bilorusse (1994-1999)',112 FROM dual
 UNION ALL
 SELECT 86,0,'XAF','franc CFA (BEAC)',950 FROM dual
 UNION ALL
 SELECT 87,2,'LSL','loti lesothan',426 FROM dual
 UNION ALL
 SELECT 88,0,'DJF','franc djiboutien',262 FROM dual
 UNION ALL
 SELECT 89,2,'MNT','tugrik mongol',496 FROM dual
 UNION ALL
 SELECT 90,0,'XOF','franc CFA (BCEAO)',952 FROM dual
 UNION ALL
 SELECT 91,-1,'XUA','ADB Unit of Account',965 FROM dual
 UNION ALL
 SELECT 92,2,'ARS','peso argentin',32 FROM dual
 UNION ALL
 SELECT 93,2,'RON','leu roumain',946 FROM dual
 UNION ALL
 SELECT 94,2,'BTN','ngultrum bouthanais',64 FROM dual
 UNION ALL
 SELECT 95,0,'BYR','rouble bilorusse',974 FROM dual
 UNION ALL
 SELECT 96,2,'CUC','peso cubain convertible',931 FROM dual
 UNION ALL
 SELECT 97,0,'ESP','peseta espagnole',724 FROM dual
 UNION ALL
 SELECT 98,0,'UGX','shilling ougandais',800 FROM dual
 UNION ALL
 SELECT 99,2,'USS','dollar des Etats-Unis (jour mme)',998 FROM dual
 UNION ALL
 SELECT 100,2,'TTD','dollar trinidadien',780 FROM dual
 UNION ALL
 SELECT 101,2,'BSD','dollar bahamen',44 FROM dual
 UNION ALL
 SELECT 102,0,'RWF','franc rwandais',646 FROM dual
 UNION ALL
 SELECT 103,0,'ADP','peseta andorrane',20 FROM dual
 UNION ALL
 SELECT 104,2,'CHE','CHE',947 FROM dual
 UNION ALL
 SELECT 105,-1,'XBA','unit europenne compose',955 FROM dual
 UNION ALL
 SELECT 106,2,'KHR','riel cambodgien',116 FROM dual
 UNION ALL
 SELECT 107,2,'TMM','manat turkmne',795 FROM dual
 UNION ALL
 SELECT 108,2,'GTQ','quetzal guatmaltque',320 FROM dual
 UNION ALL
 SELECT 109,2,'FRF','franc franais',250 FROM dual
 UNION ALL
 SELECT 110,2,'ANG','florin antillais',532 FROM dual
 UNION ALL
 SELECT 111,2,'STN','So Tom and Prncipe Dobra',930 FROM dual
 UNION ALL
 SELECT 112,2,'LBP','livre libanaise',422 FROM dual
 UNION ALL
 SELECT 113,2,'BMD','dollar bermudien',60 FROM dual
 UNION ALL
 SELECT 114,2,'CUP','peso cubain',192 FROM dual
 UNION ALL
 SELECT 115,2,'TMT','nouveau manat turkmne',934 FROM dual
 UNION ALL
 SELECT 116,2,'ZWR','Zimbabwean Dollar (2008)',935 FROM dual
 UNION ALL
 SELECT 117,2,'ROL','ancien leu roumain',946 FROM dual
 UNION ALL
 SELECT 118,2,'PEN','nouveau sol pruvien',604 FROM dual
 UNION ALL
 SELECT 119,2,'CAD','dollar canadien',124 FROM dual
 UNION ALL
 SELECT 120,2,'CDF','franc congolais',976 FROM dual
 UNION ALL
 SELECT 121,2,'NAD','dollar namibien',516 FROM dual
 UNION ALL
 SELECT 122,2,'TOP','paanga tongan',776 FROM dual
 UNION ALL
 SELECT 123,2,'MRU','Mauritanian Ouguiya',929 FROM dual
 UNION ALL
 SELECT 124,2,'NGN','naira nigrian',566 FROM dual
 UNION ALL
 SELECT 125,2,'SIT','tolar slovne',705 FROM dual
 UNION ALL
 SELECT 126,2,'ERN','nafka rythren',232 FROM dual
 UNION ALL
 SELECT 127,2,'ALL','lek albanais',8 FROM dual
 UNION ALL
 SELECT 128,-1,'XBD','unit de compte europenne (XBD)',958 FROM dual
 UNION ALL
 SELECT 129,2,'FJD','dollar fidjien',242 FROM dual
 UNION ALL
 SELECT 130,2,'SHP','livre de Sainte-Hlne',654 FROM dual
 UNION ALL
 SELECT 131,2,'HTG','gourde hatienne',332 FROM dual
 UNION ALL
 SELECT 132,2,'SBD','dollar des les Salomon',90 FROM dual
 UNION ALL
 SELECT 133,2,'SLL','leone sierra-lonais',694 FROM dual
 UNION ALL
 SELECT 134,2,'BBD','dollar barbadien',52 FROM dual
 UNION ALL
 SELECT 135,0,'PTE','escudo portugais',620 FROM dual
 UNION ALL
 SELECT 136,2,'NIO','crdoba oro nicaraguayen',558 FROM dual
 UNION ALL
 SELECT 137,2,'KPW','won nord-coren',408 FROM dual
 UNION ALL
 SELECT 138,2,'AUD','dollar australien',36 FROM dual
 UNION ALL
 SELECT 139,2,'IDR','roupie indonsienne',360 FROM dual
 UNION ALL
 SELECT 140,0,'ISK','couronne islandaise',352 FROM dual
 UNION ALL
 SELECT 141,2,'KES','shilling knyan',404 FROM dual
 UNION ALL
 SELECT 142,2,'PAB','balboa panamen',590 FROM dual
 UNION ALL
 SELECT 143,2,'MUR','roupie mauricienne',480 FROM dual
 UNION ALL
 SELECT 144,2,'NOK','couronne norvgienne',578 FROM dual
 UNION ALL
 SELECT 145,2,'USN','dollar des Etats-Unis (jour suivant)',997 FROM dual
 UNION ALL
 SELECT 146,2,'BYN','Belarusian Ruble',933 FROM dual
 UNION ALL
 SELECT 147,3,'IQD','dinar irakien',368 FROM dual
 UNION ALL
 SELECT 148,2,'PHP','peso philippin',608 FROM dual
 UNION ALL
 SELECT 149,2,'DEM','mark allemand',276 FROM dual
 UNION ALL
 SELECT 150,-1,'XXX','devise inconnue ou non valide',999 FROM dual
 UNION ALL
 SELECT 151,0,'TPE','escudo timorais',626 FROM dual
 UNION ALL
 SELECT 152,0,'LUF','franc luxembourgeois',442 FROM dual
 UNION ALL
 SELECT 153,2,'MDL','leu moldave',498 FROM dual
 UNION ALL
 SELECT 154,-1,'XPT','platine',962 FROM dual
 UNION ALL
 SELECT 155,2,'GBP','livre sterling',826 FROM dual
 UNION ALL
 SELECT 156,2,'IRR','rial iranien',364 FROM dual
 UNION ALL
 SELECT 157,0,'KRW','won sud-coren',410 FROM dual
 UNION ALL
 SELECT 158,2,'GHS','cdi ghanen',936 FROM dual
 UNION ALL
 SELECT 159,2,'AOA','kwanza angolais',973 FROM dual
 UNION ALL
 SELECT 160,2,'MYR','ringgit malais',458 FROM dual
 UNION ALL
 SELECT 161,2,'TWD','nouveau dollar tawanais',901 FROM dual
 UNION ALL
 SELECT 162,2,'SCR','roupie des Seychelles',690 FROM dual
 UNION ALL
 SELECT 163,2,'YER','rial ymnite',886 FROM dual
 UNION ALL
 SELECT 164,2,'MVR','rufiyaa maldivienne',462 FROM dual
 UNION ALL
 SELECT 165,2,'TJS','somoni tadjik',972 FROM dual
 UNION ALL
 SELECT 166,0,'UYI','UYI',940 FROM dual
 UNION ALL
 SELECT 167,0,'GNF','franc guinen',324 FROM dual
 UNION ALL
 SELECT 168,2,'HKD','dollar de Hong Kong',344 FROM dual
 UNION ALL
 SELECT 169,2,'INR','roupie indienne',356 FROM dual
 UNION ALL
 SELECT 170,2,'LAK','kip loatien',418 FROM dual
 UNION ALL
 SELECT 171,2,'GHC','cdi',288 FROM dual
 UNION ALL
 SELECT 172,2,'MZN','metical mozambicain',943 FROM dual
 UNION ALL
 SELECT 173,2,'FIM','mark finlandais',246 FROM dual
 UNION ALL
 SELECT 174,2,'NPR','roupie npalaise',524 FROM dual
 UNION ALL
 SELECT 175,-1,'XSU','Sucre',994 FROM dual
 UNION ALL
 SELECT 176,2,'AFA','afghani (19272002)',4 FROM dual
 UNION ALL
 SELECT 177,-1,'XBC','unit de compte europenne (XBC)',957 FROM dual
 UNION ALL
 SELECT 178,2,'VES','Venezuelan Bolvar Soberano',928 FROM dual
 UNION ALL
 SELECT 179,2,'KYD','dollar des les Camanes',136 FROM dual
 UNION ALL
 SELECT 180,2,'SSP','South Sudanese Pound',728 FROM dual
 UNION ALL
 SELECT 181,2,'GYD','dollar du Guyana',328 FROM dual
 UNION ALL
 SELECT 182,2,'VEF','bolivar fuerte vnzulien',937 FROM dual
 UNION ALL
 SELECT 183,2,'JMD','dollar jamacain',388 FROM dual
 UNION ALL
 SELECT 184,0,'KMF','franc comorien',174 FROM dual
 UNION ALL
 SELECT 185,2,'SRG','florin surinamais',740 FROM dual
 UNION ALL
 SELECT 186,2,'CSD','dinar serbo-montngrin',891 FROM dual
 UNION ALL
 SELECT 187,2,'LTL','litas lituanien',440 FROM dual
 UNION ALL
 SELECT 188,2,'STD','dobra santomen',678 FROM dual
 UNION ALL
 SELECT 189,2,'BAM','mark convertible bosniaque',977 FROM dual
 UNION ALL
 SELECT 190,2,'BGN','nouveau lev bulgare',975 FROM dual
 UNION ALL
 SELECT 191,2,'ZWN','ZWN',942 FROM dual
 UNION ALL
 SELECT 192,2,'ZAR','rand sud-africain',710 FROM dual
 UNION ALL
 SELECT 193,2,'SYP','livre syrienne',760 FROM dual
 UNION ALL
 SELECT 194,2,'SVC','coln salvadorien',222 FROM dual
 UNION ALL
 SELECT 195,2,'GWP','peso bissau-guinen',624 FROM dual
 UNION ALL
 SELECT 196,2,'MKD','denar macdonien',807 FROM dual
 UNION ALL
 SELECT 197,2,'RSD','dinar serbe',941 FROM dual
 UNION ALL
 SELECT 198,2,'YUM','dinar yougoslave Noviy',891 FROM dual
 UNION ALL
 SELECT 199,2,'LRD','dollar librien',430 FROM dual
 UNION ALL
 SELECT 200,2,'MMK','kyat myanmarais',104 FROM dual
 UNION ALL
 SELECT 201,2,'BZD','dollar blizen',84 FROM dual
 UNION ALL
 SELECT 202,2,'MTL','lire maltaise',470 FROM dual
 UNION ALL
 SELECT 203,2,'THB','baht thalandais',764 FROM dual
 UNION ALL
 SELECT 204,-1,'XAU','or',959 FROM dual
 UNION ALL
 SELECT 205,2,'NZD','dollar no-zlandais',554 FROM dual
 UNION ALL
 SELECT 206,2,'SAR','rial saoudien',682 FROM dual
 UNION ALL
 SELECT 207,2,'DZD','dinar algrien',12 FROM dual
 UNION ALL
 SELECT 208,2,'ATS','schilling autrichien',40 FROM dual
 UNION ALL
 SELECT 209,2,'COU','COU',970 FROM dual
 UNION ALL
 SELECT 210,2,'UZS','sum ouzbek',860 FROM dual
 UNION ALL
 SELECT 211,2,'FKP','livre des Falkland',238 FROM dual
 UNION ALL
 SELECT 212,2,'CYP','livre chypriote',196 FROM dual
 UNION ALL
 SELECT 213,2,'MOP','pataca macanaise',446 FROM dual
 UNION ALL
 SELECT 214,2,'UYU','peso uruguayen',858 FROM dual
 UNION ALL
 SELECT 215,3,'BHD','dinar bahreni',48 FROM dual
 UNION ALL
 SELECT 216,2,'TZS','shilling tanzanien',834 FROM dual
 UNION ALL
 SELECT 217,2,'TRY','nouvelle livre turque',949 FROM dual
 UNION ALL
 SELECT 218,2,'USD','dollar des tats-Unis',840 FROM dual
 UNION ALL
 SELECT 219,0,'XPF','franc CFP',953 FROM dual
 UNION ALL
 SELECT 220,2,'KZT','tenge kazakh',398 FROM dual
 UNION ALL
 SELECT 221,2,'EUR','euro',978 FROM dual
 UNION ALL
 SELECT 222,2,'HNL','lempira hondurien',340 FROM dual
 UNION ALL
 SELECT 223,2,'QAR','rial qatari',634 FROM dual
 UNION ALL
 SELECT 224,0,'JPY','yen japonais',392 FROM dual
 UNION ALL
 SELECT 225,2,'ETB','birr thiopien',230 FROM dual
 UNION ALL
 SELECT 226,2,'MXN','peso mexicain',484 FROM dual
 UNION ALL
 SELECT 227,2,'SKK','couronne slovaque',703 FROM dual
 UNION ALL
 SELECT 228,-1,'XAG','argent',961 FROM dual;
/* SQLINES DEMO ***  `currency` ENABLE KEYS */;
UNLOCK TABLES;



