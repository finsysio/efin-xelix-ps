# efin-xelix-ps

Powershell interface between eFinancials &amp; Xelix

 
1. Download SQLCL and unzip on Windows Server.
2. Create a view in SQLDeveloper for a `today` and `yesterday` view of transactions.
    - XELIX_AP_TRANS_TODAY
    - XELIX_AP_TRANS_YESTERDAY
    - eg. create or replace view XELIX_AP_TRANS_TODAY as …sql here;
3. Create a SQLcl Unload batch script (reference https://oracle-base.com/articles/misc/sqlcl-unload-and-load-table-data)  to specific folder
4. Create WINSCP command to transfer files from above location,using built in code generator.
5. Archive files.
 