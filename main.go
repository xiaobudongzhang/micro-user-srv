package main

import (
	"fmt"

	"github.com/xiaobudongzhang/micro-basic/common"
	"github.com/xiaobudongzhang/micro-basic/config"
	"github.com/xiaobudongzhang/micro-user-srv/handler"
	"github.com/xiaobudongzhang/micro-user-srv/model"
	"github.com/xiaobudongzhang/micro-user-srv/subscriber"

	basic "github.com/xiaobudongzhang/micro-basic/basic"

	s "github.com/xiaobudongzhang/micro-user-srv/proto/user"

	"github.com/micro/cli/v2"
	"github.com/micro/go-micro/v2"
	"github.com/micro/go-micro/v2/registry/etcd"
	log "github.com/micro/go-micro/v2/util/log"
	"github.com/micro/go-plugins/config/source/grpc/v2"

	"github.com/micro/go-micro/v2/registry"
)

var (
	appName = "user_service"
	cfg     = &appCfg{}
)

type appCfg struct {
	common.AppCfg
}

func main() {
	initCfg()

	// 使用etcd注册
	micReg := etcd.NewRegistry(registryOptions)
	// New Service
	service := micro.NewService(
		micro.Name("mu.micro.book.service.user"),
		micro.Registry(micReg),
		micro.Version("latest"),
	)

	// Initialise service
	// 服务初始化
	service.Init(
		micro.Action(func(c *cli.Context) error {
			// 初始化模型层
			model.Init()
			// 初始化handler
			handler.Init()
			return nil
		}),
	)

	// Register Handler
	s.RegisterUserHandler(service.Server(), new(handler.User))

	// Register Struct as Subscriber
	micro.RegisterSubscriber("mu.micro.book.service.user", service.Server(), new(subscriber.User))

	// Run service
	if err := service.Run(); err != nil {
		log.Fatal(err)
	}
}

func registryOptions(ops *registry.Options) {
	etcdCfg := &common.Etcd{}
	err := config.C().App("etcd", etcdCfg)
	if err != nil {

		log.Log(err)
		panic(err)
	}
	ops.Addrs = []string{fmt.Sprintf("%s:%d", etcdCfg.Host, etcdCfg.Port)}
}

func initCfg() {
	source := grpc.NewSource(
		grpc.WithAddress("127.0.0.1:9600"),
		grpc.WithPath("micro"),
	)

	basic.Init(config.WithSource(source))

	err := config.C().App(appName, cfg)
	if err != nil {
		panic(err)
	}

	log.Logf("配置 cfg:%v", cfg)

	return
}
