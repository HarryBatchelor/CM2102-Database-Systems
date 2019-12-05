Clear screen;
Accept Report_file char prompt ‘Enter a file name for summary report’;
Col StoreCode format A8 heading ‘Store Code’;
Col Description format A8 heading ‘Item Description’;
Col Price format $999999.99 heading ‘Price’;
Col Quantity format 99999 heading ‘Quantity’;
Col (Price*Quantity) format $999999.99 heading ‘Value’;
Set pause off;
Set feedback off;
Set space 6;
Set newpage 2;
Set pagesize 30;
Set linesize 100;
Set wrap off;
Set underline =;
Ttitle center ‘Current Stock value by store’ skip 2 center –
  ‘prepared by ‘ &your_name skip 2 center -
    _Date skip 2;
Btitle center format 999 sql.pno;
Break on StoreCode skip 2 on Description skip 1 on report;
Compute sum label 'Store Total' of (Price*Quantity) on StoreCode;
Compute sum label 'Grand Total' of (price*Quantity) on Report;
Select StoreCode, Description, Price, Quantity, (Price*Quantity)
From stocks
order by StoreCode, SuppCode;
Clear break;
Clear columns;
Clear computes;
