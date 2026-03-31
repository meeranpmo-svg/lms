-- ============================================================
-- ANSHA MONTESSORI 2026 BATCH — STUDENT IMPORT
-- Run in Supabase SQL Editor  (one-time import)
-- username = firstname_last4phone  |  password = last 8 digits of phone
-- ============================================================

-- =============================================================
-- STEP 1 — INSERT ALL STUDENTS INTO users TABLE
-- =============================================================
INSERT INTO users (name, username, phone, password, role, avatar, is_active) VALUES

-- ── MONTESSORI (c1) — 91 students ──────────────────────────
('PRIYA KARTHIK',              'priya_4095',         '8098374095', '98374095', 'student', '👩‍🎓', true),
('SOWMIYA VISHWANATHAN',       'sowmiya_4499',       '9884254499', '84254499', 'student', '👩‍🎓', true),
('HALITHA PARVEEN S',          'halitha_3093',       '9092383093', '92383093', 'student', '👩‍🎓', true),
('RASUL KIFFTHIYA',            'rasul_4557',         '7667974557', '67974557', 'student', '👩‍🎓', true),
('SRINITHI',                   'srinithi_9605',      '9789149605', '89149605', 'student', '👩‍🎓', true),
('YUVASHREE',                  'yuvashree_7136',     '7550267136', '50267136', 'student', '👩‍🎓', true),
('AFRIN SHIFANA M',            'afrin_0497',         '9952730497', '52730497', 'student', '👩‍🎓', true),
('SIRISHA',                    'sirisha_0358',       '9363380358', '63380358', 'student', '👩‍🎓', true),
('KARISHMA',                   'karishma_9500',      '7695859500', '95859500', 'student', '👩‍🎓', true),
('REKHA',                      'rekha_2927',         '8148132927', '48132927', 'student', '👩‍🎓', true),
('SILMIYA RANI',               'silmiya_3597',       '6374013597', '74013597', 'student', '👩‍🎓', true),
('SYAMALA',                    'syamala_4098',       '9361534098', '61534098', 'student', '👩‍🎓', true),
('NAJEEHA NABIL',              'najeeha_2834',       '7448782834', '48782834', 'student', '👩‍🎓', true),
('SUDHA N',                    'sudha_7151',         '9384657151', '84657151', 'student', '👩‍🎓', true),
('DIVYA A',                    'divya_7518',         '9952927518', '52927518', 'student', '👩‍🎓', true),
('HABIBA',                     'habiba_2424',        '9080042424', '80042424', 'student', '👩‍🎓', true),
('SWETHA',                     'swetha_5996',        '7200645996', '00645996', 'student', '👩‍🎓', true),
('ABIRAMI',                    'abirami_7620',       '9940287620', '40287620', 'student', '👩‍🎓', true),
('SULTHANA',                   'sulthana_9883',      '6383409883', '83409883', 'student', '👩‍🎓', true),
('SABAANA',                    'sabaana_7003',       '7395897003', '95897003', 'student', '👩‍🎓', true),
('AYEESHA REEMA',              'ayeesha_8105',       '7358448105', '58448105', 'student', '👩‍🎓', true),
('RASIKA S',                   'rasika_7672',        '7358837672', '58837672', 'student', '👩‍🎓', true),
('GOMATHI',                    'gomathi_2152',       '9626882152', '26882152', 'student', '👩‍🎓', true),
('FEBINA BEGUM J',             'febina_9793',        '6383949793', '83949793', 'student', '👩‍🎓', true),
('PARVEEN BANU A',             'parveen_1208',       '8111031208', '11031208', 'student', '👩‍🎓', true),
('KALAIMATHI',                 'kalaimathi_6857',    '8904346857', '04346857', 'student', '👩‍🎓', true),
('POORNISHA R',                'poornisha_8268',     '6383348268', '83348268', 'student', '👩‍🎓', true),
('FATHIMA S',                  'fathima_7217',       '9962417217', '62417217', 'student', '👩‍🎓', true),
('DHANALAKSHMI S',             'dhanalakshmi_3732',  '8754343732', '54343732', 'student', '👩‍🎓', true),
('LATHA A',                    'latha_6078',         '9962886078', '62886078', 'student', '👩‍🎓', true),
('SHIFANA',                    'shifana_3350',       '9952793350', '52793350', 'student', '👩‍🎓', true),
('ASMIYA ASFAR',               'asmiya_2419',        '7200622419', '00622419', 'student', '👩‍🎓', true),
('JANAGI R',                   'janagi_6801',        '8778906801', '78906801', 'student', '👩‍🎓', true),
('SAHANA',                     'sahana_1263',        '9600061263', '00061263', 'student', '👩‍🎓', true),
('MUMTAJ',                     'mumtaj_0533',        '9940380533', '40380533', 'student', '👩‍🎓', true),
('NITHYA C',                   'nithya_0943',        '9884760943', '84760943', 'student', '👩‍🎓', true),
('SARALA',                     'sarala_6665',        '7010146665', '10146665', 'student', '👩‍🎓', true),
('GAYATHRI G',                 'gayathri_3819',      '8220413819', '20413819', 'student', '👩‍🎓', true),
('MARSUKA BANU B',             'marsuka_7986',       '7358597986', '58597986', 'student', '👩‍🎓', true),
('POOVIZHI D',                 'poovizhi_2798',      '9344992798', '44992798', 'student', '👩‍🎓', true),
('PARVEEN FATHIMA R',          'parveen_3969',       '6385523969', '85523969', 'student', '👩‍🎓', true),
('SABINA BEEVI A',             'sabina_9386',        '9941539386', '41539386', 'student', '👩‍🎓', true),
('HAMEEDA BEEVI N',            'hameeda_9910',       '9500099910', '00099910', 'student', '👩‍🎓', true),
('JAYABHARATHI',               'jayabharathi_0510',  '9360720510', '60720510', 'student', '👩‍🎓', true),
('SHALINI',                    'shalini_8330',       '7448378330', '48378330', 'student', '👩‍🎓', true),
('JANAGI',                     'janagi_1913',        '8072301913', '72301913', 'student', '👩‍🎓', true),
('NARGIES BANU',               'nargies_3892',       '9994213892', '94213892', 'student', '👩‍🎓', true),
('VIDHYASRI S',                'vidhyasri_8081',     '9884868081', '84868081', 'student', '👩‍🎓', true),
('JANNATH FIRTHOUSE',          'jannath_4166',       '8248284166', '48284166', 'student', '👩‍🎓', true),
('KOWSALYA S',                 'kowsalya_2711',      '8925142711', '25142711', 'student', '👩‍🎓', true),
('MUTHU KANAGASELVI G',        'muthu_0555',         '8870420555', '70420555', 'student', '👩‍🎓', true),
('SHAZIYA M',                  'shaziya_3898',       '9042473898', '42473898', 'student', '👩‍🎓', true),
('THANZEERA',                  'thanzeera_8172',     '6385858172', '85858172', 'student', '👩‍🎓', true),
('KALAIVANI M',                'kalaivani_1527',     '9790581527', '90581527', 'student', '👩‍🎓', true),
('SHIFANA FATHIMA A',          'shifana_3003',       '9514043003', '14043003', 'student', '👩‍🎓', true),
('MAGESHWARI G',               'mageshwari_1934',    '9345401934', '45401934', 'student', '👩‍🎓', true),
('AYISHA S',                   'ayisha_1416',        '6385791416', '85791416', 'student', '👩‍🎓', true),
('GOWRIPRIYA R',               'gowripriya_7987',    '8667287987', '67287987', 'student', '👩‍🎓', true),
('MEIVIZHI K',                 'meivizhi_4925',      '7092514925', '92514925', 'student', '👩‍🎓', true),
('HARSHANA M',                 'harshana_3051',      '9566733051', '66733051', 'student', '👩‍🎓', true),
('RAHMATH NISHA S',            'rahmath_9511',       '9003749511', '03749511', 'student', '👩‍🎓', true),
('GAYATHRI J',                 'gayathri_5391',      '9884935391', '84935391', 'student', '👩‍🎓', true),
('ASHRATH A',                  'ashrath_0789',       '9244400789', '44400789', 'student', '👩‍🎓', true),
('PRADEEPA R',                 'pradeepa_4230',      '9884684230', '84684230', 'student', '👩‍🎓', true),
('SUMAIYA S',                  'sumaiya_8140',       '9840738140', '40738140', 'student', '👩‍🎓', true),
('SANDHIYA DHAYALAN',          'sandhiya_2729',      '9500862729', '00862729', 'student', '👩‍🎓', true),
('GIRIJA SANKAR',              'girija_0068',        '7094160068', '94160068', 'student', '👩‍🎓', true),
('KARPAGAM',                   'karpagam_4410',      '9994454410', '94454410', 'student', '👩‍🎓', true),
('ARCHANA JEYARAM',            'archana_6420',       '1206306420', '06306420', 'student', '👩‍🎓', true),
('RAJA KUMARI R',              'raja_8260',          '8870088260', '70088260', 'student', '👩‍🎓', true),
('SHREE LEKKA N',              'shree_0446',         '8220880446', '20880446', 'student', '👩‍🎓', true),
('AAMINA',                     'aamina_5636',        '6383595636', '83595636', 'student', '👩‍🎓', true),
('AZMINA BARVEEN',             'azmina_8005',        '9003368005', '03368005', 'student', '👩‍🎓', true),
('RUVAITHA ANSARI',            'ruvaitha_2683',      '9962462683', '62462683', 'student', '👩‍🎓', true),
('GHOUSIA BEGAM',              'ghousia_2552',       '9843672552', '43672552', 'student', '👩‍🎓', true),
('SOBBIYA S',                  'sobbiya_1096',       '7338791096', '38791096', 'student', '👩‍🎓', true),
('ANUSHEYA',                   'anusheya_5957',      '7305065957', '05065957', 'student', '👩‍🎓', true),
('POOJA',                      'pooja_4348',         '9176034348', '76034348', 'student', '👩‍🎓', true),
('JENNIFER DOMINICA CLARKSON', 'jennifer_0737',      '8838650737', '38650737', 'student', '👩‍🎓', true),
('JANAKI',                     'janaki_6317',        '9597596317', '97596317', 'student', '👩‍🎓', true),
('SANDHYA RANI',               'sandhya_7384',       '8807987384', '07987384', 'student', '👩‍🎓', true),
('ANJALI DEVI',                'anjali_3440',        '8778603440', '78603440', 'student', '👩‍🎓', true),
('PRIYADHARSHINI',             'priyadharshini_8372','9840118372', '40118372', 'student', '👩‍🎓', true),
('REENA S',                    'reena_8808',         '6374018808', '74018808', 'student', '👩‍🎓', true),
('TAMILSELVI',                 'tamilselvi_2034',    '9790432034', '90432034', 'student', '👩‍🎓', true),
('JAYASRI',                    'jayasri_3210',       '9789053210', '89053210', 'student', '👩‍🎓', true),
('HABEEBA REEM',               'habeeba_9394',       '8668049394', '68049394', 'student', '👩‍🎓', true),
('SABINA BEE',                 'sabina_5631',        '9656645631', '56645631', 'student', '👩‍🎓', true),
('RAHMATH ASMI',               'rahmath_4461',       '7339454461', '39454461', 'student', '👩‍🎓', true),
('HEMALAVANYA',                'hemalavanya_8162',   '8248708162', '48708162', 'student', '👩‍🎓', true),
('PRAVILIKA',                  'pravilika_4116',     '7010964116', '10964116', 'student', '👩‍🎓', true),

-- ── SPOKEN ENGLISH (c2) — 3 students ───────────────────────
-- NOTE: Hameeda (hameeda_9910) already inserted above — ON CONFLICT handles it
('DIVYA',                      'divya_7738',         '6379377738', '79377738', 'student', '👩‍🎓', true),
('LOGANAYAGI',                 'loganayagi_0625',    '7349460625', '49460625', 'student', '👩‍🎓', true),

-- ── PHONICS (c3) — 9 students (Mrs. Priya's class) ─────────
-- NOTE: Aamina (aamina_5636) already inserted above — ON CONFLICT handles it
('AYISHA',                     'ayisha_2440',        '8189802440', '89802440', 'student', '👩‍🎓', true),
('VAIRAMANI S',                'vairamani_6923',     '9486386923', '86386923', 'student', '👩‍🎓', true),
('RAFIA',                      'rafia_1542',         '9952051542', '52051542', 'student', '👩‍🎓', true),
('JAYAPRATHA',                 'jayapratha_3951',    '9962383951', '62383951', 'student', '👩‍🎓', true),
('SITTA VARALAKSHMI',          'sitta_2563',         '8463902563', '63902563', 'student', '👩‍🎓', true),
('ARUNA DEVI',                 'aruna_1886',         '9962531886', '62531886', 'student', '👩‍🎓', true),
('VIJAYALAKSHMI P',            'vijayalakshmi_1811', '9080791811', '80791811', 'student', '👩‍🎓', true),
('SHIBA',                      'shiba_6329',         '7502246329', '02246329', 'student', '👩‍🎓', true),

-- ── CHILD PSYCHOLOGY (c4) — 11 students ────────────────────
-- NOTE: Jennifer (jennifer_0737) already inserted above — ON CONFLICT handles it
('HAFZA',                      'hafza_0221',         '7871930221', '71930221', 'student', '👩‍🎓', true),
('THASLINISHA',                'thaslinisha_0557',   '9123510557', '23510557', 'student', '👩‍🎓', true),
('AMREEN',                     'amreen_4966',        '9345144966', '45144966', 'student', '👩‍🎓', true),
('FATHIMA',                    'fathima_3158',       '7812883158', '12883158', 'student', '👩‍🎓', true),
('HAMEETHA PARVEEN',           'hameetha_2019',      '7418082019', '18082019', 'student', '👩‍🎓', true),
('KATHIJA',                    'kathija_8121',       '9787008121', '87008121', 'student', '👩‍🎓', true),
('SIRAJUN NISHA',              'sirajun_0788',       '9042930788', '42930788', 'student', '👩‍🎓', true),
('AFRA',                       'afra_1050',          '9487081050', '87081050', 'student', '👩‍🎓', true),
('SHAHIN',                     'shahin_4872',        '8754884872', '54884872', 'student', '👩‍🎓', true),
('SUSHMA SULTHANA',            'sushma_3675',        '9444263675', '44263675', 'student', '👩‍🎓', true)

ON CONFLICT (username) DO NOTHING;


-- =============================================================
-- STEP 2 — MONTESSORI (c1) ENROLLMENTS
-- =============================================================
WITH c1(un, total, balance) AS (VALUES
  ('priya_4095',         15000, 10000),
  ('sowmiya_4499',       15000, 10000),
  ('halitha_3093',       17000, 15000),
  ('rasul_4557',         17000, 15000),
  ('srinithi_9605',      15000,  5000),
  ('yuvashree_7136',     16000, 11000),
  ('afrin_0497',         16000, 12500),
  ('sirisha_0358',       16000, 12000),
  ('karishma_9500',      20000,  8000),
  ('rekha_2927',         15000, 12000),
  ('silmiya_3597',       20000,  8000),
  ('syamala_4098',       18000, 15000),
  ('najeeha_2834',       18000,  3000),
  ('sudha_7151',         20000, 15000),
  ('divya_7518',         20000, 18000),
  ('habiba_2424',        20000, 16000),
  ('swetha_5996',        25000, 23000),
  ('abirami_7620',       20000, 16000),
  ('sulthana_9883',      20000, 18000),
  ('sabaana_7003',       18000, 16000),
  ('ayeesha_8105',       20000,     0),
  ('rasika_7672',        24000, 22000),
  ('gomathi_2152',       25000, 15000),
  ('febina_9793',        20000, 19000),
  ('parveen_1208',       18000, 17000),
  ('kalaimathi_6857',    25000, 23000),
  ('poornisha_8268',     25000, 20000),
  ('fathima_7217',       24000, 22000),
  ('dhanalakshmi_3732',  21000, 19000),
  ('latha_6078',         20000, 13000),
  ('shifana_3350',       21000, 18000),
  ('asmiya_2419',        25000, 23000),
  ('janagi_6801',        20000, 17000),
  ('sahana_1263',        20000, 17000),
  ('mumtaj_0533',        20000, 17000),
  ('nithya_0943',        15000, 10000),
  ('sarala_6665',        10000,  5000),
  ('gayathri_3819',      15000, 13000),
  ('marsuka_7986',       15000, 10000),
  ('poovizhi_2798',      15000, 13000),
  ('parveen_3969',       15000,     0),
  ('sabina_9386',        15000, 10000),
  ('hameeda_9910',       23000, 12000),
  ('jayabharathi_0510',  15000, 10000),
  ('shalini_8330',       15000,  7000),
  ('janagi_1913',        15000, 10000),
  ('nargies_3892',       15000, 10000),
  ('vidhyasri_8081',     22000, 19000),
  ('jannath_4166',       15000, 10000),
  ('kowsalya_2711',      22000, 21000),
  ('muthu_0555',         25000, 10000),
  ('shaziya_3898',       18000, 15000),
  ('thanzeera_8172',     20000, 15000),
  ('kalaivani_1527',     20000, 17000),
  ('shifana_3003',       18000, 16000),
  ('mageshwari_1934',    25000, 10500),
  ('ayisha_1416',        25000, 23000),
  ('gowripriya_7987',    20000,     0),
  ('meivizhi_4925',      20000, 17000),
  ('harshana_3051',      25000, 20000),
  ('rahmath_9511',       20000, 16000),
  ('gayathri_5391',      20000, 17000),
  ('ashrath_0789',       25000, 22000),
  ('pradeepa_4230',      18000,  9000),
  ('sumaiya_8140',       18000, 12000),
  ('sandhiya_2729',      25000, 15000),
  ('girija_0068',        18000, 11000),
  ('karpagam_4410',      25000, 20000),
  ('archana_6420',       25000, 20000),
  ('raja_8260',          20000, 16000),
  ('shree_0446',         20000, 17000),
  ('aamina_5636',        20000, 17000),
  ('azmina_8005',        20000, 17000),
  ('ruvaitha_2683',      20000, 16000),
  ('ghousia_2552',       25000, 20000),
  ('sobbiya_1096',       25000, 20000),
  ('anusheya_5957',      20000, 18000),
  ('pooja_4348',         21000,     0),
  ('jennifer_0737',      30000, 23000),
  ('janaki_6317',        20000, 15000),
  ('sandhya_7384',       20000, 16000),
  ('anjali_3440',        15000, 11000),
  ('priyadharshini_8372',15000, 10000),
  ('reena_8808',         20000, 15000),
  ('tamilselvi_2034',    15000, 12000),
  ('jayasri_3210',       20000, 15000),
  ('habeeba_9394',       20000, 17000),
  ('sabina_5631',            0,     0),
  ('rahmath_4461',       20000, 15000),
  ('hemalavanya_8162',   20000, 18000),
  ('pravilika_4116',     20000, 16000)
)
INSERT INTO enrollments (student_id, course_id, status, fee_status)
SELECT u.id, 'c1', 'active',
  CASE WHEN d.balance = 0 THEN 'paid' ELSE 'partial' END
FROM c1 d JOIN users u ON u.username = d.un
ON CONFLICT (student_id, course_id) DO NOTHING;


-- =============================================================
-- STEP 3 — MONTESSORI (c1) FEES
-- =============================================================
WITH c1(un, total, balance) AS (VALUES
  ('priya_4095',         15000, 10000),
  ('sowmiya_4499',       15000, 10000),
  ('halitha_3093',       17000, 15000),
  ('rasul_4557',         17000, 15000),
  ('srinithi_9605',      15000,  5000),
  ('yuvashree_7136',     16000, 11000),
  ('afrin_0497',         16000, 12500),
  ('sirisha_0358',       16000, 12000),
  ('karishma_9500',      20000,  8000),
  ('rekha_2927',         15000, 12000),
  ('silmiya_3597',       20000,  8000),
  ('syamala_4098',       18000, 15000),
  ('najeeha_2834',       18000,  3000),
  ('sudha_7151',         20000, 15000),
  ('divya_7518',         20000, 18000),
  ('habiba_2424',        20000, 16000),
  ('swetha_5996',        25000, 23000),
  ('abirami_7620',       20000, 16000),
  ('sulthana_9883',      20000, 18000),
  ('sabaana_7003',       18000, 16000),
  ('ayeesha_8105',       20000,     0),
  ('rasika_7672',        24000, 22000),
  ('gomathi_2152',       25000, 15000),
  ('febina_9793',        20000, 19000),
  ('parveen_1208',       18000, 17000),
  ('kalaimathi_6857',    25000, 23000),
  ('poornisha_8268',     25000, 20000),
  ('fathima_7217',       24000, 22000),
  ('dhanalakshmi_3732',  21000, 19000),
  ('latha_6078',         20000, 13000),
  ('shifana_3350',       21000, 18000),
  ('asmiya_2419',        25000, 23000),
  ('janagi_6801',        20000, 17000),
  ('sahana_1263',        20000, 17000),
  ('mumtaj_0533',        20000, 17000),
  ('nithya_0943',        15000, 10000),
  ('sarala_6665',        10000,  5000),
  ('gayathri_3819',      15000, 13000),
  ('marsuka_7986',       15000, 10000),
  ('poovizhi_2798',      15000, 13000),
  ('parveen_3969',       15000,     0),
  ('sabina_9386',        15000, 10000),
  ('hameeda_9910',       23000, 12000),
  ('jayabharathi_0510',  15000, 10000),
  ('shalini_8330',       15000,  7000),
  ('janagi_1913',        15000, 10000),
  ('nargies_3892',       15000, 10000),
  ('vidhyasri_8081',     22000, 19000),
  ('jannath_4166',       15000, 10000),
  ('kowsalya_2711',      22000, 21000),
  ('muthu_0555',         25000, 10000),
  ('shaziya_3898',       18000, 15000),
  ('thanzeera_8172',     20000, 15000),
  ('kalaivani_1527',     20000, 17000),
  ('shifana_3003',       18000, 16000),
  ('mageshwari_1934',    25000, 10500),
  ('ayisha_1416',        25000, 23000),
  ('gowripriya_7987',    20000,     0),
  ('meivizhi_4925',      20000, 17000),
  ('harshana_3051',      25000, 20000),
  ('rahmath_9511',       20000, 16000),
  ('gayathri_5391',      20000, 17000),
  ('ashrath_0789',       25000, 22000),
  ('pradeepa_4230',      18000,  9000),
  ('sumaiya_8140',       18000, 12000),
  ('sandhiya_2729',      25000, 15000),
  ('girija_0068',        18000, 11000),
  ('karpagam_4410',      25000, 20000),
  ('archana_6420',       25000, 20000),
  ('raja_8260',          20000, 16000),
  ('shree_0446',         20000, 17000),
  ('aamina_5636',        20000, 17000),
  ('azmina_8005',        20000, 17000),
  ('ruvaitha_2683',      20000, 16000),
  ('ghousia_2552',       25000, 20000),
  ('sobbiya_1096',       25000, 20000),
  ('anusheya_5957',      20000, 18000),
  ('pooja_4348',         21000,     0),
  ('jennifer_0737',      30000, 23000),
  ('janaki_6317',        20000, 15000),
  ('sandhya_7384',       20000, 16000),
  ('anjali_3440',        15000, 11000),
  ('priyadharshini_8372',15000, 10000),
  ('reena_8808',         20000, 15000),
  ('tamilselvi_2034',    15000, 12000),
  ('jayasri_3210',       20000, 15000),
  ('habeeba_9394',       20000, 17000),
  ('sabina_5631',            0,     0),
  ('rahmath_4461',       20000, 15000),
  ('hemalavanya_8162',   20000, 18000),
  ('pravilika_4116',     20000, 16000)
)
INSERT INTO fees (student_id, course_id, amount, status, description)
SELECT u.id, 'c1', d.total,
  CASE WHEN d.balance = 0 THEN 'paid' ELSE 'partial' END,
  'Montessori 2026 | Paid: ₹' || (d.total - d.balance) || ' | Balance: ₹' || d.balance
FROM c1 d JOIN users u ON u.username = d.un
WHERE NOT EXISTS (
  SELECT 1 FROM fees WHERE fees.student_id = u.id AND fees.course_id = 'c1'
);


-- =============================================================
-- STEP 4 — SPOKEN ENGLISH (c2) ENROLLMENTS + FEES
-- =============================================================
WITH c2(un, total, balance) AS (VALUES
  ('hameeda_9910',   4000, 2000),
  ('divya_7738',     4000, 3000),
  ('loganayagi_0625',4000, 3000)
)
INSERT INTO enrollments (student_id, course_id, status, fee_status)
SELECT u.id, 'c2', 'active',
  CASE WHEN d.balance = 0 THEN 'paid' ELSE 'partial' END
FROM c2 d JOIN users u ON u.username = d.un
ON CONFLICT (student_id, course_id) DO NOTHING;

WITH c2(un, total, balance) AS (VALUES
  ('hameeda_9910',   4000, 2000),
  ('divya_7738',     4000, 3000),
  ('loganayagi_0625',4000, 3000)
)
INSERT INTO fees (student_id, course_id, amount, status, description)
SELECT u.id, 'c2', d.total,
  CASE WHEN d.balance = 0 THEN 'paid' ELSE 'partial' END,
  'Spoken English 2026 | Paid: ₹' || (d.total - d.balance) || ' | Balance: ₹' || d.balance
FROM c2 d JOIN users u ON u.username = d.un
WHERE NOT EXISTS (
  SELECT 1 FROM fees WHERE fees.student_id = u.id AND fees.course_id = 'c2'
);


-- =============================================================
-- STEP 5 — PHONICS (c3) ENROLLMENTS + FEES  [Teacher: Mrs. Priya]
-- =============================================================
WITH c3(un, total, balance) AS (VALUES
  ('ayisha_2440',       4000, 3000),
  ('vairamani_6923',    4000, 2000),
  ('rafia_1542',        4000, 2000),
  ('aamina_5636',       4000, 2000),
  ('jayapratha_3951',   4000, 2000),
  ('sitta_2563',        4000, 2000),
  ('aruna_1886',        4000, 2000),
  ('vijayalakshmi_1811',4000, 2000),
  ('shiba_6329',        4500, 2500)
)
INSERT INTO enrollments (student_id, course_id, status, fee_status)
SELECT u.id, 'c3', 'active',
  CASE WHEN d.balance = 0 THEN 'paid' ELSE 'partial' END
FROM c3 d JOIN users u ON u.username = d.un
ON CONFLICT (student_id, course_id) DO NOTHING;

WITH c3(un, total, balance) AS (VALUES
  ('ayisha_2440',       4000, 3000),
  ('vairamani_6923',    4000, 2000),
  ('rafia_1542',        4000, 2000),
  ('aamina_5636',       4000, 2000),
  ('jayapratha_3951',   4000, 2000),
  ('sitta_2563',        4000, 2000),
  ('aruna_1886',        4000, 2000),
  ('vijayalakshmi_1811',4000, 2000),
  ('shiba_6329',        4500, 2500)
)
INSERT INTO fees (student_id, course_id, amount, status, description)
SELECT u.id, 'c3', d.total,
  CASE WHEN d.balance = 0 THEN 'paid' ELSE 'partial' END,
  'Phonics 2026 | Paid: ₹' || (d.total - d.balance) || ' | Balance: ₹' || d.balance
FROM c3 d JOIN users u ON u.username = d.un
WHERE NOT EXISTS (
  SELECT 1 FROM fees WHERE fees.student_id = u.id AND fees.course_id = 'c3'
);


-- =============================================================
-- STEP 6 — CHILD PSYCHOLOGY (c4) ENROLLMENTS + FEES
-- =============================================================
WITH c4(un, total, balance) AS (VALUES
  ('hafza_0221',       9000, 7000),
  ('thaslinisha_0557', 9000, 6000),
  ('amreen_4966',      9000, 6000),
  ('fathima_3158',     9000, 7000),
  ('hameetha_2019',    9000, 7000),
  ('kathija_8121',     9000, 7000),
  ('sirajun_0788',     9000, 7000),
  ('afra_1050',        9000, 6000),
  ('shahin_4872',      9000, 6000),
  ('sushma_3675',      9000, 6000),
  ('jennifer_0737',       0,    0)
)
INSERT INTO enrollments (student_id, course_id, status, fee_status)
SELECT u.id, 'c4', 'active',
  CASE WHEN d.balance = 0 THEN 'paid' ELSE 'partial' END
FROM c4 d JOIN users u ON u.username = d.un
ON CONFLICT (student_id, course_id) DO NOTHING;

WITH c4(un, total, balance) AS (VALUES
  ('hafza_0221',       9000, 7000),
  ('thaslinisha_0557', 9000, 6000),
  ('amreen_4966',      9000, 6000),
  ('fathima_3158',     9000, 7000),
  ('hameetha_2019',    9000, 7000),
  ('kathija_8121',     9000, 7000),
  ('sirajun_0788',     9000, 7000),
  ('afra_1050',        9000, 6000),
  ('shahin_4872',      9000, 6000),
  ('sushma_3675',      9000, 6000),
  ('jennifer_0737',       0,    0)
)
INSERT INTO fees (student_id, course_id, amount, status, description)
SELECT u.id, 'c4', d.total,
  CASE WHEN d.balance = 0 THEN 'paid' ELSE 'partial' END,
  'Child Psychology 2026 | Paid: ₹' || (d.total - d.balance) || ' | Balance: ₹' || d.balance
FROM c4 d JOIN users u ON u.username = d.un
WHERE NOT EXISTS (
  SELECT 1 FROM fees WHERE fees.student_id = u.id AND fees.course_id = 'c4'
);


-- =============================================================
-- STEP 7 — PHONICS SKIPPED STUDENTS (no phone in Excel — dummy numbers)
-- =============================================================
-- NOTE: Tamilselvi_0002 is a different person from tamilselvi_2034 (Montessori)
INSERT INTO users (name, username, phone, password, role, avatar, is_active) VALUES
('DIVYAPRASANNA',  'divyaprasanna_0001', '9999990001', '99990001', 'student', '👩‍🎓', true),
('TAMILSELVI',     'tamilselvi_0002',    '9999990002', '99990002', 'student', '👩‍🎓', true),
('PADMAPRIYA',     'padmapriya_0003',    '9999990003', '99990003', 'student', '👩‍🎓', true)
ON CONFLICT (username) DO NOTHING;

WITH c3b(un, total, balance) AS (VALUES
  ('divyaprasanna_0001', 4000, 2000),
  ('tamilselvi_0002',    2000,    0),
  ('padmapriya_0003',    2000,    0)
)
INSERT INTO enrollments (student_id, course_id, status, fee_status)
SELECT u.id, 'c3', 'active',
  CASE WHEN d.balance = 0 THEN 'paid' ELSE 'partial' END
FROM c3b d JOIN users u ON u.username = d.un
ON CONFLICT (student_id, course_id) DO NOTHING;

WITH c3b(un, total, balance) AS (VALUES
  ('divyaprasanna_0001', 4000, 2000),
  ('tamilselvi_0002',    2000,    0),
  ('padmapriya_0003',    2000,    0)
)
INSERT INTO fees (student_id, course_id, amount, status, description)
SELECT u.id, 'c3', d.total,
  CASE WHEN d.balance = 0 THEN 'paid' ELSE 'partial' END,
  'Phonics 2026 | Paid: ₹' || (d.total - d.balance) || ' | Balance: ₹' || d.balance
FROM c3b d JOIN users u ON u.username = d.un
WHERE NOT EXISTS (
  SELECT 1 FROM fees WHERE fees.student_id = u.id AND fees.course_id = 'c3'
);


-- =============================================================
-- VERIFY IMPORT
-- =============================================================
SELECT
  (SELECT COUNT(*) FROM users   WHERE role='student') AS total_students,
  (SELECT COUNT(*) FROM enrollments WHERE course_id='c1') AS montessori,
  (SELECT COUNT(*) FROM enrollments WHERE course_id='c2') AS spoken_english,
  (SELECT COUNT(*) FROM enrollments WHERE course_id='c3') AS phonics,
  (SELECT COUNT(*) FROM enrollments WHERE course_id='c4') AS child_pshy;
