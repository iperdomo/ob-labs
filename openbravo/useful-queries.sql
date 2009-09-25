-- Application Dictionary, table & column definition
select t.tablename, c.name, c.columnname, r.name as referencename, c.ad_reference_value_id,
       c.iskey, c.isparent, c.isidentifier, c.issecondarykey
  from ad_table t, ad_column c, ad_reference r
 where t.ad_table_id = c.ad_table_id
   and upper(t.tablename) = 'C_BPARTNER' -- Change this with your table name in UPPERCASE
   and c.ad_reference_id = r.ad_reference_id
  order by c.created;
