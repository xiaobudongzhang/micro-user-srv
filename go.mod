module github.com/xiaobudongzhang/micro-user-srv

go 1.14
replace github.com/xiaobudongzhang/micro-basic => /data/ndemo/micro-basic

replace github.com/xiaobudongzhang/micro-inventory-srv => /data/ndemo/micro-inventory-srv

replace github.com/xiaobudongzhang/micro-payment-srv => /data/ndemo/micro-payment-srv

replace github.com/xiaobudongzhang/micro-order-srv => /data/ndemo/micro-order-srv

replace github.com/xiaobudongzhang/micro-plugins => /data/ndemo/micro-plugins


replace github.com/xiaobudongzhang/micro-auth => /data/ndemo/micro-auth

replace github.com/xiaobudongzhang/micro-user-srv => /data/ndemo/micro-user-srv

require (
	github.com/go-log/log v0.2.0 // indirect
	github.com/go-redis/redis v6.15.7+incompatible // indirect
	github.com/go-sql-driver/mysql v1.5.0 // indirect
	github.com/golang/protobuf v1.3.5
	github.com/micro/go-micro/v2 v2.4.0
	github.com/xiaobudongzhang/micro-basic v1.1.2
)
