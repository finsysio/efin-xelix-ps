--yesterday’s entered transactions
AND trunc(slt_entry_date) = trunc(sysdate)-1 ;
 
 
--this morning’s trans transactions
AND trunc(slt_entry_date) = trunc(sysdate);
 
 
--Union example for today’s transactions
select 
to_char(SLT_POSTING_SYSDATE,'YYYY-MM-DD') as SLT_POSTING_SYSDATE,
SLT_SUPPLIER as Supplier_Number,
NA_NAME as Supplier_Name,
SLT_BATCH_REF,
SLT_THEIR_REF as Invoice_Number,
SLT_TRANS_TYPE,
SLT_REF as eFin_Reference,
SLT_OUR_REF_2 as Our_Ref,
to_char(SLT_DATE,'YYYY-MM-DD') as Invoice_Date,
to_char(SLT_DUE_DATE,'YYYY-MM-DD') as SLT_DUE_DATE,
SLT_PAYMENT_BATCH_REF,
to_char(SLT_DATE_PAID,'YYYY-MM-DD') as SLT_DATE_PAID,
to_char(SLT_RECEIVED_DATE,'YYYY-MM-DD') as SLT_RECEIVED_DATE,
SLT_UNIT,
SLT_GROSS_AMOUNT as Gross_Amount,
SLT_MONEY_ORIG as Net_Amount,
SLT_VAT_AMOUNT as Vat_Amount,
SLT_MONEY_OS,
SLT_STATUS,
SLT_SUB_LEDGER,
NA_ADDRESS1,
NA_ADDRESS2,
NA_ADDRESS3,
NA_ADDRESS4,
NA_POSTCODE,
NA_VAT_REG_NO,
NA_REGN_NUMBER,
SLT_DISPUTE,
SLT_USER
from sub_ledger_trans, names
where names.na_code = sub_ledger_trans.slt_supplier
and slt_trans_type in ('PI','PC','PD','PT', 'PA')
and trunc(slt_posting_sysdate) = trunc(sysdate)
UNION
select 
to_char(SLM_POSTING_SYSDATE,'YYYY-MM-DD') as SLT_POSTING_SYSDATE,
SLM_SUPPLIER as Supplier_Number,
NA_NAME as Supplier_Name,
'REGISTER', --SLM_BATCH_REF,
SLM_THEIR_REF as Invoice_Number,
Decode(slm_trans_type, 'I','PI, 'C','PC','X' ) SLM_TRANS_TYPE, --translate I to PI and C to PC
SLM_REF as eFin_Reference,
SLM_OUR_REF_2 as Our_Ref,
to_char(SLM_DATE,'YYYY-MM-DD') as Invoice_Date,
to_char(SLM_DUE_DATE,'YYYY-MM-DD') as SLT_DUE_DATE,
null as SLM_PAYMENT_BATCH_REF, --SLM_PAYMENT_BATCH_REF, --no batch yet
null as SLT_DATE_PAID, --to_char(SLT_DATE_PAID,'YYYY-MM-DD') as SLT_DATE_PAID,
to_char(SLM_RECEIVED_DATE,'YYYY-MM-DD') as SLT_RECEIVED_DATE,
SLM_UNIT,
SLM_GROSS_AMOUNT as Gross_Amount,
SLM_MONEY_ORIG as Net_Amount,
SLM_VAT_AMOUNT as Vat_Amount,
SLM_MONEY_OS,
SLM_STATUS,
SLM_SUB_LEDGER,
NA_ADDRESS1,
NA_ADDRESS2,
NA_ADDRESS3,
NA_ADDRESS4,
NA_POSTCODE,
NA_VAT_REG_NO,
NA_REGN_NUMBER,
SLM_DISPUTE,
SLM_USER
from sub_ledger_temps, names
where names.na_code = sub_ledger_temps.slm_supplier
and slm_trans_type in ('I','C')
and slm_status = 'R'
and trunc(slm_posting_sysdate) = trunc(sysdate); 
