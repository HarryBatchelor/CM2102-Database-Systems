Accept Report_file char prompt ‘Enter a file name for summary report’;
Col Storecode format A8 heading ‘Store Code’;
Col Description format A8 heading ‘Item Description’;
Col Price format $999999.99 heading ‘Price’;
Col Quantity format 99999 heading ‘Quantity’;
Col (Price*Quantity) format $999999.99 heading ‘Value’;
Set pause off;
Set feedback off;
Set space 6;
Set newpage 2;
Set pagesize 54;
Set linesize 60;
Set underline =;
Ttitle center ‘Current Stock value by store’ skip 2 center – ‘prepared by ‘ &reporting_officer center - &todays_date skip 4;
Bittle center format 999 sql.pno;
Break on storecode skip 2 on Description skip 1 on report;
Compute sum of (price*quantity) on storecode;
Compute sum of (price*Quantity) on report;
Spool &report_file;
Select Storecode, Description, price, quantity, (price*quantity)
From stocks
Order by Description;
Spool off;
Clear break;
Clear columns;
Clear computes;
Set pause on;
