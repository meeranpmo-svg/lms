-- ============================================================
-- FIX FEES TABLE — Correct paid amounts from Cash Summary
-- Run in Supabase SQL Editor
-- Total Collected: ₹5,21,000 | Total Balance: ₹13,88,500
-- ============================================================

UPDATE fees f
SET
  amount      = d.paid,
  status      = CASE WHEN d.balance = 0 THEN 'paid' ELSE 'partial' END,
  description = d.course_name || ' 2026 | Total: ₹' || d.total || ' | Paid: ₹' || d.paid || ' | Balance: ₹' || d.balance
FROM (VALUES
  -- ── MONTESSORI (c1) ──────────────────────────────────────
  ('priya_4095',          'c1','Montessori', 15000,  5000, 10000),
  ('sowmiya_4499',        'c1','Montessori', 15000,  5000, 10000),
  ('halitha_3093',        'c1','Montessori', 17000,  2000, 15000),
  ('rasul_4557',          'c1','Montessori', 17000,  2000, 15000),
  ('srinithi_9605',       'c1','Montessori', 15000, 10000,  5000),
  ('yuvashree_7136',      'c1','Montessori', 16000,  5000, 11000),
  ('afrin_0497',          'c1','Montessori', 16000,  3500, 12500),
  ('sirisha_0358',        'c1','Montessori', 16000,  4000, 12000),
  ('karishma_9500',       'c1','Montessori', 20000, 12000,  8000),
  ('rekha_2927',          'c1','Montessori', 15000,  3000, 12000),
  ('silmiya_3597',        'c1','Montessori', 20000, 12000,  8000),
  ('syamala_4098',        'c1','Montessori', 18000,  3000, 15000),
  ('najeeha_2834',        'c1','Montessori', 18000, 15000,  3000),
  ('sudha_7151',          'c1','Montessori', 20000,  5000, 15000),
  ('divya_7518',          'c1','Montessori', 20000,  2000, 18000),
  ('habiba_2424',         'c1','Montessori', 20000,  4000, 16000),
  ('swetha_5996',         'c1','Montessori', 25000,  2000, 23000),
  ('abirami_7620',        'c1','Montessori', 20000,  4000, 16000),
  ('sulthana_9883',       'c1','Montessori', 20000,  2000, 18000),
  ('sabaana_7003',        'c1','Montessori', 18000,  2000, 16000),
  ('ayeesha_8105',        'c1','Montessori', 20000, 20000,     0),
  ('rasika_7672',         'c1','Montessori', 24000,  2000, 22000),
  ('gomathi_2152',        'c1','Montessori', 25000, 10000, 15000),
  ('febina_9793',         'c1','Montessori', 20000,  1000, 19000),
  ('parveen_1208',        'c1','Montessori', 18000,  1000, 17000),
  ('kalaimathi_6857',     'c1','Montessori', 25000,  2000, 23000),
  ('poornisha_8268',      'c1','Montessori', 25000,  5000, 20000),
  ('fathima_7217',        'c1','Montessori', 24000,  2000, 22000),
  ('dhanalakshmi_3732',   'c1','Montessori', 21000,  2000, 19000),
  ('latha_6078',          'c1','Montessori', 20000,  7000, 13000),
  ('shifana_3350',        'c1','Montessori', 21000,  3000, 18000),
  ('asmiya_2419',         'c1','Montessori', 25000,  2000, 23000),
  ('janagi_6801',         'c1','Montessori', 20000,  3000, 17000),
  ('sahana_1263',         'c1','Montessori', 20000,  3000, 17000),
  ('mumtaj_0533',         'c1','Montessori', 20000,  3000, 17000),
  ('nithya_0943',         'c1','Montessori', 15000,  5000, 10000),
  ('sarala_6665',         'c1','Montessori', 10000,  5000,  5000),
  ('gayathri_3819',       'c1','Montessori', 15000,  2000, 13000),
  ('marsuka_7986',        'c1','Montessori', 15000,  5000, 10000),
  ('poovizhi_2798',       'c1','Montessori', 15000,  2000, 13000),
  ('parveen_3969',        'c1','Montessori', 15000, 15000,     0),
  ('sabina_9386',         'c1','Montessori', 15000,  5000, 10000),
  ('hameeda_9910',        'c1','Montessori', 23000, 11000, 12000),
  ('jayabharathi_0510',   'c1','Montessori', 15000,  5000, 10000),
  ('shalini_8330',        'c1','Montessori', 15000,  8000,  7000),
  ('janagi_1913',         'c1','Montessori', 15000,  5000, 10000),
  ('nargies_3892',        'c1','Montessori', 15000,  5000, 10000),
  ('vidhyasri_8081',      'c1','Montessori', 22000,  3000, 19000),
  ('jannath_4166',        'c1','Montessori', 15000,  5000, 10000),
  ('kowsalya_2711',       'c1','Montessori', 22000,  7000, 21000),
  ('muthu_0555',          'c1','Montessori', 25000, 15000, 10000),
  ('shaziya_3898',        'c1','Montessori', 18000,  3000, 15000),
  ('thanzeera_8172',      'c1','Montessori', 20000,  5000, 15000),
  ('kalaivani_1527',      'c1','Montessori', 20000,  3000, 17000),
  ('shifana_3003',        'c1','Montessori', 18000,  2000, 16000),
  ('mageshwari_1934',     'c1','Montessori', 25000, 14500, 10500),
  ('ayisha_1416',         'c1','Montessori', 25000,  2000, 23000),
  ('gowripriya_7987',     'c1','Montessori', 20000, 20000,     0),
  ('meivizhi_4925',       'c1','Montessori', 20000,  3000, 17000),
  ('harshana_3051',       'c1','Montessori', 25000,  5000, 20000),
  ('rahmath_9511',        'c1','Montessori', 20000,  4000, 16000),
  ('gayathri_5391',       'c1','Montessori', 20000,  3000, 17000),
  ('ashrath_0789',        'c1','Montessori', 25000,  3000, 22000),
  ('pradeepa_4230',       'c1','Montessori', 18000,  9000,  9000),
  ('sumaiya_8140',        'c1','Montessori', 18000,  6000, 12000),
  ('sandhiya_2729',       'c1','Montessori', 25000, 10000, 15000),
  ('girija_0068',         'c1','Montessori', 18000,  7000, 11000),
  ('karpagam_4410',       'c1','Montessori', 25000,  5000, 20000),
  ('archana_6420',        'c1','Montessori', 25000,  5000, 20000),
  ('raja_8260',           'c1','Montessori', 20000,  3000, 16000),
  ('shree_0446',          'c1','Montessori', 20000,  3000, 17000),
  ('aamina_5636',         'c1','Montessori', 20000,  3000, 17000),
  ('azmina_8005',         'c1','Montessori', 20000,  3000, 17000),
  ('ruvaitha_2683',       'c1','Montessori', 20000,  4000, 16000),
  ('ghousia_2552',        'c1','Montessori', 25000,  5000, 20000),
  ('sobbiya_1096',        'c1','Montessori', 25000,  5000, 20000),
  ('anusheya_5957',       'c1','Montessori', 20000,  2000, 18000),
  ('pooja_4348',          'c1','Montessori', 21000, 21000,     0),
  ('jennifer_0737',       'c1','Montessori', 30000,  7000, 23000),
  ('janaki_6317',         'c1','Montessori', 20000,  5000, 15000),
  ('sandhya_7384',        'c1','Montessori', 20000,  4000, 16000),
  ('anjali_3440',         'c1','Montessori', 15000,  4000, 11000),
  ('priyadharshini_8372', 'c1','Montessori', 15000,  5000, 10000),
  ('reena_8808',          'c1','Montessori', 20000,  5000, 15000),
  ('tamilselvi_2034',     'c1','Montessori', 15000,  3000, 12000),
  ('jayasri_3210',        'c1','Montessori', 20000,  5000, 15000),
  ('habeeba_9394',        'c1','Montessori', 20000,  3000, 17000),
  ('sabina_5631',         'c1','Montessori',  5000,  5000,     0),
  ('rahmath_4461',        'c1','Montessori', 20000,  5000, 15000),
  ('hemalavanya_8162',    'c1','Montessori', 20000,  2000, 18000),
  ('pravilika_4116',      'c1','Montessori', 20000,  4000, 16000),

  -- ── SPOKEN ENGLISH (c2) ──────────────────────────────────
  ('hameeda_9910',        'c2','Spoken English', 4000, 2000, 2000),
  ('divya_7738',          'c2','Spoken English', 4000, 1000, 3000),
  ('loganayagi_0625',     'c2','Spoken English', 4000, 1000, 3000),

  -- ── PHONICS (c3) ─────────────────────────────────────────
  ('ayisha_2440',         'c3','Phonics', 4000, 1000, 3000),
  ('vairamani_6923',      'c3','Phonics', 4000, 2000, 2000),
  ('rafia_1542',          'c3','Phonics', 4000, 2000, 2000),
  ('aamina_5636',         'c3','Phonics', 4000, 2000, 2000),
  ('jayapratha_3951',     'c3','Phonics', 4000, 2000, 2000),
  ('sitta_2563',          'c3','Phonics', 4000, 2000, 2000),
  ('aruna_1886',          'c3','Phonics', 4000, 2000, 2000),
  ('vijayalakshmi_1811',  'c3','Phonics', 4000, 2000, 2000),
  ('divyaprasanna_0001',  'c3','Phonics', 4000, 2000, 2000),
  ('shiba_6329',          'c3','Phonics', 4500, 2000, 2500),
  ('tamilselvi_0002',     'c3','Phonics', 2000, 2000,    0),
  ('padmapriya_0003',     'c3','Phonics', 2000, 2000,    0),

  -- ── CHILD PSYCHOLOGY (c4) ────────────────────────────────
  ('hafza_0221',          'c4','Child Psychology', 9000, 2000, 7000),
  ('thaslinisha_0557',    'c4','Child Psychology', 9000, 3000, 6000),
  ('amreen_4966',         'c4','Child Psychology', 9000, 3000, 6000),
  ('fathima_3158',        'c4','Child Psychology', 9000, 2000, 7000),
  ('hameetha_2019',       'c4','Child Psychology', 9000, 2000, 7000),
  ('kathija_8121',        'c4','Child Psychology', 9000, 2000, 7000),
  ('sirajun_0788',        'c4','Child Psychology', 9000, 2000, 7000),
  ('afra_1050',           'c4','Child Psychology', 9000, 3000, 6000),
  ('shahin_4872',         'c4','Child Psychology', 9000, 3000, 6000),
  ('sushma_3675',         'c4','Child Psychology', 9000, 3000, 6000),
  ('jennifer_0737',       'c4','Child Psychology',    0,    0,    0)

) AS d(un, cid, course_name, total, paid, balance)
JOIN users u ON u.username = d.un
WHERE f.student_id = u.id AND f.course_id = d.cid;


-- Also fix enrollment fee_status
UPDATE enrollments e
SET fee_status = CASE WHEN d.balance = 0 THEN 'paid' ELSE 'partial' END
FROM (VALUES
  ('priya_4095','c1',10000),('sowmiya_4499','c1',10000),('halitha_3093','c1',15000),
  ('rasul_4557','c1',15000),('srinithi_9605','c1',5000),('yuvashree_7136','c1',11000),
  ('afrin_0497','c1',12500),('sirisha_0358','c1',12000),('karishma_9500','c1',8000),
  ('rekha_2927','c1',12000),('silmiya_3597','c1',8000),('syamala_4098','c1',15000),
  ('najeeha_2834','c1',3000),('sudha_7151','c1',15000),('divya_7518','c1',18000),
  ('habiba_2424','c1',16000),('swetha_5996','c1',23000),('abirami_7620','c1',16000),
  ('sulthana_9883','c1',18000),('sabaana_7003','c1',16000),('ayeesha_8105','c1',0),
  ('rasika_7672','c1',22000),('gomathi_2152','c1',15000),('febina_9793','c1',19000),
  ('parveen_1208','c1',17000),('kalaimathi_6857','c1',23000),('poornisha_8268','c1',20000),
  ('fathima_7217','c1',22000),('dhanalakshmi_3732','c1',19000),('latha_6078','c1',13000),
  ('shifana_3350','c1',18000),('asmiya_2419','c1',23000),('janagi_6801','c1',17000),
  ('sahana_1263','c1',17000),('mumtaj_0533','c1',17000),('nithya_0943','c1',10000),
  ('sarala_6665','c1',5000),('gayathri_3819','c1',13000),('marsuka_7986','c1',10000),
  ('poovizhi_2798','c1',13000),('parveen_3969','c1',0),('sabina_9386','c1',10000),
  ('hameeda_9910','c1',12000),('jayabharathi_0510','c1',10000),('shalini_8330','c1',7000),
  ('janagi_1913','c1',10000),('nargies_3892','c1',10000),('vidhyasri_8081','c1',19000),
  ('jannath_4166','c1',10000),('kowsalya_2711','c1',21000),('muthu_0555','c1',10000),
  ('shaziya_3898','c1',15000),('thanzeera_8172','c1',15000),('kalaivani_1527','c1',17000),
  ('shifana_3003','c1',16000),('mageshwari_1934','c1',10500),('ayisha_1416','c1',23000),
  ('gowripriya_7987','c1',0),('meivizhi_4925','c1',17000),('harshana_3051','c1',20000),
  ('rahmath_9511','c1',16000),('gayathri_5391','c1',17000),('ashrath_0789','c1',22000),
  ('pradeepa_4230','c1',9000),('sumaiya_8140','c1',12000),('sandhiya_2729','c1',15000),
  ('girija_0068','c1',11000),('karpagam_4410','c1',20000),('archana_6420','c1',20000),
  ('raja_8260','c1',16000),('shree_0446','c1',17000),('aamina_5636','c1',17000),
  ('azmina_8005','c1',17000),('ruvaitha_2683','c1',16000),('ghousia_2552','c1',20000),
  ('sobbiya_1096','c1',20000),('anusheya_5957','c1',18000),('pooja_4348','c1',0),
  ('jennifer_0737','c1',23000),('janaki_6317','c1',15000),('sandhya_7384','c1',16000),
  ('anjali_3440','c1',11000),('priyadharshini_8372','c1',10000),('reena_8808','c1',15000),
  ('tamilselvi_2034','c1',12000),('jayasri_3210','c1',15000),('habeeba_9394','c1',17000),
  ('sabina_5631','c1',0),('rahmath_4461','c1',15000),('hemalavanya_8162','c1',18000),
  ('pravilika_4116','c1',16000),
  ('hameeda_9910','c2',2000),('divya_7738','c2',3000),('loganayagi_0625','c2',3000),
  ('ayisha_2440','c3',3000),('vairamani_6923','c3',2000),('rafia_1542','c3',2000),
  ('aamina_5636','c3',2000),('jayapratha_3951','c3',2000),('sitta_2563','c3',2000),
  ('aruna_1886','c3',2000),('vijayalakshmi_1811','c3',2000),('divyaprasanna_0001','c3',2000),
  ('shiba_6329','c3',2500),('tamilselvi_0002','c3',0),('padmapriya_0003','c3',0),
  ('hafza_0221','c4',7000),('thaslinisha_0557','c4',6000),('amreen_4966','c4',6000),
  ('fathima_3158','c4',7000),('hameetha_2019','c4',7000),('kathija_8121','c4',7000),
  ('sirajun_0788','c4',7000),('afra_1050','c4',6000),('shahin_4872','c4',6000),
  ('sushma_3675','c4',6000),('jennifer_0737','c4',0)
) AS d(un, cid, balance)
JOIN users u ON u.username = d.un
WHERE e.student_id = u.id AND e.course_id = d.cid;


-- VERIFY — should show: collected=521000, balance=1388500
SELECT
  SUM(amount)                                    AS total_collected,
  SUM(CAST((regexp_match(description, 'Balance: ₹(\d+)'))[1] AS INTEGER)) AS total_balance,
  SUM(amount) + SUM(CAST((regexp_match(description, 'Balance: ₹(\d+)'))[1] AS INTEGER)) AS total_fee
FROM fees
WHERE description LIKE '%Balance:%';
