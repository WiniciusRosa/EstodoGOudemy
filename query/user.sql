-- name: CreanteUser :one
INSERT INTO users (
username,
password,
email
 value
 $1,
 $2, 
 $3
) returning *;

-- name: GetUser :one
select * from users where username = $1 limit 1;

-- name: GetUserByID :one
select * from users where id = $1 limit 1;
