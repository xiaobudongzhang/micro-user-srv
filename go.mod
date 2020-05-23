module github.com/xiaobudongzhang/micro-user-srv

go 1.14

replace github.com/xiaobudongzhang/micro-basic => /wwwroot/microdemo/micro-basic

replace github.com/xiaobudongzhang/micro-inventory-srv => /wwwroot/microdemo/micro-inventory-srv

replace github.com/xiaobudongzhang/micro-payment-srv => /wwwroot/microdemo/micro-payment-srv

replace github.com/xiaobudongzhang/micro-order-srv => /wwwroot/microdemo/micro-order-srv

replace github.com/xiaobudongzhang/micro-auth => /wwwroot/microdemo/micro-auth

replace github.com/xiaobudongzhang/micro-user-srv => /wwwroot/microdemo/micro-user-srv

replace github.com/xiaobudongzhang/micro-plugins => /wwwroot/microdemo/micro-plugins

require (
	github.com/go-log/log v0.2.0 // indirect
	github.com/go-redis/redis v6.15.7+incompatible // indirect
	github.com/go-sql-driver/mysql v1.5.0 // indirect
	github.com/golang/protobuf v1.3.5
	github.com/micro-in-cn/tutorials/microservice-in-micro v0.0.0-20200510134214-a0f89cb675dc // indirect
	github.com/micro/go-micro v1.18.0 // indirect
	github.com/micro/go-micro/v2 v2.4.0
	github.com/micro/go-plugins v1.5.1 // indirect
	github.com/xiaobudongzhang/micro-basic v1.1.2
	github.com/xiaobudongzhang/micro-plugins v0.0.0-00010101000000-000000000000
)
