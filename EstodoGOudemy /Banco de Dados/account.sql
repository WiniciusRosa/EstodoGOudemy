-- name: Creanteaccounts :one
INSERT INTO accounts (
user_id,
category_id,
title,
type,
description,
value,
date
 value
 $1,
 $2, 
 $3,
 $4,
 $5,
 $6,
 $7

) returning *;

-- name: Getaccounts :one
select * from accounts where id = $1 limit 1;

-- name: GetAccounts :many
select 
        a.id,
        a.user_id,
        a.title,
        a.type,
        a.description,
        a.value,
        a.date,
        a.created_at,
        c.title as category_title
  from accounts a 
left Join categorias b on b.id = a.category_id
where a.user_id = $1 
 and a.type = $2 
 and a.category_id =  $3
 and a.title like $4 
 and a.description like $5
 and a.date = $6;

-- name: GetAccountReports :one
select sum(value) as sum_value from 
where user_id = $1 and type = $2;

-- name: GetAccountGraph :one
select count(*) from 
where user_id = $1 and type = $2;

-- name: UpdateAccounts :one
Update accounts
Set title = $2, description = $3, value = $4 
Where id = $1
returning *;

-- name: DeleteAccounts :exec
Delete from Accounts where id = $1;
