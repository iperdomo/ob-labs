select *
  from ad_ref_search_column 
 where columntype = 'I';

select a.name, c.total as total_col_out
 from ad_ref_search ar, ad_reference a, 
      (select ad_ref_search_id, count(*) as total 
         from ad_ref_search_column 
        where columntype = 'I' 
        group by ad_ref_search_id) c
where a.ad_reference_id = ar.ad_reference_id
  and ar.ad_ref_search_id = c.ad_ref_search_id
order by a.name;

select * from ad_reference where name = 'Account';

select distinct r.ad_reference_id, r.name --, w.name as windowname, tb.name as tabname
  from ad_window w, ad_tab tb, ad_table t, ad_field f, ad_column c, ad_reference r
 where w.ad_window_id = tb.ad_window_id
   and tb.ad_table_id = t.ad_table_id
   and t.ad_table_id = c.ad_table_id
   and f.ad_column_id = c.ad_column_id
   and f.ad_tab_id = tb.ad_tab_id
   and c.ad_reference_value_id = r.ad_reference_id
   and c.ad_reference_id = '30' -- Search (Selector)   
   and w.isactive='Y'
   and tb.isactive = 'Y'
   and f.isactive='Y'
   and f.isdisplayed = 'Y'
   and t.isactive='Y'
   and c.isactive='Y'
   and r.isactive = 'Y'
  order by r.name;

-- AD_Reference_Value_ID            - Name
-----------------------------------------------------------
-- 25                               - Account
-- A85EA9A581DB42DCA5576FAFCD08A1B7 - Account Element Value
-- 800057                           - Business Partner
-- 800058                           - Debt/Payment
-- 800059                           - Invoice
-- 800096                           - Invoice Line
-- 89A08501440B470CA3E9E5F399F32D31 - Invoice Payment Plan
-- 21                               - Location
-- 31                               - Locator
-- 800062                           - Order
-- 800063                           - Order Line
-- C01DEDDA9B35427786058CB649FB972F - Order Payment Plan
-- 800060                           - Product
-- 800011                           - Product Complete
-- 800061                           - Project
-- 800064                           - Shipment/Receipt Line
------------------------------------------------------------

select w.name, tb.name as tabname, t.tablename, f.name as fieldname, c.columnname 
  from ad_window w, ad_tab tb, ad_table t, ad_field f, ad_column c 
 where w.ad_window_id = tb.ad_window_id
   and tb.ad_table_id = t.ad_table_id
   and t.ad_table_id = c.ad_table_id
   and f.ad_column_id = c.ad_column_id
   and f.ad_tab_id = tb.ad_tab_id
   and c.ad_reference_id = '30' -- Search (Selector)
   and c.ad_reference_value_id = '800060' -- Use one of above IDs
   and w.isactive='Y'
   and tb.isactive = 'Y'
   and f.isactive='Y'
   and f.isdisplayed = 'Y'
   and t.isactive='Y'
   and c.isactive='Y'
order by w.name, tb.tablevel, tb.name, f.seqno;