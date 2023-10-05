-- name: CreanteUser :one
INSERT INTO categorias (
user_id,
title,
type,
description
 value
 $1,
 $2, 
 $3,
 $4
) returning *;

-- name: GetUser :one
select * from categorias where id = $1 limit 1;

-- name: GetCategorias :many
select * from categorias where user_id = $1 and type = 2 and title like $3 and description like $4;

-- name: UpdateCategorias :one
Update categorias Set title = $2, description = $3 Where id = $1;

-- name: DeleteCategorias :exec
Delete from categorias where id = $1;