* ![Find all rows that have an ingredient name of Brussels sprouts.](/01.png)

* ![Calculate the total count of rows of ingredients with a name of Brussels sprouts.](/02.png)

* ![Find all Brussels sprouts ingredients having a unit type of gallon(s).](/03.png)

* ![Find all rows that have a unit type of gallon(s), a name of Brussels sprouts or has the letter j in it.](/04.png)

* ![Create Indices](/05.png)

* ![Find all rows that have an ingredient name of Brussels sprouts.](/06.png)

* ![Calculate the total count of rows of ingredients with a name of Brussels sprouts.](/07.png)

* ![Find all Brussels sprouts ingredients having a unit type of gallon(s).](/08.png)

* ![Find all rows that have a unit type of gallon(s), a name of Brussels sprouts or has the letter j in it.](/09.png)


ingredients=# EXPLAIN ANALYSE
ingredients-# SELECT * FROM ingredients
ingredients-# WHERE name = 'Brussels sprouts';
                                                      QUERY PLAN
----------------------------------------------------------------------------------------------------------------------
 Seq Scan on ingredients  (cost=0.00..190150.31 rows=68792 width=21) (actual time=0.073..1281.039 rows=67861 loops=1)
   Filter: ((name)::text = 'Brussels sprouts'::text)
   Rows Removed by Filter: 9932139
 Planning time: 0.040 ms
 Execution time: 1285.226 ms
(5 rows)

ingredients=# EXPLAIN ANALYSE
SELECT count(*) FROM ingredients
WHERE name = 'Brussels sprouts';
                                                        QUERY PLAN
---------------------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=190322.29..190322.30 rows=1 width=0) (actual time=1383.446..1383.447 rows=1 loops=1)
   ->  Seq Scan on ingredients  (cost=0.00..190150.31 rows=68792 width=0) (actual time=0.076..1371.551 rows=67861 loops=1)
         Filter: ((name)::text = 'Brussels sprouts'::text)
         Rows Removed by Filter: 9932139
 Planning time: 0.048 ms
 Execution time: 1383.474 ms
(6 rows)

ingredients=# EXPLAIN ANALYSE
SELECT * FROM ingredients
WHERE name = 'Brussels sprouts' AND unit = 'gallon(s)';
                                                     QUERY PLAN
--------------------------------------------------------------------------------------------------------------------
 Seq Scan on ingredients  (cost=0.00..215149.38 rows=9842 width=21) (actual time=0.392..1342.004 rows=9799 loops=1)
   Filter: (((name)::text = 'Brussels sprouts'::text) AND ((unit)::text = 'gallon(s)'::text))
   Rows Removed by Filter: 9990201
 Planning time: 0.055 ms
 Execution time: 1342.938 ms
(5 rows)

ingredients=# EXPLAIN ANALYSE
SELECT * FROM ingredients
WHERE name = 'Brussels sprouts' OR unit = 'gallon(s)' OR name LIKE '%j%';
                                                          QUERY PLAN
------------------------------------------------------------------------------------------------------------------------------
 Seq Scan on ingredients  (cost=0.00..240148.44 rows=1566440 width=21) (actual time=0.014..2668.796 rows=1603526 loops=1)
   Filter: (((name)::text = 'Brussels sprouts'::text) OR ((unit)::text = 'gallon(s)'::text) OR ((name)::text ~~ '%j%'::text))
   Rows Removed by Filter: 8396474
 Planning time: 0.076 ms
 Execution time: 2755.997 ms
(5 rows)

ingredients=# CREATE INDEX ON name;
ERROR:  syntax error at or near ";"
LINE 1: CREATE INDEX ON name;
                            ^
ingredients=# CREATE INDEX ON ingredients(name);
CREATE INDEX
ingredients=# CREATE INDEX ON ingredients(unit);
CREATE INDEX
ingredients=# EXPLAIN ANALYSE
ingredients-# SELECT * FROM ingredients
ingredients-# WHERE name = 'Brussels sprouts';
                                                                QUERY PLAN



                                                                         QUERY PLAN
-------------------------------------------------------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=56243.78..56243.79 rows=1 width=0) (actual time=299.272..299.273 rows=1 loops=1)
   ->  Bitmap Heap Scan on ingredients  (cost=29756.01..56219.18 rows=9842 width=0) (actual time=221.234..298.507 rows=9799 loops=1)
         Recheck Cond: (((name)::text = 'Brussels sprouts'::text) AND ((unit)::text = 'gallon(s)'::text))
         Rows Removed by Index Recheck: 23587
         Heap Blocks: exact=22514
         ->  BitmapAnd  (cost=29756.01..29756.01 rows=9842 width=0) (actual time=216.808..216.808 rows=0 loops=1)
               ->  Bitmap Index Scan on ingredients_name_idx  (cost=0.00..1512.40 rows=68795 width=0) (actual time=11.019..11.019 rows=67861 loops=1)
                     Index Cond: ((name)::text = 'Brussels sprouts'::text)
               ->  Bitmap Index Scan on ingredients_unit_idx  (cost=0.00..28238.44 rows=1430667 width=0) (actual time=196.323..196.323 rows=1427955 loops=1)
                     Index Cond: ((unit)::text = 'gallon(s)'::text)
 Planning time: 0.115 ms
 Execution time: 299.919 ms
(12 rows)
                                                                         QUERY PLAN
-------------------------------------------------------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=56243.78..56243.79 rows=1 width=0) (actual time=299.272..299.273 rows=1 loops=1)
   ->  Bitmap Heap Scan on ingredients  (cost=29756.01..56219.18 rows=9842 width=0) (actual time=221.234..298.507 rows=9799 loops=1)
         Recheck Cond: (((name)::text = 'Brussels sprouts'::text) AND ((unit)::text = 'gallon(s)'::text))
         Rows Removed by Index Recheck: 23587
         Heap Blocks: exact=22514
         ->  BitmapAnd  (cost=29756.01..29756.01 rows=9842 width=0) (actual time=216.808..216.808 rows=0 loops=1)
               ->  Bitmap Index Scan on ingredients_name_idx  (cost=0.00..1512.40 rows=68795 width=0) (actual time=11.019..11.019 rows=67861 loops=1)
                     Index Cond: ((name)::text = 'Brussels sprouts'::text)
               ->  Bitmap Index Scan on ingredients_unit_idx  (cost=0.00..28238.44 rows=1430667 width=0) (actual time=196.323..196.323 rows=1427955 loops=1)
                     Index Cond: ((unit)::text = 'gallon(s)'::text)
 Planning time: 0.115 ms
 Execution time: 299.919 ms
(12 rows)

                                                                         QUERY PLAN
-------------------------------------------------------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=56243.78..56243.79 rows=1 width=0) (actual time=299.272..299.273 rows=1 loops=1)
   ->  Bitmap Heap Scan on ingredients  (cost=29756.01..56219.18 rows=9842 width=0) (actual time=221.234..298.507 rows=9799 loops=1)
         Recheck Cond: (((name)::text = 'Brussels sprouts'::text) AND ((unit)::text = 'gallon(s)'::text))
         Rows Removed by Index Recheck: 23587
         Heap Blocks: exact=22514
         ->  BitmapAnd  (cost=29756.01..29756.01 rows=9842 width=0) (actual time=216.808..216.808 rows=0 loops=1)
               ->  Bitmap Index Scan on ingredients_name_idx  (cost=0.00..1512.40 rows=68795 width=0) (actual time=11.019..11.019 rows=67861 loops=1)
                     Index Cond: ((name)::text = 'Brussels sprouts'::text)
               ->  Bitmap Index Scan on ingredients_unit_idx  (cost=0.00..28238.44 rows=1430667 width=0) (actual time=196.323..196.323 rows=1427955 loops=1)
                     Index Cond: ((unit)::text = 'gallon(s)'::text)
 Planning time: 0.115 ms
 Execution time: 299.919 ms
(12 rows)

                                                     QUERY PLAN
-------------------------------------------------------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=56243.78..56243.79 rows=1 width=0) (actual time=299.272..299.273 rows=1 loops=1)
   ->  Bitmap Heap Scan on ingredients  (cost=29756.01..56219.18 rows=9842 width=0) (actual time=221.234..298.507 rows=9799 loops=1)
         Recheck Cond: (((name)::text = 'Brussels sprouts'::text) AND ((unit)::text = 'gallon(s)'::text))
         Rows Removed by Index Recheck: 23587
         Heap Blocks: exact=22514
         ->  BitmapAnd  (cost=29756.01..29756.01 rows=9842 width=0) (actual time=216.808..216.808 rows=0 loops=1)
               ->  Bitmap Index Scan on ingredients_name_idx  (cost=0.00..1512.40 rows=68795 width=0) (actual time=11.019..11.019 rows=67861 loops=1)
                     Index Cond: ((name)::text = 'Brussels sprouts'::text)
               ->  Bitmap Index Scan on ingredients_unit_idx  (cost=0.00..28238.44 rows=1430667 width=0) (actual time=196.323..196.323 rows=1427955 loops=1)
                     Index Cond: ((unit)::text = 'gallon(s)'::text)
 Planning time: 0.115 ms
 Execution time: 299.919 ms
(12 rows)

                                                                         QUERY PLAN
-------------------------------------------------------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=56243.78..56243.79 rows=1 width=0) (actual time=299.272..299.273 rows=1 loops=1)
   ->  Bitmap Heap7861 loops=1)
                     Index Cond: ((name)::text = 'Brussels sprouts'::text)
               ->  Bitmap Index Scan on ingredients_unit_idx  (cost=0.00..28238.44 rows=1430667 width=0) (actual time=196.323..196.323 rows=1427955 loops=1)
                     Index Cond: ((unit)::text = 'gallon(s)'::text)
 Planning time: 0.115 ms
 Execution time: 299.919 ms
(12 rows)

                                                                         QUERY PLAN
-------------------------------------------------------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=56243.78..56243.79 rows=1 width=0) (actual time=299.272..299.273 rows=1 loops=1)
   ->  Bitmap Heap Scan on ingredients  (cost=29756.01..56219.18 rows=9842 width=0) (actual time=221.234..298.507 rows=9799 loops=1)
         Recheck Cond: (((name)::text = 'Brussels sprouts'::text) AND ((unit)::text = 'gallon(s)'::text))
         Rows Removed by Index Recheck: 23587
         Heap Blocks: exact=22514
         ->  BitmapAnd  (cost=29756.01..29756.01 rows=9842 width=0) (actual time=216.808..216.808 rows=0 loops=1)
               ->  Bitmap Index Scan on ingredients_name_idx  (cost=0.00..1512.40 rows=68795 width=0) (actual time=11.019..11.019 rows=67861 loops=1)
                     Index Cond: ((name)::text = 'Brussels sprouts'::text)
               ->  Bitmap Index Scan on ingredients_unit_idx  (cost=0.00..28238.44 rows=1430667 width=0) (actual time=196.323..196.323 rows=1427955 loops=1)
                     Index Cond: ((unit)::text = 'gallon(s)'::text)
 Planning time: 0.115 ms
 Execution time: 299.919 ms
(12 rows)

------------------------------------------------------------------------------------------------------------------------------------------
 Bitmap Heap Scan on ingredients  (cost=1529.60..70202.93 rows=68795 width=21) (actual time=26.038..348.136 rows=67861 loops=1)
   Recheck Cond: ((name)::text = 'Brussels sprouts'::text)
   Heap Blocks: exact=42233
   ->  Bitmap Index Scan on ingredients_name_idx  (cost=0.00..1512.40 rows=68795 width=0) (actual time=18.188..18.188 rows=67861 loops=1)
         Index Cond: ((name)::text = 'Brussels sprouts'::text)
 Planning time: 1.545 ms
 Execution time: 351.740 ms
(7 rows)

ingredients=# EXPLAIN ANALYSE
SELECT count(*) FROM ingredients
WHERE name = 'Brussels sprouts';
                                                                   QUERY PLAN
------------------------------------------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=70374.91..70374.92 rows=1 width=0) (actual time=172.864..172.865 rows=1 loops=1)
   ->  Bitmap Heap Scan on ingredients  (cost=1529.60..70202.93 rows=68795 width=0) (actual time=25.427..167.746 rows=67861 loops=1)
         Recheck Cond: ((name)::text = 'Brussels sprouts'::text)
         Heap Blocks: exact=42233
         ->  Bitmap Index Scan on ingredients_name_idx  (cost=0.00..1512.40 rows=68795 width=0) (actual time=13.295..13.295 rows=67861 loops=1)
               Index Cond: ((name)::text = 'Brussels sprouts'::text)
 Planning time: 0.115 ms
 Execution time: 172.976 ms
(8 rows)

ingredients=# EXPLAIN ANALYSE
SELECT count(*) FROM ingredients
WHERE name = 'Brussels sprouts' AND unit = 'gallon(s)';
ingredients=# EXPLAIN ANALYSE
SELECT count(*) FROM ingredients
WHERE name = 'Brussels sprouts' AND unit = 'gallon(s)';
                                                                         QUERY PLAN
-------------------------------------------------------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=56243.78..56243.79 rows=1 width=0) (actual time=247.385..247.385 rows=1 loops=1)
   ->  Bitmap Heap Scan on ingredients  (cost=29756.01..56219.18 rows=9842 width=0) (actual time=167.461..246.521 rows=9799 loops=1)
         Recheck Cond: (((name)::text = 'Brussels sprouts'::text) AND ((unit)::text = 'gallon(s)'::text))
         Rows Removed by Index Recheck: 23587
         Heap Blocks: exact=22514
         ->  BitmapAnd  (cost=29756.01..29756.01 rows=9842 width=0) (actual time=160.909..160.909 rows=0 loops=1)
               ->  Bitmap Index Scan on ingredients_name_idx  (cost=0.00..1512.40 rows=68795 width=0) (actual time=14.111..14.111 rows=67861 loops=1)
                     Index Cond: ((name)::text = 'Brussels sprouts'::text)
               ->  Bitmap Index Scan on ingredients_unit_idx  (cost=0.00..28238.44 rows=1430667 width=0) (actual time=137.287..137.287 rows=1427955 loops=1)
                     Index Cond: ((unit)::text = 'gallon(s)'::text)
 Planning time: 0.088 ms
 Execution time: 247.901 ms
(12 rows)

ingredients=# EXPLAIN ANALYSE
SELECT count(*) FROM ingredients
WHERE name = 'Brussels sprouts' OR unit = 'gallon(s)' OR name LIKE '%j%';
                                                             QUERY PLAN
------------------------------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=244071.25..244071.26 rows=1 width=0) (actual time=2211.558..2211.558 rows=1 loops=1)
   ->  Seq Scan on ingredients  (cost=0.00..240155.00 rows=1566499 width=0) (actual time=0.246..2105.666 rows=1603526 loops=1)
         Filter: (((name)::text = 'Brussels sprouts'::text) OR ((unit)::text = 'gallon(s)'::text) OR ((name)::text ~~ '%j%'::text))
         Rows Removed by Filter: 8396474
 Planning time: 1.662 ms
 Execution time: 2211.598 ms
(6 rows)
