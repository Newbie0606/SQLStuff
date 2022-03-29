SELECT TOP 1000
  SchemaName	= sch.name
, TblName		= st.name
, ColName		= sc.name
, TypeName = sty.name
, '|||' = '|||'
, sc.*
FROM sys.columns sc
LEFT OUTER JOIN sys.tables st ON st.object_id = sc.object_id
LEFT OUTER JOIN sys.schemas sch ON sch.schema_id = st.schema_id
LEFT OUTER JOIN sys.types sty ON sty.system_type_id = sc.system_type_id
WHERE 1 = 1
  AND st.name LIKE '%enro%'
  --AND sc.name LIKE '%path%'
  AND st.name IS NOT NULL
  AND sty.Name NOT LIKE 'udt%'
  AND sty.Name NOT LIKE 'sysname%'
ORDER BY st.name,sc.column_id   
 