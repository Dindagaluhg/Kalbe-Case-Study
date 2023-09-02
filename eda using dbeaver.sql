-- query 1
-- Berapa rata-rata umur customer jika dilihat dari marital statusnya ?
select `Marital Status` , avg(Age) 
from kn_customer kc 
where `Marital Status` <> ""
group by 1

-- query 2
-- Berapa rata-rata umur customer jika dilihat dari gender nya ?
select Gender , avg(Age) 
from kn_customer kc 
group by 1

-- query 3
-- Tentukan nama store dengan total quantity terbanyak! pakai totalamount atau qty?
-- opsi 1
select ks.StoreID,ks.StoreName, sum(kt.Qty) as 'Total Transaksi'
from kn_store ks 
left join kn_transaction kt 
on ks.StoreID =kt.StoreID 
group by 1, 2
order by 3 desc

-- opsi 2
select StoreID , sum(Qty) 
from kn_transaction kt 
group by 1
order by 2 desc

-- query 4
-- Tentukan nama produk terlaris dengan total amount terbanyak!
-- opsi 1
select kp.ProductID , kp.`Product Name`, sum(kt.TotalAmount) as 'Total Amount'
from kn_product kp 
left join kn_transaction kt 
on kp.ProductID = kt.ProductID 
group by 1, 2
order by 3 desc

-- opsi 2
select ProductID , sum(TotalAmount) as 'Total Amount' 
from kn_transaction kt 
group by 1
order by 2 desc